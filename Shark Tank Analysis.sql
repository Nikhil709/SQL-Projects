select * from sharktank;

Total Episodes

select max(ep_no) from sharktank;
select distinct ep_no from sharktank;

--Total Pitches

select count (distinct brand) as 'Total Pitches' from sharktank;

--Pitches Converted

select count(amount_invested_lakhs) as pitches_converted from sharktank where amount_invested_lakhs >0

--Total Number of Male Participation

select sum(male) as 'male participation' from sharktank;

--Total Number of Female Participation


select sum(Female) 'Female Participation' from sharktank;

--Total Invested Amount

select sum(amount_invested_lakhs) from sharktank

--Average Equity Taken

select avg(Equity_Taken) as Average_Equity_Taken from sharktank where Equity_Taken>0

--Highest Deal Taken

select max(Amount_Invested_lakhs) from sharktank

--Highest Equity Taken 

select max(Equity_Taken) from sharktank

--Startups Having Atleast One Women

select sum(a.female_count)  from(
select female, case when female>0 then 1 else 0 end as female_count from sharktank) a

--Pitches converted having atleast one women

select * from sharktank;

select sum(Female_count) from(
select  case when a.female>0 then 1 else 0 end as female_count, a.* from (
select * from sharktank where Deal != 'no deal') a)b

--Average team members

select AVG(Team_members) from sharktank

--Amount Invested per deal

select avg(a.amount_invested_lakhs) amount_invested_per_deal from
(select *from sharktank where deal != 'no deal') a

--Average age group of contestant

select Avg_age,COUNT(Avg_age) count from sharktank group by Avg_age order by count desc

--Location group of contestant

select Location,count(Location) count from sharktank group by Location order by count desc

--Sector group of contestant

select Sector, count(Sector) count from sharktank group by Sector order by count desc

--Partner Deals

select Partners, count(Partners) count from sharktank where Partners!='-' group by Partners order by count desc

--Making the Matrix

select 'Ashneer' as keyy,count(Ashneer_Amount_Invested) from sharktank where Ashneer_Amount_Invested is not null

select 'Ashneer' as keyy,count(Ashneer_Amount_Invested) from sharktank where Ashneer_Amount_Invested is not null and Ashneer_Amount_Invested !=0

select 'Ashneer' as keyy,sum(c.Ashneer_Amount_Invested),AVG(c.Ashneer_Equity_Taken)
from (select * from sharktank where Ashneer_Equity_Taken!=0 and Ashneer_Equity_Taken is not null) c


--Inner Join all Outputs

select m.keyy, m.total_deals_present, m.total_deals,n.Total_Amount_Invested,n.Avg_Equity_Taken from
(select a.keyy,a.total_deals_present,b.total_deals from(
select 'Ashneer' as keyy,count(Ashneer_Amount_Invested) total_deals_present from sharktank where Ashneer_Amount_Invested is not null) a
inner join(

select 'Ashneer' as keyy,count(Ashneer_Amount_Invested) total_deals from sharktank where Ashneer_Amount_Invested is not null and Ashneer_Amount_Invested !=0)b

on a.keyy=b.keyy) m

inner join
(select 'Ashneer' as keyy,sum(c.Ashneer_Amount_Invested)Total_Amount_Invested,AVG(c.Ashneer_Equity_Taken) Avg_Equity_Taken
from (select * from sharktank where Ashneer_Equity_Taken!=0 and Ashneer_Equity_Taken is not null) c) n

on m.keyy=n.keyy
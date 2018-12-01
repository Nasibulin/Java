with s1 as (
select dateadd(day,1-day(date),date) startdate,(dateadd(month,1,dateadd(day,1-day(date),date))-1) enddate,code,point,date,inc sum from income
union
select dateadd(day,1-day(date),date) startdate,(dateadd(month,1,dateadd(day,1-day(date),date))-1) enddate,code,point,date,-out from outcome
)

select DENSE_RANK() OVER(ORDER BY startdate) num, convert(date,startdate),convert(date,enddate),code,point,date,sum from s1 where datediff(mm,date,(select max(date) from s1)) >=2

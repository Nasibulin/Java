with total as (select code,o.point,a.cnt,out,a.avg, ROW_NUMBER() OVER(PARTITION BY o.point ORDER BY out) rnk from outcome o join (select point,avg(out) avg, count(out) cnt from outcome o group by point) a on a.point=o.point),
med as (
select total.point,o.out from total join (
select point,
case when cnt%2=1
then out
else null
end out
from total where rnk=(total.cnt+1)/2
) o on o.point=total.point where o.out is not null
union
select total.point,o.out from total join (
select point,
case when total.cnt%2=0
then avg(out)
else null
end out
from total where rnk in (total.cnt/2+1,total.cnt/2) group by point,cnt
) o on o.point=total.point where o.out is not null)

select code,total.point,total.out,med.out,avg from total join med on total.point=med.point where (total.out>med.out and total.out<total.avg) or (total.out<med.out and total.out>total.avg)

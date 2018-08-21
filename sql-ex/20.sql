select case when (prev = min and flag = 2)
            then '2003-03-28'
            else convert(varchar(10), dateadd(dd, 1, cur), 120)
       end as _from,
       case when (next = max and flag = 2 or next > max)
            then '2003-04-28'
            else convert(varchar(10), dateadd(dd, -1, next), 120)
       end as _to
 from (select cur,
              min(cur) over(partition by flag) as min, 
              max(cur) over(partition by flag) as max,
              lag(cur, 1, '20030328') over(order by cur) as prev,
              lead(cur, 1, '20030428') over(order by cur) as next, 
              min(flag) over(partition by cur) flag 
        from (select case when t.town_to = 'Rostov'
                   then dateadd(dd, iif(t.time_in<t.time_out, 1, 0), date)
                   else date
              end as cur, 1 as flag
        from Pass_in_trip pt
        Join Trip t
          On t.trip_no = pt.trip_no
         And 'Rostov' in (t.town_to, t.town_from)   
            union all select '20030328', 2 union all  select '20030428', 2 ) D
     where cur between '20030328' and '20030428'
       ) A
where cur <> next and (dateadd(dd,1 , cur) < next or flag = 2)
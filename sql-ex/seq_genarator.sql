with cte as
(select ascii('a') as code
 union all
 select code + 1
   from cte
 where code < ascii('z')
)

select char(code) from cte
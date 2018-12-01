select model,sum(convert(tinyint,case when substring(model, n, 1) like '[0-9]' then substring(model, n, 1) else '0' end)) qty
	from product,(select distinct x.n+y.n*10 as n from
	( select 1 as n
	union all select 2
	union all select 3
	union all select 4
	union all select 5
	union all select 6
	union all select 7
	union all select 8
	union all select 9
	union all select 10
) x cross join 
	( select 0 as n
	union all select 1
	union all select 2
	union all select 3
	union all select 4
	union all select 5
	union all select 6
	union all select 7
	union all select 8
	union all select 9
) y
) numbers
group by model

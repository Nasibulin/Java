with s as (select q_id, (row_number() over (order by q_id))%3 num from utq)

select [1],[2],[0]
	from 
	(
	select 
		Q_ID
		,num
		,ROW_NUMBER() OVER(PARTITION BY num ORDER BY Q_ID) rm
	from s
	) ss
pivot (max(ss.q_id) for num in ([1],[2],[0])) as ss2

with s1 as (select distinct b_q_id,b_v_id,RANK() OVER(PARTITION BY B_Q_ID ORDER BY B_DATETIME DESC) rnk from utb)

select v_name,utq2.q_name,utq1.q_name from s1 join (select distinct b_q_id,b_v_id,RANK() OVER(PARTITION BY B_Q_ID ORDER BY B_DATETIME ASC) rnk from utb u) u on u.b_v_id=s1.b_v_id and u.rnk=s1.rnk
join utv on v_id=s1.b_v_id
join utq utq1 on utq1.q_id=s1.b_q_id
join utq utq2 on utq2.q_id=u.b_q_id
where s1.rnk=1 and utq2.q_name<>utq1.q_name

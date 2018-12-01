with s1 as (select b_q_id, b_v_id, b_datetime, b_vol, ROW_NUMBER() OVER(ORDER BY b_q_id, b_v_id, b_datetime) num, RANK() OVER(PARTITION BY b_vol ORDER BY b_q_id, b_v_id, b_datetime) rnk, (ROW_NUMBER() OVER(ORDER BY b_q_id, b_v_id, b_datetime) - RANK() OVER(PARTITION BY b_vol ORDER BY b_q_id, b_v_id, b_datetime)) nmk from utb)

select count(nmk) N, b_vol  from s1 group by b_vol,nmk having max(num) in (select max(num) from s1)

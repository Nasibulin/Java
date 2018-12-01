select distinct q_name NAME from utb join utq on b_q_id=q_id join utv on utv.v_id=utb.b_v_id
where b_q_id not in (select b_q_id from utb where b_v_id in (select b_v_id from utb group by b_v_id having count(distinct b_q_id)<>1))
and b_q_id in (select b_q_id from utb join utv on b_v_id=v_id group by b_q_id having sum(b_vol)=765)

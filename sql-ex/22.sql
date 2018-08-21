WITH s1
     AS (SELECT u.b_q_id,
                b_v_id,
                s.m,
                2 m2,
                y,
                y + 1 y2
           FROM utb u
                JOIN
                (SELECT month (max (b_datetime)) m,
                        year (max (b_datetime)) y,
                        b_q_id
                   FROM utb
                 GROUP BY b_q_id
                 HAVING month (max (b_datetime)) = 6) s
                   ON u.b_q_id = s.B_Q_ID),
     s2
     AS (SELECT u.b_q_id,
                b_v_id,
                s.m,
                y
           FROM utb u
                JOIN
                (SELECT month (min (b_datetime)) m,
                        year (min (b_datetime)) y,
                        b_q_id
                   FROM utb
                 GROUP BY b_q_id
                 HAVING month (min (b_datetime)) = 2) s
                   ON u.b_q_id = s.B_Q_ID)
SELECT distinct u1.q_name, v_name, u2.q_name
  FROM s1
       JOIN s2 ON s1.B_v_ID = s2.B_v_ID AND s1.y2 = s2.y
       JOIN utq u1 ON u1.Q_ID = s1.b_q_id
       JOIN utq u2 ON u2.Q_ID = s2.b_q_id
       JOIN utv ON utv.V_ID = s1.B_v_id
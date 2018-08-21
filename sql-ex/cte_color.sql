WITH a AS (
SELECT Q_ID,x.V_ID, 0 B_VOL FROM utq CROSS JOIN (SELECT min(v_id) V_ID, V_COLOR FROM utv GROUP BY v_color) x
UNION
SELECT B_Q_ID,B_V_ID,B_VOL FROM utB)

SELECT DISTINCT a.q_id, V_color,sum (b_vol),CAST(CAST (ROUND ( (sum (b_vol) + 64) * 1.0 / 64, 0, 1) AS INT) AS VARCHAR)
                   grp_name
           FROM a JOIN utV ON utV.V_ID = a.V_ID
         GROUP BY a.q_id,v_color
WITH a AS (
SELECT Q_ID,x.V_ID, 0 B_VOL FROM utq CROSS JOIN (SELECT min(v_id) V_ID, V_COLOR FROM utv GROUP BY v_color) x
UNION ALL
SELECT B_Q_ID,B_V_ID,B_VOL FROM utB)
,
grp AS (
SELECT DISTINCT a.q_id, CAST(SUM(B_VOL)/64+1 AS VARCHAR)
                   grp_name
           FROM a JOIN utV ON utV.V_ID = a.V_ID
         GROUP BY a.q_id,v_color
)

SELECT q_name,
         isnull (g1.grp_name, '')
       + iif (
              isnull (g1.grp_name, '')
               ='',
            isnull (g2.grp_name, ''),
            isnull (', '+g2.grp_name, '')) 
       + iif (
              isnull (g1.grp_name, '')
            + isnull (', ' + g2.grp_name, '')
               ='',
            isnull (g3.grp_name, ''),
            isnull (', '+g3.grp_name, ''))       
       + iif (
              isnull (g1.grp_name, '')
            + isnull (', ' + g2.grp_name, '')
            + isnull (', ' + g3.grp_name, '')
               ='',
            isnull (g4.grp_name, ''),
            isnull (', '+g4.grp_name, ''))
          grp_name
  FROM utq
       LEFT JOIN (SELECT q_id, grp_name
                    FROM grp
                   WHERE grp_name = 1) g1
          ON g1.q_id = utq.q_id
       LEFT JOIN (SELECT q_id, grp_name
                    FROM grp
                   WHERE grp_name = 2) g2
          ON utq.q_id = g2.q_id
       LEFT JOIN (SELECT q_id, grp_name
                    FROM grp
                   WHERE grp_name = 3) g3
          ON utq.q_id = g3.q_id
       LEFT JOIN (SELECT q_id, grp_name
                    FROM grp
                   WHERE grp_name = 4) g4
          ON utq.q_id = g4.q_id

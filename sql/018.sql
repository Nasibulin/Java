SELECT q_name
  FROM utq
       JOIN
       (SELECT b_q_id
          FROM utb
         WHERE b_v_id IN (SELECT b_v_id
                            FROM utb
                          GROUP BY b_v_id
                          HAVING sum (b_vol) % 255 = 0
                          EXCEPT
                          SELECT b_v_id
                            FROM utb
                           WHERE b_q_id IN (SELECT b_q_id
                                              FROM utb
                                            GROUP BY b_q_id
                                            HAVING sum (b_vol) <> 255 * 3))
        GROUP BY b_q_id
        HAVING sum (b_vol) = 255 * 3) s
          ON s.b_q_id = utq.q_id

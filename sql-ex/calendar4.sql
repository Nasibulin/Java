SELECT dateadd (d, 7 * n.nbr + 0, t5.wbeg) AS mo,
       dateadd (d, 7 * n.nbr + 1, t5.wbeg) AS tu,
       dateadd (d, 7 * n.nbr + 2, t5.wbeg) AS we,
       dateadd (d, 7 * n.nbr + 3, t5.wbeg) AS th,
       dateadd (d, 7 * n.nbr + 4, t5.wbeg) AS fr,
       dateadd (d, 7 * n.nbr + 5, t5.wbeg) AS sa,
       dateadd (d, 7 * n.nbr + 6, t5.wbeg) AS su
  FROM (SELECT 0
        UNION ALL
        SELECT 1
        UNION ALL
        SELECT 2
        UNION ALL
        SELECT 3
        UNION ALL
        SELECT 4
        UNION ALL
        SELECT 5) AS n (nbr),
       (SELECT wbeg, datediff (wk, wbeg, wend) AS wks
          FROM (SELECT mbeg,
                       mend,
                       wbeg,
                       dateadd (d, datediff (d, 0, mend) / 7 * 7 + 6, 0)
                          AS wend
                  FROM (SELECT mbeg,
                               dateadd (m, 1, mbeg) - 1 AS mend,
                               dateadd (d, datediff (d, 0, mbeg) / 7 * 7, 0)
                                  AS wbeg
                          FROM (SELECT dateadd (d,
                                                -datepart (d, cdate) + 1,
                                                cdate)
                                          AS mbeg
                                  FROM (SELECT current_timestamp AS cdate) AS t1) AS t2) AS t3) AS t4) AS t5
 WHERE t5.wks >= n.nbr + 1
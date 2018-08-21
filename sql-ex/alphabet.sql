SELECT char(((x.n - 1) * 10 + y.n)) A
  FROM (SELECT 1 n
        UNION
        SELECT 2 n
        UNION
        SELECT 3 n
        UNION
        SELECT 4 n
        UNION
        SELECT 5 n
        UNION
        SELECT 6 n
        UNION
        SELECT 7 n
        UNION
        SELECT 8 n
        UNION
        SELECT 9 n
        UNION
        SELECT 10 n) x
       CROSS JOIN (SELECT 1 n
                   UNION
                   SELECT 2 n
                   UNION
                   SELECT 3 n
                   UNION
                   SELECT 4 n
                   UNION
                   SELECT 5 n
                   UNION
                   SELECT 6 n
                   UNION
                   SELECT 7 n
                   UNION
                   SELECT 8 n
                   UNION
                   SELECT 9 n
                   UNION
                   SELECT 10 n) y where ((x.n - 1) * 10 + y.n) between 65 and 90 order by A
SELECT MIN (
          CASE
             WHEN DATEPART (DW, DATEADD (DD, number, b.idate)) = datepart(dw, getdate()-1)
             THEN
                CAST (DATEADD (DD, NUMBER, b.idate) AS DATE)
          END)
          AS Monday,
       MIN (
          CASE
             WHEN DATEPART (DW, DATEADD (DD, number, b.idate)) = datepart(dw, getdate())
             THEN
                CAST (DATEADD (DD, NUMBER, b.idate) AS DATE)
          END)
          AS Tuesday,
       MIN (
          CASE
             WHEN DATEPART (DW, DATEADD (DD, number, b.idate)) = datepart(dw, getdate()+1)
             THEN
                CAST (DATEADD (DD, NUMBER, b.idate) AS DATE)
          END)
          AS Wednesday,
       MIN (
          CASE
             WHEN DATEPART (DW, DATEADD (DD, number, b.idate)) = datepart(dw, getdate()+2)
             THEN
                CAST (DATEADD (DD, NUMBER, b.idate) AS DATE)
          END)
          AS Thursday,
       MIN (
          CASE
             WHEN DATEPART (DW, DATEADD (DD, number, b.idate)) = datepart(dw, getdate()+3)
             THEN
                CAST (DATEADD (DD, NUMBER, b.idate) AS DATE)
          END)
          AS Friday,
       MIN (
          CASE
             WHEN DATEPART (DW, DATEADD (DD, number, b.idate)) = datepart(dw, getdate()+4)
             THEN
                CAST (DATEADD (DD, NUMBER, b.idate) AS DATE)
          END)
          AS Saturday,
       MIN (
          CASE
             WHEN DATEPART (DW, DATEADD (DD, number, b.idate)) = datepart(dw, getdate()+5)
             THEN
                CAST (DATEADD (DD, NUMBER, b.idate) AS DATE)
          END)
          AS Sunday
  FROM (SELECT (x.n * 10 + y.n) number
  FROM (SELECT 0 n
        UNION
        SELECT 1 n
        UNION
        SELECT 2 n
        UNION
        SELECT 3 n) x
       CROSS JOIN (SELECT 0 n
                   UNION
                   SELECT 1 n
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
                   SELECT 9 n) y) m,
       (SELECT date,
               DATEFROMPARTS (YEAR (b.date), MONTH (b.date), 1) idate
          FROM Battles b WHERE b.date IN (SELECT date FROM battles bb JOIN outcomes o ON o.battle=bb.name WHERE o.ship='Bismarck')) b
 WHERE     DATEADD (DD, number, b.idate) BETWEEN b.idate
                                             AND DATEADD (
                                                    DAY,
                                                    -1,
                                                    DATEADD (MONTH,
                                                             1,
                                                             b.idate))

GROUP BY idate, DATEPART (WW, DATEADD (DD, number, b.idate))
SELECT MIN (
          CASE
             WHEN DATEPART (DW, DATEADD (DD, number, b.idate)) = 1
             THEN
                CAST (DATEADD (DD, NUMBER, b.idate) AS DATE)
          END)
          AS Monday,
       MIN (
          CASE
             WHEN DATEPART (DW, DATEADD (DD, number, b.idate)) = 2
             THEN
                CAST (DATEADD (DD, NUMBER, b.idate) AS DATE)
          END)
          AS Tuesday,
       MIN (
          CASE
             WHEN DATEPART (DW, DATEADD (DD, number, b.idate)) = 3
             THEN
                CAST (DATEADD (DD, NUMBER, b.idate) AS DATE)
          END)
          AS Wednesday,
       MIN (
          CASE
             WHEN DATEPART (DW, DATEADD (DD, number, b.idate)) = 4
             THEN
                CAST (DATEADD (DD, NUMBER, b.idate) AS DATE)
          END)
          AS Thursday,
       MIN (
          CASE
             WHEN DATEPART (DW, DATEADD (DD, number, b.idate)) = 5
             THEN
                CAST (DATEADD (DD, NUMBER, b.idate) AS DATE)
          END)
          AS Friday,
       MIN (
          CASE
             WHEN DATEPART (DW, DATEADD (DD, number, b.idate)) = 6
             THEN
                CAST (DATEADD (DD, NUMBER, b.idate) AS DATE)
          END)
          AS Saturday,
       MIN (
          CASE
             WHEN DATEPART (DW, DATEADD (DD, number, b.idate)) = 7
             THEN
                CAST (DATEADD (DD, NUMBER, b.idate) AS DATE)
          END)
          AS Sunday
  FROM master.dbo.spt_values m,
       (SELECT date,
               DATEFROMPARTS (YEAR (b.date), MONTH (b.date), 1) idate,
               DATEADD (
                  DAY,
                  -1,
                  DATEFROMPARTS (YEAR (dateadd (m, 1, b.date)),
                                 MONTH (dateadd (m, 1, b.date)),
                                 1))
                  edate
          FROM Battles b where b.date in (select date from battles b join outcomes o on o.battle=b.name where o.ship='Bismarck')) b
 WHERE     DATEADD (DD, number, b.idate) BETWEEN b.idate
                                             AND DATEADD (
                                                    DAY,
                                                    -1,
                                                    DATEADD (MONTH,
                                                             1,
                                                             b.idate))
       AND m.type = 'P'
GROUP BY idate, DATEPART (WEEK, DATEADD (DD, number, b.idate)) order by idate
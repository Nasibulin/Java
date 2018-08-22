SELECT
MIN(iif ((DATEDIFF(DD,DATEADD (DD, number, b.idate),'20180820')%7=0),CAST (DATEADD (DD, NUMBER, b.idate) AS DATE),NULL)) Monday,
MIN(iif ((DATEDIFF(DD,DATEADD (DD, number, b.idate),'20180820')%7=6),CAST (DATEADD (DD, NUMBER, b.idate) AS DATE),NULL)) Tuesday,
MIN(iif ((DATEDIFF(DD,DATEADD (DD, number, b.idate),'20180820')%7=5),CAST (DATEADD (DD, NUMBER, b.idate) AS DATE),NULL)) Wednesday,
MIN(iif ((DATEDIFF(DD,DATEADD (DD, number, b.idate),'20180820')%7=4),CAST (DATEADD (DD, NUMBER, b.idate) AS DATE),NULL)) Thursday,
MIN(iif ((DATEDIFF(DD,DATEADD (DD, number, b.idate),'20180820')%7=3),CAST (DATEADD (DD, NUMBER, b.idate) AS DATE),NULL)) Friday,
MIN(iif ((DATEDIFF(DD,DATEADD (DD, number, b.idate),'20180820')%7=2),CAST (DATEADD (DD, NUMBER, b.idate) AS DATE),NULL)) Saturday,
MIN(iif ((DATEDIFF(DD,DATEADD (DD, number, b.idate),'20180820')%7=1),CAST (DATEADD (DD, NUMBER, b.idate) AS DATE),NULL)) Sunday


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
       (SELECT DATEFROMPARTS (YEAR (b.date), MONTH (b.date), 1) idate
FROM Battles b WHERE b.date IN (SELECT date FROM battles bb JOIN outcomes o ON o.battle=bb.name /*WHERE o.ship='Bismarck'*/)) b
WHERE     (DATEADD (DD, number, b.idate) >= b.idate AND DATEADD (DD, number, b.idate) <= DATEADD (
                                                    DAY,
                                                    -1,
                                                    DATEADD (MONTH,
                                                             1,
                                                             b.idate)))

GROUP BY DATEPART (YEAR, DATEADD (DD, number, b.idate)),DATEPART (MONTH, DATEADD (DD, number, b.idate)),DATEPART (isowk, DATEADD (DD, number, b.idate))

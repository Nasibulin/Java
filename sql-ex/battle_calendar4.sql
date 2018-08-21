SELECT
MIN(iif ((DATEPART (DW, DATEADD (DD, number, b.idate))=datepart(dw,getdate ()- 1)),CAST (DATEADD (DD, NUMBER, b.idate) AS DATE),null)) Monday,
MIN(iif ((DATEPART (DW, DATEADD (DD, number, b.idate))=datepart(dw,getdate ())),CAST (DATEADD (DD, NUMBER, b.idate) AS DATE),null)) Tuesday,
MIN(iif ((DATEPART (DW, DATEADD (DD, number, b.idate))=datepart(dw,getdate ()+1)),CAST (DATEADD (DD, NUMBER, b.idate) AS DATE),null)) Wednesday,
MIN(iif ((DATEPART (DW, DATEADD (DD, number, b.idate))=datepart(dw,getdate ()+2)),CAST (DATEADD (DD, NUMBER, b.idate) AS DATE),null)) Thursday,
MIN(iif ((DATEPART (DW, DATEADD (DD, number, b.idate))=datepart(dw,getdate ()+3)),CAST (DATEADD (DD, NUMBER, b.idate) AS DATE),null)) Friday,
MIN(iif ((DATEPART (DW, DATEADD (DD, number, b.idate))=datepart(dw,getdate ()+4)),CAST (DATEADD (DD, NUMBER, b.idate) AS DATE),null)) Saturday,
MIN(iif ((DATEPART (DW, DATEADD (DD, number, b.idate))=datepart(dw,getdate ()+5)),CAST (DATEADD (DD, NUMBER, b.idate) AS DATE),null)) Sunday
 
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
          FROM battles b JOIN outcomes o ON o.battle=b.name WHERE o.ship='Bismarck') b
 WHERE     DATEADD (DD, number, b.idate) BETWEEN b.idate
                                             AND DATEADD (
                                                    DAY,
                                                    -1,
                                                    DATEADD (MONTH,
                                                             1,
                                                             b.idate))

GROUP BY idate, DATEPART (WW, DATEADD (DD, number, b.idate))
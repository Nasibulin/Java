SELECT date,
       DATEFROMPARTS (YEAR (b.date), MONTH (b.date), 1) idate,
       DATEADD (DAY,
                -1,DATEFROMPARTS (YEAR (dateadd(m,1,b.date)), MONTH (dateadd(m,1,b.date)), 1)
                ) edate
  FROM Battles b
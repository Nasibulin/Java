DECLARE @D DATETIME;
SET @D=GETDATE();
SELECT
 MAX(ISNULL(CASE(@@DATEFIRST+DATEPART(WEEKDAY, DATEADD(DAY,V.number,M.D)))%7 WHEN 2 THEN STR(V.number+1)END,''))[Пн],
 MAX(ISNULL(CASE(@@DATEFIRST+DATEPART(WEEKDAY, DATEADD(DAY,V.number,M.D)))%7 WHEN 3 THEN STR(V.number+1)END,''))[Вт],
 MAX(ISNULL(CASE(@@DATEFIRST+DATEPART(WEEKDAY, DATEADD(DAY,V.number,M.D)))%7 WHEN 4 THEN STR(V.number+1)END,''))[Ср],
 MAX(ISNULL(CASE(@@DATEFIRST+DATEPART(WEEKDAY, DATEADD(DAY,V.number,M.D)))%7 WHEN 5 THEN STR(V.number+1)END,''))[Чт],
 MAX(ISNULL(CASE(@@DATEFIRST+DATEPART(WEEKDAY, DATEADD(DAY,V.number,M.D)))%7 WHEN 6 THEN STR(V.number+1)END,''))[Пт],
 MAX(ISNULL(CASE(@@DATEFIRST+DATEPART(WEEKDAY, DATEADD(DAY,V.number,M.D)))%7 WHEN 0 THEN STR(V.number+1)END,''))[Сб],
 MAX(ISNULL(CASE(@@DATEFIRST+DATEPART(WEEKDAY, DATEADD(DAY,V.number,M.D)))%7 WHEN 1 THEN STR(V.number+1)END,''))[Вс]
FROM (SELECT CONVERT(CHAR(6),@D,112)+'01') M(D)
JOIN master.dbo.spt_values V ON type='P' AND V.number<DATEDIFF(DAY,M.D, DATEADD(MONTH,1,M.D))
GROUP BY (V.number+(@@DATEFIRST+DATEPART(WEEKDAY,M.D)-2)%7)/7;
DECLARE @Base_Month AS INT = 1
--–Setting the base month the MONTH for which you want to generate the Calendar.

DECLARE @Base_Year AS INT = 2014
--–Setting the base year.

DECLARE @InitialDate AS DATETIME = CONVERT(VARCHAR,@Base_Year) + RIGHT('0' + CONVERT(VARCHAR,@Base_Month),2) + '01'

DECLARE @FinalEndDate AS DATETIME = DATEADD(DAY,-1,DATEADD(MONTH,1,@InitialDate));

SELECT

SUM(CASE WHEN DATEPART(DW, DATEADD(DD,number,@InitialDate)) = 1

THEN DATEPART(DAY, DATEADD(DD,NUMBER,@InitialDate)) END) AS Sunday

,SUM(CASE WHEN DATEPART(DW, DATEADD(DD,number,@InitialDate)) = 2

THEN DATEPART(DAY, DATEADD(DD,NUMBER,@InitialDate)) END) AS Monday

,SUM(CASE WHEN DATEPART(DW, DATEADD(DD,number,@InitialDate)) = 3

THEN DATEPART(DAY, DATEADD(DD,NUMBER,@InitialDate)) END) AS Tuesday

,SUM(CASE WHEN DATEPART(DW, DATEADD(DD,number,@InitialDate)) = 4

THEN DATEPART(DAY, DATEADD(DD,NUMBER,@InitialDate)) END) AS Wednesday

,SUM(CASE WHEN DATEPART(DW, DATEADD(DD,number,@InitialDate)) = 5

THEN DATEPART(DAY, DATEADD(DD,NUMBER,@InitialDate)) END) AS Thursday

,SUM(CASE WHEN DATEPART(DW, DATEADD(DD,number,@InitialDate)) = 6

THEN DATEPART(DAY, DATEADD(DD,NUMBER,@InitialDate)) END) AS Friday

,SUM(CASE WHEN DATEPART(DW, DATEADD(DD,number,@InitialDate)) = 7

THEN DATEPART(DAY, DATEADD(DD,NUMBER,@InitialDate)) END) AS Saturday

FROM master.dbo.spt_values m

WHERE DATEADD(DD,number,@InitialDate) BETWEEN @InitialDate

AND DATEADD(DAY,-1,DATEADD(MONTH,1,@InitialDate))

AND m.type = 'P'

GROUP BY DATEPART(WEEK, DATEADD(DD,number,@InitialDate))
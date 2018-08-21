DECLARE @Base_Month AS INT
              = 8
--Setting the base month the MONTH for which you want to generate the Calendar.

DECLARE @Base_Year AS INT
              = 2018
--Setting the base year.
DECLARE @InitialDate AS DATETIME =   CONVERT (
                                        VARCHAR,
                                        year (cast ('17.08.2018' AS DATE)))
                                   + RIGHT (
                                          '0'
                                        + CONVERT (
                                             VARCHAR,
                                             month (
                                                cast ('17.08.2018' AS DATE))),
                                        2)
                                   + '01'


DECLARE @FinalEndDate AS DATETIME
              = DATEADD (DAY, -1, DATEADD (MONTH, 1, @InitialDate));

SELECT MIN (
          CASE
             WHEN DATEPART (DW, DATEADD (DD, number, @InitialDate)) = 1
             THEN
                CAST(DATEADD (DD, NUMBER, @InitialDate) as DATE)
                END)
          AS Monday,
       MIN (
          CASE
             WHEN DATEPART (DW, DATEADD (DD, number, @InitialDate)) = 2
             THEN
                CAST(DATEADD (DD, NUMBER, @InitialDate) as DATE)
          END)
          AS Tuesday,
       MIN (
          CASE
             WHEN DATEPART (DW, DATEADD (DD, number, @InitialDate)) = 3
             THEN
                CAST(DATEADD (DD, NUMBER, @InitialDate) as DATE)
          END)
          AS Wednesday,
       MIN (
          CASE
             WHEN DATEPART (DW, DATEADD (DD, number, @InitialDate)) = 4
             THEN
                CAST(DATEADD (DD, NUMBER, @InitialDate) as DATE)
          END)
          AS Thursday,
       MIN (
          CASE
             WHEN DATEPART (DW, DATEADD (DD, number, @InitialDate)) = 5
             THEN
                CAST(DATEADD (DD, NUMBER, @InitialDate) as DATE)
          END)
          AS Friday,
       MIN (
          CASE
             WHEN DATEPART (DW, DATEADD (DD, number, @InitialDate)) = 6
             THEN
                CAST(DATEADD (DD, NUMBER, @InitialDate) as DATE)
          END)
          AS Saturday,
          MIN (
          CASE
             WHEN DATEPART (DW, DATEADD (DD, number, @InitialDate)) = 7
             THEN
                CAST(DATEADD (DD, NUMBER, @InitialDate) as DATE)
          END)
          AS Sunday
  FROM master.dbo.spt_values m
 WHERE     DATEADD (DD, number, @InitialDate) BETWEEN @InitialDate
                                                  AND DATEADD (
                                                         DAY,
                                                         -1,
                                                         DATEADD (
                                                            MONTH,
                                                            1,
                                                            @InitialDate))
       AND m.type = 'P'
GROUP BY DATEPART (WEEK, DATEADD (DD, number, @InitialDate))
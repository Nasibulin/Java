USE [sql-ex];
GO
SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
ALTER VIEW [dbo].[dec]
AS
   SELECT code,model,
          CONVERT (VARCHAR (20), price) price,
            CASE (SUBSTRING (CONVERT (VARCHAR (20), price), 2, 1))

WHEN '0' THEN ''
WHEN '1' THEN
                  CASE (SUBSTRING (CONVERT (VARCHAR (20), price), 6-LEN(CONVERT (VARCHAR (20), price)), 1))
                     WHEN '0' THEN 'ten'
                     WHEN '1' THEN 'eleven'
                     WHEN '2' THEN 'twelve'
                     WHEN '3' THEN 'thirteen'
                     WHEN '4' THEN 'fourteen'
                     WHEN '5' THEN 'fifteen'
                     WHEN '6' THEN 'sixteen'
                     WHEN '7' THEN 'seventeen'
                     WHEN '8' THEN 'eighteen'
                     WHEN '9' THEN 'nineteen'
                  END
		WHEN '2' THEN 'twenty'
		WHEN '3' THEN 'thirty'
		WHEN '4' THEN 'fourty'
		WHEN '5' THEN 'fifty'
		WHEN '6' THEN 'sixty'
		WHEN '7' THEN 'seventy'
		WHEN '8' THEN 'eighty'
		WHEN '9' THEN 'ninety'
            END
          + ''
                
             dec
     FROM pc
GO
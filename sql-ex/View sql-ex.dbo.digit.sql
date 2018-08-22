USE [sql-ex];
GO
SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
ALTER VIEW [dbo].[digit]
AS
SELECT code,model,
          price,
            CASE (SUBSTRING (CONVERT (VARCHAR (20), price), 2, 1))
		WHEN '1' THEN ''
    ELSE        
            CASE (SUBSTRING (CONVERT (VARCHAR (20), price), 3, 1))
		WHEN '0' THEN ''
		WHEN '1' THEN 'one'
		WHEN '2' THEN 'two'
		WHEN '3' THEN 'three'
		WHEN '4' THEN 'four'
		WHEN '5' THEN 'five'
		WHEN '6' THEN 'six'
		WHEN '7' THEN 'seven'
		WHEN '8' THEN 'eight'
		WHEN '9' THEN 'nine'
            
            END
            END
          + ''
                
             dig
     FROM pc
GO
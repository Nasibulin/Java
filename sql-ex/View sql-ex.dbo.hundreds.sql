USE [sql-ex];
GO
SET ANSI_NULLS ON;
GO
SET QUOTED_IDENTIFIER ON;
GO
ALTER VIEW [dbo].[hundreds]
AS
select code,model,price,CASE (SUBSTRING (CONVERT (VARCHAR (20), price),
                                        1,
                                        1))
                          WHEN '0'
                          THEN
                             ''
                          WHEN '1'
                          THEN
                             'one hundred'
                          WHEN '2'
                          THEN
                             'two hundred'
                          WHEN '3'
                          THEN
                             'three hundred'
                          WHEN '4'
                          THEN
                             'four hundred'
                          WHEN '5'
                          THEN
                             'five hundred'
                          WHEN '6'
                          THEN
                             'six hundred'
                          WHEN '7'
                          THEN
                             'seven hundred'
                          WHEN '8'
                          THEN
                             'eight hundred'
                          WHEN '9'
                          THEN
                             'nine hundred'
                       END
                       + '' h
                       from pc
GO
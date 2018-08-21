DECLARE @beginDate datetime, @endDate datetime



Set @beginDate='20021201'

Set @endDate='20030201'



Select

	result.date_ As Date_,

	DatePart(dw,result.Date_) As DayOfWeek

From

	(

	Select

		cast(cast(year_.value As varchar(4))+Right('0'+cast(month_.value as varchar(2)),2)+Right('0'+cast(day_.value as varchar(2)),2) As datetime) As date_

	From

		(

		Select 2000 As value

		UNION ALL

		Select 2001

		UNION ALL

		Select 2002 

		UNION ALL

		Select 2003

		UNION ALL

		Select 2004

		) year_

		CROSS JOIN

		(

		Select 1 As value

		UNION ALL

		Select 2

		UNION ALL

		Select 3

		UNION ALL

		Select 4

		UNION ALL

		Select 5

		UNION ALL

		Select 6

		UNION ALL

		Select 7

		UNION ALL

		Select 8

		UNION ALL

		Select 9

		UNION ALL

		Select 10

		UNION ALL

		Select 11

		UNION ALL

		Select 12

		) month_

		CROSS JOIN

		(

		Select 1 As value

		UNION ALL

		Select 2

		UNION ALL

		Select 3

		UNION ALL

		Select 4

		UNION ALL

		Select 5

		UNION ALL

		Select 6

		UNION ALL

		Select 7

		UNION ALL

		Select 8

		UNION ALL

		Select 9

		UNION ALL

		Select 10

		UNION ALL

		Select 11 As value

		UNION ALL

		Select 12

		UNION ALL

		Select 13

		UNION ALL

		Select 14

		UNION ALL

		Select 15

		UNION ALL

		Select 16

		UNION ALL

		Select 17

		UNION ALL

		Select 18

		UNION ALL

		Select 19

		UNION ALL

		Select 20

		UNION ALL

		Select 21 As value

		UNION ALL

		Select 22

		UNION ALL

		Select 23

		UNION ALL

		Select 24

		UNION ALL

		Select 25

		UNION ALL

		Select 26

		UNION ALL

		Select 27

		UNION ALL

		Select 28

		UNION ALL

		Select 29

		UNION ALL

		Select 30

		UNION ALL

		Select 31

		) day_

	WHERE

		IsDate(cast(year_.value As varchar(4))+Right('0'+cast(month_.value as varchar(2)),2)+Right('0'+cast(day_.value as varchar(2)),2))=1

		AND cast(year_.value As varchar(4))+Right('0'+cast(month_.value as varchar(2)),2)+Right('0'+cast(day_.value as varchar(2)),2) Between @beginDate AND @endDate	) As result

Order By

	result.Date_
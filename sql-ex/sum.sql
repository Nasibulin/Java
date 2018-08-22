SELECT i,convert(varchar(20), iprice),LEN(convert(varchar(20), iprice)),
CASE (SUBSTRING(convert(varchar(20), iprice),i,1))
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
	END +' '+
CASE
		WHEN (convert(varchar(20), iprice)='0') THEN 'zero'
		WHEN ((SUBSTRING(convert(varchar(20), iprice),i,1))<>'0')AND( ((LEN(convert(varchar(20), iprice))-i) % 3)=2) THEN 'hundred '
		ELSE ''
		END + ''+
CASE (SUBSTRING(convert(varchar(20), iprice),2,1))
		WHEN '0' THEN ''
		WHEN '1' THEN 'ten'
		WHEN '2' THEN 'twenty'
		WHEN '3' THEN 'thirty'
		WHEN '4' THEN 'fourty'
		WHEN '5' THEN 'fifty'
		WHEN '6' THEN 'sixty'
		WHEN '7' THEN 'seventy'
		WHEN '8' THEN 'eighty'
		WHEN '9' THEN 'ninety'
		END + ' '+
CASE (SUBSTRING(convert(varchar(20), iprice),LEN(convert(varchar(20), iprice)),1))
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
	END +' '

  from pcc
  cross join (select 1 i union select 2 i union select 3 i) x
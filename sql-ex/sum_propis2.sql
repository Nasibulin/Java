with pcc as (select str(cast(price as int),3) iprice,* from pc),
hundreds as (select code,model,iprice,

CASE (SUBSTRING (iprice,1,1))
                          WHEN '0' THEN ''
                          WHEN SPACE(1) THEN ''
                          WHEN null THEN ''
                          WHEN '1' THEN 'one hundred'
                          WHEN '2' THEN 'two hundred'
                          WHEN '3' THEN 'three hundred'
                          WHEN '4' THEN 'four hundred'
                          WHEN '5' THEN 'five hundred'
                          WHEN '6' THEN 'six hundred'
                          WHEN '7' THEN 'seven hundred'
                          WHEN '8' THEN 'eight hundred'
                          WHEN '9' THEN 'nine hundred'
                       END
                       + '' h
                       from pcc),
dec as (SELECT code,model,
          iprice,
           
            CASE (SUBSTRING (iprice, 2, 1))

WHEN '0' THEN ''
WHEN SPACE(1) THEN ''
WHEN null THEN ''
WHEN '1' THEN
                  CASE (SUBSTRING (iprice, 3, 1))
                     WHEN '0' THEN ' ten'
                     WHEN '1' THEN ' eleven'
                     WHEN '2' THEN ' twelve'
                     WHEN '3' THEN ' thirteen'
                     WHEN '4' THEN ' fourteen'
                     WHEN '5' THEN ' fifteen'
                     WHEN '6' THEN ' sixteen'
                     WHEN '7' THEN ' seventeen'
                     WHEN '8' THEN ' eighteen'
                     WHEN '9' THEN ' nineteen'
                  END

    WHEN '2' THEN ' twenty'
		WHEN '3' THEN ' thirty'
		WHEN '4' THEN ' forty'
		WHEN '5' THEN ' fifty'
		WHEN '6' THEN ' sixty'
		WHEN '7' THEN ' seventy'
		WHEN '8' THEN ' eighty'
		WHEN '9' THEN ' ninety'

            END
          + ''
                
             dec
     FROM pcc),
digit as (SELECT code,model,
          iprice,
            CASE (SUBSTRING (iprice, 2, 1))
		WHEN '1' THEN ''
    ELSE        
            CASE (SUBSTRING (iprice, 3, 1))
		WHEN '0' THEN ''
    WHEN SPACE(1) THEN ''
    WHEN null THEN ''
    WHEN '1' THEN ' one'
		WHEN '2' THEN ' two'
		WHEN '3' THEN ' three'
		WHEN '4' THEN ' four'
		WHEN '5' THEN ' five'
		WHEN '6' THEN ' six'
		WHEN '7' THEN ' seven'
		WHEN '8' THEN ' eight'
		WHEN '9' THEN ' nine'
            
            END
            END
          + ''
                
             dig
     FROM pcc)     

select distinct dec.model, dec.iprice, rtrim(ltrim(h+dec+dig)) description from hundreds join dec on hundreds.code = dec.code join digit on dec.code = digit.code join pcc on pcc.code=dec.code where pcc.price<1000

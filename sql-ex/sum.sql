SELECT i,
       CONVERT (VARCHAR (20), iprice),
       LEN (CONVERT (VARCHAR (20), iprice)),
       CASE
          WHEN ( (LEN (CONVERT (VARCHAR (20), iprice)) - i) % 3) = 1
          THEN
               CASE (SUBSTRING (CONVERT (VARCHAR (20), iprice), i + 1, 1))
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
             + ' '
             + CASE
                  WHEN    ( ( (LEN (CONVERT (VARCHAR (20), iprice)) - i) % 3) =
                              2)
                       OR     ( ( (LEN (CONVERT (VARCHAR (20), iprice)) - i) %
                                    3) = 0)
                          AND (i = 1)
                  THEN
CASE
 (         SUBSTRING (CONVERT (VARCHAR (20), iprice),
                                        i + 1,
                                        1))
                          WHEN '0'
                          THEN
                             ''
                          WHEN '1'
                          THEN
                             'one'
                          WHEN '2'
                          THEN
                             'two'
                          WHEN '3'
                          THEN
                             'three'
                          WHEN '4'
                          THEN
                             'four'
                          WHEN '5'
                          THEN
                             'five'
                          WHEN '6'
                          THEN
                             'six'
                          WHEN '7'
                          THEN
                             'seven'
                          WHEN '8'
                          THEN
                             'eight'
                          WHEN '9'
                          THEN
                             'nine'
                       END
                     + ' '
                     + CASE
                          WHEN (CONVERT (VARCHAR (20), iprice) = '0')
                          THEN
                             'zero'
                          WHEN     ( (SUBSTRING (
                                         CONVERT (VARCHAR (20), iprice),
                                         i,
                                         1)) <> '0')
                               AND ( ( (  LEN (
                                             CONVERT (VARCHAR (20), iprice))
                                        - i) % 3) = 2)
                          THEN
                             'hundred '
                          ELSE
                             ''
                       END
                     + ''
                     + CASE (SUBSTRING (CONVERT (VARCHAR (20), iprice),
                                        i + 1,
                                        1))
                          WHEN '0'
                          THEN
                             ''
                          WHEN '1'
                          THEN
                             'ten'
                          WHEN '2'
                          THEN
                             'twenty'
                          WHEN '3'
                          THEN
                             'thirty'
                          WHEN '4'
                          THEN
                             'fourty'
                          WHEN '5'
                          THEN
                             'fifty'
                          WHEN '6'
                          THEN
                             'sixty'
                          WHEN '7'
                          THEN
                             'seventy'
                          WHEN '8'
                          THEN
                             'eighty'
                          WHEN '9'
                          THEN
                             'ninety'
                       END
                     + ' '
                     + CASE (SUBSTRING (CONVERT (VARCHAR (20), iprice),
                                        i + 2,
                                        1))
                          WHEN '0'
                          THEN
                             'ten'
                          WHEN '1'
                          THEN
                             'eleven'
                          WHEN '2'
                          THEN
                             'twelve'
                          WHEN '3'
                          THEN
                             'thirteen'
                          WHEN '4'
                          THEN
                             'fourteen'
                          WHEN '5'
                          THEN
                             'fifteen'
                          WHEN '6'
                          THEN
                             'sixteen'
                          WHEN '7'
                          THEN
                             'seventeen'
                          WHEN '8'
                          THEN
                             'eighteen'
                          WHEN '9'
                          THEN
                             'nineteen'
                       END
                     + ' '
                       END
                     + ' '
                                            END
                     + ' '
                     FROM pcc
       CROSS JOIN (SELECT 1 i
                   UNION
                   SELECT 2 i
                   UNION
                   SELECT 3 i) x
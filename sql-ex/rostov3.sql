SELECT dateadd (d, 1, reg_date) AS startdate,
       (SELECT TOP 1 dateadd (d, -1, reg_date)
          FROM (SELECT cast (date AS DATE) reg_date
                  FROM Pass_in_trip
                       JOIN Trip ON Trip.trip_no = Pass_in_trip.trip_no
                 WHERE town_from = 'Rostov'
                UNION
                SELECT DISTINCT
                       cast (
                          iif (time_in < time_out, date + 1, date) AS DATE)
                          reg_date
                  FROM Pass_in_trip
                       JOIN Trip ON Trip.trip_no = Pass_in_trip.trip_no
                 WHERE town_to = 'Rostov'
                UNION
                SELECT '27/03/2003' reg_date) t1
         WHERE t1.reg_date > t.reg_date
        ORDER BY reg_date ASC)
          AS enddate
  FROM (SELECT DISTINCT cast (date AS DATE) reg_date
          FROM Pass_in_trip JOIN Trip ON Trip.trip_no = Pass_in_trip.trip_no
         WHERE town_from = 'Rostov'
        UNION
        SELECT DISTINCT
               cast (iif (time_in < time_out, date + 1, date) AS DATE)
                  reg_date
          FROM Pass_in_trip JOIN Trip ON Trip.trip_no = Pass_in_trip.trip_no
         WHERE town_to = 'Rostov'
        UNION
        SELECT '27/03/2003' reg_date) t
 WHERE reg_date <>
          (SELECT TOP 1 dateadd (d, -1, reg_date)
             FROM (SELECT DISTINCT cast (date AS DATE) reg_date
                     FROM Pass_in_trip
                          JOIN Trip ON Trip.trip_no = Pass_in_trip.trip_no
                    WHERE town_from = 'Rostov'
                   UNION
                   SELECT DISTINCT
                          cast (
                             iif (time_in < time_out, date + 1, date) AS DATE)
                             reg_date
                     FROM Pass_in_trip
                          JOIN Trip ON Trip.trip_no = Pass_in_trip.trip_no
                    WHERE town_to = 'Rostov'
                   UNION
                   SELECT '27/03/2003' reg_date) t1
            WHERE t1.reg_date > t.reg_date
           ORDER BY reg_date ASC)
ORDER BY startdate
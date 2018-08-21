SELECT dateadd (d, 1, reg_date) AS startdate,
       (SELECT TOP 1 dateadd (d, -1, reg_date)
          FROM (SELECT DISTINCT cast (date + time_out AS DATE) reg_date
                  FROM Pass_in_trip
                       JOIN Trip ON Trip.trip_no = Pass_in_trip.trip_no
                 WHERE town_from = 'Rostov' OR town_to = 'Rostov') t1
         WHERE t1.reg_date > t.reg_date
        ORDER BY reg_date ASC)
          AS enddate
  FROM (SELECT DISTINCT cast (date + time_out AS DATE) reg_date
          FROM Pass_in_trip JOIN Trip ON Trip.trip_no = Pass_in_trip.trip_no
         WHERE town_from = 'Rostov' OR town_to = 'Rostov') t
 WHERE reg_date <>
          (SELECT TOP 1 dateadd (d, -1, reg_date)
             FROM (SELECT DISTINCT cast (date + time_out AS DATE) reg_date
                     FROM Pass_in_trip
                          JOIN Trip ON Trip.trip_no = Pass_in_trip.trip_no
                    WHERE town_from = 'Rostov' OR town_to = 'Rostov') t1
            WHERE t1.reg_date > t.reg_date
           ORDER BY reg_date ASC)
ORDER BY startdate
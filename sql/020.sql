SELECT dateadd (d, 1, reg_date) AS startdate,
       (SELECT TOP 1 dateadd (d, -1, reg_date)
          FROM (SELECT cast (date AS DATE) reg_date
  FROM Pass_in_trip JOIN Trip ON Trip.trip_no = Pass_in_trip.trip_no
 WHERE town_from = 'Rostov'
UNION
SELECT cast (iif (time_in < time_out, date + 1, date) AS DATE) reg_date
  FROM Pass_in_trip JOIN Trip ON Trip.trip_no = Pass_in_trip.trip_no
 WHERE town_to = 'Rostov' union select '03/27/2003' reg_date union select '04/29/2003' reg_date) t1
         WHERE t1.reg_date > t.reg_date
        ORDER BY reg_date ASC)
          AS enddate
  FROM (SELECT cast (date AS DATE) reg_date
  FROM Pass_in_trip JOIN Trip ON Trip.trip_no = Pass_in_trip.trip_no
 WHERE town_from = 'Rostov'
UNION
SELECT cast (iif (time_in < time_out, date + 1, date) AS DATE) reg_date
  FROM Pass_in_trip JOIN Trip ON Trip.trip_no = Pass_in_trip.trip_no
 WHERE town_to = 'Rostov'  union select '03/27/2003' reg_date union select '04/29/2003' reg_date) t
 WHERE reg_date <>
          (SELECT TOP 1 dateadd (d, -1, reg_date)
             FROM (SELECT cast (date AS DATE) reg_date
  FROM Pass_in_trip JOIN Trip ON Trip.trip_no = Pass_in_trip.trip_no
 WHERE town_from = 'Rostov'
UNION
SELECT cast (iif (time_in < time_out, date + 1, date) AS DATE) reg_date
  FROM Pass_in_trip JOIN Trip ON Trip.trip_no = Pass_in_trip.trip_no
 WHERE town_to = 'Rostov' union select '03/27/2003' reg_date union select '04/29/2003' reg_date) t1
            WHERE t1.reg_date > t.reg_date
           ORDER BY reg_date ASC)
and (dateadd (d, 1, reg_date)>='03/28/2003') and (SELECT TOP 1 dateadd (d, -1, reg_date)
          FROM (SELECT cast (date AS DATE) reg_date
  FROM Pass_in_trip JOIN Trip ON Trip.trip_no = Pass_in_trip.trip_no
 WHERE town_from = 'Rostov'
UNION
SELECT cast (iif (time_in < time_out, date + 1, date) AS DATE) reg_date
  FROM Pass_in_trip JOIN Trip ON Trip.trip_no = Pass_in_trip.trip_no
 WHERE town_to = 'Rostov' union select '03/27/2003' reg_date union select '04/29/2003' reg_date) t1
         WHERE t1.reg_date > t.reg_date
        ORDER BY reg_date ASC)<= '04/28/2003' ORDER BY startdate

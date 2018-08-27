with s1 as (SELECT id_psg,(DATEPART (dw, date) - DATEPART (dw, '20180819') % 7) day_out,
       (datepart (dw, date + iif (time_out < time_in, 0, 1))
        - DATEPART (dw, '20180819') % 7)
          day_in
  FROM trip JOIN dbo.Pass_in_trip ON Pass_in_trip.trip_no = Trip.trip_no)
  
  select id_psg,day_out,count(day_in) from s1 where day_in=1 group by id_psg,day_out
SELECT id_psg,
       (  datepart (dw, date + iif (time_out < time_in, 0, 1))
        - DATEPART (dw, '20180819') % 7)
          day
  FROM trip JOIN dbo.Pass_in_trip ON Pass_in_trip.trip_no = Trip.trip_no
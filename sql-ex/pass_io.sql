WITH out_
     AS (SELECT id_psg,
                (DATEPART (dw, date) - DATEPART (dw, '20180819') % 7) day
           FROM Pass_in_trip),
     in_
     AS (SELECT id_psg,
                (  datepart (dw, date + iif (time_out < time_in, 0, 1))
                 - DATEPART (dw, '20180819') % 7)
                   day
           FROM trip
                JOIN dbo.Pass_in_trip ON Pass_in_trip.trip_no = Trip.trip_no),
     pass_io
     AS (SELECT in_.id_psg, out_.day, count (in_.day) cnt
           FROM in_ JOIN out_ ON in_.id_psg = out_.ID_psg
          WHERE in_.day = 1
         GROUP BY in_.id_psg, out_.day)
SELECT *
  FROM pass_io
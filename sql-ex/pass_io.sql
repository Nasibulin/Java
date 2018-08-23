with out_ as (SELECT id_psg,
       (DATEPART (dw, date) - DATEPART (dw, '20180819') % 7) day
  FROM Pass_in_trip),
  
  in_ as (SELECT id_psg,
       (  datepart (dw, date + iif (time_out < time_in, 0, 1))
        - DATEPART (dw, '20180819') % 7)
          day
  FROM trip JOIN dbo.Pass_in_trip ON Pass_in_trip.trip_no = Trip.trip_no)
  
  select in_.id_psg,out_.day,count(in_.day) cnt FROM in_ join out_ on in_.id_psg=out_.ID_psg where in_.day=1 group by in_.id_psg,out_.day
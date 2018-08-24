WITH s1
     AS (SELECT id_psg,
                (DATEPART (dw, date) - DATEPART (dw, '20180819') % 7) day
           FROM Pass_in_trip),
     s2
     AS (SELECT id_psg, day, count (day) OVER (PARTITION BY id_psg) cnt
           FROM s1),
     s3
     AS (SELECT id_psg,
                day,
                count (day) day_cnt,
                cnt all_cnt
           FROM s2
         GROUP BY id_psg, day, cnt),
     s4
     AS (SELECT DISTINCT p.id_psg
           FROM s3 JOIN passenger p ON s3.id_psg = p.id_psg
          WHERE    day NOT IN (6, 7)
                OR (day IN (6, 7) AND day_cnt < (all_cnt - day_cnt))),
     in_
     AS (SELECT id_psg,
                (  datepart (dw, date + iif (time_out < time_in, 0, 1))
                 - DATEPART (dw, '20180819') % 7)
                   day
           FROM trip JOIN Pass_in_trip ON Pass_in_trip.trip_no = Trip.trip_no),
     all_
     AS (SELECT in_.id_psg, count (in_.day) cnt
           FROM in_
          WHERE (in_.day = 1 AND id_psg IN (SELECT id_psg FROM s4))
         GROUP BY in_.id_psg)

SELECT name
  FROM all_ join Passenger p on p.ID_psg=all_.id_psg
 WHERE cnt IN (SELECT max (cnt) FROM all_)
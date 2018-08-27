WITH s1
     AS (SELECT  id_psg
           FROM (SELECT id_psg,
                        day,
                        count (day) OVER (PARTITION BY id_psg) cnt
                   FROM (SELECT id_psg,DATEPART (dw, date) day
                           FROM Pass_in_trip) s) s
         GROUP BY id_psg, day, cnt
         HAVING    (    day IN (DATEPART (dw, '20180825'), DATEPART (dw, '20180826'))
                    AND count (day) * 1.0 / cnt <
                           (cnt - count (day)) * 1.0 / cnt)
                OR (day NOT IN (DATEPART (dw, '20180825'), DATEPART (dw, '20180826')))),
     s2
     AS (SELECT id_psg, day_in, (count (day_in) * 1.0 / cnt) freq
           FROM (SELECT id_psg,
                        day_in,
                        count (day_in) OVER (PARTITION BY day_in) cnt
                   FROM (SELECT id_psg,
                                datepart (
                                      dw,
                                      date + iif (time_out < time_in, 0, 1)) day_in
                           FROM trip
                                JOIN Pass_in_trip
                                   ON Pass_in_trip.trip_no = Trip.trip_no
                          WHERE id_psg IN (SELECT id_psg FROM s1)) s) s
         GROUP BY id_psg, day_in, cnt
         HAVING day_in = DATEPART (dw, '20180820')
         )
SELECT name
  FROM s2 JOIN passenger p ON s2.id_psg = p.id_psg
 WHERE freq = (SELECT max (freq) FROM s2)
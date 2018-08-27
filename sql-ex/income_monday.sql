SET DATEFIRST 7;
SELECT id_psg,
       day_in,
(count (day_in) * 1.0 / cnt) freq, count (day_in), cnt
  FROM (SELECT id_psg, day_in, count (day_in) OVER (PARTITION BY day_in) cnt
          FROM (SELECT id_psg,
                       (  datepart (dw,
                                    date + iif (time_out <= time_in, 0, 1))
                        - datepart (dw, '20180819') % 7)
                          day_in
                  FROM trip
                       JOIN Pass_in_trip
                          ON Pass_in_trip.trip_no = Trip.trip_no) s) s
GROUP BY id_psg, day_in, cnt
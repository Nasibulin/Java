SELECT id_psg,
       day,
       count (day) cnt,
       cnt cnt_all
  FROM (SELECT id_psg, day, count (day) OVER (PARTITION BY id_psg) cnt
          FROM (SELECT id_psg,
                       (DATEPART (dw, date) - DATEPART (dw, '20180819') % 7)
                          day
                  FROM Pass_in_trip) s) s
GROUP BY id_psg, day, cnt having (day in (6,7) and count (day) < (cnt-count(day))) or (day not in (6.7))
SELECT id_psg,
       (DATEPART (dw, date) - DATEPART (dw, '20180819') % 7) day
  FROM Pass_in_trip
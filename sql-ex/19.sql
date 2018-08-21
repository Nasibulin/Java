WITH str
     AS (SELECT lower (concat (Trip.plane,
                               Trip.town_to,
                               Trip.town_from,
                               Company.name,
                               Passenger.name,
                               Pass_in_trip.place))
                   str
           FROM ((Trip INNER JOIN Company ON (Trip.ID_comp = Company.ID_comp)) INNER JOIN Pass_in_trip Pass_in_trip ON (Pass_in_trip.trip_no =
                                                                                                                           Trip.trip_no))
                INNER JOIN Passenger
                   ON (Pass_in_trip.ID_psg = Passenger.ID_psg)),
     alphabet
     AS (SELECT ASCII ('A') code, CHAR (ASCII ('A')) A
         UNION ALL
         SELECT code + 1, CHAR (code + 1)
           FROM alphabet
          WHERE code + 1 <= ASCII ('Z')),
     list
     AS (SELECT substring ( (SELECT '' + str AS 'data()'
                               FROM str
                             FOR XML PATH ( '' )),
                           1,
                           16000)
                   MyList)
SELECT a.A, LEN (REPLACE (list.MyList, a.A, a.A + a.A)) - LEN (list.MyList)
  FROM list CROSS JOIN alphabet a
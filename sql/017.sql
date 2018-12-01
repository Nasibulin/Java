WITH ss
     AS (SELECT ID_comp, plane, Count (*) OVER (PARTITION BY ID_comp) cnt
           FROM (SELECT DISTINCT ID_comp, plane FROM Trip) AS D)
SELECT name
  FROM (SELECT C1, C2
          FROM (SELECT S1.ID_comp C1, S2.cnt K2, S2.ID_comp C2
                  FROM ss S1 JOIN ss S2 ON S1.plane = S2.plane
                 WHERE S1.ID_comp <> S2.ID_comp AND S1.cnt >= S2.cnt) AS D
        GROUP BY C1, C2
        HAVING Count (*) >= Max (K2)) AS DD
       JOIN Company C ON DD.C1 = C.ID_comp
GROUP BY name, C1

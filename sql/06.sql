with s1 as (select trip_no,
        (CASE WHEN CONVERT(VARCHAR(16), trip_no & 32768 ) > 0 THEN '1' ELSE '0'   END +
        CASE WHEN CONVERT(VARCHAR(16), trip_no & 16384 ) > 0 THEN '1' ELSE '0'   END +
        CASE WHEN CONVERT(VARCHAR(16), trip_no &  8192 ) > 0 THEN '1' ELSE '0'   END +
        CASE WHEN CONVERT(VARCHAR(16), trip_no &  4096 ) > 0 THEN '1' ELSE '0'   END +
        CASE WHEN CONVERT(VARCHAR(16), trip_no &  2048 ) > 0 THEN '1' ELSE '0'   END +
        CASE WHEN CONVERT(VARCHAR(16), trip_no &  1024 ) > 0 THEN '1' ELSE '0'   END +
        CASE WHEN CONVERT(VARCHAR(16), trip_no &   512 ) > 0 THEN '1' ELSE '0'   END +
        CASE WHEN CONVERT(VARCHAR(16), trip_no &   256 ) > 0 THEN '1' ELSE '0'   END +
        CASE WHEN CONVERT(VARCHAR(16), trip_no &   128 ) > 0 THEN '1' ELSE '0'   END +
        CASE WHEN CONVERT(VARCHAR(16), trip_no &    64 ) > 0 THEN '1' ELSE '0'   END +
        CASE WHEN CONVERT(VARCHAR(16), trip_no &    32 ) > 0 THEN '1' ELSE '0'   END +
        CASE WHEN CONVERT(VARCHAR(16), trip_no &    16 ) > 0 THEN '1' ELSE '0'   END +
        CASE WHEN CONVERT(VARCHAR(16), trip_no &     8 ) > 0 THEN '1' ELSE '0'   END +
        CASE WHEN CONVERT(VARCHAR(16), trip_no &     4 ) > 0 THEN '1' ELSE '0'   END +
        CASE WHEN CONVERT(VARCHAR(16), trip_no &     2 ) > 0 THEN '1' ELSE '0'   END +
        CASE WHEN CONVERT(VARCHAR(16), trip_no &     1 ) > 0 THEN '1' ELSE '0'   END)
trip_no_bit
from trip)

select trip_no,substring(trip_no_bit,charindex('1',trip_no_bit),len(trip_no_bit)) from s1

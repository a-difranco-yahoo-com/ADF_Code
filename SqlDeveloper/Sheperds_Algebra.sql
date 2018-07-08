
WITH Mult AS (SELECT Rownum X FROM ALL_OBJECTS WHERE Rownum <= 100)
SELECT 'N 51° 34.' ||(1056-Multiple) Northing,
       'W 0°  08.' || (434-Multiple) Westing,
       X, Multiple
FROM  (
        SELECT Mult.X, (7 * Mult.X) Multiple
        FROM   Mult
        )
WHERE  mod(Multiple, 2) = 1
AND    mod(Multiple, 3) = 1
AND    mod(Multiple, 4) = 1
AND    mod(Multiple, 5) = 1
AND    mod(Multiple, 6) = 1
/

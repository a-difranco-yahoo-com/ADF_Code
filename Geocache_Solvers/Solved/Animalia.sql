
DROP   TABLE GC_ANIMAILIA PURGE;
CREATE TABLE GC_ANIMAILIA
AS
/
WITH Digit AS (SELECT Rownum X FROM ALL_OBJECTS WHERE Rownum <= 999)
SELECT 
       ((A.X + B.X + C.X + D.X) / 2) - 4 Northing,
        D.X + ((A.X - C.X) / C.X) Westing,
       A.X A, B.X B, C.X C, D.X D
FROM   Digit A
  JOIN Digit B ON B.X BETWEEN 100 AND 999
  JOIN Digit C ON C.X BETWEEN 1   AND 9
  JOIN Digit D ON D.X BETWEEN 100 AND 999
WHERE  A.X = 24
AND    B.X = 101
AND    C.X = 3
AND    D.X = 910
/  
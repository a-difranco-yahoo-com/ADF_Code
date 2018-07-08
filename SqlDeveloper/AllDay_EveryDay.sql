
SELECT count(*)
FROM (
WITH Digit AS (SELECT Rownum - 1 X FROM ALL_OBJECTS WHERE Rownum <= 10)
SELECT 'N 51° 23.' || (B.X - C.X) ||(F.X - E.X) || (D.X - A.X - E.X) Northing,
       'E000 03.'  || (B.X + C.X) || D.X        || (A.X + E.X - C.X) Easting,
       A.X A, B.X B, C.X C, D.X D, E.X E, F.X F
FROM   Digit A
  JOIN Digit B ON A.X + B.X                                                <= 10
  JOIN Digit C ON A.X + B.X + C.X                                          <= 10
  JOIN Digit C ON C.X <= 9
  JOIN Digit D ON D.X <= 9
  JOIN Digit E ON E.X <= 9
  JOIN Digit F ON F.X <= 9
WHERE  B.X - C.X       >= 0
AND    F.X - E.X       >= 0
AND    D.X - A.X - E.X >= 0
AND    B.X + C.X       <= 9
AND    A.X + E.X - C.X >= 0  
)
/


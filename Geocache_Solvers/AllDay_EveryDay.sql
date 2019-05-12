
DROP   TABLE GC_ALLDAY_EVERYDAY PURGE;
CREATE TABLE GC_ALLDAY_EVERYDAY
AS
WITH Digit AS (SELECT Rownum - 1 X FROM ALL_OBJECTS WHERE Rownum <= 10)
SELECT 'N 51° 23.' || (B.X - C.X) ||(F.X - E.X) || (D.X - A.X - E.X) Northing,
       'E000 03.'  || (B.X + C.X) || D.X        || (A.X + E.X - C.X) Easting,
       (B.X - C.X) ||(F.X - E.X) || (D.X - A.X - E.X) Northing_Thousandth,
       (B.X + C.X) || D.X        || (A.X + E.X - C.X) Easting_Thousandth,
       A.X A, B.X B, C.X C, D.X D, E.X E, F.X F
FROM   Digit A
  JOIN Digit B ON B.X <= 9
  JOIN Digit C ON C.X <= 9
  JOIN Digit D ON D.X <= 9
  JOIN Digit E ON E.X <= 9
  JOIN Digit F ON F.X <= 9
WHERE  B.X - C.X       Between 0 AND 9
AND    F.X - E.X       Between 0 AND 9
AND    D.X - A.X - E.X Between 0 AND 9
AND    B.X + C.X       Between 0 AND 9
AND    A.X + E.X - C.X Between 0 AND 9
/


-- North Near : 310 : East near 999
SELECT   min(Northing_Thousandth), max(Northing_Thousandth), min(Easting_Thousandth), max(Easting_Thousandth), Count(*)
FROM     GC_ALLDAY_EVERYDAY
WHERE    Northing_Thousandth Between 200 AND 400
AND      Easting_Thousandth  Between 800 AND 999
GROUP BY floor(Northing_Thousandth/100), floor(Easting_Thousandth/100)
ORDER BY 1, 3 Desc
/

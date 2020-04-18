
N 51° 32. (blue + red) x yellow x red + yellow
W 000° 00. (yellow + blue + black) x blue x green + blue
/

Drop   Table GEO_1912_NORTH Purge;
Create Table GEO_1912_NORTH
AS
WITH Nos AS (SELECT rownum Nos FROM ALL_OBJECTS WHERE Rownum <= 999)
SELECT Blue.Nos Blue, Red.Nos Red, Yellow.Nos Yellow,
     ((Blue.Nos + Red.Nos) * Yellow.Nos * Red.Nos) + Yellow.Nos Northing
FROM       Nos Blue
CROSS JOIN Nos Red
CROSS JOIN Nos Yellow
WHERE (((Blue.Nos + Red.Nos) * Yellow.Nos * Red.Nos) + Yellow.Nos
) Between 0 AND 999
/
SELECT count(*) FROM GEO_1912_NORTH; -- 13,227

Drop   Table GEO_1912_Black_Equal_1 Purge;
Create Table GEO_1912_Black_Equal_1
AS
WITH Nos AS (SELECT rownum Nos FROM ALL_OBJECTS WHERE Rownum <= 999)
SELECT Blue, Red, Yellow, Black.Nos Black, Green.Nos Green,
       Northing,
      ( (Yellow + Blue + Black.Nos) * Blue * Green.Nos) + Blue Westing
FROM       GEO_1912_NORTH 
CROSS JOIN Nos Black
CROSS JOIN Nos Green
WHERE Black.Nos = 1
AND   ( (Yellow + Blue + Black.Nos) * Blue * Green.Nos) + Blue Between 0 AND 999
/
SELECT count(*) FROM GEO_1912_Black_Equal_1; -- 86,383



Drop   Table GEO_1912_Final Purge;
Create Table GEO_1912_Final
AS
WITH Nos AS (SELECT rownum Nos FROM ALL_OBJECTS WHERE Rownum <= 999)
SELECT Blue, Red, Yellow, Black.Nos Black, Green,
       Northing,
      ( (Yellow + Blue + Black.Nos) * Blue * Green) + Blue Westing
FROM       GEO_1912_Black_Equal_1 
CROSS JOIN Nos Black
WHERE ( (Yellow + Blue + Black.Nos) * Blue * Green) + Blue Between 0 AND 999
/
SELECT count(*) FROM   GEO_1912_Final;  -- 3,672,694


SELECT min(Blue), max(Blue), min(Red), max(Red), min(Yellow), max(Yellow), min(Black), max(Black), min(Green), max(Green),
       min(Northing), max(Northing), min(Westing), max(Westing), 
       count(*)
FROM   GEO_1912_Final
WHERE  Blue + Red + Yellow + Black + Green = 28
AND    Northing > 500
AND    Westing  > 500
/
SELECT *
FROM   GEO_1912_Final
WHERE  Blue + Red + Yellow + Black + Green = 204
/
WHERE  Blue + Red + Yellow + Black + Green = 28
AND    Blue   IN (1, 2, 3, 20, 21)
AND    Red    IN (1, 2, 3, 20, 21)
AND    Yellow IN (1, 2, 3, 20, 21)
AND    Black  IN (1, 2, 3, 20, 21)
AND    Green  IN (1, 2, 3, 20, 21)
AND    Blue IN (20, 21)
AND    Red  = 3
AND    Yellow IN (1, 2)
AND    Black = 2
AND    Green = 1
AND    Northing > 100
AND    Westing  > 100
/


Green  : Oceaniana: 1
Blue   : Europe:   20 / 21
Red    : Americas:  3
Black  : Africa:    2
Yellow : Asia:      1 / 2


N 51° 32.140 W 000° 00.500
/

SELECT Blue, Red, Yellow, Black, Green,
     (Blue + Red)            * Yellow * Red   + Yellow Northing,
     (Yellow + Blue + Black) * Blue   * Green + Blue   Westing
FROM  (SELECT 49 Green, 17 Blue, 41 Red, 53 Black, 44 Yellow FROM DUAL)
/

SELECT 53 + 41 + 44 + 49 + 17
FROM DUAL

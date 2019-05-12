
-- N 51 (H-E)(F-A).(F-G)(B-H)(C*D)   W 000 (A-E)(B-D).(G+E)(B+C)(F-A)
--Start : N 51° 29.662 W 000° 08.871 


Drop  Table GC_Who_are_These_People Purge
/
Create Table GC_Who_are_These_People
AS
SELECT *
FROM (
WITH DIGIT AS (SELECT Rownum - 1 X FROM ALL_OBJECTS WHERE Rownum <=  200)
SELECT A.X A, B.X B, C.X C, D.X D, E.X E, F.X F, G.X G, H.X H,
      (H.X - E.X) || (F.X - A.X) North_Minute,
      (F.X - G.X) || (B.X - H.X) || (C.X * D.X) North_Minute_Thousandth,
      (A.X - E.X) || (B.X - D.X) West_Minute,
      (G.X + E.X) || (B.X + C.X) || (F.X - A.X) West_Minute_Thousandth,
      'Y' Valid
FROM       DIGIT A
CROSS JOIN DIGIT B
CROSS JOIN DIGIT C
CROSS JOIN DIGIT D
CROSS JOIN DIGIT E
CROSS JOIN DIGIT F
CROSS JOIN DIGIT G
CROSS JOIN DIGIT H
WHERE  (H.X - E.X) Between 0 AND 9
AND    (F.X - A.X) Between 0 AND 9
AND    (F.X - G.X) Between 0 AND 9
AND    (B.X - H.X) Between 0 AND 9
AND    (C.X * D.X) Between 0 AND 9
AND    (A.X - E.X) Between 0 AND 9
AND    (B.X - D.X) Between 0 AND 9
AND    (G.X + E.X) Between 0 AND 9
AND    (B.X + C.X) Between 0 AND 9
)
WHERE  North_Minute IN ('28', '29', '30')
AND    West_Minute  IN ('07', '08', '09')
/


SELECT North_Minute, count(*) FROM GC_Who_are_These_People GROUP BY North_Minute ORDER BY abs(North_Minute - 29);
SELECT West_Minute,  count(*) FROM GC_Who_are_These_People GROUP BY West_Minute  ORDER BY abs(West_Minute  -  8);

-- North 28 / 29 / 30
DELETE FROM  GC_Who_are_These_People WHERE  North_Minute NOT IN ('28', '29', '30');
-- West 08 / 09
DELETE FROM  GC_Who_are_These_People WHERE  West_Minute NOT IN ('07', '08', '09');

SELECT   North_Minute, North_Minute_Thousandth, count(*) FROM GC_Who_are_These_People
GROUP BY North_Minute, North_Minute_Thousandth
ORDER BY North_Minute, North_Minute_Thousandth;
SELECT   West_Minute,  West_Minute_Thousandth, count(*) FROM GC_Who_are_These_People
GROUP BY West_Minute,  West_Minute_Thousandth
ORDER BY West_Minute,  West_Minute_Thousandth;

--Start : N 51° 29.662 W 000° 08.871 
-- N 51° 29.162 - N 51° 30.162 : W 000° 08.371  - W 000° 09.371 
DELETE FROM  GC_Who_are_These_People WHERE  North_Minute = '29' AND North_Minute_Thousandth < '162';
DELETE FROM  GC_Who_are_These_People WHERE  North_Minute = '30' AND North_Minute_Thousandth > '162';
-- West 08 / 09
DELETE FROM  GC_Who_are_These_People WHERE  West_Minute = '08'  AND West_Minute_Thousandth < '371';
DELETE FROM  GC_Who_are_These_People WHERE  West_Minute = '09'  AND West_Minute_Thousandth > '371';


SELECT A, count(A) Options FROM GC_Who_are_These_People GROUP BY A ORDER BY A; -- 0 - 6
SELECT min(A) Min_A, max(A) Max_A FROM GC_Who_are_These_People; -- 0 - 6
SELECT min(B) Min_B, max(B) Max_B FROM GC_Who_are_These_People; -- 8 - 9
SELECT min(C) Min_C, max(C) Max_C FROM GC_Who_are_These_People; -- 0 - 1
SELECT min(D) Min_D, max(D) Max_D FROM GC_Who_are_These_People; -- 0 - 1
SELECT min(E) Min_E, max(E) Max_E FROM GC_Who_are_These_People; -- 0 - 6
SELECT min(F) Min_F, max(F) Max_F FROM GC_Who_are_These_People; -- 0 - 13
SELECT min(G) Min_G, max(G) Max_G FROM GC_Who_are_These_People; -- 0 - 9
SELECT min(H) Min_H, max(H) Max_H FROM GC_Who_are_These_People; -- 2 - 9
SELECT count(*) Options           FROM GC_Who_are_These_People; -- 208

SELECT *   FROM GC_Who_are_These_People; -- 101
SELECT Valid, count(*) Options FROM GC_Who_are_These_People GROUP BY Valid ORDER BY 1; -- 0 - 6


SELECT   North_Minute, North_Minute_Thousandth, West_Minute, West_Minute_Thousandth, count(*) 
FROM GC_Who_are_These_People
GROUP BY North_Minute, North_Minute_Thousandth, West_Minute, West_Minute_Thousandth
ORDER BY Count(*);

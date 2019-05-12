
N 51° 31.881 W 000° 09.654 
NORTH (Green X 2) - Pale Green°  
       Green + (Pale Green X 5).  (Dark Green X 3) + Dull Green + Green + (Pale Green X 4)   
WEST White White White°  
     Light Green - Pale Green.  Dull Green - Green + (Pale Green X 7)
/

-----------------------------------------------------------

Drop   Table GC_GREEN Purge;
Create Table GC_GREEN
AS
SELECT *
FROM  (
WITH Digits AS (SELECT rownum - 1 X FROM ALL_OBJECTS WHERE Rownum <= 290)
SELECT  (G.X * 2) - PG.X                        North_Degrees,
         G.X + (PG.X * 5)                       North_Minutes,
        (DaG.X * 3) + DuG.X + G.X + (PG.X * 4)  North_Minute_Part,
         W.X                                    West_Degrees,
         LG.X - PG.X                            West_Minutes,
         DuG.X - G.X + (PG.X * 7)               West_Minute_Part,
         W.X W, PG.X PG, LG.X LG, G.X G, DuG.X DuG, DaG.X DaG
FROM   Digits W
 JOIN  Digits PG  ON  PG.X  Between 1   AND 1
 JOIN  Digits LG  ON  LG.X  Between 11  AND 14
 JOIN  Digits G   ON   G.X  Between 18  AND 31
 JOIN  Digits DuG ON DuG.X  Between 92  AND 113
 JOIN  Digits DaG ON DaG.X  Between 241 AND 357
)
WHERE North_Degrees = 51
AND   North_Minutes IN (30, 31, 32)
AND   North_Minute_Part Between 0 AND 999 
AND   West_Degrees = 0
AND   West_Minutes IN (8, 9 ,10)
/

-- N 51° 31.881 W 000° 09.654 
-- N 51° 31.884 W 000° 10.082 

SELECT * FROM GC_GREEN WHERE DAG = 251;
-- 
SELECT min(North_Degrees),     max(North_Degrees)     FROM GC_GREEN; -- 51
SELECT min(North_Minutes),     max(North_Minutes)     FROM GC_GREEN; -- 31
SELECT min(North_Minute_Part), max(North_Minute_Part) FROM GC_GREEN; -- 845 - 999
SELECT min(West_Degrees),      max(West_Degrees)      FROM GC_GREEN; -- 0
SELECT min(West_Minutes),      max(West_Minutes)      FROM GC_GREEN; -- 10
SELECT min(West_Minute_Part),  max(West_Minute_Part)  FROM GC_GREEN; -- 73 - 94
--
SELECT min(W),     max(W)     FROM GC_GREEN; -- 0
SELECT min(PG),    max(PG)    FROM GC_GREEN; -- 1
SELECT min(LG),    max(LG)    FROM GC_GREEN; -- 11
SELECT min(G),     max(G)     FROM GC_GREEN; -- 26
SELECT min(DuG),   max(DuG)   FROM GC_GREEN; -- 92 - 113
SELECT min(DaG),   max(DaG)   FROM GC_GREEN; -- 241 - 289

-- AlanWito DuG 103
DELETE FROM GC_GREEN WHERE DuG > 103;
SELECT min(North_Minute_Part), max(North_Minute_Part) FROM GC_GREEN; -- 845 - 999
SELECT min(West_Minute_Part),  max(West_Minute_Part)  FROM GC_GREEN; -- 73 - 84
SELECT min(DuG),   max(DuG)   FROM GC_GREEN; -- 92 - 103
SELECT min(DaG),   max(DaG)   FROM GC_GREEN; -- 241 - 289

-- Krop Green 100
DELETE FROM GC_GREEN WHERE DuG <= 100;
SELECT min(North_Minute_Part), max(North_Minute_Part) FROM GC_GREEN; -- 854 - 999
SELECT min(West_Minute_Part),  max(West_Minute_Part)  FROM GC_GREEN; -- 82 - 84
SELECT min(DuG),   max(DuG)   FROM GC_GREEN; -- 101 - 103
SELECT min(DaG),   max(DaG)   FROM GC_GREEN; -- 241 - 289


-- Southerntrekker DuG 102
DELETE FROM GC_GREEN WHERE DuG > 102;
SELECT min(North_Minute_Part), max(North_Minute_Part) FROM GC_GREEN; -- 854 - 999
SELECT min(West_Minute_Part),  max(West_Minute_Part)  FROM GC_GREEN; -- 82 - 83
SELECT min(DuG),   max(DuG)   FROM GC_GREEN; -- 101 - 102
SELECT min(DaG),   max(DaG)   FROM GC_GREEN; -- 241 - 289

-- Gazania Rigens DuG 247
DELETE FROM GC_GREEN WHERE DaG <= 247;
SELECT min(North_Minute_Part), max(North_Minute_Part) FROM GC_GREEN; -- 875 - 999
SELECT min(West_Minute_Part),  max(West_Minute_Part)  FROM GC_GREEN; -- 82 - 83
SELECT min(DuG),   max(DuG)   FROM GC_GREEN; -- 101 - 102
SELECT min(DaG),   max(DaG)   FROM GC_GREEN; -- 248 - 289

-- tundra70  DaG 269
DELETE FROM GC_GREEN WHERE DaG > 269;
SELECT min(North_Minute_Part), max(North_Minute_Part) FROM GC_GREEN; -- 875 - 939
SELECT min(West_Minute_Part),  max(West_Minute_Part)  FROM GC_GREEN; -- 82 - 83
SELECT min(DuG),   max(DuG)   FROM GC_GREEN; -- 101 - 102
SELECT min(DaG),   max(DaG)   FROM GC_GREEN; -- 248 - 269

-- mjouk DaG 257
DELETE FROM GC_GREEN WHERE DaG > 257;
SELECT min(North_Minute_Part), max(North_Minute_Part) FROM GC_GREEN; -- 875 - 903
SELECT min(West_Minute_Part),  max(West_Minute_Part)  FROM GC_GREEN; -- 82 - 83
SELECT min(DuG),   max(DuG)   FROM GC_GREEN; -- 101 - 102
SELECT min(DaG),   max(DaG)   FROM GC_GREEN; -- 248 - 257

-- heartstones1  DuG 101
DELETE FROM GC_GREEN WHERE DuG > 101;
SELECT min(North_Minute_Part), max(North_Minute_Part) FROM GC_GREEN; -- 875 - 901
SELECT min(West_Minute_Part),  max(West_Minute_Part)  FROM GC_GREEN; -- 82 - 82
SELECT min(DuG),   max(DuG)   FROM GC_GREEN; -- 101 - 101
SELECT min(DaG),   max(DaG)   FROM GC_GREEN; -- 248 - 257

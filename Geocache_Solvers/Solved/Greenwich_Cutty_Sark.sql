
The total number of embossed crowns on the exterior of the phone box and the post box = A
The first letter under the large crown on the front of the post box = B
The second letter under the large crown on the front of the post box = C
The number of letters in the first word next to the slot for letters on the post box = D
The number of letters in the second word next to the slot for letters on the post box = E

The cache can be found at

N 51°  28.   A+D    C-E    B-A
W 000° 00.   E-D    B    D
-----------------------------------------------------------

Drop   Table CUTTY_SARK Purge;
Create Table CUTTY_SARK
AS
SELECT *
FROM  (
WITH Digits AS (SELECT rownum X FROM ALL_OBJECTS WHERE Rownum <= 27)
SELECT  A.X + D.X   North_M1,
        C.X - E.X   North_M2,
        B.X - A.X   North_M3,
        E.X - D.X   West_M1,
        B.X         West_M2,
        D.X         West_M3,
         A.X A, B.X B, C.X C, D.X D, E.X E
FROM   Digits A
 JOIN  Digits B ON  B.X  Between 7  AND 7    -- G
 JOIN  Digits C ON  C.X  Between 18 AND 18   -- R
 JOIN  Digits D ON  D.X  Between 4  AND 4    -- Next
 JOIN  Digits E ON  E.X  Between 10 AND 10   --- Collection
)
WHERE  North_M1 Between 0 AND 9
AND    North_M2 Between 0 AND 9
AND    North_M3 Between 0 AND 9
AND    West_M1  Between 0 AND 9
AND    West_M2  Between 0 AND 9
AND    West_M3  Between 0 AND 9
/

SELECT count(*) FROM CUTTY_SARK;
-- 
SELECT min(A),     max(A)     FROM CUTTY_SARK; -- 1 - 5
SELECT min(B),     max(B)     FROM CUTTY_SARK; -- 7 - 7
SELECT min(C),     max(C)     FROM CUTTY_SARK; -- 10 - 19
SELECT min(D),     max(D)     FROM CUTTY_SARK; -- 4 - 4
SELECT min(E),     max(E)     FROM CUTTY_SARK; -- 10 - 10
--
SELECT min(North_M1),     max(North_M1)     FROM CUTTY_SARK; -- 5-9
SELECT min(North_M2),     max(North_M2)     FROM CUTTY_SARK; -- 8-8
SELECT min(North_M3),     max(North_M3)     FROM CUTTY_SARK; -- 2-6
SELECT min(West_M1),      max(West_M1)      FROM CUTTY_SARK; -- 6-6
SELECT min(West_M2),      max(West_M2)      FROM CUTTY_SARK; -- 7-7
SELECT min(West_M3),      max(West_M3)      FROM CUTTY_SARK; -- 4-4
--

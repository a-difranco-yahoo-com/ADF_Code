
ABC DEFG : N 51° 31.946 W 000° 10.668 
N(CxD)+(G-F)° C+E.(E+F)(D+F)E  W000° (C-B).E(B-E)((A-G)+D))
/
CREATE OR REPLACE VIEW V_ABBEY_DIGITS AS SELECT rownum - 2000 Nos FROM ALL_OBJECTS WHERE Rownum <= 10000;

CREATE OR REPLACE VIEW V_ABBEY_DIGITS_A AS SELECT Nos A FROM V_ABBEY_DIGITS WHERE Nos Between -2000 AND 10000;
CREATE OR REPLACE VIEW V_ABBEY_DIGITS_B AS SELECT Nos B FROM V_ABBEY_DIGITS WHERE Nos Between 11 AND 23;
CREATE OR REPLACE VIEW V_ABBEY_DIGITS_C AS SELECT Nos C FROM V_ABBEY_DIGITS WHERE Nos Between 22 AND 32;
CREATE OR REPLACE VIEW V_ABBEY_DIGITS_D AS SELECT Nos D FROM V_ABBEY_DIGITS WHERE Nos Between -9 AND 18;
CREATE OR REPLACE VIEW V_ABBEY_DIGITS_E AS SELECT Nos E FROM V_ABBEY_DIGITS WHERE Nos Between  0 AND 9;
CREATE OR REPLACE VIEW V_ABBEY_DIGITS_F AS SELECT Nos F FROM V_ABBEY_DIGITS WHERE Nos Between -9 AND 9;
CREATE OR REPLACE VIEW V_ABBEY_DIGITS_G AS SELECT Nos G FROM V_ABBEY_DIGITS WHERE Nos Between -534 AND 348;

SELECT min(A), max(A) FROM V_ABBEY_DIGITS_A;
SELECT min(B), max(B) FROM V_ABBEY_DIGITS_B;
SELECT min(C), max(C) FROM V_ABBEY_DIGITS_C; -- 22 32
SELECT min(D), max(D) FROM V_ABBEY_DIGITS_D; -- -9 18
SELECT min(E), max(E) FROM V_ABBEY_DIGITS_E;
SELECT min(F), max(F) FROM V_ABBEY_DIGITS_F; -- -9 9
SELECT min(G), max(G) FROM V_ABBEY_DIGITS_G; -- -534 348

SELECT    min(A), max(A),   min(B), max(B),   min(C), max(C),   min(D), max(D),   min(E), max(E),   min(F), max(F),   min(G), max(G),   count(*)
FROM   (
SELECT  A A, 'B' B, 'C' C, D D, 'E' E, 'F' F, G G, 'x'
--       (C.Nos * D.Nos) + (G.Nos - F.Nos) North_Degrees, (C.Nos + E.Nos) North_Minute,
--       (E.Nos + F.Nos) North_Minute_T1, (D.Nos + F.Nos) North_Minute_T2, E.Nos  North_Minute_T3,
--       (C.Nos - B.Nos) West_Minute,
--        E.Nos  West_Minute_T1, (B.Nos - E.Nos) West_Minute_T2, 
--        (A.Nos - G.Nos + D.Nos) West_Minute_T3
FROM   DUAL X
CROSS JOIN  V_ABBEY_DIGITS_A -- A ON A.A Between -552  AND 366
--CROSS JOIN  V_ABBEY_DIGITS_B --B ON B.B Between  0  AND 18
--CROSS JOIN  V_ABBEY_DIGITS_C --C ON C.C Between 22  AND 32
CROSS JOIN  V_ABBEY_DIGITS_D -- D ON D.D Between -9  AND 18
--CROSS JOIN  V_ABBEY_DIGITS_E --  ON E Between  0  AND 9
--CROSS JOIN  V_ABBEY_DIGITS_F -- F ON F.F Between -9  AND 9
CROSS JOIN  V_ABBEY_DIGITS_G --G ON G.G Between -534  AND 348
--
WHERE  1 = 1
--
--AND   (C.Nos * D.Nos) + (G.Nos - F.Nos) = 51 -- North Degree
--AND   (C.Nos + E.Nos)            IN (31, 32) -- North Minute,
--AND    E + F         Between 0  AND 9
--AND    D.Nos + F.Nos         Between 0  AND 9
--AND    E                 Between 0  AND 9
--
--AND    C - B         Between 9  AND 11
--AND    E.Nos                 Between 0  AND 9
--AND    B.Nos - E.Nos         Between 0  AND 9
AND    A - G + D Between 0  AND 9
)
/ 

CREATE OR REPLACE VIEW V_ABBEY_BEETLE
AS
SELECT  A.Nos A, B.Nos B, C.Nos C, D.Nos D, E.Nos E, F.Nos F, G.Nos G,
       (C.Nos * D.Nos) + (G.Nos - F.Nos) North_Degrees, (C.Nos + E.Nos) North_Minute,
       (E.Nos + F.Nos) North_Minute_T1, (D.Nos + F.Nos) North_Minute_T2, E.Nos  North_Minute_T3,
       (C.Nos - B.Nos) West_Minute,
        E.Nos   West_Minute_T1, (B.Nos - E.Nos) West_Minute_T2, (A.Nos - G.Nos + D.Nos) West_Minute_T3
FROM   V_ABBEY_DIGITS_A A
 JOIN  V_ABBEY_DIGITS_E E ON E.Nos                 Between 0  AND 9
 JOIN  V_ABBEY_DIGITS_F F ON E.Nos + F.Nos         Between 0  AND 9
 JOIN  V_ABBEY_DIGITS_D D ON D.Nos + F.Nos         Between 0  AND 9
 JOIN  V_ABBEY_DIGITS_B B ON B.Nos - E.Nos         Between 0  AND 9
 JOIN  V_ABBEY_DIGITS_G G ON A.Nos - G.Nos + D.Nos Between 0  AND 9
 JOIN  V_ABBEY_DIGITS_C C ON C.Nos - B.Nos         Between 9  AND 11
/ 


CREATE OR REPLACE VIEW V_ABBEY_BEETLE_RANGE
AS
SELECT *
FROM   V_ABBEY_BEETLE
WHERE  North_Degrees = 51
AND    North_Minute IN (31, 32)
AND    West_Minute  IN (9, 10, 11)
/

 
-- 1st guess : -99	100	0	18	9	29	-9	18	0	9	-9	9	-99	100	58610040
-- N 51      : -99	100	0	18	9	29	-4	12	0	9	-8	9	-99	98	185533
-- 31/32     : -99	90	11	16	22	26	-1	6	6	9	-6	3	-99	80	7433
-- extend range : -199	144	11	16	22	26	-3	11	6	9	-6	3	-197	132
SELECT    min(A), max(A),   min(B), max(B),   min(C), max(C),   min(D), max(D),   min(E), max(E),   min(F), max(F),   min(G), max(G),   count(*)
FROM   V_ABBEY_BEETLE_RANGE
/
SELECT West_Minute, min(West_Minute_T1), max(West_Minute_T1)
FROM   V_ABBEY_BEETLE_RANGE
GROUP BY West_Minute
/
SELECT North_Minute, min(North_Minute_T1), max(North_Minute_T1)
FROM   V_ABBEY_BEETLE_RANGE
GROUP BY North_Minute
/


SELECT   North_Minute_T1, West_Minute_T1, Count(*)
FROM     V_ABBEY_BEETLE_RANGE
GROUP BY North_Minute_T1, West_Minute_T1
/

DROP   TABLE ABBEY_BEETLE_COORD PURGE;
CREATE TABLE ABBEY_BEETLE_COORD
AS
SELECT   'N ' || North_Degrees || ' ' || North_Minute || '.' || North_Minute_T1 || North_Minute_T2 || North_Minute_T3 Northing,
         'W 0 ' || West_Minute || '.' || West_Minute_T1 || West_Minute_T2 || West_Minute_T3 Westing, R.*,
         substr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', A, 1) LA,
         substr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', B, 1) LB,
         substr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', C, 1) LC,
         substr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', D, 1) LD,
         substr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', E, 1) LE,
         substr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', F, 1) LF,
         substr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', G, 1) LG
FROM     V_ABBEY_BEETLE_RANGE R
/

DELETE FROM ABBEY_BEETLE_COORD
WHERE    LA = 'J'
AND      LB = 'O'
/
SELECT   * -- Distinct Northing
FROM     ABBEY_BEETLE_COORD
--WHERE    LA = 'J'
--AND      LB = 'O'
WHERE North_Minute_T1 = 8
ORDER BY 1, 2
/




-- Range : 1-26 : 1	26	12	16	23	26	1	2	6	8	1	3	1	26	254
SELECT Word,
       instr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', substr(Word, 1, 1)) W1,
       instr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', substr(Word, 2, 1)) W2,
       instr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', substr(Word, 3, 1)) W3
FROM   DICTIONARY.Word_List
WHERE  length(Word) = 3
AND    instr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', substr(Word, 1, 1)) Between 1  AND 13 
AND    instr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', substr(Word, 2, 1)) Between 13 AND 15 
AND    instr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', substr(Word, 3, 1)) Between 23 AND 25 
/
SELECT Word,
       instr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', substr(Word, 1, 1)) W1,
       instr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', substr(Word, 2, 1)) W2,
       instr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', substr(Word, 3, 1)) W3,
       instr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', substr(Word, 4, 1)) W4
FROM   DICTIONARY.Word_List
WHERE  length(Word) = 4
AND    instr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', substr(Word, 1, 1)) Between 2  AND 2 
AND    instr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', substr(Word, 2, 1)) Between 6  AND 8 
AND    instr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', substr(Word, 3, 1)) Between 1  AND 3 
AND    instr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', substr(Word, 4, 1)) Between 2  AND 6 
/


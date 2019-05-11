
ABC DEFG : N 51° 31.946 W 000° 10.668 
N(CxD)+(G-F)° C+E.(E+F)(D+F)E  W000° (C-B).E(B-E)((A-G)+D))
/

SELECT 26 * 26 * 26 * 26 * 9 * 9 * 9 FROM DUAL;
SELECT 213 * 26 * 26 * 26  FROM DUAL;

CREATE TABLE GC_ABBEY_ROAD_BEATLE_ND_T2
AS
WITH
     LETTER_C AS ( SELECT Rownum C FROM ALL_OBJECTS WHERE Rownum <= 26),
     LETTER_D AS ( SELECT Rownum D FROM ALL_OBJECTS WHERE Rownum <= 26),
     LETTER_F AS ( SELECT Rownum F FROM ALL_OBJECTS WHERE Rownum <= 26),     
     LETTER_G AS ( SELECT Rownum G FROM ALL_OBJECTS WHERE Rownum <= 26)
SELECT 
       (C * D) + (G - F) North_Degrees,
       (D + F)           North_Minute_T2,
        C, D, F, G
FROM   DUAL
  JOIN LETTER_C ON C Between 1 AND 26
  JOIN LETTER_D ON D Between 1 AND 26
  JOIN LETTER_F ON F Between 1 AND 26
  JOIN LETTER_G ON G Between 1 AND 26
WHERE  (C * D) + (G - F) Between 51 AND 51
AND    (D + F)           Between 0 AND 9
/
CREATE TABLE GC_ABBEY_ROAD_BEATLE_NORTH
AS
WITH
     LETTER_E AS ( SELECT Rownum E FROM ALL_OBJECTS WHERE Rownum <= 26)
SELECT 
       North_Degrees,
       (C + E)           North_Minute,
       (E + F)           North_Minute_T1, 
       North_Minute_T2,
        E                North_Minute_T3,
        C, D, E, F, G
FROM   GC_ABBEY_ROAD_BEATLE_ND_T2
  JOIN LETTER_E ON E Between 1 AND 26
WHERE  (C + E)           Between 30 AND 32
AND    (E + F)           Between 0 AND 9
AND     E                Between 0 AND 9
/

SELECT * FROM GC_ABBEY_ROAD_BEATLE_NORTH;

CREATE TABLE GC_ABBEY_ROAD_BEATLE
AS
WITH LETTER_A AS ( SELECT Rownum A FROM ALL_OBJECTS WHERE Rownum <= 26),
     LETTER_B AS ( SELECT Rownum B FROM ALL_OBJECTS WHERE Rownum <= 26)
SELECT 
       North_Degrees,   North_Minute,
       North_Minute_T1, North_Minute_T2, North_Minute_T3,
       (C - B)           West_Minute,
        E                West_Minute_T1,
        B - E            West_Minute_T2, 
       (A - G + D)       West_Minute_T3,
        A, B, C, D, E, F, G
FROM   GC_ABBEY_ROAD_BEATLE_NORTH
  JOIN LETTER_A ON A Between 1 AND 26
  JOIN LETTER_B ON B Between 1 AND 26
WHERE  (C - B)           Between 9 AND 11
AND     E                Between 0 AND 9
AND     B - E            Between 0 AND 9
AND    (A - G + D)       Between 0 AND 9
/

SELECT North_Minute, count(*) FROM GC_ABBEY_ROAD_BEATLE Group By North_Minute;



 
-- 1st guess : -99	100	0	18	9	29	-9	18	0	9	-9	9	-99	100	58610040
-- N 51      : -99	100	0	18	9	29	-4	12	0	9	-8	9	-99	98	185533
-- 31/32     : -99	90	11	16	22	26	-1	6	6	9	-6	3	-99	80	7433
-- extend range : -199	144	11	16	22	26	-3	11	6	9	-6	3	-197	132
SELECT min(A), max(A),   min(B), max(B),   min(C), max(C),   min(D), max(D),   min(E), max(E),   min(F), max(F),   min(G), max(G),count(*)
FROM   GC_ABBEY_ROAD_BEATLE
/
SELECT West_Minute, min(West_Minute_T1), max(West_Minute_T1), count(*)
FROM   GC_ABBEY_ROAD_BEATLE
GROUP BY West_Minute
/
SELECT North_Minute, min(North_Minute_T1), max(North_Minute_T1), count(*)
FROM   GC_ABBEY_ROAD_BEATLE
GROUP BY North_Minute
/
SELECT   North_Minute, min(North_Minute_T1), max(North_Minute_T1), West_Minute, min(West_Minute_T1), max(West_Minute_T1), count(*)
FROM     GC_ABBEY_ROAD_BEATLE
GROUP BY North_Minute, West_Minute
ORDER BY North_Minute, West_Minute
/
FROM   GC_ABBEY_ROAD_BEATLE
GROUP BY 
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
FROM     GC_ABBEY_ROAD_BEATLE R
WHERE    North_Minute = 31
AND      West_Minute  = 10
/

SELECT * FROM ABBEY_BEETLE_COORD
WHERE  LA || LB || LC || LD || LE || LF || LG  Like 'LMW%F' -- 281FL'
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


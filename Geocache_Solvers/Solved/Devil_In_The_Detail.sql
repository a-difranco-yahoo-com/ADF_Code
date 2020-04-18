@@ -1,111 +0,0 @@

-- GZ : N 51� 31.050 W 000� 09.175 
-- FGZ: N 51� 31.505	W 000� 9.287
DROP   TABLE GC_DEVIL_DETAIL_ABCDE PURGE
/
CREATE TABLE GC_DEVIL_DETAIL_ABCDE
AS
WITH LETTER  AS ( SELECT Rownum X FROM ALL_OBJECTS WHERE Rownum <= 26)
SELECT     A.X A, B.X B, C.X C, D.X D, E.X E
FROM       LETTER A
CROSS JOIN LETTER B 
CROSS JOIN LETTER C 
CROSS JOIN LETTER D 
CROSS JOIN LETTER E 
WHERE A.X + B.X + C.X + D.X + E.X = 69
/

DROP   TABLE GC_DEVIL_DETAIL_FGHK PURGE
/
CREATE TABLE GC_DEVIL_DETAIL_FGHK
AS
WITH DIGIT  AS ( SELECT Rownum - 1 X FROM ALL_OBJECTS WHERE Rownum <= 10)
SELECT Distinct F.X F, K.X K
FROM       DIGIT F
CROSS JOIN DIGIT G 
CROSS JOIN DIGIT H 
CROSS JOIN DIGIT K
WHERE  F.X = 1
AND    G.X = 6
AND    H.X = 6
AND    K.X = 4
/

CREATE OR REPLACE VIEW GC_DEVIL_DETAIL
AS
WITH DIGIT_F  AS ( SELECT Rownum - 1 F FROM ALL_OBJECTS WHERE Rownum <= 10),
     DIGIT_K  AS ( SELECT Rownum - 1 K FROM ALL_OBJECTS WHERE Rownum <= 10)
SELECT D + E North_Minute, (B * C * K) + B North_Minute_Thousandth,
       A + F West_Minute, (D * C) + D + F West_Minute_Thousandth,
       A, B, C, D, E, F, K
FROM       GC_DEVIL_DETAIL_ABCDE
CROSS JOIN GC_DEVIL_DETAIL_FGHK
/
SELECT count(*),
       min(A), max(A), min(B), max(B), min(C), max(C), min(D), max(D), min(E), max(E),
       min(F), max(F), min(K), max(K),
       min(North_Minute),            max(North_Minute),
       min(West_Minute),             max(West_Minute),
       min(North_Minute_Thousandth), max(North_Minute_Thousandth),
       min(West_Minute_Thousandth),  max(West_Minute_Thousandth)
FROM GC_DEVIL_DETAIL
WHERE  1 = 1
AND    North_Minute IN (30, 31)
AND    West_Minute  IN (8, 9, 10)
AND    North_Minute_Thousandth < 1000
/
DROP    TABLE GC_DEVIL_DETAIL_WORD PURGE;
CREATE  TABLE GC_DEVIL_DETAIL_WORD
AS
SELECT Z.A, Z.B, Z.C, Z.D, Z.E, Z.F, Z.K,
       Z.North_Minute, Z.North_Minute_Thousandth, 
       Z.West_Minute,  Z.West_Minute_Thousandth,
       'N 51� '  || Z.North_Minute || '.' || to_char(Z.North_Minute_Thousandth, 'fm099') Northing,
       'W 000� ' || Z.West_Minute  || '.' || to_char(Z.West_Minute_Thousandth,  'fm099') Westing,
       Z.Letter_A  ||  Z.Letter_B  ||  Z.Letter_C  ||  Z.Letter_D  ||  Z.Letter_E Word,
       Z.Reverse_A ||  Z.Reverse_B ||  Z.Reverse_C ||  Z.Reverse_D ||  Z.Reverse_E Reverse_Word,
       'U' Status
FROM  (
        SELECT A.*,
               substr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', A, 1) Letter_A,
               substr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', B, 1) Letter_B,
               substr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', C, 1) Letter_C,
               substr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', D, 1) Letter_D,
               substr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', E, 1) Letter_E,
               substr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', 27 - A, 1) Reverse_A,
               substr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', 27 - B, 1) Reverse_B,
               substr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', 27 - C, 1) Reverse_C,
               substr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', 27 - D, 1) Reverse_D,
               substr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', 27 - E, 1) Reverse_E
        FROM   GC_DEVIL_DETAIL A
        WHERE  A.North_Minute IN (30, 31)
        AND    A.West_Minute  IN (8, 9, 10)
        ) Z
/

SELECT count(*) FROM   GC_DEVIL_DETAIL_WORD;

DELETE FROM GC_DEVIL_DETAIL_WORD WHERE  North_Minute_Thousandth > 999;
DELETE FROM GC_DEVIL_DETAIL_WORD WHERE  North_Minute = 31 AND North_Minute_Thousandth > 600;
DELETE FROM GC_DEVIL_DETAIL_WORD WHERE  North_Minute = 30 AND North_Minute_Thousandth < 510;
DELETE FROM GC_DEVIL_DETAIL_WORD WHERE  West_Minute  = 10 AND West_Minute_Thousandth  > 40;
DELETE FROM GC_DEVIL_DETAIL_WORD WHERE  West_Minute  =  9 AND West_Minute_Thousandth  > 999;
DELETE FROM GC_DEVIL_DETAIL_WORD WHERE  West_Minute  =  8 AND West_Minute_Thousandth  < 310;

SELECT A, B, C, count(*)
FROM   GC_DEVIL_DETAIL_WORD
GROUP BY A, B, C
ORDER BY A, B, C
/


SELECT *
FROM   GC_DEVIL_DETAIL_WORD
/

SELECT A, count(*) FROM   GC_DEVIL_DETAIL_WORD GROUP BY A;
SELECT B, count(*) FROM   GC_DEVIL_DETAIL_WORD GROUP BY B;
SELECT C, count(*) FROM   GC_DEVIL_DETAIL_WORD GROUP BY C;
SELECT D, count(*) FROM   GC_DEVIL_DETAIL_WORD GROUP BY D;
SELECT E, count(*) FROM   GC_DEVIL_DETAIL_WORD GROUP BY E;
SELECT Status, count(*) FROM   GC_DEVIL_DETAIL_WORD GROUP BY Status;
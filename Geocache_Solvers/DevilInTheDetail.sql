

CREATE OR REPLACE VIEW GC_DEVIL_DETAIL
AS
WITH LETTER_A AS ( SELECT Rownum     A FROM ALL_OBJECTS WHERE Rownum <= 26),
     LETTER_B AS ( SELECT Rownum     B FROM ALL_OBJECTS WHERE Rownum <= 26),
     LETTER_C AS ( SELECT Rownum     C FROM ALL_OBJECTS WHERE Rownum <= 26),
     LETTER_D AS ( SELECT Rownum     D FROM ALL_OBJECTS WHERE Rownum <= 26),
     LETTER_E AS ( SELECT Rownum     E FROM ALL_OBJECTS WHERE Rownum <= 26),
     DIGIT_F  AS ( SELECT Rownum - 1 F FROM ALL_OBJECTS WHERE Rownum <= 10),
     DIGIT_G  AS ( SELECT Rownum - 1 G FROM ALL_OBJECTS WHERE Rownum <= 10),
     DIGIT_H  AS ( SELECT Rownum - 1 H FROM ALL_OBJECTS WHERE Rownum <= 10),
     DIGIT_K  AS ( SELECT Rownum - 1 K FROM ALL_OBJECTS WHERE Rownum <= 10)
SELECT D + E North_Minute, (B * C * K) + B North_Minute_Thousandth,
       A + F West_Minute, (D * C) + D + F West_Minute_Thousandth,
       A, B, C, D, E, F, K
FROM   DUAL
  JOIN LETTER_A ON A Between 1 AND 9
  JOIN LETTER_B ON B Between 1 AND 26
  JOIN LETTER_C ON C Between 1 AND 26
  JOIN LETTER_D ON D Between 4 AND 26
  JOIN LETTER_E ON E Between 4 AND 26
  JOIN DIGIT_F  ON F Between 1 AND 1
  JOIN DIGIT_K  ON K Between 4 AND 4
WHERE A + B + C + D + E = 69
/

DROP    TABLE GC_DEVIL_DETAIL_WORD PURGE;
CREATE  TABLE GC_DEVIL_DETAIL_WORD
AS
SELECT Z.*,
       Z.Letter_A  ||  Z.Letter_B  ||  Z.Letter_C  ||  Z.Letter_D  ||  Z.Letter_E Word,
       Z.Reverse_A ||  Z.Reverse_B ||  Z.Reverse_C ||  Z.Reverse_D ||  Z.Reverse_E Reverse_Word
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
DELETE FROM GC_DEVIL_DETAIL_WORD WHERE  North_Minute = 31 AND North_Minute_Thousandth > 590;
DELETE FROM GC_DEVIL_DETAIL_WORD WHERE  North_Minute = 30 AND North_Minute_Thousandth < 510;
DELETE FROM GC_DEVIL_DETAIL_WORD WHERE  West_Minute  = 10 AND West_Minute_Thousandth  > 40;
DELETE FROM GC_DEVIL_DETAIL_WORD WHERE  West_Minute  =  9 AND West_Minute_Thousandth  > 999;
DELETE FROM GC_DEVIL_DETAIL_WORD WHERE  West_Minute  =  8 AND West_Minute_Thousandth  < 310;

SELECT A, B, C, count(*)
FROM   GC_DEVIL_DETAIL_WORD
GROUP BY A, B, C
ORDER BY A, B, C
/


SELECT 
       'N 51 '  || North_Minute || '.' || to_char(North_Minute_Thousandth, 'fm099') Northing,
       'W 000 ' || West_Minute  || '.' || to_char(West_Minute_Thousandth,  'fm099') Westing,
       Word, reverse_word
FROM   GC_DEVIL_DETAIL_WORD
WHERE  1 = 1
AND    Word IN (SELECT Word FROM DICTIONARY.Word_List)
AND    Word NOT IN ('HOLEY', 'HOOKS', 'GEZSL')
--AND   Word Like 'HIND%'
/

SELECT Letter_A, count(*) FROM   GC_DEVIL_DETAIL_WORD GROUP BY Letter_A;
SELECT Letter_B, count(*) FROM   GC_DEVIL_DETAIL_WORD GROUP BY Letter_B;
SELECT Letter_C, count(*) FROM   GC_DEVIL_DETAIL_WORD GROUP BY Letter_C;
SELECT Letter_D, count(*) FROM   GC_DEVIL_DETAIL_WORD GROUP BY Letter_D;
SELECT Letter_E, count(*) FROM   GC_DEVIL_DETAIL_WORD GROUP BY Letter_E;



WITH LETTER_A AS (SELECT rownum -1 A FROM ALL_OBJECTS WHERE Rownum <= 10)
SELECT A, 'N51 27.' || (A-2)||(A+4)||(A+3) Northing, 'E000 17.' || (A+3)||(A-1)||(A-1) Easting
FROM   LETTER_A
WHERE  A Between 2 AND 5
/

N51 27. (A-2) (A+4) (A+3)        E000 17. (A+3) (A-1) (A-1)

DROP   TABLE HS_STAGE2 Purge;
CREATE TABLE HS_STAGE2
AS
WITH Digits AS (SELECT rownum Nos FROM ALL_OBJECTS WHERE Rownum <= 9)
SELECT 'N51 30.' || (A * B) || (C)|| (A * C) Northing,
       'W000 0'  || (B + C) || '.' || (B + C) || '00' Westing,
       A, B, C, 'U' Verified
FROM (
        SELECT A.Nos A, B.Nos B, C.Nos C      
        FROM   Digits A
         JOIN  Digits B ON (A.Nos * B.Nos) < 10 
         JOIN  Digits C ON (A.Nos * C.Nos) < 10 
                       AND (B.Nos + C.Nos) < 10 
        )
/

SELECT 'A', A, Count(*) Occurs FROM   HS_STAGE2 WHERE  Verified != 'N' Group By A UNION
SELECT 'B', B, Count(*) Occurs FROM   HS_STAGE2 WHERE  Verified != 'N' Group By B UNION
SELECT 'C', C, Count(*) Occurs FROM   HS_STAGE2 WHERE  Verified != 'N' Group By C
ORDER BY 3;

DROP   TABLE HS_STAGE3 Purge;
CREATE TABLE HS_STAGE3
AS
WITH Digits AS (SELECT rownum Nos FROM ALL_OBJECTS WHERE Rownum <= 26)
SELECT 'N51 30.' || (B + F) || (C * F)|| '0' Northing,
       'W000 0'  || (B * D) || '.' || (B + F)  || (D * F) || (D + F) Westing,
       A, B, C, D, E, F, 'U' Verified, Verified Stage2_Verified
FROM (
        SELECT S.A, S.B, S.C, D.Nos D, E.Nos E, F.Nos F, S.Verified      
        FROM   HS_STAGE2 S
          JOIN Digits    D ON (S.B   * D.Nos) < 10 
          JOIN Digits    E ON (S.A   + S.C + E.Nos) < 10 
          JOIN Digits    F ON (S.B   + F.Nos) < 10 
                          AND (S.C   * F.Nos) < 10
                          AND (D.Nos * F.Nos) < 10
                          AND (D.Nos + F.Nos) < 10
        )
/


UPDATE HS_STAGE3 S3
SET    Stage2_Verified = (SELECT Verified
                          FROM   HS_STAGE2 S2
                          WHERE  S2.A = S3.A
                          AND    S2.B = S3.B
                          AND    S2.C = S3.C)
/

UPDATE HS_STAGE2 
SET    Verified = 'X'
WHERE (A, B, C) NOT IN (SELECT A, B, C
                        FROM   HS_STAGE3
                        WHERE  D = 2
                        AND    E = 1
                        AND    F = 3)
/
UPDATE HS_STAGE3 
SET    Verified = 'X'
WHERE  D = 2
AND    E = 1
AND    F = 3
/

SELECT Distinct Verified FROM HS_STAGE2;

SELECT A, B, C, Count(*) Occurs, count(Distinct northing || westing) coords
FROM   HS_STAGE3 
WHERE  Verified = 'X' 
Group By A, B, C
--HAVING count(*) < 7
ORDER BY 5 desc, Count(*) Desc
/
SELECT D, E, F, Count(*) Occurs
FROM   HS_STAGE3 
--WHERE  Verified != 'N' 
Group By D, E, F
--HAVING count(*) < 7
ORDER BY Count(*) Desc
/

-- GHIJ = 2nd date
-- hendrix : 1942-1970 : 1968-1969  : Handel : 1685 - 1759 : 1723
-- C was known to remark that a musician that played for him bore a  
-- striking resemblance to another (more famous) musicians mothers mother.
-- More famous musician's D.o.B = KLMN.
-- http://jimibanter.blogspot.co.uk/2006/08/yes-as-i-said-before-like-rolling.html
-- Yes, he called Noel Redding "Bob Dylan's Grandmother" and he called Mitch Mitchell "Queen Bee". I'm guessing he was stoned when he came up with those names?

-- GHIJ = 1970
-- KLMN = 1941

WITH  GHIJ AS (SELECT 1 G, 9 H, 7 I, 0 J FROM DUAL),
      KLMN AS (SELECT 1 K, 9 L, 4 M, 1 N FROM DUAL) 
SELECT 'N51 3' || (K.M-S.B) || '.' || (S.D * S.F) || (S.A + S.C + S.E) || (G.I - S.D)   Northing,
       'W000 ' ||(G.G) || (K.K + K.N) || '.' || (K.M + G.J) ||(G.H)||(K.L-S.B-K.N) Westing
FROM   HS_STAGE3 S 
CROSS JOIN GHIJ  G
CROSS JOIN KLMN  K
WHERE  S.Verified = 'X' 
AND    S.Stage2_Verified = 'X'
/

/*
At the first stage you will see a diamond which will reveal numbers ABCD & EFGH
N 51� (B-D)(D+E).C(A+E)F E 000� 0G.A(B-A)(E+H)
*/

Drop   Table Blackheath Purge;
Create Table Blackheath
AS
/
WITH Digits AS (SELECT rownum - 1 Nos FROM ALL_OBJECTS WHERE Rownum <= 10)
SELECT 'N51 ' || L1 || L2 || '.' || L3 || L4 || L5  Northing,
       'E00 0' || L6 || '.' || L7|| L8 || L9 Easting,
       A, B, C, D, E, F, G, H, 
       L1, L2, L3, L4, L5, L6, L7, L8, L9, Rownum Id
FROM (
        SELECT A.Nos A, B.Nos B, C.Nos C, D.Nos D,
               E.Nos E, F.Nos F, G.Nos G, H.Nos H,
              (B.Nos - D.Nos) L1, (D.Nos + E.Nos) L2,
              C.Nos L3, (A.Nos + E.Nos) L4, F.Nos L5,
              G.Nos L6,
              A.Nos L7, (B.Nos - A.Nos) L8, (E.Nos + H.Nos) L9
        FROM   Digits A
         JOIN  Digits B ON B.Nos Between 0 AND 9 
         JOIN  Digits C ON C.Nos Between 0 AND 9 
         JOIN  Digits D ON D.Nos Between 0 AND 9 
         JOIN  Digits E ON E.Nos Between 0 AND 9 
         JOIN  Digits F ON F.Nos Between 0 AND 9 
         JOIN  Digits G ON G.Nos Between 0 AND 9 
         JOIN  Digits H ON H.Nos Between 0 AND 9 
        WHERE  A.Nos Between 0 AND 9            
        )
WHERE L1 BETWEEN 2 AND 2
AND   L2 BETWEEN 7 AND 8
AND   L3 BETWEEN 0 AND 9
AND   L4 BETWEEN 0 AND 9
AND   L5 BETWEEN 0 AND 9
AND   L6 BETWEEN 0 AND 0
AND   L7 BETWEEN 0 AND 9
AND   L8 BETWEEN 0 AND 9
AND   L9 BETWEEN 0 AND 9
/

SELECT  Distinct L1, L2, L3, L4, L5, L6, L7, L8, L9, L10
FROM    BLACKHEATH
/
DELETE FROM BLACKHEATH WHERE L3 > 9;
DELETE FROM BLACKHEATH WHERE L7 < 0;
DELETE FROM BLACKHEATH WHERE L8 > 9;
DELETE FROM BLACKHEATH WHERE L9 > 9;

SELECT    A, B, C, D, E, F, G, H, I, J, L, M FROM BLACKHEATH WHERE Id > 214 ORDER BY ID;
SELECT Id, Northing, Easting FROM BLACKHEATH WHERE Id > 214 ORDER BY ID;

A=21 / B = 1 or 3 / C = 8 / D = 4 / E = 1(?) / F = 9 / G = ? 
/ H = 74 / I = 6 (Selectric) / J = ? / K = 1 / L = 8 / M = 14 (?)

1 = 65


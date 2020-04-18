/*
There is a large emblem on the wall of a building, with an A-stringed harp, B large animals and CD small circles surrounding the harp.
The cache is not far, at: N51�30.(A-B)(D-B)B, W000�11.AD(B+C). 
Please be stealthy, as the hide area could be quite busy.

*/

Drop   Table Notting_Hill_Gate Purge;
Create Table Notting_Hill_Gate
AS
WITH Digits AS (SELECT rownum - 1 Nos FROM ALL_OBJECTS WHERE Rownum <= 10)
SELECT 'N51 30.' || L1 || L2 || L3  Northing,
       'W00 11.' || L4 || L5 || L6 Easting,
       A, B, C, D,  
       L1, L2, L3, L4, L5, L6, Rownum Id
FROM (
        SELECT A.Nos A, B.Nos B, C.Nos C, D.Nos D,
              (A.Nos - B.Nos) L1, (D.Nos - B.Nos) L2, B.Nos L3,
              A.Nos  L4, D.Nos L5, (B.Nos + C.Nos) L6
        FROM   Digits A
         JOIN  Digits B ON B.Nos Between 1 AND 9 
         JOIN  Digits C ON C.Nos Between 1 AND 9 
         JOIN  Digits D ON D.Nos Between 0 AND 9 
        WHERE  A.Nos Between 1 AND 9            
        )
WHERE L1 BETWEEN 0 AND 9
AND   L2 BETWEEN 0 AND 9
AND   L3 BETWEEN 0 AND 9
AND   L4 BETWEEN 0 AND 9
AND   L5 BETWEEN 0 AND 9
AND   L6 BETWEEN 0 AND 9
/

SELECT  Distinct L1, L2, L3, L4, L5, L6
FROM    Notting_Hill_Gate
/
DELETE FROM Notting_Hill_Gate WHERE A != 7;
DELETE FROM Notting_Hill_Gate WHERE B != 2;
DELETE FROM Notting_Hill_Gate WHERE C != 1;
DELETE FROM Notting_Hill_Gate WHERE D != 8;



SELECT  * FROM Notting_Hill_Gate ;
SELECT Id, Northing, Easting FROM Notting_Hill_Gate WHERE Id > 214 ORDER BY ID;

A=21 / B = 1 or 3 / C = 8 / D = 4 / E = 1(?) / F = 9 / G = ? 
/ H = 74 / I = 6 (Selectric) / J = ? / K = 1 / L = 8 / M = 14 (?)

1 = 65


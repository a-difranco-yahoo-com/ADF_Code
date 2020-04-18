/*
Hanging off the ceiling, there are A lights. 
By the lifts, there are B lights attached to the wall.
The skylight has C rectangular panes, D triangular ones and E that are trapeziums.
It is supported by F cross beams.
The hall is supported by G columns made of iron with green on their tops.

The cache is located at N51°30.(D-C+F)(B+C)(A+F), W000°12.GF(E-B). 

*/

Drop   Table Holland_Park Purge;
Create Table Holland_Park
AS
/
WITH Digits AS (SELECT rownum  Nos FROM ALL_OBJECTS WHERE Rownum <= 20)
SELECT 'N51 30.' || L1 || L2 || L3  Northing,
       'W00 12.' || L4 || L5 || L6 Easting,
       A, B, C, D, E, F, G, 
       L1, L2, L3, L4, L5, L6, Rownum Id
FROM (
        SELECT A.Nos A, B.Nos B, C.Nos C, D.Nos D, E.Nos E, F.Nos F, G.Nos G,
              (D.Nos - C.Nos + F.Nos) L1, (B.Nos + C.Nos) L2, (A.Nos + F.Nos) L3,
              G.Nos  L4, F.Nos L5, (E.Nos - B.Nos) L6
        FROM   Digits A
         JOIN  Digits B ON B.Nos Between 1 AND 20
         JOIN  Digits C ON C.Nos Between 1 AND 20
         JOIN  Digits D ON D.Nos Between 1 AND 20
         JOIN  Digits E ON E.Nos Between 1 AND 20
         JOIN  Digits F ON F.Nos Between 1 AND 20
         JOIN  Digits G ON G.Nos Between 1 AND 20
        WHERE  A.Nos Between 1 AND 20
        )
WHERE L1 BETWEEN 4 AND 4
AND   L2 BETWEEN 0 AND 9
AND   L3 BETWEEN 0 AND 9
AND   L4 BETWEEN 3 AND 3
AND   L5 BETWEEN 0 AND 9
AND   L6 BETWEEN 0 AND 9
/

SELECT  Distinct L1, L2, L3, L4, L5, L6
FROM    Notting_Hill_Gate
/
DELETE FROM Holland_Park WHERE A != 7;
DELETE FROM Holland_Park WHERE B != 2;
DELETE FROM Holland_Park WHERE C != 1;
DELETE FROM Holland_Park WHERE D != 8;



SELECT  * FROM Holland_Park ;
SELECT Id, Northing, Easting FROM Holland_Park WHERE Id > 214 ORDER BY ID;





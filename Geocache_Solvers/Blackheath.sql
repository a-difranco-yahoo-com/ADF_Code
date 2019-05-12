
Drop   Table Blackheath Purge;
Create Table Blackheath
AS
WITH Digits AS (SELECT rownum Nos FROM ALL_OBJECTS WHERE Rownum <= 100)
SELECT 'N51 ' || L1 || L2 || '.' || L3 || L4 || L5  Northing,
       'E00 ' || L6 || L7 || '.' || L8 || L9 || L10 Easting,
       A, B, C, D, E, F, G, H, I, J, L, M,
       L1, L2, L3, L4, L5, L6, L7, L8, L9, L10, Rownum Id
FROM (
        SELECT A.Nos A, B.Nos B, C.Nos C, D.Nos D, E.Nos E,
               F.Nos F, G.Nos G, H.Nos H, I.Nos I, J.Nos J,
               K.Nos K, L.Nos L, M.Nos M,
              (H.Nos - F.Nos) L1, (L.Nos - K.Nos) L2, (J.Nos + E.Nos) L3,
              (C.Nos - B.Nos) L4, (M.Nos - I.Nos - G.Nos) L5,
              (C.Nos - L.Nos) L6, (D.Nos + E.Nos - I.Nos) L7,
              ( (E.Nos*E.Nos) + K.Nos) L8,
              ( (A.Nos/B.Nos) + E.Nos) L9,  
              ( (M.Nos-L.Nos) / B.Nos) L10  
        FROM   Digits A
         JOIN  Digits B ON B.Nos IN (1, 3) 
         JOIN  Digits C ON C.Nos  = 8
         JOIN  Digits D ON D.Nos  = 4
         JOIN  Digits E ON E.Nos <= 3
         JOIN  Digits F ON F.Nos  = 9
         JOIN  Digits G ON G.Nos <= 6 -- ?
         JOIN  Digits H ON H.Nos  = 11
         JOIN  Digits I ON I.Nos  = 6
         JOIN  Digits J ON J.Nos <= 8
         JOIN  Digits K ON K.Nos  = 1
         JOIN  Digits L ON L.Nos  = 8
         JOIN  Digits M ON M.Nos  = 14
        WHERE  A.Nos = 21             
        )
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



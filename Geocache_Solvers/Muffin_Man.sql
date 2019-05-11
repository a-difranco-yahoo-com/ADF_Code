
N5(C-H) (I-J)(B+A).(G-H)(B/(J/G))(J*(H-E))
W000 (G-C)(F-E-A).(A+C)(I+H-K)(B-G)
/
EFG = 173
HIJK = 1869
/

WITH Digits AS (SELECT rownum - 1 Nos FROM ALL_OBJECTS WHERE Rownum <= 10)
SELECT 'N5' || (C-H) || ' ' || (I-J) || (B+A) || '.' || (G-H) || (B/(J/G)) || (J*(H-E)) North,
       'W000 ' || (G-C) || (F-E-A) || '.' || (A+C) || (I+H-K) || (B-G) West,
       A, B, C, D
FROM  (
SELECT A.Nos A, B.Nos B, C.Nos C, D.Nos D, E.Nos E, F.Nos F, G.Nos G, H.Nos H, I.Nos I, J.Nos J, K.Nos K
FROM   Digits A
 JOIN  Digits B ON B.Nos < 10
 JOIN  Digits C ON C.Nos < 10
 JOIN  Digits D ON D.Nos < 10
 JOIN  Digits E ON E.Nos = 1
 JOIN  Digits F ON F.Nos = 7
 JOIN  Digits G ON G.Nos = 3
 JOIN  Digits H ON H.Nos = 1
 JOIN  Digits I ON I.Nos = 8
 JOIN  Digits J ON J.Nos = 6
 JOIN  Digits K ON K.Nos = 9
)
WHERE  (C - H)     Between 0 AND 9
AND    (C - H)     Between 1 AND 1
AND    (B - G)     Between 0 AND 9
AND    (B + A)     Between 0 AND 9
AND    (B + A)     Between 9 AND 9
AND    (G - C)     Between 0 AND 9
AND    (I - J)     Between 0 AND 9
AND    (F - E - A) Between 0 AND 9
AND    (B/(J/G)) = Floor(B/(J/G))
AND    A = 1
/

N 51° 31.BGE' W 000° 0B.JCA'
N 51° 31.578' W 000° 05.649'
/


WITH Digits AS (SELECT rownum - 1 Nos FROM ALL_OBJECTS WHERE Rownum <= 10)
SELECT 'N 51° 31.'  || (A.Nos + B.Nos) || (C.Nos + D.Nos) || (C.Nos + E.Nos) Northing,
       'W 000° 08.' ||  A.Nos          || (E.Nos - C.Nos) || (E.Nos + A.Nos) Westing,
       A.Nos A, B.Nos
FROM   Digits A
 JOIN  Digits B ON B.Nos + A.Nos < 10
 JOIN  Digits C ON C.Nos = 4
 JOIN  Digits D ON D.Nos = 2
 JOIN  Digits E ON E.Nos = 5
               AND E.Nos + A.Nos < 10
WHERE  A.Nos = 1
AND    B.Nos <= 2

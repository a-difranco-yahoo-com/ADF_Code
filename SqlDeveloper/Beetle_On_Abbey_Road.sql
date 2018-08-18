
WITH Digits AS (SELECT rownum Nos FROM ALL_OBJECTS WHERE Rownum <= 9)
SELECT A.Nos A, B.Nos B, C.Nos C, D.Nos D, E.Nos E, F.Nos F, G.Nos G, H.Nos H, J.Nos J
FROM   Digits A
 JOIN  Digits B ON B.Nos < A.Nos
 JOIN  Digits C ON C.Nos < B.Nos
 JOIN  Digits D ON D.Nos NOT IN (A.Nos, B.Nos, C.Nos)
 JOIN  Digits E ON E.Nos NOT IN (A.Nos, B.Nos, C.Nos, D.Nos)
               AND E.Nos = (A.Nos + B.Nos + C.Nos) - (10 *D.Nos)
 JOIN  Digits F ON F.Nos NOT IN (A.Nos, B.Nos, C.Nos, D.Nos, E.Nos)
 JOIN  Digits G ON G.Nos NOT IN (A.Nos, B.Nos, C.Nos, D.Nos, E.Nos, F.Nos)
               AND G.Nos = (11 * D.Nos) + (2 * E.Nos) - (10 * F.Nos)
 JOIN  Digits H ON H.Nos NOT IN (A.Nos, B.Nos, C.Nos, D.Nos, E.Nos, F.Nos, G.Nos)
 JOIN  Digits J ON J.Nos NOT IN (A.Nos, B.Nos, C.Nos, D.Nos, E.Nos, F.Nos, G.Nos, H.Nos)
               AND J.Nos = (11 * F.Nos) + (2 * G.Nos) - (10 * H.Nos)
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

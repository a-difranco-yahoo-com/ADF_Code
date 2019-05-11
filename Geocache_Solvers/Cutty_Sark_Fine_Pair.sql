You need to gather some information from these objects to find where the geocache is hidden.
The total number of embossed crowns on the exterior of the phone box and the post box = A
The first letter under the large crown on the front of the post box = B
The second letter under the large crown on the front of the post box = C
The number of letters in the first word next to the slot for letters on the post box = D
The number of letters in the second word next to the slot for letters on the post box = E
The cache can be found at
N 51° 28.   A+D    C-E    B-A
W 000° 00.   E-D    B    D
/


WITH Digits AS (SELECT rownum Nos FROM ALL_OBJECTS WHERE Rownum <= 26)
SELECT 'N 51° 28.'  || (A.Nos + D.Nos) || (C.Nos - E.Nos) || (B.Nos - A.Nos) Northing,
       'W 000° 00.' || (E.Nos - D.Nos) || B.Nos || D.Nos Westing,
       A.Nos A, B.Nos B, C.Nos C, D.Nos D, E.Nos E 
FROM   Digits A
 JOIN  Digits B ON B.Nos <= 26
 JOIN  Digits C ON C.Nos <= 26
 JOIN  Digits D ON D.Nos = 4
 JOIN  Digits E ON E.Nos = 10
WHERE  A.Nos >= 5
AND   (A.Nos + D.Nos) Between 0 AND 9
--AND   (C.Nos - E.Nos) Between 0 AND 9
--AND   (B.Nos - A.Nos) Between 0 AND 9
--AND   (E.Nos - D.Nos) Between 0 AND 9
AND   B.Nos Between 0 AND 9
AND   D.Nos Between 0 AND 9
AND   B.Nos = instr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'G')
AND   C.Nos = instr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'R')
/

1. What year did the hospital first open? ABCD (1915)
2. In which year did the Hospital close their door? EFGH (1919)
3. How many beds? JKL (573)

Now walk 3 metres north
4. Biggest number on the H? MNO

and now walk north 15-16 metres to the water fountain
5. The year on the stone? PQRS (1859)

Now the for the maths:

N51 (N*R-(S+C)) . (Q+G) (L*(A+M)) (D+E)
W000 (J*O) (Q-P) . (H-(L+G)) (F+E-L) (C+G+J)
/


WITH Digits AS (SELECT rownum - 1 Nos FROM ALL_OBJECTS WHERE Rownum <= 10)
SELECT 'N 51° '  || ( (N.Nos * R.Nos) - (S.Nos + C.Nos) ) || '.' ||
       (Q.Nos + G.Nos)            ||
       (L.Nos * (A.Nos + M.Nos) ) ||
       (D.Nos + E.Nos)           Northing,
       'W 000° ' || (J.Nos * O.Nos) || (Q.Nos - P.Nos) || '.' || 
       (H.Nos - (L.Nos + G.Nos)) || 
       (F.Nos +  E.Nos - L.Nos)  ||
       (C.Nos +  G.Nos + J.Nos) Westing,
       A.Nos A, B.Nos B, C.Nos C, D.Nos D, E.Nos E,
       M.Nos M, N.Nos N, O.Nos O 
FROM   Digits A
 JOIN  Digits B ON B.Nos  = 9
 JOIN  Digits C ON C.Nos  = 1
 JOIN  Digits D ON D.Nos  = 5
 JOIN  Digits E ON E.Nos  = 1
 JOIN  Digits F ON F.Nos  = 9
 JOIN  Digits G ON G.Nos  = 1
 JOIN  Digits H ON H.Nos  = 9
 JOIN  Digits J ON J.Nos  = 5
 JOIN  Digits K ON K.Nos  = 7
 JOIN  Digits L ON L.Nos  = 3
 JOIN  Digits M ON M.Nos <= 9
 JOIN  Digits N ON N.Nos <= 9
 JOIN  Digits O ON O.Nos <= 9
 JOIN  Digits P ON P.Nos  = 1
 JOIN  Digits Q ON Q.Nos  = 8
 JOIN  Digits R ON R.Nos  = 5
 JOIN  Digits S ON S.Nos  = 9
WHERE  A.Nos = 1
AND   ( (N.Nos * R.Nos) - (S.Nos + C.Nos) )  Between 29 AND 31
AND     (L.Nos * (A.Nos + M.Nos) )           Between  0 AND 9
AND     (H.Nos - (L.Nos + G.Nos))            Between  0 AND 9
AND     (J.Nos * O.Nos) = 0
AND     (Q.Nos - P.Nos) Between 0 and 9
 

/
--AND   (A.Nos + D.Nos) Between 0 AND 9
--AND   (C.Nos - E.Nos) Between 0 AND 9
--AND   (B.Nos - A.Nos) Between 0 AND 9
--AND   (E.Nos - D.Nos) Between 0 AND 9
AND   B.Nos Between 0 AND 9
AND   D.Nos Between 0 AND 9
AND   B.Nos = instr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'G')
AND   C.Nos = instr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'R')
/

-- N51 32.(A-D)(C+F)(C)  W000 00.(B-E)(E-C)(A+B+D)
--Start : N 51° 32.108 W 000° 00.308 

-- ABCD = 1731 5 feet 3 Inches
WITH DIGIT AS (SELECT Rownum - 1 X FROM ALL_OBJECTS WHERE Rownum <=  10)
SELECT A.X A, B.X B, C.X C, D.X D, E.X E, F.X F,
       'N 51 32.' || (A.X - D.X) || (C.X + F.X) || (C.X) North,
       'W 0 000.' || (B.X - E.X) || (E.X - C.X) || (A.X + B.X + D.X) West     
FROM       DIGIT A
CROSS JOIN DIGIT B
CROSS JOIN DIGIT C
CROSS JOIN DIGIT D
CROSS JOIN DIGIT E
CROSS JOIN DIGIT F
WHERE  (A.X - D.X)       Between 0 AND 9
AND    (C.X + F.X)       Between 0 AND 9
AND     C.X              Between 0 AND 9
AND    (B.X - E.X)       Between 0 AND 9
AND    (E.X - C.X)       Between 0 AND 9
AND    (A.X + B.X + D.X) Between 0 AND 9
AND    A.X = 1  -- 2310
AND    B.X = 7  --  551
AND    C.X = 3  --   70
AND    D.X = 1  --   35
AND    E.X = 5  --    5
AND    F.X = 3  --    5
;


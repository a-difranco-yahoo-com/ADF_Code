
-- N (A+K+P)° (N-M)(F-E+H).((AxM)+F) W 000° (H-L).((DxG)-J)
-- N 51° 31.885 W 000° 07.455 
-- Assuming N 51 3(1/2) W 7

CREATE OR REPLACE VIEW V_KC_CONNECTION_DEFGHJK
AS
WITH ALPHA AS (SELECT Rownum X FROM ALL_OBJECTS WHERE Rownum <= 26)
SELECT     A.X A, /* B.X B, C.X C, */ D.X D, E.X E, F.X F, G.X G, H.X H, J.X J, K.X K, LMNP.L, LMNP.M, LMNP.N, LMNP.P,
           substr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', D.X, 1) ||
           substr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', E.X, 1) ||
           substr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', F.X, 1) ||
           substr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', G.X, 1) ||
           substr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', H.X, 1) ||
           substr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', J.X, 1) ||
           substr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', K.X, 1) DEFGHJK, LMNP.LMNP,
           A.X + K.X + LMNP.P  North_Degree,
           LMNP.N - LMNP.M     North_Minute_L1,
           F.X - E.X + H.X     North_Minute_L2,
          (A.X * LMNP.M) + F.X North_Thousandth_Minute,
           H.X - LMNP.L        West_Minute,
          (D.X * G.X) - J.X    West_Thousandth_Minute
FROM       ALPHA A
--CROSS JOIN ALPHA B
--CROSS JOIN ALPHA C
CROSS JOIN ALPHA D
CROSS JOIN ALPHA E
CROSS JOIN ALPHA F
CROSS JOIN ALPHA G
CROSS JOIN ALPHA H
CROSS JOIN ALPHA J
CROSS JOIN ALPHA K
CROSS JOIN KC_CONNECTION_LMNP LMNP
WHERE  (A.X + K.X + LMNP.P) = 51
AND    (LMNP.N - LMNP.M)    = 3
AND    (F.X - E.X + H.X)      BETWEEN 1 AND 2
AND    ((A.X * LMNP.M) + F.X) BETWEEN 0 AND 999
AND    (H.X - LMNP.L)       = 7
AND    ((D.X * G.X) - J.X)    BETWEEN 0 AND 999
/

SELECT * FROM V_KC_CONNECTION_DEFGHJK;

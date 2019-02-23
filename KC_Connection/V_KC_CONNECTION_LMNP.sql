
-- N (A+K+P)° (N-M)(F-E+H).((AxM)+F) W 000° (H-L).((DxG)-J)
-- N 51° 31.885 W 000° 07.455 
-- Assume N 51 3(1/2)  W 7

CREATE OR REPLACE VIEW V_KC_CONNECTION_LMNP
AS
WITH ALPHA AS (SELECT Rownum X FROM ALL_OBJECTS WHERE Rownum <= 26)
SELECT     L.X L, M.X M, N.X N, P.X P, -- F.X + H.X F_PLUS_H_2_11,
           A.X + K.X + P.X  North_Degree,
           N.X - M.X        North_Minute_L1,
          (A.X * M.X) + F.X North_Thousandth_Minute,
           H.X - L.X        West_Minute
FROM       ALPHA A
CROSS JOIN ALPHA F
CROSS JOIN ALPHA H
CROSS JOIN ALPHA K
CROSS JOIN ALPHA L
CROSS JOIN ALPHA M
CROSS JOIN ALPHA N
CROSS JOIN ALPHA P
WHERE  (A.X + K.X + P.X) = 51
AND    (N.X - M.X)       = 3
AND    (F.X + H.X) BETWEEN 2 AND 28  -- F-E+H = 1 or 2
AND    (H.X - L.X)       = 7
/


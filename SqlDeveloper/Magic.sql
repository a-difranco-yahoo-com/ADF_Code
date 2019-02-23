
WITH MAGIC AS (SELECT Rownum - 1 X FROM ALL_OBJECTS WHERE Rownum <= 16)
SELECT 'N 51 ' || (K.X + L.X + Q.X) || '.' || (F.X + H.X - B.X) || (D.X + E.X - G.X) || (B.X + L.X - K.X) Northing,
       'E 0  ' || (E.X + J.X - G.X) || '.' || (J.X + L.X - D.X) || (L.X + Q.X - H.X) || (F.X + Q.X - J.X) Easting,
       A.X A, B.X B, C.X C, D.X D, E.X E, F.X F, G.X G, H.X H,
       J.X J, K.X K, L.X L, M.X M, N.X N, P.X P, Q.X Q, R.X R
FROM   MAGIC A
  JOIN MAGIC B ON B.X NOT IN (A.X)
  JOIN MAGIC C ON C.X NOT IN (A.X, B.X)
  JOIN MAGIC D ON D.X NOT IN (A.X, B.X, C.X)
  JOIN MAGIC E ON E.X NOT IN (A.X, B.X, C.X, D.X)
  JOIN MAGIC F ON F.X NOT IN (A.X, B.X, C.X, D.X, E.X)
  JOIN MAGIC G ON G.X NOT IN (A.X, B.X, C.X, D.X, E.X, F.X)
  JOIN MAGIC H ON H.X NOT IN (A.X, B.X, C.X, D.X, E.X, F.X, G.X)
  JOIN MAGIC J ON J.X NOT IN (A.X, B.X, C.X, D.X, E.X, F.X, G.X, H.X)
  JOIN MAGIC K ON K.X NOT IN (A.X, B.X, C.X, D.X, E.X, F.X, G.X, H.X, J.X)
  JOIN MAGIC L ON L.X NOT IN (A.X, B.X, C.X, D.X, E.X, F.X, G.X, H.X, J.X, K.X)
  JOIN MAGIC M ON M.X NOT IN (A.X, B.X, C.X, D.X, E.X, F.X, G.X, H.X, J.X, K.X, L.X)
  JOIN MAGIC N ON N.X NOT IN (A.X, B.X, C.X, D.X, E.X, F.X, G.X, H.X, J.X, K.X, L.X, M.X)
  JOIN MAGIC P ON P.X NOT IN (A.X, B.X, C.X, D.X, E.X, F.X, G.X, H.X, J.X, K.X, L.X, M.X, N.X)
  JOIN MAGIC Q ON Q.X NOT IN (A.X, B.X, C.X, D.X, E.X, F.X, G.X, H.X, J.X, K.X, L.X, M.X, N.X, P.X)
  JOIN MAGIC R ON R.X NOT IN (A.X, B.X, C.X, D.X, E.X, F.X, G.X, H.X, J.X, K.X, L.X, M.X, N.X, P.X, Q.X)
WHERE A.X = 7
AND   C.X = 14
AND   M.X = 6
AND   N.X = 10
AND   P.X = 4
-- Rows
AND   A.X + B.X + C.X + D.X = 30
AND   E.X + F.X + G.X + H.X = 30
AND   J.X + K.X + L.X + M.X = 30
AND   N.X + P.X + Q.X + R.X = 30
-- Columns
AND   A.X + E.X + J.X + N.X = 30
AND   B.X + F.X + K.X + P.X = 30
AND   C.X + G.X + L.X + Q.X = 30
AND   D.X + H.X + M.X + R.X = 30
-- Diagonals
AND   A.X + F.X + L.X + R.X = 30
AND   D.X + G.X + K.X + N.X = 30
/

7	9	14	0
12	2	5	11
1	15	8	6
10	4	3	13

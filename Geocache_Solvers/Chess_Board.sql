
WITH CHESS AS (SELECT Rownum X FROM ALL_OBJECTS WHERE Rownum <= 8)
SELECT A.X A, B.X B, C.X C, D.X D, E.X E, F.X F, G.X G, H.X H
FROM   CHESS A
  JOIN CHESS B ON B.X NOT IN (2, 7, A.X)
  JOIN CHESS C ON C.X NOT IN (3, 6, A.X, B.X)
  JOIN CHESS D ON D.X NOT IN (4, 5, A.X, B.X, C.X)
  JOIN CHESS E ON E.X NOT IN (4, 5, A.X, B.X, C.X, D.X)
  JOIN CHESS F ON F.X NOT IN (3, 6, A.X, B.X, C.X, D.X, E.X)
  JOIN CHESS G ON G.X NOT IN (2, 7, A.X, B.X, C.X, D.X, E.X, F.X)
  JOIN CHESS H ON H.X NOT IN (1, 8, A.X, B.X, C.X, D.X, E.X, F.X, G.X)
WHERE A.X = 2
AND   abs(B.X - A.X) != 1
AND   abs(C.X - A.X) != 2
AND   abs(D.X - A.X) != 3
AND   abs(E.X - A.X) != 4
AND   abs(F.X - A.X) != 5
AND   abs(G.X - A.X) != 6
AND   abs(H.X - A.X) != 7
--
AND   abs(C.X - B.X) != 1
AND   abs(D.X - B.X) != 2
AND   abs(E.X - B.X) != 3
AND   abs(F.X - B.X) != 4
AND   abs(G.X - B.X) != 5
AND   abs(H.X - B.X) != 6
--
AND   abs(D.X - C.X) != 1
AND   abs(E.X - C.X) != 2
AND   abs(F.X - C.X) != 3
AND   abs(G.X - C.X) != 4
AND   abs(H.X - C.X) != 5
--
AND   abs(E.X - D.X) != 1
AND   abs(F.X - D.X) != 2
AND   abs(G.X - D.X) != 3
AND   abs(H.X - D.X) != 4
--
AND   abs(F.X - E.X) != 1
AND   abs(G.X - E.X) != 2
AND   abs(H.X - E.X) != 3
--
AND   abs(G.X - F.X) != 1
AND   abs(H.X - F.X) != 2
/

N 50 57.964, W 000 08.023
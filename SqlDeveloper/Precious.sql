
 -- A = J × X + W : C = M ÷ Q + W
DROP   TABLE GC_PRECIOUS PURGE;
CREATE TABLE GC_PRECIOUS
AS
WITH DIGIT AS (SELECT Rownum X FROM ALL_OBJECTS WHERE Rownum <=  26)
SELECT A.X A, Cast (NULL as number) B, C.X C, 
       Cast (NULL as number) D,   Cast (NULL as number) E,
       Cast (NULL as number) F,   Cast (NULL as number) G,
       Cast (NULL as number) H,   Cast (NULL as number) I,
       J.X J,
       Cast (NULL as number) K,   Cast (NULL as number) L,
       M.X M,
       Cast (NULL as number) N,   Cast (NULL as number) O,
       Cast (NULL as number) P,   Q.X Q,
       Cast (NULL as number) R,   Cast (NULL as number) S,
       Cast (NULL as number) T,   Cast (NULL as number) U,
       Cast (NULL as number) V,   W.X W, X.X X,
       Cast (NULL as number) Y,   Cast (NULL as number) Z
FROM   DIGIT A
  JOIN DIGIT J ON J.X NOT IN (A.X)
  JOIN DIGIT X ON X.X NOT IN (A.X, J.X)
  JOIN DIGIT W ON W.X NOT IN (A.X, J.X, X.X)
  JOIN DIGIT C ON C.X NOT IN (A.X, J.X, X.X, W.X)
  JOIN DIGIT M ON M.X NOT IN (A.X, J.X, X.X, W.X, C.X)
  JOIN DIGIT Q ON Q.X NOT IN (A.X, J.X, X.X, W.X, C.X, M.X)
WHERE A.X = (J.X * X.X) + W.X
AND   C.X = (M.X / Q.X) + W.X
;

UPDATE GC_PRECIOUS SET   Z = C + A - M ;

DELETE FROM GC_PRECIOUS
WHERE  Z IN (A, C, J, M, Q, X, W)
OR     Z Not Between 1 AND 26
;

-- W = T + Q - M => T = W + M -Q
UPDATE GC_PRECIOUS SET   T = W + M - Q;

DELETE FROM GC_PRECIOUS
WHERE  T IN (A, C, J, M, Q, W, X, Z)
OR     T Not Between 1 AND 26
;

UPDATE GC_PRECIOUS SET Y = (T * J) - Q;

DELETE FROM GC_PRECIOUS
WHERE  Y IN (A, C, J, M, Q, T, W, X, Z)
OR     Y Not Between 1 AND 26
;

-- Q = F - T - M => F = Q + T + M
UPDATE GC_PRECIOUS SET F = Q + T + M;

DELETE FROM GC_PRECIOUS
WHERE  F IN (A, C, J, M, Q, T, W, X, Y, Z)
OR     F Not Between 1 AND 26
;

UPDATE GC_PRECIOUS SET D = (Z / J) + C;

DELETE FROM GC_PRECIOUS
WHERE  D IN (A, C, F, J, M, Q, T, W, X, Y, Z)
OR     D Not Between 1 AND 26
OR     D != floor(D)
;

UPDATE GC_PRECIOUS SET H = M + Y - C;

DELETE FROM GC_PRECIOUS
WHERE  H IN (A, C, D, F, J, M, Q, T, W, X, Y, Z)
OR     H Not Between 1 AND 26
;

DELETE FROM GC_PRECIOUS
WHERE  J != Q + C - T
;

UPDATE GC_PRECIOUS SET O = (D / J) + X;

DELETE FROM GC_PRECIOUS
WHERE  O IN (A, C, D, F, H, J, M, Q, T, W, X, Y, Z)
OR     O Not Between 1 AND 26
OR     O != floor(O)
;

UPDATE GC_PRECIOUS SET B = J + O - Z;

DELETE FROM GC_PRECIOUS
WHERE  B IN (A, C, D, F, H, J, M, O, Q, T, W, X, Y, Z)
OR     B Not Between 1 AND 26
;

UPDATE GC_PRECIOUS SET S = (O / B) + Z;

DELETE FROM GC_PRECIOUS
WHERE  S IN (A, B, C, D, F, H, J, M, O, Q, T, W, X, Y, Z)
OR     S Not Between 1 AND 26
OR     S != floor(S)
;

DELETE FROM GC_PRECIOUS
WHERE  X != F - H + C
;

UPDATE GC_PRECIOUS SET G = (S / Q) + H;

DELETE FROM GC_PRECIOUS
WHERE  G IN (A, B, C, D, F, H, J, M, O, Q, S, T, W, X, Y, Z)
OR     G Not Between 1 AND 26
OR     G != floor(G)
;

UPDATE GC_PRECIOUS SET R = G - B + D;

DELETE FROM GC_PRECIOUS
WHERE  R IN (A, B, C, D, F, G, H, J, M, O, Q, S, T, W, X, Y, Z)
OR     R Not Between 1 AND 26
;

UPDATE GC_PRECIOUS SET V = R - Q + B;

DELETE FROM GC_PRECIOUS
WHERE  V IN (A, B, C, D, F, G, H, J, M, O, Q, R, S, T, W, X, Y, Z)
OR     V Not Between 1 AND 26
;

UPDATE GC_PRECIOUS SET K = (V / B) + C;

DELETE FROM GC_PRECIOUS
WHERE  K IN (A, B, C, D, F, G, H, J, M, O, Q, R, S, T, V, W, X, Y, Z)
OR     K Not Between 1 AND 26
;

UPDATE GC_PRECIOUS SET E = V - G + K;

DELETE FROM GC_PRECIOUS
WHERE  E IN (A, B, C, D, F, G, H, J, K, M, O, Q, R, S, T, V, W, X, Y, Z)
OR     E Not Between 1 AND 26
;

UPDATE GC_PRECIOUS SET U = E + C - X;

DELETE FROM GC_PRECIOUS
WHERE  U IN (A, B, C, D, E, F, G, H, J, K, M, O, Q, R, S, T, V, W, X, Y, Z)
OR     U Not Between 1 AND 26
;

UPDATE GC_PRECIOUS SET L = (F / U) + D;

DELETE FROM GC_PRECIOUS
WHERE  L IN (A, B, C, D, E, F, G, H, J, K, M, O, Q, R, S, T, U, V, W, X, Y, Z)
OR     L Not Between 1 AND 26
OR     L != floor(L)
;

UPDATE GC_PRECIOUS SET N = C + B + L;

DELETE FROM GC_PRECIOUS
WHERE  N IN (A, B, C, D, E, F, G, H, J, K, L, M, O, Q, R, S, T, U, V, W, X, Y, Z)
OR     N Not Between 1 AND 26
;

UPDATE GC_PRECIOUS SET N = C + B + L;

DELETE FROM GC_PRECIOUS
WHERE  N IN (A, B, C, D, E, F, G, H, J, K, L, M, O, Q, R, S, T, U, V, W, X, Y, Z)
OR     N Not Between 1 AND 26
;

UPDATE GC_PRECIOUS SET P = (N / X) + H;

DELETE FROM GC_PRECIOUS
WHERE  P IN (A, B, C, D, E, F, G, H, J, K, L, M, N, O, Q, R, S, T, U, V, W, X, Y, Z)
OR     P Not Between 1 AND 26
OR     P != floor(P)
;

UPDATE GC_PRECIOUS SET I = P - K + X;

DELETE FROM GC_PRECIOUS
WHERE  I IN (A, B, C, D, E, F, G, H, J, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z)
OR     I Not Between 1 AND 26
;

SELECT * FROM GC_PRECIOUS;

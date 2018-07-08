
DROP   TABLE GS_ABCDEFGHIJ PURGE;
CREATE TABLE GS_ABCDEFGHIJ
AS
WITH Digit AS (SELECT Rownum - 1 X FROM ALL_OBJECTS WHERE Rownum <= 10)
SELECT A.X A, B.X B, C.X C, D.X D, E.X E, F.X F, G.X G, H.X H, I.X I, J.X J,
       0 No_0s, 0 No_1s, 0 No_2s, 0 No_3s, 0 No_4s, 0 No_5s, 0 No_6s, 0 No_7s, 0 No_8s,  0 No_9s 
FROM   Digit A
  JOIN Digit B ON A.X + B.X                                                <= 10
  JOIN Digit C ON A.X + B.X + C.X                                          <= 10
  JOIN Digit D ON A.X + B.X + C.X + D.X                                    <= 10
  JOIN Digit E ON A.X + B.X + C.X + D.X + E.X                              <= 10
  JOIN Digit F ON A.X + B.X + C.X + D.X + E.X + F.X                        <= 10
  JOIN Digit G ON A.X + B.X + C.X + D.X + E.X + F.X + G.X                  <= 10
  JOIN Digit H ON A.X + B.X + C.X + D.X + E.X + F.X + G.X + H.X            <= 10
  JOIN Digit I ON A.X + B.X + C.X + D.X + E.X + F.X + G.X + H.X + I.X      <= 10
  JOIN Digit J ON A.X + B.X + C.X + D.X + E.X + F.X + G.X + H.X + I.X + J.X = 10
WHERE  A.X > 0
/

UPDATE GS_ABCDEFGHIJ
SET    No_0s = decode(A, 0, 1, 0) + decode(B, 0, 1, 0) + decode(C, 0, 1, 0) + decode(D, 0, 1, 0) +
               decode(E, 0, 1, 0) + decode(F, 0, 1, 0) + decode(G, 0, 1, 0) + decode(H, 0, 1, 0) +
               decode(I, 0, 1, 0) + decode(J, 0, 1, 0)
/
DELETE FROM GS_ABCDEFGHIJ
WHERE  No_0s != A
/

UPDATE GS_ABCDEFGHIJ
SET    No_1s = decode(A, 1, 1, 0) + decode(B, 1, 1, 0) + decode(C, 1, 1, 0) + decode(D, 1, 1, 0) +
               decode(E, 1, 1, 0) + decode(F, 1, 1, 0) + decode(G, 1, 1, 0) + decode(H, 1, 1, 0) +
               decode(I, 1, 1, 0) + decode(J, 1, 1, 0)
/
DELETE FROM GS_ABCDEFGHIJ
WHERE  No_1s != B
/

UPDATE GS_ABCDEFGHIJ
SET    No_2s = decode(A, 2, 1, 0) + decode(B, 2, 1, 0) + decode(C, 2, 1, 0) + decode(D, 2, 1, 0) +
               decode(E, 2, 1, 0) + decode(F, 2, 1, 0) + decode(G, 2, 1, 0) + decode(H, 2, 1, 0) +
               decode(I, 2, 1, 0) + decode(J, 2, 1, 0)
/
DELETE FROM GS_ABCDEFGHIJ
WHERE  No_2s != C
/

UPDATE GS_ABCDEFGHIJ
SET    No_3s = decode(A, 3, 1, 0) + decode(B, 3, 1, 0) + decode(C, 3, 1, 0) + decode(D, 3, 1, 0) +
               decode(E, 3, 1, 0) + decode(F, 3, 1, 0) + decode(G, 3, 1, 0) + decode(H, 3, 1, 0) +
               decode(I, 3, 1, 0) + decode(J, 3, 1, 0)
/
DELETE FROM GS_ABCDEFGHIJ
WHERE  No_3s != D
/

UPDATE GS_ABCDEFGHIJ
SET    No_4s = decode(A, 4, 1, 0) + decode(B, 4, 1, 0) + decode(C, 4, 1, 0) + decode(D, 4, 1, 0) +
               decode(E, 4, 1, 0) + decode(F, 4, 1, 0) + decode(G, 4, 1, 0) + decode(H, 4, 1, 0) +
               decode(I, 4, 1, 0) + decode(J, 4, 1, 0)
/
DELETE FROM GS_ABCDEFGHIJ
WHERE  No_4s != E
/

UPDATE GS_ABCDEFGHIJ
SET    No_5s = decode(A, 5, 1, 0) + decode(B, 5, 1, 0) + decode(C, 5, 1, 0) + decode(D, 5, 1, 0) +
               decode(E, 5, 1, 0) + decode(F, 5, 1, 0) + decode(G, 5, 1, 0) + decode(H, 5, 1, 0) +
               decode(I, 5, 1, 0) + decode(J, 5, 1, 0)
/
DELETE FROM GS_ABCDEFGHIJ
WHERE  No_5s != F
/

UPDATE GS_ABCDEFGHIJ
SET    No_6s = decode(A, 6, 1, 0) + decode(B, 6, 1, 0) + decode(C, 6, 1, 0) + decode(D, 6, 1, 0) +
               decode(E, 6, 1, 0) + decode(F, 6, 1, 0) + decode(G, 6, 1, 0) + decode(H, 6, 1, 0) +
               decode(I, 6, 1, 0) + decode(J, 6, 1, 0)
/
DELETE FROM GS_ABCDEFGHIJ
WHERE  No_6s != G
/


SELECT 6210 / ( (1+6+1+0+0) + 0010 ), ((B+C+D+E)*100) + ((A+B+C+D)*10) + (D+E+F)
FROM GS_ABCDEFGHIJ;
SELECT * FROM GS_ABCDEFGHIJ;

N 51° 26.345 E 000° 09.390


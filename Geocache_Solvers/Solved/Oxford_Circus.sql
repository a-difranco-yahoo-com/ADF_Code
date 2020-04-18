-- Sport shoes       : Exit A : 1
-- Computer software : Exit B - 3
-- Discount clothes  : Exit C - 4
-- Underwear         : Exit D - 2

The cache is located at somewhere quieter: N51�30.(1000-A-B-C-D-B), W000�08.(A+C)(DxB)A. Even though it is quieter here, you will still need to be stealthy. Tweezers may be required. Optional: you may want to write on your find logs, what keen geocachers should put on their present wishlists.
/
WITH ANSWERS AS (SELECT 1 A, 3 B, 4 C, 2 D FROM DUAL)
SELECT 'N 51�  30.' || (1000-A-B-C-D-B)  Northing,
       'W 000� 08.' || (A+C) || (D*B) || A Westing
FROM ANSWERS
/

SELECT  Distinct L1, L2, L3, L4, L5, L6, L7, L8, L9, L10
FROM    BLACKHEATH
/
DELETE FROM BLACKHEATH WHERE L3 > 9;
DELETE FROM BLACKHEATH WHERE L7 < 0;
DELETE FROM BLACKHEATH WHERE L8 > 9;
DELETE FROM BLACKHEATH WHERE L9 > 9;

SELECT    A, B, C, D, E, F, G, H, I, J, L, M FROM BLACKHEATH WHERE Id > 214 ORDER BY ID;
SELECT Id, Northing, Easting FROM BLACKHEATH WHERE Id > 214 ORDER BY ID;

A=21 / B = 1 or 3 / C = 8 / D = 4 / E = 1(?) / F = 9 / G = ? 
/ H = 74 / I = 6 (Selectric) / J = ? / K = 1 / L = 8 / M = 14 (?)

1 = 65


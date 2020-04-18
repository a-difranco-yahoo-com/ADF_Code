
-- 14 October 1066
-- AB CD EFGH 14 10 1066

WITH   ANSWER AS (SELECT 1 A, 4 B, 1 C, 0 D, 1 E, 0 F, 6 G, 6 H FROM DUAL)
SELECT
--     'N [G - A][A - C][H - C] [ B ] . [B + B] [B + G - A] [D + F]',
--     'E [A - C][C - E][E - A][A + C][A + C + G].[C + E + H][A + C + H][A + B + C - G]',
       A.*,
      'N ' ||
      to_char(G-A) || to_char(A-C) || ' ' ||
      to_char(H-C) || to_char(B) || '.' ||
      to_char(B+B) || to_char(B+G-A) || to_char(D+F) Northing,
      'E ' ||
      to_char(A-C) || to_char(C-E) || to_char(E-A) || ' ' ||
      to_char(A+C) || to_char(A+C+G) || '.' || 
      to_char(C+E+H) || to_char(A+C+H) || to_char(A+B+C-G) Easting
FROM   ANSWER A
/

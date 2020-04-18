
SELECT  'N 51 3' || a || '.' || b || c || d Northing,
        'W 000 2' ||  e || '.' || f || g || h
FROM  (
WITH   Ranks AS (SELECT 1 FO, 2 FL, 3 SL, 4 WC, 5 GC, 6 AC, 7 AVM, 8 AM, 9 ACM, 10 MOTRAF FROM DUAL)
SELECT (AC - GC + FO) a, (ACM - WC + AM - AVM) b,
       (FO + SL - FL) c, (MOTRAF - SL) d,
       (GC + SL - FO) e, (AC + FL + WC - GC) f,
       (AM - SL)      g, (MOTRAF - AVM - FL + SL - WC) h
FROM RANKS
)
/
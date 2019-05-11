-- 262144 => 80080 => 7360 N 23' - 43'
SELECT Count(*)
--SELECT floor(AB_CDE / 1000) North, floor(EF_GHI / 1000) West, Count(*)
--SELECT AB_CDE, EF_GHI
FROM  (
        WITH Octal AS ( SELECT Rownum - 1 Nos FROM ALL_Objects WHERE Rownum <= 8)
        SELECT     (T.Nos * power(8, 5)) + (W.Nos * power(8, 4)) + (U.Nos * power(8, 3)) +
                   (X.Nos * power(8, 2)) + (W.Nos * power(8, 1)) + (T.Nos * power(8, 0)) AB_CDE,
                   (U.Nos * power(8, 5)) + (T.Nos * power(8, 4)) + (V.Nos * power(8, 3)) +
                   (S.Nos * power(8, 2)) + (X.Nos * power(8, 1)) + (Z.Nos * power(8, 0)) EF_GHI,
                   S.Nos S, T.Nos T, U.Nos U, V.Nos V, W.Nos W, X.Nos X, Z.Nos Z
        FROM       Octal S
        CROSS JOIN Octal T
        CROSS JOIN Octal U
        CROSS JOIN Octal V
        CROSS JOIN Octal W
        CROSS JOIN Octal X
        CROSS JOIN Octal Z
      )
WHERE mod(AB_CDE, 10) = floor(EF_GHI / 10000)
AND   AB_CDE Between 23000 AND 43000
--AND   EF_GHI Between 00000 AND 100000
--GROUP BY floor(AB_CDE / 1000), floor(EF_GHI / 1000)
--ORDER BY floor(AB_CDE / 1000), floor(EF_GHI / 1000)
/



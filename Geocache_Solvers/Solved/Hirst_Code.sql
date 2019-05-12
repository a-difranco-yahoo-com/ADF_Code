INSERT INTO HIRST_PUZZLE1 (Letter_No, R_Code, G_Code, B_Code)
(SELECT 36, -1, -1, -1 FROM HIRST_PUZZLE1 WHERE Letter_No = 1);
COMMIT;

INSERT INTO HIRST_CODE (Letter, R_Code, G_Code, B_Code)
(SELECT '0', -1, -1, -1 FROM HIRST_CODE WHERE Letter = 'A');
COMMIT;



SELECT Letter_No, Letter,
      avg(Distance) AVG, min(Distance) Min, Max(Distance) Max
FROM  (
        SELECT     P.Letter_No, C.Letter,
                   power(P.R_Code - C.R_Code, 2) +
                   power(P.G_Code - C.G_Code, 2) +
                   power(P.B_Code - C.B_Code, 2) Distance
        FROM       HIRST_PUZZLE1 P
        CROSS JOIN HIRST_CODE    C
      )
WHERE Letter_No > 34
GROUP BY Letter_No, Letter
ORDER BY 3, 1      
/


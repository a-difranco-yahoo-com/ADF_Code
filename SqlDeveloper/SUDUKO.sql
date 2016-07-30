

BEGIN
  Su_Solver.Solve_Puzzle(1, 15);
END;
/


SELECT Row_No,
       max(CASE WHEN Col_No = 1 THEN Nos ELSE 0 END) Col1,
       max(CASE WHEN Col_No = 2 THEN Nos ELSE 0 END) Col2,
       max(CASE WHEN Col_No = 3 THEN Nos ELSE 0 END) Col3,
       max(CASE WHEN Col_No = 4 THEN Nos ELSE 0 END) Col4,
       max(CASE WHEN Col_No = 5 THEN Nos ELSE 0 END) Col5,
       max(CASE WHEN Col_No = 6 THEN Nos ELSE 0 END) Col6,
       max(CASE WHEN Col_No = 7 THEN Nos ELSE 0 END) Col7,
       max(CASE WHEN Col_No = 8 THEN Nos ELSE 0 END) Col8,
       max(CASE WHEN Col_No = 9 THEN Nos ELSE 0 END) Col9
FROM   Suduko_Solution
WHERE  Is_Entered = 'Y'
GROUP BY Row_No
ORDER BY Row_No
/
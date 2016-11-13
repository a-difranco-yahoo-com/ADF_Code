
BEGIN
  GS_SOLVER.Solve_Puzzle(1);
END;
/

SELECT *
FROM   GS_LINE_COMBINATION
/

SELECT P.Row_Or_Col, P.LINE_NO, PS.SEQUENCE_NO, PS.SEQUENCE_LENGTH 
FROM   GS_GT_PATTERN          P
  JOIN GS_GT_PATTERN_SEQUENCE PS ON PS.Pattern_Id = P.Pattern_Id
ORDER BY 1, 2, 3
/


SELECT * FROM   GS_COMBINATION_SEQUENCE;
SELECT * FROM   GS_LINE_COMBINATION;
SELECT * FROM   GS_SOLUTION;
SELECT * FROM   GS_PROGRESS;

SELECT Solution_Id, Is_Filled, Count(*) FROM   GS_SOLUTION Group By Solution_Id, Is_Filled;

/
SELECT LC.Row_Or_Col, LC.LINE_NO, CS.START_POS, CS.END_POS 
FROM   GS_LINE_COMBINATION     LC
  JOIN GS_COMBINATION_SEQUENCE CS ON CS.Combination_Id = LC.Combination_Id
ORDER BY LC.Row_Or_Col, LC.LINE_NO, CS.COMBINATION_ID, CS.START_POS
/

SELECT LC.Row_Or_Col, LC.Solution_Id, Sum(CS.END_POS - CS.START_POS + 1)
FROM   GS_LINE_COMBINATION     LC
  JOIN GS_COMBINATION_SEQUENCE CS ON CS.Combination_Id = LC.Combination_Id
GROUP BY LC.Row_Or_Col, LC.Solution_Id
/



SELECT 
       max(CASE WHEN Col_NO =  1 AND Is_Filled = 'Y' THEN 'X' ELSE ' ' END) ||
       max(CASE WHEN Col_NO =  2 AND Is_Filled = 'Y' THEN 'X' ELSE ' ' END) ||
       max(CASE WHEN Col_NO =  3 AND Is_Filled = 'Y' THEN 'X' ELSE ' ' END) ||
       max(CASE WHEN Col_NO =  4 AND Is_Filled = 'Y' THEN 'X' ELSE ' ' END) ||
       max(CASE WHEN Col_NO =  5 AND Is_Filled = 'Y' THEN 'X' ELSE ' ' END) ||
--
       max(CASE WHEN Col_NO =  6 AND Is_Filled = 'Y' THEN 'X' ELSE ' ' END) ||
       max(CASE WHEN Col_NO =  7 AND Is_Filled = 'Y' THEN 'X' ELSE ' ' END) ||
       max(CASE WHEN Col_NO =  8 AND Is_Filled = 'Y' THEN 'X' ELSE ' ' END) ||
       max(CASE WHEN Col_NO =  9 AND Is_Filled = 'Y' THEN 'X' ELSE ' ' END) ||
       max(CASE WHEN Col_NO = 10 AND Is_Filled = 'Y' THEN 'X' ELSE ' ' END) ||
--
       max(CASE WHEN Col_NO = 11 AND Is_Filled = 'Y' THEN 'X' ELSE ' ' END) ||
       max(CASE WHEN Col_NO = 12 AND Is_Filled = 'Y' THEN 'X' ELSE ' ' END) ||
       max(CASE WHEN Col_NO = 13 AND Is_Filled = 'Y' THEN 'X' ELSE ' ' END) ||
       max(CASE WHEN Col_NO = 14 AND Is_Filled = 'Y' THEN 'X' ELSE ' ' END) ||
       max(CASE WHEN Col_NO = 15 AND Is_Filled = 'Y' THEN 'X' ELSE ' ' END) ||
--
       max(CASE WHEN Col_NO = 16 AND Is_Filled = 'Y' THEN 'X' ELSE ' ' END) ||
       max(CASE WHEN Col_NO = 17 AND Is_Filled = 'Y' THEN 'X' ELSE ' ' END) ||
       max(CASE WHEN Col_NO = 18 AND Is_Filled = 'Y' THEN 'X' ELSE ' ' END) ||
       max(CASE WHEN Col_NO = 19 AND Is_Filled = 'Y' THEN 'X' ELSE ' ' END) ||
       max(CASE WHEN Col_NO = 20 AND Is_Filled = 'Y' THEN 'X' ELSE ' ' END) ||
--
--
       max(CASE WHEN Col_NO = 21 AND Is_Filled = 'Y' THEN 'X' ELSE ' ' END) ||
       max(CASE WHEN Col_NO = 22 AND Is_Filled = 'Y' THEN 'X' ELSE ' ' END) ||
       max(CASE WHEN Col_NO = 23 AND Is_Filled = 'Y' THEN 'X' ELSE ' ' END) ||
       max(CASE WHEN Col_NO = 24 AND Is_Filled = 'Y' THEN 'X' ELSE ' ' END) ||
       max(CASE WHEN Col_NO = 25 AND Is_Filled = 'Y' THEN 'X' ELSE ' ' END) ||
       '' Linex
FROM   GS_SOLUTION
GROUP BY Row_No
ORDER BY Row_No
/

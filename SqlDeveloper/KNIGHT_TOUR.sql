

BEGIN
  KT_SETUP.SETUP_PUZZLE1;
  KT_SOLVER.SOLVE_PUZZLE(600);
END;
/

SELECT *
FROM   USER_SEGMENTS
/

SELECT   Solution_Id,
         SUM( decode(Status, 'Y', 1, 0) ) IsY,
         SUM( decode(Status, 'U', 1, 0) ) IsU,
         SUM( decode(Status, 'N', 1, 0) ) IsN
FROM     KT_SOLUTION
GROUP BY Solution_Id
ORDER BY Solution_Id
/
SELECT   Move_No,
         SUM( decode(Status, 'Y', 1, 0) ) IsY,
         SUM( decode(Status, 'U', 1, 0) ) IsU,
         SUM( decode(Status, 'N', 1, 0) ) IsN
FROM     KT_SOLUTION
GROUP BY Move_No
ORDER BY Move_No
/


SELECT   Solution_Id, Row_No,
         SUM( decode(Col_No, 1, Move_No, 0) ) Col1,
         SUM( decode(Col_No, 2, Move_No, 0) ) Col2,
         SUM( decode(Col_No, 3, Move_No, 0) ) Col3,
         SUM( decode(Col_No, 4, Move_No, 0) ) Col4,
         SUM( decode(Col_No, 5, Move_No, 0) ) Col5,
         SUM( decode(Col_No, 6, Move_No, 0) ) Col6,
         SUM( decode(Col_No, 7, Move_No, 0) ) Col7,
         SUM( decode(Col_No, 8, Move_No, 0) ) Col8
FROM     KT_SOLUTION
WHERE    STATUS = 'Y'
GROUP BY Solution_Id, Row_No
ORDER BY Solution_Id, Row_No
/


CREATE Table SOL AS (SELECT * FROM KT_SOLUTION);
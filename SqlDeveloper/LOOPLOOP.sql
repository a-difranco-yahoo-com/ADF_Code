

BEGIN
  LL_SETUP.Setup_Puzzle(1);
  LL_SOLVER.SOLVE_PUZZLE;
END;
/

SELECT L.Solution_Id,
       SUM( Decode(L.IS_USED, 'Y', 1, 0) ) Is_Y,
       SUM( Decode(L.IS_USED, 'N', 1, 0) ) Is_N,
       SUM( Decode(L.IS_USED, 'U', 1, 0) ) Is_U
FROM   LL_LINE L
Group By L.Solution_Id
/


SELECT Start_Row,
       max( Decode( Start_Col,  1, Is_Used, NULL)) C1,
       max( Decode( Start_Col,  2, Is_Used, NULL)) C2,
       max( Decode( Start_Col,  3, Is_Used, NULL)) C3,
       max( Decode( Start_Col,  4, Is_Used, NULL)) C4,
       max( Decode( Start_Col,  5, Is_Used, NULL)) C5,
       max( Decode( Start_Col,  6, Is_Used, NULL)) C6,
       max( Decode( Start_Col,  7, Is_Used, NULL)) C7,
       max( Decode( Start_Col,  8, Is_Used, NULL)) C8,
       max( Decode( Start_Col,  9, Is_Used, NULL)) C9,
       max( Decode( Start_Col, 10, Is_Used, NULL)) C10
FROM   LL_LINE
WHERE  Start_Row = End_Row
AND    Solution_Id = 3732
Group By Start_Row
Order By Start_Row
/
SELECT Start_Col,
       max( Decode( Start_Row,  1, Is_Used, NULL)) C1,
       max( Decode( Start_Row,  2, Is_Used, NULL)) C2,
       max( Decode( Start_Row,  3, Is_Used, NULL)) C3,
       max( Decode( Start_Row,  4, Is_Used, NULL)) C4,
       max( Decode( Start_Row,  5, Is_Used, NULL)) C5,
       max( Decode( Start_Row,  6, Is_Used, NULL)) C6,
       max( Decode( Start_Row,  7, Is_Used, NULL)) C7,
       max( Decode( Start_Row,  8, Is_Used, NULL)) C8,
       max( Decode( Start_Row,  9, Is_Used, NULL)) C9,
       max( Decode( Start_Row, 10, Is_Used, NULL)) C10
FROM   LL_LINE
WHERE  Start_Col = End_Col
AND    Solution_Id = 3732
Group By Start_Col
Order By Start_Col
/



BEGIN
  PUZZLE_SOLVER.Solve_Puzzle(1, 10);
END;
/

--------------------------------------------------------
--  DDL for Table DS_DOMINO
--------------------------------------------------------

TRUNCATE TABLE DS_DOMINO;

SELECT B.Solution_Id, B.NO_OF_UNKNOWNS, a.NO_OF_UNKNOWNS
FROM   DS_SUMMARY B
  JOIN DS_SUMMARY A ON a.SOLUTION_ID = B.SOLUTION_ID
                   AND A.STAGE       < B.STAGE
ORDER BY 1, 3
/

SELECT Solution_Id, 
      Sum( Decode(Is_used, 'Y', 1, 0) ) Is_Y,
      Sum( Decode(Is_used, 'U', 1, 0) ) Is_U,
      Sum( Decode(Is_used, 'N', 1, 0) ) Is_N
FROM   DS_DOMINO
GROUP BY Solution_Id
ORDER BY Solution_Id;


SELECT S2.ROW_NO, S2.COL_NO, S1.Row_No, S1.Col_No, S2.DOMINO, S1.DOMINO
FROM   DS_DOMINO D
  JOIN DS_SQUARE S1 ON S1.SQUARE_ID = D.SQUARE_ID1
  JOIN DS_SQUARE S2 ON S2.SQUARE_ID = D.SQUARE_ID2
WHERE  D.Solution_Id = 1
AND    D.Is_Used     = 'Y'
;


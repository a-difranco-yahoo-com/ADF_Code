
BEGIN
  AC_SETUP.Setup_Puzzle1;
  AC_SOLVER.Solve_Puzzle;
END;
/

SELECT *  FROM   AC_SOLUTION ORDER BY Solution_Id, Letter;
SELECT *  FROM   AC_SOLUTION ORDER BY Solution_Id, Amount;

SELECT *  FROM   AC_SOLUTION_CLUE ORDER BY Remaining_total;
SELECT  * FROM   AC_CLUE ORDER BY length( REMAINING_LETTERS);

SELECT Count(Distinct Solution_ID) FROM   AC_SOLUTION;
SELECT Count(*) - (1 * 17),  Count(Distinct Solution_ID), Count(Distinct Letter)     FROM   AC_SOLUTION;
SELECT Count(*) - (1 * 12), Count(Distinct Solution_ID), Count(Distinct Clue_ID)     FROM   AC_SOLUTION_CLUE;



BEGIN
--  AC_SOLVER.Solve_Puzzle(1);
--  AC_SOLVER.Solve_Puzzle(2);
  AC_SOLVER_EXTRA.Solve_Puzzle(3);
END;
/

SELECT *  FROM   AC_SOLUTION ORDER BY Solution_Id, Letter;
SELECT *  FROM   AC_SOLUTION ORDER BY Solution_Id, Amount;

SELECT *  FROM   AC_SOLUTION_CLUE ORDER BY Remaining_total;
SELECT  * FROM   AC_CLUE ORDER BY length( REMAINING_LETTERS);
SELECT  * FROM   AC_CLUE ORDER BY Clue_Word;

SELECT Count(Distinct Solution_ID) Solutions, Count(Distinct Letter) Letters_Done    FROM   AC_SOLUTION;
SELECT  * FROM   AC_CLUE ORDER BY length( REMAINING_LETTERS);

SELECT *  FROM   AC_CLUE          WHERE                      Clue_Id = ;
SELECT *  FROM   AC_SOLUTION      WHERE SOLUTION_ID = 418;
SELECT Remaining_Total, Count(*)  FROM   AC_SOLUTION_CLUE WHERE Clue_Id = 11 GROUP BY Remaining_Total;
SELECT Remaining_Total, Count(*)  FROM   AC_SOLUTION_CLUE WHERE Clue_Id = 19 GROUP BY Remaining_Total;


SELECT *
FROM  (
SELECT Solution_Id,
       max( decode(Letter, 'R', Amount, 0) ) R,
       max( decode(Letter, 'E', Amount, 0) ) E,
       max( decode(Letter, 'N', Amount, 0) ) N,
       max( decode(Letter, 'A', Amount, 0) ) A,
       max( decode(Letter, 'U', Amount, 0) ) U,
       max( decode(Letter, 'L', Amount, 0) ) L,
       max( decode(Letter, 'T', Amount, 0) ) T,
       'x'
FROM   AC_SOLUTION
Group By Solution_Id
)
WHERE  R = 7
AND    E = 3
AND    A = 5
AND    U = 4
AND    L = 1
AND    T = 8
/

SELECT min(Start_Time), max(End_Time) FROM AC_MESSAGE;

SELECT * FROM AC_MESSAGE Order By End_Time - Start_Time desc;
SELECT * FROM AC_MESSAGE Order By Message_Id;
SELECT P.Message_Text Prev, C.Message_Text Curr, P.End_Time, C.Start_Time  
FROM   AC_MESSAGE C
  JOIN AC_MESSAGE P ON P.Message_Id = C.Message_Id - 1
ORDER BY C.Start_Time - P.End_Time Desc

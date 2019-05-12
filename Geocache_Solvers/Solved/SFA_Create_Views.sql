
Create Or Replace View V_Solution_Words_Count
AS
SELECT   F.Solution_Id, F.Word_Id, Count(*) Occurs, W.Start_Col, W.End_Col
FROM     SFA_FOUND_WORD F
  JOIN   SFA_WORD       W ON W.Word_Id     = F.Word_Id
                         AND W.Solution_Id = F.Solution_Id
                         AND W.Solved      = 'N'
GROUP BY F.Solution_Id, F.Word_Id, W.Start_Col, W.End_Col
ORDER BY 3, 1, 2
/

Create Or Replace View V_Word_Max_Solution
AS
SELECT Word_Id, Max(Sols) Max_Solutions
FROM  (
SELECT Solution_Id, Word_Id, Count(*) Sols
FROM   SFA_FOUND_WORD 
Group By Solution_Id, Word_Id
)
Where    Sols > 1
Group By Word_Id
Order By 2, 1
/

Create Or Replace View V_Words_To_Solve_Count
AS
SELECT   Words_To_Solve, Count(*) No_Of_Solutions
FROM     (
          SELECT   Solution_Id, Count(*) Words_To_Solve
          FROM     SFA_WORD
          WHERE    Solved = 'N'
          GROUP BY Solution_Id)
GROUP BY Words_To_Solve
ORDER BY Words_To_Solve
/

Create Or Replace View V_Solution_Count
AS
SELECT Count(*) No_of_Words, Count(Distinct Solution_Id) No_of_Solutions
FROM   SFA_FOUND_WORD
/

Create Or Replace View V_Unsolved_Word_Count
AS
SELECT Word_Id, No_Of_Words, Count(*) Times
FROM  (
        SELECT Word_Id, Solution_Id, Count(*) No_Of_Words
        FROM   SFA_FOUND_WORD
        GROUP BY Word_Id, Solution_Id
        HAVING Count(*) > 1
        )
GROUP BY Word_Id, No_Of_Words
ORDER BY 2, 3, 1
/

Create Or Replace View V_Solved_Word_Count
AS
SELECT Word_Id, Word, Count(*) Occurs
FROM   SFA_WORD 
WHERE  Word IS NOT NULL
Group By Word_Id, Word
Order By Word_Id, Word
/


--------------------------------------------------------------------------------



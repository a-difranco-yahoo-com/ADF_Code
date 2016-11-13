CREATE OR REPLACE PACKAGE GS_SOLVER AS 

  Procedure Solve_Puzzle(p_Puzzle_Id  NUMBER);

END GS_SOLVER;
/


CREATE OR REPLACE PACKAGE BODY GS_SOLVER AS

  PKG_FILLED      NUMBER := 1;
  PKG_BLANK       NUMBER := 2;
  PKG_UNKNOWN     NUMBER := 3;
  
/*  ***********************************************************
    Utility Functions
    *********************************************************** */
    Function Finished
        RETURN BOOLEAN
    IS
       Loc_Count   NUMBER;
    BEGIN
       SELECT Count(*)
       INTO   Loc_Count
       FROM   GS_SOLUTION
       WHERE  Is_Filled = 'U';
       
       Return (Loc_Count = 0);
    END;

/*  ***********************************************************
    Get Functions
    *********************************************************** */
    Function Get_No_Of_Combinations(p_Solution_Id NUMBER, p_Row_Col VARCHAR2, p_Line_No NUMBER)
        RETURN NUMBER
    IS
       Loc_Combs   NUMBER;
    BEGIN
       SELECT Count(*)
       INTO   Loc_Combs
       FROM   GS_LINE_COMBINATION
       WHERE  Solution_Id = p_Solution_Id
       AND    Row_Or_Col  = p_Row_Col
       AND    Line_No     = p_Line_No;
       
       Return  Loc_Combs;
    END;

    Function Get_No_Of_Hits(p_Solution_Id NUMBER, p_Row_Col VARCHAR2, p_Line_No NUMBER, p_Cell_No NUMBER)
        RETURN NUMBER
    IS
       Loc_Hits   NUMBER;
    BEGIN
       SELECT Count(*)
       INTO   Loc_Hits
       FROM   GS_LINE_COMBINATION     LS
         JOIN GS_COMBINATION_SEQUENCE CS ON CS.Combination_Id = LS.Combination_Id
       WHERE  LS.Solution_Id = p_Solution_Id
       AND    LS.Row_Or_Col  = p_Row_Col
       AND    LS.Line_No     = p_Line_No
       AND    p_Cell_No BETWEEN CS.Start_Pos AND CS.End_Pos;
       
       Return  Loc_Hits;
    END;

    Function Get_Status(p_Solution_Id NUMBER, p_Row_Col VARCHAR2, p_Line_No NUMBER, p_Cell_No NUMBER)
        RETURN NUMBER
    IS
       Loc_Combs  NUMBER;
       Loc_Hits   NUMBER;
    BEGIN
       Loc_Combs := Get_No_Of_Combinations(p_Solution_Id, p_Row_Col, p_Line_No);
       Loc_Hits  := Get_No_Of_Hits        (p_Solution_Id, p_Row_Col, p_Line_No, p_Cell_No);
       
       IF    Loc_Hits = 0         THEN Return  PKG_BLANK;
       ELSIF Loc_Hits = Loc_Combs THEN Return  PKG_FILLED;
                                  ELSE Return  PKG_UNKNOWN;
       END IF;
    END;

    Function Get_Next_Solution_Id
        RETURN NUMBER
    IS
       Loc_Solution_Id  NUMBER;
    BEGIN
       SELECT max(Solution_Id) + 1
       INTO   Loc_Solution_Id
       FROM   GS_SOLUTION;

       Return  Loc_Solution_Id;
    END;

    Function Get_Best_Solution(p_Solution_Id NUMBER)
        RETURN GS_SOLUTION%RowType
    IS
       Loc_Solution GS_SOLUTION%RowType;
    BEGIN
       SELECT Row_No, Col_No, p_Solution_Id, 'U'
       INTO   Loc_Solution
       FROM (
             SELECT S.Row_No, S.Col_No,
                    Row_Number() OVER (ORDER BY Count(Distinct Rc.Combination_Id) * 
                                                Count(Distinct Cc.Combination_Id) ) RN
             FROM   GS_SOLUTION S
               JOIN GS_LINE_COMBINATION RC ON RC.Solution_Id = S.Solution_Id
                                          AND RC.Line_No     = S.Row_No 
                                          AND RC.Row_Or_Col  = 'R'
               JOIN GS_LINE_COMBINATION CC ON CC.Solution_Id = S.Solution_Id
                                          AND CC.Line_No     = S.Col_No 
                                          AND CC.Row_Or_Col  = 'C'
             WHERE  S.Solution_Id = p_Solution_Id
             AND    S.Is_Filled   = 'U'
             GROUP BY S.Row_No, S.Col_No
             )
       WHERE RN = 1;

       Return  Loc_Solution;
    END;

/*  ***********************************************************
    Mark Procedures
    *********************************************************** */
   Procedure Mark_As_Filled(p_Solution_Id NUMBER, p_Row_No NUMBER, p_Col_No NUMBER)
   AS
   BEGIN
      UPDATE GS_SOLUTION
      SET    Is_Filled = 'Y'
      WHERE  Solution_Id = p_Solution_Id
      AND    Row_No      = p_Row_No
      AND    Col_No      = p_Col_No;

      DELETE FROM GS_LINE_COMBINATION LC
      WHERE  Solution_Id = p_Solution_Id
      AND    Row_Or_Col  = 'R'
      AND    Line_No     = p_Row_No
      AND NOT EXISTS (SELECT 1
                      FROM   GS_COMBINATION_SEQUENCE CS
                      WHERE  CS.Combination_Id = LC.Combination_Id
                      AND    p_Col_No BETWEEN CS.Start_Pos AND CS.End_Pos);

      DELETE FROM GS_LINE_COMBINATION LC
      WHERE  Solution_Id = p_Solution_Id
      AND    Row_Or_Col  = 'C'
      AND    Line_No     = p_Col_No
      AND NOT EXISTS (SELECT 1
                      FROM   GS_COMBINATION_SEQUENCE CS
                      WHERE  CS.Combination_Id = LC.Combination_Id
                      AND    p_Row_No BETWEEN CS.Start_Pos AND CS.End_Pos);
   END;

   Procedure Mark_As_Blank(p_Solution_Id NUMBER, p_Row_No NUMBER, p_Col_No NUMBER)
   AS
   BEGIN
      UPDATE GS_SOLUTION
      SET    Is_Filled = 'N'
      WHERE  Solution_Id = p_Solution_Id
      AND    Row_No      = p_Row_No
      AND    Col_No      = p_Col_No;

      DELETE FROM GS_LINE_COMBINATION LC
      WHERE  Solution_Id = p_Solution_Id
      AND    Row_Or_Col  = 'R'
      AND    Line_No     = p_Row_No
      AND EXISTS (SELECT 1
                  FROM   GS_COMBINATION_SEQUENCE CS
                  WHERE  CS.Combination_Id = LC.Combination_Id
                  AND    p_Col_No BETWEEN CS.Start_Pos AND CS.End_Pos);

      DELETE FROM GS_LINE_COMBINATION LC
      WHERE  Solution_Id = p_Solution_Id
      AND    Row_Or_Col  = 'C'
      AND    Line_No     = p_Col_No
      AND EXISTS (SELECT 1
                  FROM   GS_COMBINATION_SEQUENCE CS
                  WHERE  CS.Combination_Id = LC.Combination_Id
                  AND    p_Row_No BETWEEN CS.Start_Pos AND CS.End_Pos);
   END;

/*  ***********************************************************
    Clear Procedures
    *********************************************************** */
    Procedure Delete_Solutions(p_Solution_Id NUMBER)
    AS
    BEGIN
       DELETE FROM GS_SOLUTION         WHERE Solution_Id = p_Solution_Id;
       DELETE FROM GS_LINE_COMBINATION WHERE Solution_Id = p_Solution_Id;
       DELETE FROM GS_PROGRESS;
    END;

/*  ***********************************************************
    Clone Procedures
    *********************************************************** */
    Procedure  Clone_Solution(p_Solution GS_SOLUTION%RowType, p_Next_Solution_Id NUMBER)
    AS
    BEGIN
       INSERT INTO GS_SOLUTION (Row_No, Col_No, Solution_Id, Is_Filled) 
       SELECT Row_No, Col_No, p_Next_Solution_Id, Is_Filled 
       FROM   GS_SOLUTION
       WHERE  Solution_Id = p_Solution.Solution_Id;

       INSERT INTO GS_LINE_COMBINATION (Row_Or_Col, Line_No, Solution_Id, Combination_Id)
       SELECT Row_Or_Col, Line_No, p_Next_Solution_Id, Combination_Id
       FROM   GS_LINE_COMBINATION
       WHERE  Solution_Id = p_Solution.Solution_Id;

       Mark_As_Filled(p_Solution.Solution_Id, p_Solution.Row_No, p_Solution.Col_No);
       Mark_As_Blank(p_Next_Solution_Id,      p_Solution.Row_No, p_Solution.Col_No);
    END;


/*  ***********************************************************
    Check Procedures
    *********************************************************** */
  Procedure Check_All_Solutions
  AS
     Row_Status NUMBER;
     Col_Status NUMBER;
  BEGIN
     FOR CHK_REC IN (SELECT * FROM GS_SOLUTION WHERE Is_Filled = 'U')
     LOOP
        Row_Status := Get_Status(CHK_REC.Solution_Id, 'R', CHK_REC.Row_No, CHK_REC.Col_No);
        Col_Status := Get_Status(CHK_REC.Solution_Id, 'C', CHK_REC.Col_No, CHK_REC.Row_No);
        
        IF  (Row_Status = PKG_BLANK  AND Col_Status = PKG_FILLED)
         OR (Row_Status = PKG_FILLED AND Col_Status = PKG_BLANK )
        THEN
            Delete_Solutions(CHK_REC.Solution_Id);
            EXIT;
        ELSIF (Row_Status = PKG_FILLED  OR Col_Status = PKG_FILLED)
        THEN
           Mark_As_Filled(CHK_REC.Solution_Id, CHK_REC.Row_No, CHK_REC.Col_No);
        ELSIF (Row_Status = PKG_BLANK OR Col_Status = PKG_BLANK)
        THEN
           Mark_As_Blank(CHK_REC.Solution_Id, CHK_REC.Row_No, CHK_REC.Col_No);
        END IF;
     END LOOP;
  END;

  Procedure Update_Progress
  AS
     Row_Status NUMBER;
     Col_Status NUMBER;
  BEGIN
     DELETE FROM GS_PROGRESS                 WHERE Stage = 'B';
     UPDATE      GS_PROGRESS SET Stage = 'B' WHERE Stage = 'A';

     INSERT INTO GS_PROGRESS (Solution_Id, Stage, No_Of_Unknowns)
     SELECT   Solution_Id, 'A', Count(*)
     FROM     GS_SOLUTION
     WHERE    Is_Filled = 'U'
     GROUP BY Solution_Id;
  END;

  Procedure Check_Progress
  AS
     Loc_Solution_Record  GS_SOLUTION%RowType;
     Loc_Next_Solution_Id NUMBER;
  BEGIN
     FOR CLN_REC IN (SELECT A.Solution_Id
                     FROM   GS_PROGRESS A
                       JOIN GS_PROGRESS B ON B.Solution_Id    = A.Solution_ID
                                         AND B.No_Of_Unknowns = A.No_Of_Unknowns
                                         AND B.Stage = 'B'
                     WHERE A.Stage = 'A')
     LOOP
        Loc_Solution_Record  := Get_Best_Solution(CLN_REC.Solution_Id);
        Loc_Next_Solution_Id := Get_Next_Solution_Id;
        Clone_Solution(Loc_Solution_Record, Loc_Next_Solution_Id);
     END LOOP;
  END;

/*  ***********************************************************
    Main Procedures
    *********************************************************** */
  Procedure Solve_Puzzle(p_Puzzle_Id  NUMBER)
  AS
  BEGIN
    GS_Setup.Setup_Puzzle(P_Puzzle_Id);
    If P_Puzzle_Id = 1
    THEN
       Mark_As_Filled(1,  9, 19);
       Mark_As_Filled(1, 17, 12);
    END IF;

    While Not Finished
    Loop
        Check_All_Solutions;
        Update_Progress;
        COMMIT;
        Check_Progress;
    End Loop;
  END Solve_Puzzle;

END GS_SOLVER;
/

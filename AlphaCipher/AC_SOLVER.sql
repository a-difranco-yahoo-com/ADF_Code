CREATE OR REPLACE PACKAGE AC_SOLVER AS 
  Procedure Solve_Puzzle(p_Puzzle_Id NUMBER, p_Steps NUMBER);
  Function Score_Clue(SRC_Letters VARCHAR2, TGT_Letters VARCHAR2)
        RETURN NUMBER;
END AC_SOLVER;
/


CREATE OR REPLACE PACKAGE BODY AC_SOLVER AS

  Function Finished
        RETURN BOOLEAN
  AS
     Loc_Count  Number;
  BEGIN
     SELECT Count(*)
     INTO   Loc_Count
     FROM   AC_CLUE
     WHERE  Processed = 'N';

     Return (Loc_Count = 0); 
  END;

  Function Find_Max_Solution_Id
        RETURN NUMBER
  AS
     Loc_Limit   Number;
  BEGIN
     SELECT max(Solution_Id)
     INTO   Loc_Limit
     FROM   AC_SOLUTION;
     
     RETURN Loc_Limit;
  END;

  Function Score_Clue(SRC_Letters VARCHAR2, TGT_Letters VARCHAR2)
        RETURN NUMBER
  AS
     Loc_TGT_Letters  Varchar2(30) := TGT_Letters;
     Loc_Score        Number := 0;
  BEGIN
     FOR i in 1..length(SRC_Letters)
     LOOP
        Loc_TGT_Letters := replace(Loc_TGT_Letters, substr(SRC_Letters, i, 1), '');       
     END LOOP;
     
     IF    length(Loc_TGT_Letters) = 0 THEN Return 100;
     ELSIF length(Loc_TGT_Letters) = 1 THEN Return 10;
     ELSIF length(Loc_TGT_Letters) = 2 THEN Return 1;
     ELSE                                   Return 0; 
     END IF;
  END;

  Procedure Set_Letters_Used
  AS
     Loc_Alphabet   Varchar2(26) := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  BEGIN
    FOR i in 1..26
    LOOP
       UPDATE AC_CLUE
       Set    REMAINING_LETTERS = REMAINING_LETTERS || substr(Loc_Alphabet, i, 1)
       Where  Clue_Word  Like '%' || substr(Loc_Alphabet, i, 1) || '%';
    END LOOP;
  END;

  Function Find_Best_First_Clue
        RETURN AC_CLUE%RowType
  AS
     Loc_Alphabet   Varchar2(26) := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
     Loc_Score      NUMBER;
     Best_Score     NUMBER := 0;
     Best_Clue      AC_CLUE%RowType;
  BEGIN
    FOR CLUE_REC in (SELECT * FROM AC_CLUE WHERE length(Remaining_Letters) = 4)
    LOOP
       SELECT Sum( AC_SOLVER.Score_Clue(CLUE_REC.Remaining_Letters, Remaining_Letters) )
       INTO   Loc_Score
       FROM   AC_CLUE
       Where  Clue_Id != CLUE_REC.Clue_Id;
       
       IF Loc_Score > Best_Score
       THEN
          Best_Score := Loc_Score;
          Best_Clue  := CLUE_REC;
       END IF;
    END LOOP;
    
    RETURN Best_Clue;
  END;

  Function Find_Best_Letter
        RETURN VARCHAR2
  AS
     Loc_Min_Len    NUMBER;
     Loc_Score      NUMBER;
     Best_Score     NUMBER := 0;
     Loc_Letter     VARCHAR2(1);
     Best_Letter    VARCHAR2(1);
  BEGIN
     SELECT min(length(Remaining_Letters)) 
     INTO   Loc_Min_Len
     FROM   AC_CLUE
     WHERE  Processed = 'N';
    
    FOR CLUE_REC in (SELECT * FROM AC_CLUE WHERE length(Remaining_Letters) = Loc_Min_Len)
    LOOP
       FOR i in 1..Loc_Min_Len
       LOOP
          Loc_Letter := substr(CLUE_REC.Remaining_Letters, i ,1);

          SELECT Sum( AC_SOLVER.Score_Clue(Loc_Letter, Remaining_Letters) )
          INTO   Loc_Score
          FROM   AC_CLUE
          Where  Processed = 'N';
       
          IF Loc_Score > Best_Score
          THEN
             Best_Score  := Loc_Score;
             Best_Letter := Loc_Letter;
          END IF;
       END LOOP;
    END LOOP;
    
    RETURN Best_Letter;
  END;

  Function Find_Single_Letter_Clue
        RETURN AC_CLUE%RowType
  AS
     Best_Clue      AC_CLUE%RowType;
  BEGIN
    FOR CLUE_REC in (SELECT * FROM AC_CLUE WHERE length(Remaining_Letters) = 1)
    LOOP
       Return CLUE_REC;
    END LOOP;
    
    RETURN Best_Clue;
  END;

  Procedure  Mark_Clue_As_Processed(p_Clue_Id NUMBER)
  AS
  BEGIN
     UPDATE AC_CLUE
     SET    Remaining_Letters = '',
            Processed         = 'Y'
     WHERE  Clue_Id           = p_Clue_Id;
  END;

  Procedure Solve_First_Clue(p_Clue AC_CLUE%Rowtype)
  AS
     Loc_Freq1   NUMBER;
     Loc_Freq2   NUMBER;
     Loc_Freq3   NUMBER;
     Loc_Freq4   NUMBER;
  BEGIN
     Loc_Freq1 := length(p_Clue.Clue_Word) - length( replace(p_Clue.Clue_Word, substr(p_Clue.Remaining_Letters, 1, 1) ) );
     Loc_Freq2 := length(p_Clue.Clue_Word) - length( replace(p_Clue.Clue_Word, substr(p_Clue.Remaining_Letters, 2, 1) ) );
     Loc_Freq3 := length(p_Clue.Clue_Word) - length( replace(p_Clue.Clue_Word, substr(p_Clue.Remaining_Letters, 3, 1) ) );
     Loc_Freq4 := length(p_Clue.Clue_Word) - length( replace(p_Clue.Clue_Word, substr(p_Clue.Remaining_Letters, 4, 1) ) );

     INSERT INTO TEMP_SOLUTION (Solution_Id, Amount1, Amount2, Amount3, Amount4)
     WITH DIGITS AS (SELECT Rownum Nos FROM ALL_OBJECTS WHERE Rownum <= 26)
     SELECT RowNum, L1.Nos, L2.Nos, L3.Nos, L4.Nos
     FROM   DIGITS L1
       JOIN DIGITS L2 ON L2.Nos Not In (L1.Nos)
       JOIN DIGITS L3 ON L3.Nos Not In (L1.Nos, L2.Nos)
       JOIN DIGITS L4 ON L4.Nos Not In (L1.Nos, L2.Nos, L3.Nos)
     WHERE  (L1.Nos * Loc_Freq1) + (L2.Nos * Loc_Freq2) +
            (L3.Nos * Loc_Freq3) + (L4.Nos * Loc_Freq4) = p_Clue.Clue_Total;

     INSERT INTO AC_SOLUTION (Solution_Id, Letter, Amount)
     SELECT Solution_Id, substr(p_Clue.Remaining_Letters, 1, 1), Amount1 FROM TEMP_SOLUTION UNION
     SELECT Solution_Id, substr(p_Clue.Remaining_Letters, 2, 1), Amount2 FROM TEMP_SOLUTION UNION
     SELECT Solution_Id, substr(p_Clue.Remaining_Letters, 3, 1), Amount3 FROM TEMP_SOLUTION UNION
     SELECT Solution_Id, substr(p_Clue.Remaining_Letters, 4, 1), Amount4 FROM TEMP_SOLUTION;
  END;

  Procedure Add_Single_Letter_Solution(p_Clue AC_CLUE%Rowtype)
  AS
     Loc_Freq   NUMBER;
  BEGIN
     Loc_Freq := length(p_Clue.Clue_Word) - length( replace(p_Clue.Clue_Word, p_Clue.Remaining_Letters) );

     INSERT INTO AC_SOLUTION (Solution_Id, Letter, Amount)
     SELECT Solution_Id, p_Clue.Remaining_Letters, Remaining_Total / Loc_Freq
     FROM   AC_SOLUTION_CLUE
     WHERE  Clue_Id = p_Clue.Clue_Id;

     DELETE FROM AC_SOLUTION_CLUE
     WHERE  Clue_Id = p_Clue.Clue_Id;
  END;

  Procedure Add_Solution(p_Letter  VARCHAR2, p_Limit NUMBER)
  AS
  BEGIN
     INSERT INTO AC_SOLUTION (Solution_Id, Previous_Solution_Id, Letter, Amount)
     WITH DIGITS AS   (SELECT Rownum Nos FROM ALL_OBJECTS WHERE RowNum <= 26),
          SOLUTION AS (SELECT Distinct Solution_ID FROM AC_SOLUTION)
     SELECT p_Limit + Rownum, Solution_Id, p_Letter, Nos
     FROM   SOLUTION
     CROSS JOIN DIGITS;
  END;


  Procedure Check_Single_Letter_Solution(p_Letter Varchar2)
  AS
  BEGIN
      For SOL_REC in (SELECT Solution_Id
                      FROM   AC_SOLUTION S1
                      WHERE  Letter = p_Letter
                      AND   (NOT Amount Between 1 AND 26
                         OR      Amount != ceil(Amount)
                         OR EXISTS (SELECT 1
                                    FROM   AC_SOLUTION S2
                                    WHERE  S2.Solution_Id = S1.Solution_Id
                                    AND    S2.Amount      = S1.Amount
                                    AND    S2.Letter     != S1.Letter)) )
      Loop
         DELETE FROM AC_SOLUTION      WHERE Solution_Id = SOL_REC.Solution_Id;
         DELETE FROM AC_SOLUTION_CLUE WHERE Solution_Id = SOL_REC.Solution_Id;
      End Loop;
  END;

  Procedure Check_Solution(p_Letter Varchar2)
  AS
  BEGIN
      DELETE FROM AC_SOLUTION S1
      WHERE  Letter = p_Letter
      AND EXISTS (SELECT 1
                  FROM   AC_SOLUTION S2
                  WHERE  S2.Solution_Id = S1.Previous_Solution_Id
                  AND    S2.Amount      = S1.Amount);
  END;

  Procedure Copy_Solution_Clue(p_Limit Number)
  AS
  BEGIN
     INSERT INTO AC_SOLUTION_CLUE (Clue_Id, Solution_Id, Remaining_Total)
     SELECT C.Clue_Id, S.Solution_ID, C.Remaining_Total
     FROM   AC_SOLUTION S
       JOIN AC_SOLUTION_CLUE C ON C.Solution_Id = S.Previous_Solution_Id;
    
     INSERT INTO AC_SOLUTION (Solution_Id, Letter, Amount)
     SELECT S1.Solution_ID, S2.Letter, S2.Amount
     FROM   AC_SOLUTION S1
       JOIN AC_SOLUTION S2 ON S2.Solution_Id = S1.Previous_Solution_Id;
    
     DELETE FROM AC_SOLUTION_CLUE WHERE Solution_Id <= p_Limit;
     DELETE FROM AC_SOLUTION      WHERE Solution_Id <= p_Limit;
  END;


  Procedure Setup_First_Solution_Clue
  AS
  BEGIN
     INSERT INTO AC_SOLUTION_CLUE (Clue_Id, Solution_Id, Remaining_Total)
     SELECT Distinct C.Clue_Id, S.Solution_Id, C.Clue_Total
     FROM   AC_SOLUTION S
       JOIN AC_CLUE     C ON C.Processed = 'N';
  END;
  
  Procedure Eliminate_Letter(p_Letter  Varchar2)
  AS
     Loc_Freq  NUMBER;
  BEGIN
     For CLUE_REC in (SELECT * FROM AC_CLUE
                      WHERE  Processed = 'N' AND CLUE_WORD Like '%' || p_Letter || '%')
     Loop
        Loc_Freq := length(CLUE_REC.Clue_Word) - length( replace(CLUE_REC.Clue_Word, p_Letter, '') );
        UPDATE AC_SOLUTION_CLUE SC
        SET    SC.Remaining_Total = (SELECT SC.Remaining_Total - (Loc_Freq * S.AMOUNT)
                                     FROM   AC_SOLUTION S
                                     WHERE  S.Solution_Id = SC.Solution_Id
                                     AND    S.Letter      = p_Letter)
        WHERE  SC.Clue_Id = CLUE_REC.Clue_Id;
     End Loop;

     UPDATE AC_CLUE
     SET    Remaining_Letters = replace(Remaining_Letters, p_Letter, '');
  END;
  
  Procedure Eliminate_First_Letters(p_Letters  Varchar2)
  AS
  BEGIN
     For i in 1..4
     Loop
        Eliminate_Letter( substr(p_Letters, i, 1) );
     End Loop;
  END;

  Procedure Process_Null_Clues
  AS
  BEGIN
     For CLUE_REC in (SELECT * FROM AC_CLUE
                      WHERE  Processed = 'N'
                      AND    REMAINING_LETTERS IS NULL)
     Loop
         For SOL_REC in (SELECT  Solution_Id
                          FROM   AC_SOLUTION_CLUE
                          WHERE  Clue_Id =  CLUE_REC.Clue_Id
                          AND    Remaining_Total != 0)
         Loop
            DELETE FROM AC_SOLUTION      WHERE Solution_Id = SOL_REC.Solution_Id;
            DELETE FROM AC_SOLUTION_CLUE WHERE Solution_Id = SOL_REC.Solution_Id;
         End Loop;

         DELETE FROM AC_SOLUTION_CLUE       WHERE Clue_Id = CLUE_REC.Clue_Id;
         UPDATE AC_CLUE SET Processed = 'Y' WHERE Clue_Id = CLUE_REC.Clue_Id;
     End Loop;
  END;

  Procedure Process_First_Clue(p_Clue AC_CLUE%Rowtype)
  AS
  BEGIN
     Mark_Clue_As_Processed(p_Clue.Clue_Id);
     Solve_First_Clue(p_Clue);
     Setup_First_Solution_Clue;
     Eliminate_First_Letters(p_Clue.Remaining_Letters);
     Process_Null_Clues;
  END;

  Procedure Process_Single_Letter_Clue(p_Clue AC_CLUE%Rowtype)
  AS
  BEGIN
     Mark_Clue_As_Processed(p_Clue.Clue_Id);
     Add_Single_Letter_Solution(p_Clue);
     Check_Single_Letter_Solution(p_Clue.Remaining_Letters);
     Eliminate_Letter(p_Clue.Remaining_Letters);
     Process_Null_Clues;
END;

  Procedure Check_Solution_Clue
  AS
  BEGIN
     For CLUE_REC in (SELECT Clue_Id,
                             length(Remaining_Letters) * (length(Remaining_Letters) + 1) / 2 Min_Total
                      FROM   AC_CLUE
                      WHERE  Processed = 'N')
     Loop
         For SOL_REC in (SELECT Solution_Id
                         FROM   AC_SOLUTION_CLUE
                         WHERE  Clue_Id         = CLUE_REC.Clue_Id
                         AND    Remaining_Total < CLUE_REC.Min_Total)
         Loop
            DELETE FROM AC_SOLUTION      WHERE Solution_Id = SOL_REC.Solution_Id;
            DELETE FROM AC_SOLUTION_CLUE WHERE Solution_Id = SOL_REC.Solution_Id;
         End Loop;
     End Loop;
  END;

  Procedure Solve_Puzzle(p_Puzzle_Id NUMBER)
  AS
    Loc_Clue    AC_CLUE%Rowtype;
    Loc_Letter  VARCHAR2(1);
    Loc_Limit   NUMBER;
  BEGIN
     AC_SETUP.Setup_Puzzle(p_Puzzle_Id);
     Set_Letters_Used;
     Loc_Clue := Find_Best_First_Clue;
     Process_First_Clue(Loc_Clue);
     Check_Solution_Clue;
     COMMIT;

     While Not Finished
     Loop
       Loc_Clue := Find_Single_Letter_Clue;
       IF Loc_Clue.Clue_Id IS NOT NULL
       THEN
          Process_Single_Letter_Clue(Loc_Clue);
       ELSE
          Loc_Letter := Find_Best_Letter;
          Loc_Limit  := Find_Max_Solution_Id;
          Add_Solution(Loc_Letter, Loc_Limit);
          Check_Solution(Loc_Letter);
          Copy_Solution_Clue(Loc_Limit);
          Eliminate_Letter(Loc_Letter);
       END IF;
       Check_Solution_Clue;
       COMMIT;
     End Loop;   
  END Solve_Puzzle;

END AC_SOLVER;
/

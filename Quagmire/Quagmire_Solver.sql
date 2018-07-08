
CREATE OR REPLACE PACKAGE QUAGMIRE_SOLVER
AS 
  Procedure Prepare_Cipher(p_Cipher_Id VARCHAR2);
  Procedure Solve_Cipher;
  Procedure Ignore_Word(p_Word_Id NUMBER);
END QUAGMIRE_SOLVER;
/

CREATE OR REPLACE PACKAGE BODY QUAGMIRE_SOLVER
AS
--

/*   =========================================================
     Functions
     ========================================================= */
     Function Get_Max_Solution_Id
        RETURN NUMBER
     IS
        Loc_Max_Solution_Id  NUMBER;
     BEGIN
        SELECT max(Solution_Id)
        INTO   Loc_Max_Solution_Id
        FROM   QUAGMIRE_SOLUTION;
        
        RETURN Loc_Max_Solution_Id;
     END;

     Function Find_Best_First_Word
        RETURN NUMBER
     IS
        Loc_Word_Id  NUMBER;
     BEGIN
        SELECT Word_Id
        INTO   Loc_Word_Id
        FROM  (SELECT Word_Id
               FROM   QUAGMIRE_DICTIONARY_WORD
               WHERE  Valid = 'Y'
               GROUP BY Word_Id
               ORDER BY Count(*))
        WHERE  Rownum = 1;
        
        RETURN Loc_Word_Id;
     END;


     Function Unsolved_Known_Word
        RETURN NUMBER
     IS
        Loc_Word_Id  NUMBER;
     BEGIN
        SELECT Word_Id
        INTO   Loc_Word_Id
        FROM  (SELECT Word_Id
               FROM   QUAGMIRE_DICTIONARY_WORD
               WHERE  Word_Id NOT IN (SELECT Word_Id FROM QUAGMIRE_DIAGNOSTIC_RUN)
               AND    Valid = 'Y'
               GROUP BY Word_Id
               HAVING   Count(*) = 1)
        WHERE  Rownum = 1;
        
        RETURN Loc_Word_Id;
     EXCEPTION
        WHEN OTHERS THEN
           RETURN 0;
     END;
     
     Function Find_Most_Matched_Word
        RETURN NUMBER
     IS
        Loc_Word_Id  NUMBER;
     BEGIN
        SELECT Word_Id1
        INTO   Loc_Word_Id
        FROM  (SELECT Word_Id1
               FROM   V_QUAGMIRE_COMMON_OFFSET
               WHERE  Word_Id1 NOT IN (SELECT Word_Id FROM QUAGMIRE_DIAGNOSTIC_RUN)
               AND    Word_Id2     IN (SELECT Word_Id FROM QUAGMIRE_DIAGNOSTIC_RUN WHERE Solved = 'Y')
               ORDER By MATCHED_LETTERS Desc, MISMATCHED_LETTERS Desc)
        WHERE  Rownum = 1;
        
        RETURN Loc_Word_Id;
     END;

     Function Find_Best_Next_Word
        RETURN NUMBER
     IS
        Loc_Word_Id  NUMBER;
     BEGIN
        Loc_Word_Id := Unsolved_Known_Word;
        IF Loc_Word_Id = 0
        THEN
           Loc_Word_Id := Find_Most_Matched_Word;
        END IF;
        
        RETURN Loc_Word_Id;
     END;

     Function All_Solved
        RETURN BOOLEAN
     IS
        Loc_Count_Id  NUMBER;
     BEGIN
        SELECT Count(*)
        INTO   Loc_Count_Id
        FROM  (SELECT Word_Id FROM   QUAGMIRE_DICTIONARY_WORD
               MINUS
               SELECT Word_Id FROM   QUAGMIRE_DIAGNOSTIC_RUN);
        
        RETURN (Loc_Count_Id = 0);
     END;

/*   =========================================================
     QUAGMIRE_DIAGNOSTIC_RUN Procedures
     ========================================================= */
   Function Get_Next_Ordinal
      RETURN NUMBER
   AS
      Loc_Next_Ordinal  NUMBER;
   BEGIN
      SELECT count(*) + 1
      INTO   Loc_Next_Ordinal
      FROM   QUAGMIRE_DIAGNOSTIC_RUN;
      
      RETURN Loc_Next_Ordinal;
   END;

   Procedure Mark_As_Solved(p_Word_Id  NUMBER)
   AS
      Loc_Ordinal  NUMBER;
   BEGIN
      Loc_Ordinal  := Get_Next_Ordinal;
      INSERT INTO QUAGMIRE_DIAGNOSTIC_RUN (Word_Id, Ordinal, Solved) Values (p_Word_Id, Loc_Ordinal, 'Y');
   END;

   Procedure Mark_As_Unsolved(p_Word_Id  NUMBER)
   AS
      Loc_Ordinal  NUMBER;
   BEGIN
      Loc_Ordinal  := Get_Next_Ordinal;
      INSERT INTO QUAGMIRE_DIAGNOSTIC_RUN (Word_Id, Ordinal, Solved) Values (p_Word_Id, Loc_Ordinal, 'N');
   END;

   Procedure Find_Known_Words
   AS
   BEGIN
       UPDATE QUAGMIRE_DIAGNOSTIC_RUN DR
       SET    Suggested_Word = (SELECT D.Word
                                FROM   QUAGMIRE_DICTIONARY_WORD DW
                                  JOIN QUAGMIRE_DICTIONARY       D ON D.Dictionary_Id = DW.Dictionary_Id
                                WHERE  DW.Word_Id = DR.Word_Id
                                AND    DW.Valid   = 'Y')
       WHERE  Solved = 'Y'
       AND    Suggested_Word IS NULL
       AND    1 = (SELECT Count(*)
                   FROM   QUAGMIRE_DICTIONARY_WORD DW
                   WHERE  DW.Word_Id = DR.Word_Id
                   AND    DW.Valid   = 'Y');
   END;

/*   =========================================================
     QUAGMIRE_DIAGNOSTIC_MISMATCH Procedures
     ========================================================= */
   Procedure Analyse_Diagraph(p_No_Of_Solved_Word NUMBER)
   AS
      Loc_Max_Matches  NUMBER;
   BEGIN

      SELECT Matches
      INTO   Loc_Max_Matches
      FROM  (SELECT   Count(Distinct Word_Id2) Matches
             FROM     QUAGMIRE_DIAGRAPH
             GROUP BY Dictionary_Id1
             ORDER BY Count(Distinct Word_Id2) Desc)
      WHERE  Rownum = 1;

      FOR DIAG_REC IN (SELECT   DG.Word_Id1, DG.Dictionary_Id1, DT.Word
                       FROM     QUAGMIRE_DIAGRAPH   DG
                         JOIN   QUAGMIRE_DICTIONARY DT ON DT.Dictionary_Id = DG.Dictionary_Id1
                       GROUP BY DG.Word_Id1, DG.Dictionary_Id1, DT.Word
                       HAVING   Count(Distinct Word_Id2) = Loc_Max_Matches)
      LOOP
         INSERT INTO QUAGMIRE_DIAGNOSTIC_MISMATCH (Attempted_Word_Id, Attempted_Word, Mismatch_Word_Id)
         SELECT DIAG_REC.Word_Id1, DIAG_REC.Word, Word_Id
         FROM QUAGMIRE_DIAGNOSTIC_RUN
         WHERE Solved = 'Y'
         MINUS
         SELECT DIAG_REC.Word_Id1, DIAG_REC.Word, Word_Id2
         FROM QUAGMIRE_DIAGRAPH 
         WHERE Dictionary_Id1 = DIAG_REC.Dictionary_Id1;
      END LOOP;
   END;

/*   =========================================================
     SOLUTION Procedures
     ========================================================= */
   Procedure Create_Solution(p_Word_Id  NUMBER)
   AS
   BEGIN
      INSERT INTO QUAGMIRE_SOLUTION (Solution_Id, Word_Id, Dictionary_Id)
      SELECT Rownum, Word_Id, Dictionary_Id
      FROM   QUAGMIRE_DICTIONARY_WORD
      WHERE  Word_Id = p_Word_Id
      AND    Valid   = 'Y';
   END;

   Procedure Add_New_Solution(p_Prev_Word_Id NUMBER, p_Max_Solution_Id NUMBER)
   AS
   BEGIN
      INSERT INTO QUAGMIRE_SOLUTION (Solution_Id, Prev_Solution_Id, Word_Id, Dictionary_Id)
      SELECT p_Max_Solution_Id + Rownum, S.Solution_Id, D.Word_Id1, D.Dictionary_Id1
      FROM  (SELECT Distinct Word_Id1, Dictionary_Id1 FROM  QUAGMIRE_DIAGRAPH) D 
        JOIN QUAGMIRE_SOLUTION S ON S.Word_Id = p_Prev_Word_Id;
   END;

   Procedure Clear_New_Solution(p_Max_Solution_Id NUMBER)
   AS
   BEGIN
      FOR WRD_REC IN (SELECT Word_Id FROM QUAGMIRE_DIAGNOSTIC_RUN WHERE Solved = 'Y')
      LOOP
         DELETE FROM QUAGMIRE_SOLUTION S
         WHERE  Solution_Id > p_Max_Solution_Id
         AND    Dictionary_Id NOT IN (SELECT D.Dictionary_Id1
                                      FROM   QUAGMIRE_DIAGRAPH  D
                                        JOIN QUAGMIRE_SOLUTION PS ON PS.Solution_Id   = S.Prev_Solution_Id
                                                                 AND PS.Word_Id       = D.Word_Id2
                                                                 AND PS.Dictionary_Id = D.Dictionary_Id2
                                      WHERE  D.Word_Id1 = S.Word_Id
                                      AND    D.Word_Id2 = WRD_REC.Word_Id);
      END LOOP;
   END;

   Procedure Complete_New_Solution(p_Max_Solution_Id NUMBER)
   AS
   BEGIN
      INSERT INTO QUAGMIRE_SOLUTION (Solution_Id, Word_Id, Dictionary_Id)
      SELECT NS.Solution_Id, PS.Word_Id, PS.Dictionary_Id
      FROM   QUAGMIRE_SOLUTION NS
        JOIN QUAGMIRE_SOLUTION PS ON PS.Solution_Id = NS.Prev_Solution_Id
      WHERE  NS.Solution_Id > p_Max_Solution_Id;

      DELETE FROM QUAGMIRE_SOLUTION
      WHERE  Solution_Id <= p_Max_Solution_Id;
   END;

   Function Exists_New_Solution(p_Max_Solution_Id NUMBER)
     RETURN BOOLEAN
   AS
      Loc_Count  NUMBER;
   BEGIN
      SELECT Count(*)
      INTO   Loc_Count
      FROM   QUAGMIRE_SOLUTION
      WHERE  Solution_Id > p_Max_Solution_Id;

      RETURN (Loc_Count > 0);
   END;

/*   =========================================================
     DICTIONARY Procedures
     ========================================================= */
   Procedure Check_Solution
   AS
   BEGIN
      FOR DONE_REC IN (SELECT Word_Id FROM QUAGMIRE_DIAGNOSTIC_RUN WHERE Solved = 'Y')
      LOOP
         UPDATE QUAGMIRE_DICTIONARY_WORD
         SET    Valid   = 'N'
         WHERE  Word_Id = DONE_REC.Word_Id
         AND    Valid   = 'Y'
         AND    Dictionary_Id NOT IN (SELECT Dictionary_Id
                                      FROM   QUAGMIRE_SOLUTION
                                      WHERE  Word_Id = DONE_REC.Word_Id);
      END LOOP;
   END;

/*   =========================================================
     DIAGRAPH Procedures
     ========================================================= */
   Procedure Setup_Diagraph(p_Word_Id1 NUMBER, p_Word_Id2 NUMBER)
   AS
      Loc_SQL_Text   Varchar2(2000) := '';
      Loc_AND_Text   Varchar2(200)  := 'AND    substr(D1.Word, <POS1>, 1) <EQUAL> substr(D2.Word, <POS2>, 1) ';
      Loc_New_Text   Varchar2(200);
   BEGIN
      Loc_SQL_Text := Loc_SQL_Text || 'INSERT INTO QUAGMIRE_DIAGRAPH (Word_Id1, Word_Id2, Dictionary_Id1, Dictionary_Id2) ';
      Loc_SQL_Text := Loc_SQL_Text || 'SELECT DW1.Word_Id, DW2.Word_Id, DW1.Dictionary_Id, DW2.Dictionary_Id ';
      Loc_SQL_Text := Loc_SQL_Text || 'FROM   QUAGMIRE_DICTIONARY_WORD DW1 ';
      Loc_SQL_Text := Loc_SQL_Text || '  JOIN QUAGMIRE_DICTIONARY      D1  ON  D1.Dictionary_Id = DW1.Dictionary_Id ';
      Loc_SQL_Text := Loc_SQL_Text || '  JOIN QUAGMIRE_DICTIONARY_WORD DW2 ON DW2.Word_Id       = ' || p_Word_Id2 || ' ';
      Loc_SQL_Text := Loc_SQL_Text || '                                   AND DW2.Valid         = ''Y'' ';
      Loc_SQL_Text := Loc_SQL_Text || '  JOIN QUAGMIRE_DICTIONARY      D2  ON  D2.Dictionary_Id = DW2.Dictionary_Id ';
      Loc_SQL_Text := Loc_SQL_Text || 'WHERE  DW1.Word_Id = ' || p_Word_Id1 || ' ';
      Loc_SQL_Text := Loc_SQL_Text || 'AND    DW1.Valid   = ''Y'' ';

      FOR TXT_REC IN (SELECT  L1.Letter_Position Letter_Position1, L2.Letter_Position Letter_Position2,
                              CASE WHEN L1.Letter  = L2.Letter
                                   THEN '=' ELSE '!=' END Equal_Sign
                       FROM   QUAGMIRE_LETTER L1
                         JOIN QUAGMIRE_LETTER L2 ON L2.Word_Id = p_Word_Id2
                                                AND L2.Offset  = L1.Offset
                       WHERE  L1.Word_Id = p_Word_Id1)
      LOOP
         Loc_New_Text := replace(Loc_AND_Text, '<EQUAL>', TXT_REC.Equal_Sign);
         Loc_New_Text := replace(Loc_New_Text, '<POS1>',  TXT_REC.Letter_Position1);
         Loc_New_Text := replace(Loc_New_Text, '<POS2>',  TXT_REC.Letter_Position2);
         Loc_SQL_Text := Loc_SQL_Text || Loc_New_Text;         
      END LOOP;
      execute immediate Loc_SQL_Text;
      COMMIT;
   END;

   Procedure Create_Diagraph(p_Word_Id NUMBER)
   AS
   BEGIN      
      EXECUTE IMMEDIATE 'TRUNCATE TABLE QUAGMIRE_DIAGRAPH';
      FOR WRD_REC IN (SELECT Word_Id FROM QUAGMIRE_DIAGNOSTIC_RUN WHERE Solved = 'Y')
      LOOP
         Setup_Diagraph(p_Word_Id, WRD_REC.Word_Id);
      END LOOP;
   END;

   Function Diagraph_Valid(p_No_Of_Solved_Word  NUMBER)
     RETURN BOOLEAN
   AS
      Loc_Count  NUMBER;
   BEGIN
      SELECT Count(*)
      INTO   Loc_Count
      FROM  (SELECT   Dictionary_Id1
             FROM     QUAGMIRE_DIAGRAPH
             GROUP BY Dictionary_Id1
             HAVING   Count(Distinct Word_Id2) = p_No_Of_Solved_Word);

      RETURN (Loc_Count > 0);
   END;

   Procedure Trim_Diagraph(p_No_Of_Solved_Word NUMBER)
   AS
   BEGIN      
      DELETE FROM QUAGMIRE_DIAGRAPH
      WHERE  Dictionary_Id1 IN
            (SELECT   Dictionary_Id1
             FROM     QUAGMIRE_DIAGRAPH
             GROUP BY Dictionary_Id1
             HAVING   Count(Distinct Word_Id2) < p_No_Of_Solved_Word);
   END;
         


/*   =========================================================
     Public Procedures
     ========================================================= */
   Procedure Solve_Cipher
   AS
      Loc_Max_Solution_Id   NUMBER;
      Loc_No_Of_Solved_Word NUMBER;
      Loc_Word_Id           NUMBER;
      Loc_First_Word_Id     NUMBER;
   BEGIN
      Loc_Word_Id       := Find_Best_First_Word;
      Loc_First_Word_Id := Loc_Word_Id;
      Create_Solution(Loc_Word_Id);
      Mark_As_Solved(Loc_Word_Id);
      Loc_No_Of_Solved_Word := 1;
      WHILE Not All_Solved
      LOOP
         Loc_Word_Id := Find_Best_Next_Word;
         Create_Diagraph(Loc_Word_Id);
         IF Diagraph_Valid(Loc_No_Of_Solved_Word)
         THEN
            Trim_Diagraph(Loc_No_Of_Solved_Word);
            Loc_Max_Solution_Id := Get_Max_Solution_Id;
            Add_New_Solution(Loc_First_Word_Id, Loc_Max_Solution_Id);
            Clear_New_Solution(Loc_Max_Solution_Id);
            IF Exists_New_Solution(Loc_Max_Solution_Id)
            THEN
               Mark_As_Solved(Loc_Word_Id);
               Loc_No_Of_Solved_Word := Loc_No_Of_Solved_Word + 1;
               Complete_New_Solution(Loc_Max_Solution_Id);
               Check_Solution;
               Find_Known_Words;
            ELSE
               Mark_As_Unsolved(Loc_Word_Id);
            END IF;
         ELSE
            Analyse_Diagraph(Loc_No_Of_Solved_Word);
            Mark_As_Unsolved(Loc_Word_Id);
         END IF;
         COMMIT;
      END LOOP;
   END;
      
   Procedure Prepare_Cipher(p_Cipher_Id VARCHAR2)
   AS
   BEGIN
      QUAGMIRE_SETUP.Setup_Cipher(p_Cipher_Id);
   END;
      
   Procedure Ignore_Word(p_Word_Id NUMBER)
   AS
   BEGIN
      Mark_As_Unsolved(p_Word_Id);
   END;

END QUAGMIRE_SOLVER;
/

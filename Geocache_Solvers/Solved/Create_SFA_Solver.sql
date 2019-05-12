

Create Or Replace Package SFA_Solver
AS
   Procedure Use_All_Words;
   Procedure Split_Word(p_Word_Id NUMBER, p_Limit NUMBER);
   Procedure Delete_All_Solutions;
END;
/

Create Or Replace Package Body SFA_Solver
AS
   PKG_WORD_ID   NUMBER := 0;

   Function Get_Max_Solution_Id
       RETURN NUMBER
   IS
      Loc_Solution_Id NUMBER;
   BEGIN
      SELECT max(Solution_Id)
      INTO   Loc_Solution_Id
      FROM   SFA_WORD;

      RETURN Loc_Solution_Id;
   EXCEPTION
      WHEN OTHERS THEN
         RAISE_APPLICATION_ERROR(-20111, 'ERROR: Get_Max_Solution_Id : ' || sqlerrm);
   END;

   Procedure  Check_Words(p_Solution_Id NUMBER, p_Word_Id NUMBER, p_Start_Col NUMBER, p_End_Col NUMBER)
   IS
   BEGIN
      FOR i in p_Start_Col..p_End_Col
      LOOP
         DELETE FROM SFA_FOUND_WORD
         WHERE  Word_Id     = p_Word_Id
         AND    Solution_Id = p_Solution_Id
         AND    substr(Word, i - p_Start_Col +1, 1) NOT IN
               (SELECT Letter FROM SFA_LETTER WHERE Col_No = i AND Used = 'N' AND Solution_Id = p_Solution_Id);
      END LOOP;
   EXCEPTION
      WHEN OTHERS THEN
         RAISE_APPLICATION_ERROR(-20111, 'ERROR: Trim_Words : ' || sqlerrm);
   END;

   Procedure Check_Solution_Words(p_Solution_Id NUMBER)
   IS
   BEGIN
       For Wrd_Rec in (SELECT Word_Id, Start_Col, End_Col FROM SFA_WORD WHERE Solved = 'N' AND Solution_Id = p_Solution_Id)
       Loop
           Check_Words(p_Solution_Id, Wrd_Rec.Word_Id, Wrd_Rec.Start_Col, Wrd_Rec.End_Col); 
       End Loop;
   EXCEPTION
      WHEN OTHERS THEN
         RAISE_APPLICATION_ERROR(-20111, 'ERROR: Check_Solution_Words : ' || sqlerrm);
   END;

   Procedure Use_Word(p_Solution_Id NUMBER, p_Word_Id NUMBER)
   IS
      Loc_Word       Varchar2(10);
      Loc_Start_Col  Number;
      Loc_End_Col    Number;
   BEGIN
       UPDATE SFA_WORD W
       SET    (Word, Solved) = (SELECT Word, 'Y'
                                FROM   SFA_FOUND_WORD F
                                WHERE  F.Word_Id     = W.Word_Id
                                AND    F.Solution_Id = W.Solution_Id)
       WHERE  W.Word_Id     = p_Word_Id
       AND    W.Solution_Id = p_Solution_Id;

       SELECT Word,     Start_Col,     End_Col
       INTO   Loc_Word, Loc_Start_Col, Loc_End_Col
       FROM   SFA_WORD
       WHERE  Word_Id     = p_Word_Id
       AND    Solution_Id = p_Solution_Id;

       For i in Loc_Start_Col..Loc_End_Col
       Loop
           UPDATE SFA_LETTER Y
           SET    Used   = 'Y'
           WHERE  Used   = 'N'
           AND    Col_No = i
           AND    Letter = substr(Loc_Word, i - Loc_Start_Col + 1, 1)
           AND    Solution_Id = p_Solution_Id
           AND NOT EXISTS (SELECT 1
                           FROM   SFA_LETTER E
                           WHERE  E.Col_No      = Y.Col_No
                           AND    E.Solution_Id = Y.Solution_Id
                           AND    E.Letter      = Y.Letter
                           AND    E.Used        = 'N'
                           AND    E.RowId       < Y.RowId);
       End Loop;
       Check_Solution_Words(p_Solution_Id);
   EXCEPTION
      WHEN OTHERS THEN
         RAISE_APPLICATION_ERROR(-20111, 'ERROR: Use_Word : ' || sqlerrm);
   END;

   Procedure Use_All_Words
   IS
      Loc_Word       Varchar2(10);
      Loc_Start_Col  Number;
      Loc_End_Col    Number;
   BEGIN
      FOR SOL_REC IN (SELECT  Solution_Id, min(Word_Id) Word_Id
                      FROM    (
                                SELECT   F.Solution_Id, F.Word_Id
                                FROM     SFA_FOUND_WORD F
                                  JOIN   SFA_WORD       W ON W.Word_Id     = F.Word_Id
                                                         AND W.Solution_Id = F.Solution_Id
                                                         AND W.Solved      = 'N'
                                GROUP BY F.Solution_Id, F.Word_Id
                                HAVING   Count(*) = 1
                              )
                      Group By Solution_Id)
      LOOP
         Use_Word(SOL_REC.Solution_Id, SOL_REC.Word_Id);
         COMMIT;
      END LOOP;
   EXCEPTION
      WHEN OTHERS THEN
         RAISE_APPLICATION_ERROR(-20111, 'ERROR: Use_All_Words : ' || sqlerrm);
   END;

   Procedure Clone_Solution(p_Solution_Id NUMBER, Cln_Solution_Id NUMBER,
                            p_Word_Id NUMBER,     p_Word    VARCHAR2)
   IS
   BEGIN
       INSERT INTO SFA_WORD (Solution_Id, Word_Id, Row_No, Start_Col, End_Col, Word, Solved)
       SELECT Cln_Solution_Id, Word_Id, Row_No, Start_Col, End_Col, Word, Solved
       FROM   SFA_WORD
       WHERE  Solution_Id = p_Solution_Id;

       INSERT INTO SFA_LETTER (Solution_Id, Col_No, Letter, Used)
       SELECT Cln_Solution_Id, Col_No, Letter, Used
       FROM   SFA_LETTER
       WHERE  Solution_Id = p_Solution_Id;

       INSERT INTO SFA_FOUND_WORD (Solution_Id, Word_Id, Word)
       SELECT Cln_Solution_Id, Word_Id, Word
       FROM   SFA_FOUND_WORD
       WHERE  Solution_Id = p_Solution_Id;

       DELETE FROM SFA_FOUND_WORD
       WHERE  Solution_Id = Cln_Solution_Id
       AND    Word_Id     = p_Word_Id
       AND    Word       != p_Word;
   EXCEPTION
      WHEN OTHERS THEN
         RAISE_APPLICATION_ERROR(-20111, 'ERROR: Clone_Solution : ' || sqlerrm);
   END;

   Procedure Delete_Solution(p_Solution_Id NUMBER)
   IS
   BEGIN
       DELETE FROM SFA_WORD       WHERE  Solution_Id = p_Solution_Id;
       DELETE FROM SFA_LETTER     WHERE  Solution_Id = p_Solution_Id;
       DELETE FROM SFA_FOUND_WORD WHERE  Solution_Id = p_Solution_Id;
       COMMIT;
   EXCEPTION
      WHEN OTHERS THEN
         RAISE_APPLICATION_ERROR(-20111, 'ERROR: Delete_Solution : ' || sqlerrm);
   END;

   Procedure Delete_All_Solutions
   IS
   BEGIN
      FOR DEL_REC IN (SELECT   Solution_Id
                      FROM     SFA_FOUND_WORD 
                      Group By Solution_Id
                      Having   Count(Distinct Word_Id)< 46)
      LOOP
         Delete_Solution(DEL_REC.Solution_Id);
      END LOOP;

      FOR DEL_REC IN (SELECT   Distinct L.Solution_Id
                      FROM   SFA_WORD H
                        JOIN SFA_WORD L ON L.Solution_Id = H.Solution_Id
                                       AND L.Start_Col   = H.Start_Col
                                       AND L.End_Col     = H.End_Col
                                       AND L.Word_Id     < H.Word_Id
                                       AND L.Word        > H.Word
                      WHERE    L.Word_Id != 3)
      LOOP
         Delete_Solution(DEL_REC.Solution_Id);
      END LOOP;
   EXCEPTION
      WHEN OTHERS THEN
         RAISE_APPLICATION_ERROR(-20111, 'ERROR: Delete_All_Solutions : ' || sqlerrm);
   END;

   Procedure Split_Solution(p_Solution_Id NUMBER, p_Word_Id NUMBER)
   IS
      Loc_Solution_Id NUMBER;
   BEGIN
      Loc_Solution_Id := Get_Max_Solution_Id;
      FOR WRD_REC in (SELECT Word
                      FROM   SFA_FOUND_WORD
                      WHERE  Solution_Id = p_Solution_Id
                      AND    Word_Id     = p_Word_Id)
      LOOP
         Loc_Solution_Id := Loc_Solution_Id + 1;
         Clone_Solution(p_Solution_Id, Loc_Solution_Id, p_Word_Id, WRD_REC.Word);
         Use_Word(Loc_Solution_Id, p_Word_Id);
      END LOOP;
      Delete_Solution(p_Solution_Id);
      COMMIT;
   EXCEPTION
      WHEN OTHERS THEN
         RAISE_APPLICATION_ERROR(-20111, 'ERROR: Split_Solution : ' || sqlerrm);
   END;

   Procedure Split_Word(p_Word_Id NUMBER, p_Limit NUMBER)
   IS
   BEGIN
      FOR SOL_REC in (SELECT Solution_Id
                      FROM   SFA_FOUND_WORD
                      WHERE  Word_Id = p_Word_Id
                      GROUP BY Solution_Id
                      HAVING Count(*) BETWEEN 2 AND p_Limit)
      LOOP
         Split_Solution(SOL_REC.Solution_Id, p_Word_Id);
      END LOOP;
   EXCEPTION
      WHEN OTHERS THEN
         RAISE_APPLICATION_ERROR(-20111, 'ERROR: Split_Word : ' || sqlerrm);
   END;
END;
/
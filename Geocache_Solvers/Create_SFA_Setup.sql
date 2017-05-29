

Create Or Replace Package SFA_Setup
AS
   Procedure Reset;
END;
/
Create Or Replace Package Body SFA_Setup
AS
   PKG_WORD_ID   NUMBER := 0;
   
   Function Get_Max_Solution_Id
       RETURN NUMBER
   IS
      Loc_Solution_Id NUMBER;
   BEGIN
      SELECT max(Solution_Id)
      INTO   Loc_Solution_Id
      FROM   SFA_LETTER;
      
      RETURN Loc_Solution_Id;
   EXCEPTION
      WHEN OTHERS THEN
         RAISE_APPLICATION_ERROR(-20111, 'ERROR: Get_Max_Solution_Id : ' || sqlerrm);
   END;

   Procedure Add_Word(p_Row_No NUMBER, p_Start_Col NUMBER, p_End_Col NUMBER)
   IS
   BEGIN
       PKG_WORD_ID := PKG_WORD_ID + 1;

       INSERT INTO SFA_WORD (Solution_Id, Word_Id, Row_No, Start_Col, End_Col, Solved)
       Values (1, PKG_WORD_ID, p_Row_No, p_Start_Col, p_End_Col, 'N');
   EXCEPTION
      WHEN OTHERS THEN
         RAISE_APPLICATION_ERROR(-20111, 'ERROR: Add_Word : ' || sqlerrm);
   END;

   Procedure Add_Letter(p_Col_No NUMBER, p_Letter VARCHAR2)
   IS
   BEGIN
       FOR i in 1..length(p_Letter)
       LOOP
          INSERT INTO SFA_LETTER (Solution_Id, Col_No, Letter, Used)
          Values (1, p_Col_No, substr(p_Letter, i, 1), 'N');
       END LOOP;
   EXCEPTION
      WHEN OTHERS THEN
         RAISE_APPLICATION_ERROR(-20111, 'ERROR: Add_Letter : ' || sqlerrm);
   END;

   Function Find_End_Puntcuation(p_Col_No NUMBER)
       RETURN VARCHAR2
   IS
      Loc_Punctuation  VARCHAR2(1);
   BEGIN
       SELECT min(Letter)
       INTO   Loc_Punctuation
       FROM   SFA_LETTER
       WHERE  Col_No      = p_Col_No
       AND    Letter IN (',', '!', '.');
       
       RETURN Loc_Punctuation;
   EXCEPTION
      WHEN OTHERS THEN
         RAISE_APPLICATION_ERROR(-20111, 'ERROR: Find_End_Puntcuation : ' || sqlerrm);
   END;
      
   
   
   Procedure Load_Words(p_Word_Id NUMBER, p_Length NUMBER, p_Puncuation VARCHAR2)
   IS
   BEGIN
       INSERT INTO SFA_FOUND_WORD (Solution_Id, Word_Id, Word)
       SELECT 1, p_Word_Id, Word || p_Puncuation
       FROM   DICTIONARY.Word_List
       WHERE  length(Word) = p_length;
   EXCEPTION
      WHEN OTHERS THEN
         RAISE_APPLICATION_ERROR(-20111, 'ERROR: Load_Words : ' || sqlerrm);
   END;

   Procedure  Check_Words(p_Word_Id NUMBER, p_Start_Col NUMBER, p_End_Col NUMBER)
   IS
   BEGIN
      FOR i in p_Start_Col..p_End_Col
      LOOP
         DELETE FROM SFA_FOUND_WORD
         WHERE  Word_Id     = p_Word_Id
         AND    substr(Word, i - p_Start_Col +1, 1) NOT IN
               (SELECT Letter FROM SFA_LETTER WHERE Col_No = i AND Used = 'N');
      END LOOP;
   EXCEPTION
      WHEN OTHERS THEN
         RAISE_APPLICATION_ERROR(-20111, 'ERROR: Trim_Words : ' || sqlerrm);
   END;

   Procedure Setup_Words(p_Word_Id NUMBER, p_Start_Col NUMBER, p_End_Col NUMBER)
   IS
      Loc_Word            Varchar2(10);
      Loc_Punctuation     Varchar2(1);
   BEGIN
       Load_Words(p_Word_Id, p_End_Col - p_Start_Col + 1, NULL);
       Loc_Punctuation := Find_End_Puntcuation(p_End_Col);
       If Loc_Punctuation Is Not Null
       Then
          Load_Words(p_Word_Id, p_End_Col - p_Start_Col, Loc_Punctuation);
       End If;
       Check_Words(p_Word_Id, p_Start_Col, p_End_Col);
   EXCEPTION
      WHEN OTHERS THEN
         RAISE_APPLICATION_ERROR(-20111, 'ERROR: Find_Words : ' || sqlerrm);
   END;

   Procedure Setup_Single_Word(p_Word_Id NUMBER, p_Col_No NUMBER)
   IS
   BEGIN
       INSERT INTO SFA_FOUND_WORD (Solution_Id, Word_Id, Word)
       SELECT Distinct 1, p_Word_Id, Letter
       FROM   SFA_LETTER
       WHERE  Col_No = p_Col_No;
   EXCEPTION
      WHEN OTHERS THEN
         RAISE_APPLICATION_ERROR(-20111, 'ERROR: Setup_Single_Word : ' || sqlerrm);
   END;

   Procedure Setup_Word3(p_Word_Id NUMBER, p_Start_Col NUMBER, p_End_Col NUMBER)
   IS
   BEGIN
       INSERT INTO SFA_FOUND_WORD (Solution_Id, Word_Id, Word)
       SELECT Distinct 1, p_Word_Id, L1.Letter || L2.Letter || L3.Letter || '''' || L5.Letter 
       FROM   SFA_LETTER L1
         JOIN SFA_LETTER L2 ON L2.Col_No = p_Start_Col + 1
         JOIN SFA_LETTER L3 ON L3.Col_No = p_Start_Col + 2
         JOIN SFA_LETTER L5 ON L5.Col_No = p_End_Col
                           AND L5.Letter IN ('D', 'S', 'T')
       WHERE  L1.Col_No = p_Start_Col;
   EXCEPTION
      WHEN OTHERS THEN
         RAISE_APPLICATION_ERROR(-20111, 'ERROR: Setup_Word3 : ' || sqlerrm);
   END;

   Procedure Setup_All_Words
   IS
   BEGIN
       For Wrd_Rec in (SELECT Word_Id, Start_Col, End_Col FROM SFA_WORD)
       Loop
           IF Wrd_Rec.Word_Id = 3
           THEN
              Setup_Word3(Wrd_Rec.Word_Id, Wrd_Rec.Start_Col, Wrd_Rec.End_Col); 
           ELSIF Wrd_Rec.Start_Col = Wrd_Rec.End_Col
           THEN
              Setup_Single_Word(Wrd_Rec.Word_Id, Wrd_Rec.Start_Col); 
           ELSE
              Setup_Words(Wrd_Rec.Word_Id, Wrd_Rec.Start_Col, Wrd_Rec.End_Col); 
           END IF;   
       End Loop;
   EXCEPTION
      WHEN OTHERS THEN
         RAISE_APPLICATION_ERROR(-20111, 'ERROR: Find_All_Words : ' || sqlerrm);
   END;

   Procedure Reset
   IS
   BEGIN
     PKG_WORD_ID  := 0;
     Delete FROM SFA_WORD;
     Delete FROM SFA_LETTER;
     Delete FROM SFA_FOUND_WORD;
--
     Add_Word(1,  1,  3);
     Add_Word(1,  5,  7);
     Add_Word(1,  9, 13);
     Add_Word(1, 15, 17);
     Add_Word(1, 19, 22);
     Add_Word(1, 24, 26);
--   
     Add_Word(2,  2,  6);
     Add_Word(2,  8, 12);
     Add_Word(2, 14, 16);
     Add_Word(2, 18, 18);
     Add_Word(2, 20, 25);
--
     Add_Word(3,  1,  4);
     Add_Word(3,  6, 10);
     Add_Word(3, 12, 16);
     Add_Word(3, 18, 21);
     Add_Word(3, 23, 26);
--
     Add_Word(4,  2,  5);
     Add_Word(4,  7,  9);
     Add_Word(4, 11, 19);
     Add_Word(4, 21, 21);
     Add_Word(4, 23, 25);
--
     Add_Word(5,  1,  4);
     Add_Word(5,  6,  9);
     Add_Word(5, 11, 15);
     Add_Word(5, 17, 18);
     Add_Word(5, 20, 22);
     Add_Word(5, 24, 25);
--
     Add_Word(6,  1,  5);
     Add_Word(6,  7, 12);
     Add_Word(6, 14, 16);
     Add_Word(6, 18, 20);
     Add_Word(6, 22, 23);
     Add_Word(6, 25, 25);
--
     Add_Word(7,  1,  7);
     Add_Word(7,  9, 13);
     Add_Word(7, 15, 20);
     Add_Word(7, 22, 26);
--
     Add_Word(8,  1,  1);
     Add_Word(8,  3,  6);
     Add_Word(8,  8, 10);
     Add_Word(8, 12, 16);
     Add_Word(8, 18, 20);
     Add_Word(8, 22, 26);
--
     Add_Word(9,  2, 10);
     Add_Word(9, 12, 18);
     Add_Word(9, 20, 26);
--
     Add_Letter( 1, 'FHINNT');
     Add_Letter( 2, 'EFIIOSUZ');
     Add_Letter( 3, 'BEHINNOUY');
     Add_Letter( 4, 'EEFMNORU');
     Add_Letter( 5, 'DELOOPT');
     Add_Letter( 6, 'AEHNTWY');
     Add_Letter( 7, ',HHIIOR');
     Add_Letter( 8, 'EFNNNRY');
     Add_Letter( 9, 'BEEEILORS');
     Add_Letter(10, 'EEEFILU');
     Add_Letter(11, 'ADSTTW');
     Add_Letter(12, '''CEEEEFNY');
     Add_Letter(13, 'KNOSSUV');
     Add_Letter(14, 'EJRRTTT');
     Add_Letter(15, '.GHMNOTTW');
     Add_Letter(16, 'EHHIOOTY');
     Add_Letter(17, '!EEIR');
     Add_Letter(18, '.CERRTTT');
     Add_Letter(19, 'AHHHNO');
     Add_Letter(20, 'ACEEEPRT');
     Add_Letter(21, '.AAFHN');
     Add_Letter(22, 'DFIINOP');
     Add_Letter(23, 'EFIORSZ');
     Add_Letter(24, 'BEFILRST');
     Add_Letter(25, 'ADEORSTXY');
     Add_Letter(26, '..ORT');
--
     Setup_All_Words;
   EXCEPTION
      WHEN OTHERS THEN
         RAISE_APPLICATION_ERROR(-20111, 'ERROR: Reset : ' || sqlerrm);
   END;


END;
/

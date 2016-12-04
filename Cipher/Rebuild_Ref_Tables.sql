

Create Or Replace Package Rebuild_Ref_Tables
AS
   Procedure Rebuild_Tables;
END;
/

Create Or Replace Package Body Rebuild_Ref_Tables
AS

   Procedure Record_Letter(p_Word_Text VARCHAR2, p_Freq NUMBER, p_Start_Freq NUMBER, p_End_Freq NUMBER)
   IS
   BEGIN
/*
        INSERT INTO REF_LETTER
               (Letter,      Frequency, Starts_With,  End_With)
        VALUES (p_Word_Text, p_Freq,    p_Start_Freq, p_End_Freq);
*/
      MERGE INTO REF_LETTER R
        USING (SELECT p_Word_Text Word, p_Freq Freq, p_Start_Freq Start_Freq, p_End_Freq End_Freq FROM   DUAL) U
        ON    (U.Word = R.Letter)
      WHEN MATCHED THEN
        UPDATE SET R.Frequency   = R.Frequency   + U.Freq,
                   R.Starts_With = R.Starts_With + U.Start_Freq,
                   R.End_With    = R.End_With    + U.End_Freq
      WHEN NOT MATCHED THEN
        INSERT (Letter, Frequency, Starts_With, End_With)
        VALUES (U.Word, U.Freq, U.Start_Freq, U.End_Freq);
   END;

   Procedure Rebuild_Ref_Letters(p_Word_Text  VARCHAR2, p_Freq NUMBER)
   IS
   BEGIN
       IF length(p_word_Text) = 1
       THEN
          Record_Letter(p_Word_Text, p_Freq, 0, 0);
       ELSE
          Record_Letter(substr(p_Word_Text, 1, 1), p_Freq, p_Freq, 0);
          Record_Letter(substr(p_Word_Text, -1),   p_Freq,      0,  p_Freq);
          IF length(p_word_Text) > 2
          THEN
             FOR i in 2..length(p_Word_Text) - 1
             LOOP
                Record_Letter(substr(p_Word_Text, i, 1), p_Freq, 0, 0);
             END LOOP;
          END IF;
       END IF;
   END;


   Procedure Record_Digraph(p_Word_Text VARCHAR2, p_Freq NUMBER, p_Start_Freq NUMBER, p_End_Freq NUMBER)
   IS
   BEGIN
      MERGE INTO REF_DIGRAPH R
        USING (SELECT p_Word_Text Word, p_Freq Freq, p_Start_Freq Start_Freq, p_End_Freq End_Freq FROM   DUAL) U
        ON    (U.Word = R.Word)
      WHEN MATCHED THEN
        UPDATE SET R.Frequency   = R.Frequency   + U.Freq,
                   R.Starts_With = R.Starts_With + U.Start_Freq,
                   R.End_With    = R.End_With    + U.End_Freq
      WHEN NOT MATCHED THEN
        INSERT (Word, Frequency, Starts_With, End_With)
        VALUES (U.Word, U.Freq, U.Start_Freq, U.End_Freq);
   END;

   Procedure Rebuild_Ref_Digraph(p_Word_Text  VARCHAR2, p_Freq NUMBER)
   IS
   BEGIN
       IF length(p_word_Text) = 2
       THEN
          Record_Digraph(p_Word_Text, p_Freq, 0, 0);
       ELSIF length(p_word_Text) > 2
       THEN
          Record_Digraph(substr(p_Word_Text, 1, 2), p_Freq, p_Freq, 0);
          Record_Digraph(  substr(p_Word_Text, -2), p_Freq,      0,  p_Freq);
          IF length(p_word_Text) > 3
          THEN
             FOR i in 2..length(p_Word_Text) - 2
             LOOP
                Record_Digraph(substr(p_Word_Text, i, 2), p_Freq, 0, 0);
             END LOOP;
          END IF;
       END IF;
   END;


   Procedure Record_Trigraph(p_Word_Text VARCHAR2, p_Freq NUMBER, p_Start_Freq NUMBER, p_End_Freq NUMBER)
   IS
   BEGIN
      MERGE INTO REF_TRIGRAPH R
        USING (SELECT p_Word_Text Word, p_Freq Freq, p_Start_Freq Start_Freq, p_End_Freq End_Freq FROM   DUAL) U
        ON    (U.Word = R.Word)
      WHEN MATCHED THEN
        UPDATE SET R.Frequency   = R.Frequency   + U.Freq,
                   R.Starts_With = R.Starts_With + U.Start_Freq,
                   R.End_With    = R.End_With    + U.End_Freq
      WHEN NOT MATCHED THEN
        INSERT (Word, Frequency, Starts_With, End_With)
        VALUES (U.Word, U.Freq, U.Start_Freq, U.End_Freq);
   END;

   Procedure Rebuild_Ref_Trigraph(p_Word_Text  VARCHAR2, p_Freq NUMBER)
   IS
   BEGIN
       IF length(p_word_Text) = 3
       THEN
          Record_Trigraph(p_Word_Text, p_Freq, 0, 0);
       ELSIF length(p_word_Text) > 3
       THEN
          Record_Trigraph(substr(p_Word_Text, 1, 3), p_Freq, p_Freq, 0);
          Record_Trigraph(  substr(p_Word_Text, -3), p_Freq,      0,  p_Freq);
          IF length(p_word_Text) > 4
          THEN
             FOR i in 2..length(p_Word_Text) - 3
             LOOP
                Record_Trigraph(substr(p_Word_Text, i, 3), p_Freq, 0, 0);
             END LOOP;
          END IF;
       END IF;
   END;

   Procedure Clear_Ref_Tables
   IS
   BEGIN
       DELETE FROM REF_LETTER;
       DELETE FROM REF_DIGRAPH;
       DELETE FROM REF_TRIGRAPH;
   END;

   Procedure Rebuild_Tables
   IS
      Loc_Rare_Letter   Varchar2(26);
   BEGIN
       Analyse_Words.Clear_Analyse_Tables;
       Clear_Ref_Tables;
       
       FOR WORD_REC IN (SELECT Word_Text, Count(*) Freq FROM RAW_WORD GROUP BY Word_text)
       LOOP
          Analyse_Words.Analyse_Word(WORD_REC.Word_Text, WORD_REC.Freq);
       END LOOP;
--
       Loc_Rare_Letter := Analyse_Words.Determine_Rare_Letters;
       Analyse_Words.Find_Contact_Rare_Letter(Loc_Rare_Letter);
/*
          Rebuild_Ref_Letters( WORD_REC.Word_Text, WORD_REC.Freq);
          Rebuild_Ref_Digraph( WORD_REC.Word_Text, WORD_REC.Freq);
          Rebuild_Ref_Trigraph(WORD_REC.Word_Text, WORD_REC.Freq);
*/
   END;
END;
/

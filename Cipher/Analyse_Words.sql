

Create Or Replace Package Analyse_Words
AS
   Procedure Analyse_Word(p_Word Varchar2, p_Freq Number);
   Procedure Clear_Analyse_Tables;
   Procedure Find_Contact_Rare_Letter(p_Rare_Letter VARCHAR2);
   Function  Determine_Rare_Letters RETURN Varchar2;
END;
/

Create Or Replace Package Body Analyse_Words
AS
   Function  Determine_Rare_Letters RETURN Varchar2
   IS
      Loc_Rare_Letter VARCHAR(26);
   BEGIN
       FOR RARE_REC IN (SELECT Letter FROM  (
                          SELECT Letter, Letter_Frequency, 
                                 sum(Letter_Frequency) OVER (Order By Letter_Frequency)  Running_Total, 
                                 sum(Letter_Frequency) OVER ()  Grand_Total 
                          FROM (
                                SELECT Letter, sum(Frequency) Letter_Frequency
                                FROM GT_LETTER_ANALYSIS
                                GROUP BY Letter)
                          )
                        WHERE Running_Total * 5 < Grand_Total)
       LOOP
          Loc_Rare_Letter := Loc_Rare_Letter || RARE_REC.Letter;
       END LOOP;

      RETURN Loc_Rare_Letter;
   END;

   Procedure Find_Contact_Rare_Letter(p_Rare_Letter VARCHAR2)
   IS
   BEGIN
         INSERT INTO GT_LETTER_RARE_CONTACT (Letter, Frequency)
         SELECT Letter, Sum(Frequency)
         FROM  (SELECT substr(Digraph, 1, 1) Letter, Frequency
                FROM   GT_DIGRAPH_ANALYSIS
                WHERE  instr(p_Rare_Letter, substr(Digraph, 1, 1)) = 0
                AND    instr(p_Rare_Letter, substr(Digraph, 2, 1)) > 0
                UNION ALL
                SELECT substr(Digraph, 2, 1), Frequency
                FROM   GT_DIGRAPH_ANALYSIS
                WHERE  instr(p_Rare_Letter, substr(Digraph, 1, 1)) > 0
                AND    instr(p_Rare_Letter, substr(Digraph, 2, 1)) = 0
               )
         GROUP BY Letter;
   END;

   Procedure Analyse_Letter(p_Word  VARCHAR2, p_Length NUMBER, p_Freq NUMBER)
   IS
   BEGIN
       FOR i in 1..p_Length
       LOOP
         INSERT INTO GT_LETTER_ANALYSIS (Letter,  Word_Length, Frequency, Position)
         VALUES (substr(p_Word, i, 1), p_Length, p_Freq, i);
       END LOOP;
   END;

   Procedure Analyse_Digraph(p_Word  VARCHAR2, p_Length NUMBER, p_Freq NUMBER)
   IS
   BEGIN
       FOR i in 1..p_Length-1
       LOOP
         INSERT INTO GT_DIGRAPH_ANALYSIS (Digraph,  Word_Length, Frequency, Position)
         VALUES (substr(p_Word, i, 2), p_Length, p_Freq, i);
       END LOOP;
   END;

   Procedure Analyse_Trigraph(p_Word  VARCHAR2, p_Length NUMBER, p_Freq NUMBER)
   IS
   BEGIN
       FOR i in 1..p_Length-2
       LOOP
         INSERT INTO GT_TRIGRAPH_ANALYSIS (Trigraph,  Word_Length, Frequency, Position)
         VALUES (substr(p_Word, i, 3), p_Length, p_Freq, i);
       END LOOP;
   END;

   Procedure Clear_Analyse_Tables
   IS
   BEGIN
       DELETE FROM GT_LETTER_ANALYSIS;
       DELETE FROM GT_LETTER_ANALYSIS_SUMMARY;
       DELETE FROM GT_LETTER_RARE_CONTACT;
       DELETE FROM GT_DIGRAPH_ANALYSIS;
       DELETE FROM GT_TRIGRAPH_ANALYSIS;
   END;

   Procedure Analyse_Word(p_Word Varchar2, p_Freq Number)
   IS
      Loc_Length NUMBER := length(p_Word);
   BEGIN
      Analyse_Letter( p_Word, Loc_Length, p_Freq);
      Analyse_Digraph( p_Word, Loc_Length, p_Freq);
      Analyse_Trigraph(p_Word, Loc_Length, p_Freq);
   END;
END;
/

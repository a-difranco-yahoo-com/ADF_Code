

Create Or Replace Package Build_Raw_Word
AS
   Procedure Reload_Table;
END;
/

Create Or Replace Package Body Build_Raw_Word
AS

   Procedure Format_Raw_Text_Lines
   IS
   BEGIN
      UPDATE RAW_TEXT  SET  Line_Of_Text = ltrim(Line_Of_Text);
      UPDATE RAW_TEXT  SET  Line_Of_Text = rtrim(Line_Of_Text);
      UPDATE RAW_TEXT  SET  Line_Of_Text = upper(Line_Of_Text);
   END;

   Procedure Delete_Extra_Raw_Text_Lines
   IS
   BEGIN
      DELETE FROM RAW_TEXT
      WHERE  Line_Of_Text IN (SELECT Line_Of_text FROM RAW_TEXT Group By Line_Of_text Having count(*) > 1);

      DELETE FROM RAW_TEXT
      WHERE  Line_Of_Text LIKE '% OF 670%';

      DELETE FROM RAW_TEXT
      WHERE  Line_Of_Text IN ('XX','XXI','XIX','XVI','XXII','XXIV','XVII','XVIII','XXIII');
   END;

   Procedure Set_Line_Numbers
   IS
   BEGIN
      UPDATE RAW_TEXT  Set  Line_Number = rownum;
   END;

   Procedure Clear_Raw_Words
   IS
   BEGIN
      DELETE FROM RAW_WORD;
   END;

   Function Correct_Word_Hyphenation(p_Line  Varchar2)
      RETURN Varchar2 
   IS
      Loc_Line RAW_TEXT.Line_Of_Text%Type := p_Line;
   BEGIN
      Loc_Line := replace(Loc_Line, 'SPI—I—IES', 'SPIES');
      Loc_Line := replace(Loc_Line, 'SPI—IES',    'SPIES');

      Return Loc_Line;
   END;

   Function Convert_Punctuation_To_Space(p_Line  Varchar2)
      RETURN Varchar2 
   IS
      Loc_Line RAW_TEXT.Line_Of_Text%Type := p_Line;
   BEGIN
      Loc_Line := replace(Loc_Line, '—',          ' ');
      Loc_Line := replace(Loc_Line, '-',          ' ');
      Loc_Line := replace(Loc_Line, ',’',         ' ');

      Return Loc_Line;
   END;

   Function Trim_Punctuation(p_Line  Varchar2, p_Punct Varchar2)
      RETURN Varchar2 
   IS
      Loc_Line  RAW_TEXT.Line_Of_Text%Type       := p_Line;
      Loc_Punct PUNCTUATION_CHAR.Punct_Char%Type := p_Punct;
   BEGIN
      FOR i IN 1..2
      LOOP
         FOR j IN 1..length(Loc_Punct)
         LOOP
            Loc_Line := replace(Loc_Line, ' ' || substr(Loc_Punct, j, 1), ' ');
            Loc_Line := replace(Loc_Line, substr(Loc_Punct, j, 1) || ' ', ' ');
         END LOOP;
      END LOOP;

      Return Loc_Line;
   END;

   Function Convert_Apostrophe_To_Quote(p_Line  Varchar2)
      RETURN Varchar2 
   IS
      Loc_Line  RAW_TEXT.Line_Of_Text%Type       := p_Line;
   BEGIN
      Loc_Line := replace(Loc_Line, '’D ',  '''D ');
      Loc_Line := replace(Loc_Line, '’M ',  '''M ');
      Loc_Line := replace(Loc_Line, '’N ',  '''N ');
      Loc_Line := replace(Loc_Line, '’S ',  '''S ');
      Loc_Line := replace(Loc_Line, '’T ',  '''T ');
      Loc_Line := replace(Loc_Line, '’RE ', '''RE ');
      Loc_Line := replace(Loc_Line, '’VE ', '''VE ');
      Loc_Line := replace(Loc_Line, '’YE ', '''YE ');
      Loc_Line := replace(Loc_Line, '’LL ', '''LL ');
--
      Loc_Line := replace(Loc_Line, ' O’',  ' O''');
      Loc_Line := replace(Loc_Line, 'D’AULNAIS',  'D''AULNAIS');

      Return Loc_Line;
   END;

   Function Correct_Abbreviations(p_Line  Varchar2)
      RETURN Varchar2 
   IS
      Loc_Line  RAW_TEXT.Line_Of_Text%Type := p_Line;
   BEGIN
      Loc_Line := replace(Loc_Line, 'NAT’RAL',    'NATURAL');
      Loc_Line := replace(Loc_Line, 'MAM’SELLE',  'MADEMOISELLE');
      Loc_Line := replace(Loc_Line, 'MA’AMSELLE', 'MADEMOISELLE');
      Loc_Line := replace(Loc_Line, 'T’OTHER',    'THE OTHER');
      Loc_Line := replace(Loc_Line, 'REG’LAR',    'REGULAR');

      Return Loc_Line;
   END;

   Function Correct_Run_Together_Words(p_Line  Varchar2)
      RETURN Varchar2 
   IS
      Loc_Line  RAW_TEXT.Line_Of_Text%Type := p_Line;
   BEGIN
--
      Loc_Line := replace(Loc_Line, 'EYE,MORE',   'EYE MORE');
      Loc_Line := replace(Loc_Line, 'CO.''S',     'CO''S');

      Return Loc_Line;
   END;

   Procedure Extract_Words_From_Lines
   IS
      Loc_Word   Varchar2(2000);
      Loc_Line   Varchar2(2000);
      Loc_Punct  Varchar2(20);
   BEGIN
       SELECT Punct_Char
       INTO   Loc_Punct
       FROM   PUNCTUATION_CHAR;
    
       FOR INS_REC IN (SELECT Line_Number, Line_Of_Text FROM RAW_TEXT)
       LOOP
          Loc_Line := ' ' || INS_REC.Line_Of_Text || ' ';
          Loc_Line := Correct_Word_Hyphenation(Loc_Line);
          Loc_Line := Convert_Punctuation_To_Space(Loc_Line);
          Loc_Line := Trim_Punctuation(Loc_Line, Loc_Punct);
          Loc_Line := Convert_Apostrophe_To_Quote(Loc_Line);
          Loc_Line := Correct_Abbreviations(Loc_Line);
          Loc_Line := Correct_Run_Together_Words(Loc_Line);
          Loc_Line := ltrim(Loc_Line);
          While Loc_Line IS NOT NULL
          LOOP
             Loc_Word := regexp_replace(Loc_Line, ' .*',     '');
             Loc_Line := regexp_replace(Loc_Line, '^[^ ]* ', '');
             Loc_Line := ltrim(Loc_Line);
             
             INSERT INTO RAW_WORD (Line_Number, Word_Text) VALUES (INS_REC.Line_Number, Loc_Word);        
          END LOOP;
       END LOOP;
   END;

   Procedure Remove_Numbers
   IS
   BEGIN
       DELETE FROM RAW_WORD WHERE translate(Word_Text, 'x0123456789', 'x') IS NULL;
   END;


   Procedure Reload_Table
   IS
   BEGIN
     Format_Raw_Text_Lines;
     Delete_Extra_Raw_Text_Lines;
     Set_Line_Numbers;
     Clear_Raw_Words;
     Extract_Words_From_Lines;
     Remove_Numbers;
   END;
END;
/

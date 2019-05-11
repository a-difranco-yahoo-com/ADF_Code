
Create Or Replace Package Peanut_Tree
AS
   Procedure Solve_Puzzle(p_Cipher_Text VARCHAR2, p_keyword VARCHAR2, p_Indicator_Word VARCHAR2, p_Indicator_Letter VARCHAR2);
END;
/

Create Or Replace Package Body Peanut_Tree
AS
   PKG_ALPHABET    Varchar2(26)   := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
   Type AlphabetArray IS TABLE OF VARCHAR2(26) INDEX BY Binary_Integer;

   Function Setup_PlainAlphaBet(p_Keyword VARCHAR2) RETURN VARCHAR2
   AS
      Loc_AlphaBet      Varchar2(26)   := PKG_ALPHABET;
      Loc_Keyword       Varchar2(200)  := p_Keyword;
      Loc_PlainAlphaBet Varchar2(26)   := '';
   BEGIN
      WHILE Loc_Keyword IS NOT NULL
      LOOP
         Loc_PlainAlphaBet := Loc_PlainAlphaBet  || substr(Loc_Keyword, 1, 1);
         Loc_AlphaBet      := replace(Loc_AlphaBet, substr(Loc_Keyword, 1, 1), '');
         Loc_Keyword       := replace(Loc_Keyword,  substr(Loc_Keyword, 1, 1), '');
      END LOOP;
      RETURN Loc_PlainAlphaBet || Loc_AlphaBet;
   END;

   Function Setup_CipherAlphaBet(p_PlainAlpha VARCHAR2, p_Indicator_Word VARCHAR2, p_Indicator_Letter VARCHAR2) 
        RETURN AlphabetArray
   AS
      Loc_CipherAlpha   AlphabetArray;
      Loc_Indicator_Pos NUMBER := instr(p_PlainAlpha, p_Indicator_Letter);
      Loc_Letter_Pos    NUMBER;
   BEGIN
      FOR i in 1..length(p_Indicator_Word)
      LOOP
         Loc_Letter_Pos  := instr(p_PlainAlpha, substr(p_Indicator_Word, i, 1) ) - Loc_Indicator_Pos + 1;
         IF Loc_Letter_Pos < 1
         THEN
            Loc_Letter_Pos := Loc_Letter_Pos + 26;
         END IF;
         
         Loc_CipherAlpha(i) := substr(p_PlainAlpha, Loc_Letter_Pos) || substr(p_PlainAlpha, 1, Loc_Letter_Pos - 1);
      END LOOP;
      RETURN Loc_CipherAlpha;
   END;

   Procedure Decrypt_Text(p_Cipher_Text VARCHAR2, p_PlainAlpha VARCHAR2, p_CipherAlpha AlphabetArray, p_Period NUMBER)
   AS
     Loc_Cipher_Text Varchar2(2000) := replace(p_Cipher_Text, ' ', '');
     Loc_Period_Text Varchar2(20);
     Loc_Pos         Number;
   BEGIN
      WHILE Loc_Cipher_Text IS NOT NULL
      LOOP
         Loc_Period_Text := substr(Loc_Cipher_Text, 1, p_Period);
         Loc_Cipher_Text := substr(Loc_Cipher_Text, p_Period + 1);
         FOR i in 1..length(Loc_Period_Text)
         LOOP
            loc_Pos := instr(p_CipherAlpha(i), substr(Loc_Period_Text, i, 1) );
            dbms_output.put( substr(p_PlainAlpha, loc_pos, 1) );
         END LOOP;
         dbms_output.put_line('');
      END LOOP;
      
   END;

   Procedure Solve_Puzzle(p_Cipher_Text VARCHAR2, p_keyword VARCHAR2, p_Indicator_Word VARCHAR2, p_Indicator_Letter VARCHAR2)
   IS
     Loc_PlainAlpha    VARCHAR2(26);
     Loc_CipherAlpha   AlphabetArray;
   BEGIN
       Loc_PlainAlpha  := Setup_PlainAlphaBet(p_Keyword);
       Loc_CipherAlpha := Setup_CipherAlphaBet(Loc_PlainAlpha, p_Indicator_Word, p_Indicator_Letter);
       Decrypt_Text(p_Cipher_Text, Loc_PlainAlpha, Loc_CipherAlpha, length(p_Indicator_Word) );
   END;  
END;
/

DECLARE
--   Loc_CIpher_Text Varchar2(2000) := 'KRSLWMI TJDVIAB MRGQMTM LLIVIFU IXRHTNY ONVRHHI IIRMCAO VEI';
   Loc_CIpher_Text Varchar2(2000) := 'SSBUU PSDKR EAXZA XBZTS GIFAL MKXDQ FHXTL CJPCX AZLZL RDOCR MICSF RQJTZ XHLXL OTMAI RSNBQ OQJFS LADOE FAICS UQACQ OXUNX SAZRM SKJGC MCBZG PYXEK JRFYQ JFSNI VTUPC REOAB NJEIN KEZCK VCMCG KTPDU SHUQQ';
BEGIN
   dbms_output.enable(20000);
   Peanut_Tree.Solve_Puzzle(Loc_CIpher_Text, 'CHARLES', 'SCHULZ', 'A');
END;
/


ADD A QUAGMIRE THREE AND IT BECOMES VERY HARD 
THE CACHE IS TWENTY FEET UP A TREE AT 
NORTH FIFTY ONE DEGS THIRTY FOUR DOT TWO ELEVEN MINS AND 
EAST ZERO DEGS ONE DOT TWO THIRTY FOUR MINS BYOP AND DONT FALLOUT

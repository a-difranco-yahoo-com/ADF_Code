CREATE OR REPLACE PACKAGE AC_SETUP AS 

  Procedure Setup_Puzzle(p_Puzzle_Id NUMBER);
  Function Compare_Letters(p_Word1 VARCHAR2, p_Word2 VARCHAR2) RETURN VARCHAR2;

END AC_SETUP;
/


CREATE OR REPLACE PACKAGE BODY AC_SETUP AS

  PKG_CLUE_ID   NUMBER       := 0;
  PKG_ALPHABET  Varchar2(26) := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

  Procedure Reset_Puzzle AS
  BEGIN
     Execute Immediate 'TRUNCATE TABLE AC_SOLUTION_CLUE';
     Execute Immediate 'TRUNCATE TABLE AC_SOLUTION';
     Execute Immediate 'TRUNCATE TABLE AC_MESSAGE';
     Execute Immediate 'TRUNCATE TABLE AC_CLUE';

     PKG_CLUE_ID  := 0;
  END;

  Function Compare_Letters(p_Word1 VARCHAR2, p_Word2 VARCHAR2)
     RETURN VARCHAR2
  AS
     Loc_Word1   Varchar2(200);
     Loc_Word2   Varchar2(200);
     Loc_Pos     Number;
  BEGIN
     IF length(p_Word2) > length(P_Word1)
     THEN
        Loc_Word1 := p_Word2;
        Loc_Word2 := p_Word1;
     ELSE
        Loc_Word1 := p_Word1;
        Loc_Word2 := p_Word2;
     END IF;
   
     FOR i in REVERSE 1..length(loc_Word2)
     LOOP
        Loc_Pos := instr(Loc_Word1, substr(Loc_Word2, i, 1));
        If Loc_Pos > 0
        Then
           Loc_Word1 := substr(Loc_Word1, 1, Loc_Pos - 1) || substr(Loc_Word1, Loc_Pos + 1);
           Loc_Word2 := substr(Loc_Word2, 1, i       - 1) || substr(Loc_Word2, i       + 1);
        End If;
     END LOOP;

--     RETURN Loc_Word1 || ':' || Loc_Word2;
     IF Loc_Word2 IS NULL
     THEN
        RETURN Loc_Word1;
     ELSE
        RETURN NULL;
     END IF;
  END;

  Function Reorder_Word(p_Word  Varchar2)
      RETURN Varchar2
  AS
     Loc_Ret_Word  Varchar2(200) := '';
     Loc_Char      Varchar2(1);
  BEGIN
    FOR i in 1..26
    LOOP
       Loc_Char     := substr(PKG_ALPHABET, i, 1);
       Loc_Ret_Word := Loc_Ret_Word || translate(p_Word, Loc_Char || PKG_ALPHABET, Loc_Char);
    END LOOP;
    
    RETURN Loc_Ret_Word;
  END;
  
  Function Clue_Logged(p_Word  Varchar2)
      RETURN BOOLEAN
  AS
     Loc_Count  Number;
  BEGIN
     SELECT Count(*)
     INTO   Loc_Count
     FROM   AC_CLUE
     WHERE  Clue_Word = p_Word;
  
     RETURN (Loc_Count > 0);
  END;
  
  Procedure Set_Letters_Used
  AS
  BEGIN
    UPDATE AC_CLUE
    Set    REMAINING_LETTERS = '';

    FOR i in 1..26
    LOOP
       UPDATE AC_CLUE
       Set    REMAINING_LETTERS = REMAINING_LETTERS || substr(PKG_ALPHABET, i, 1)
       Where  Clue_Word  Like '%' || substr(PKG_ALPHABET, i, 1) || '%';
    END LOOP;
  END;
  
  Procedure Mark_As_Processed(p_Word Varchar2)
  AS
  BEGIN
     UPDATE AC_CLUE
     Set    Processed = 'Y'
     Where  Clue_Word  = p_Word;
  END;
  
  Procedure Add_Clue(p_Word  Varchar2, p_Total NUMBER)
  AS
     Loc_Word  Varchar2(200);
  BEGIN
     Loc_Word := Reorder_Word(p_Word);
     If Not Clue_Logged(Loc_Word)
     Then
        PKG_CLUE_ID  := PKG_CLUE_ID + 1;
     
        INSERT INTO AC_CLUE(Clue_Id, Clue_Word, Clue_Total, Processed)  
        Values (PKG_CLUE_ID, Loc_Word, p_Total, 'N');
     End If;
  END;

  Procedure Remove_Processed_Clues
  AS
  BEGIN
     DELETE FROM AC_CLUE
     WHERE  Processed = 'Y';
  END;
  
  Procedure Simplify_Clue(p_Clue  AC_CLUE%Rowtype)
  AS
     Loc_Occur  NUMBER;
     Loc_Freq   NUMBER;
     Loc_Char   VARCHAR2(1);
  BEGIN
     FOR i IN 1..length(p_Clue.Remaining_Letters)
     LOOP
        Loc_Char  := substr(p_Clue.Remaining_Letters, i, 1);
        Loc_Occur := length(p_Clue.Clue_Word) - 
                    nvl(length(replace(p_Clue.Clue_Word, Loc_Char, '') ), 0);
        IF i = 1
        THEN 
           Loc_Freq := Loc_Occur;
        ELSIF Loc_Freq != Loc_Occur
        THEN
           Loc_Freq := -1;
        END IF;
     END LOOP;

     IF Loc_Freq Not In (-1, 1)
     THEN
        Add_Clue(p_Clue.Remaining_Letters, p_Clue.Clue_Total / Loc_Freq);
        DELETE FROM AC_CLUE
        WHERE  Clue_Id    = p_Clue.Clue_Id;    
     END IF;
  END;
  
  Procedure Simplify_Clues
  AS
  BEGIN
     Set_Letters_Used;
     FOR CLUE_REC IN (SELECT * FROM AC_CLUE)
     LOOP
        Simplify_Clue(CLUE_REC);
     END LOOP;
  END;
  
/** *********************************************
    Add Clue Procedures
    ********************************************* **/
  Procedure Add_New_1v1_Clue
  AS
  BEGIN
     FOR ADD_REC IN (
                     SELECT Distinct L1, New_Word, New_Total 
                     FROM   (
                             SELECT L1.Clue_Word L1, R1.Clue_Word R1,
                                    L1.Clue_Total - R1.Clue_Total New_Total,
                                    Compare_Letters(L1.Clue_Word, R1.Clue_Word) New_Word
                             FROM   AC_CLUE  L1
                               JOIN AC_CLUE  R1 ON R1.Clue_Total < L1.Clue_Total
                              )
                     WHERE New_Word Is Not Null
                     AND   length(New_Word) < greatest( length(L1), length(R1) ) 
                    )
     LOOP
        Add_Clue( rtrim(ADD_REC.New_Word, ':'), ADD_REC.New_Total);
        Mark_As_Processed(ADD_REC.L1);
     END LOOP;
     Remove_Processed_Clues;
  END;

  Procedure Add_New_2v1_Clue
  AS
  BEGIN
     FOR ADD_REC IN (
                     SELECT Distinct New_Word, New_Total 
                     FROM   (
                             SELECT L1.Clue_Word L1, L2.Clue_Word L2, R1.Clue_Word R1,
                                    abs(L1.Clue_Total + L2.Clue_Total - R1.Clue_Total) New_Total,
                                    Compare_Letters(L1.Clue_Word || L2.Clue_Word, R1.Clue_Word) New_Word
                             FROM   AC_CLUE  L1
                               JOIN AC_CLUE  L2 ON L2.Clue_Id >= L1.Clue_Id
                               JOIN AC_CLUE  R1 ON R1.Clue_Id Not In (L1.Clue_Id, L2.Clue_Id)
                              )
                     WHERE New_Word Is Not Null
                     AND   length(New_Word) < greatest( length(L1), length(L2), length(R1) ) 
                    )
     LOOP
        Add_Clue( rtrim(ADD_REC.New_Word, ':'), ADD_REC.New_Total);
     END LOOP;
  END;

  Procedure Add_New_2v2_Clue
  AS
  BEGIN
     FOR ADD_REC IN (
                     SELECT Distinct New_Word, New_Total 
                     FROM   (
                             SELECT L1.Clue_Word L1, L2.Clue_Word L2, R1.Clue_Word R1,  R2.Clue_Word R2,
                                    abs(L1.Clue_Total + L2.Clue_Total - R1.Clue_Total - R2.Clue_Total) New_Total,
                                    Compare_Letters(L1.Clue_Word || L2.Clue_Word, R1.Clue_Word || R2.Clue_Word) New_Word
                             FROM   AC_CLUE  L1
                               JOIN AC_CLUE  L2 ON L2.Clue_Id >= L1.Clue_Id
                               JOIN AC_CLUE  R1 ON R1.Clue_Id Not In (L1.Clue_Id, L2.Clue_Id)
                                               AND R1.Clue_Id > L1.Clue_Id
                               JOIN AC_CLUE  R2 ON R2.Clue_Id Not In (L1.Clue_Id, L2.Clue_Id)
                                               AND R2.Clue_Id >= R1.Clue_Id
                              )
                     WHERE New_Word Is Not Null
                     AND   length(New_Word) < greatest( length(L1), length(L2), length(R1), length(R2) ) 
                    )
     LOOP
        Add_Clue( rtrim(ADD_REC.New_Word, ':'), ADD_REC.New_Total);
     END LOOP;
  END;

  Procedure Add_New_Clues
  AS
    Loc_Last_Clue_Id  NUMBER;
    Loc_Done          BOOLEAN := FALSE;
  BEGIN
    While Not Loc_Done
    Loop
        Loc_Last_Clue_Id := PKG_CLUE_ID;
        Add_New_1v1_Clue;
        IF Loc_Last_Clue_Id = PKG_CLUE_ID Then Add_New_2v1_Clue; End IF;
        IF Loc_Last_Clue_Id = PKG_CLUE_ID Then Add_New_2v2_Clue; End IF;
        IF Loc_Last_Clue_Id = PKG_CLUE_ID Then Loc_Done := TRUE; End IF;
        Simplify_Clues;
     End Loop;
  END;

/** *********************************************
    Setup Procedures
    ********************************************* **/

  Procedure Setup_Puzzle1 AS
  BEGIN
    Add_Clue('AMIES',      36);
    Add_Clue('ASHLEY',     60);
    Add_Clue('BALENCIAGA', 67);
    Add_Clue('BALMAIN',    49);
    Add_Clue('CARDIN',     48);
    Add_Clue('CHANEL',     43);
    Add_Clue('DIOR',       37);
    Add_Clue('GAULTIER',   43);
    Add_Clue('GIVENCHY',   81);
    Add_Clue('GUCCI',      35);
    Add_Clue('HARTNELL',   54);
    Add_Clue('JAMES',      60);
    Add_Clue('KLEIN',      37);
    Add_Clue('LACROIX',    64);
    Add_Clue('LAGERFELD',  74);
    Add_Clue('LAUREN',     26);
    Add_Clue('MIYAKE',     62);
    Add_Clue('MUIR',       21);
    Add_Clue('OLDFIELD',   80);
    Add_Clue('PAQUIN',     47);
    Add_Clue('QUANT',      35);
    Add_Clue('RICCI',      35);
    Add_Clue('VERSACE',    67);
    Add_Clue('WORTH',      64);
    Add_Clue('YUKI',       43);
  END Setup_Puzzle1;

  Procedure Setup_Puzzle2 AS
  BEGIN
    Add_Clue('ABLE',   38);
    Add_Clue('ACID',   23);
    Add_Clue('ACRID',  24);
    Add_Clue('ADMIT',  45);
    Add_Clue('ADO',    16);
    Add_Clue('AGREE',  37);
    Add_Clue('AHEAD',  43);
    Add_Clue('AISLE',  45);
    Add_Clue('ALE',    30);
    Add_Clue('ANIL',   48);
    Add_Clue('ANKLE',  66);
    Add_Clue('ANTLER', 52);
    Add_Clue('ANVIL',  66);
    Add_Clue('APPLE',  72);
    Add_Clue('AQUA',   36);
    Add_Clue('AREA',   12);
    Add_Clue('ARENA',  24);
    Add_Clue('ARROW',  27);
    Add_Clue('AURA',   27);
    Add_Clue('AWAY',   41);
    Add_Clue('AWE',    24);
    Add_Clue('AWFUL',  78);
    Add_Clue('AXLE',   44);
    Add_Clue('AZALEA', 49);
  END Setup_Puzzle2;

  Procedure Setup_Puzzle3 AS
  BEGIN
    Add_Clue('ANGELOU',  45);
    Add_Clue('ATWOOD',   55);
    Add_Clue('BALZAC',   59);
    Add_Clue('BRAINE',   47);
    Add_Clue('CONRAD',   59);
    Add_Clue('EVELYN',   63);
    Add_Clue('FORESTER', 58);
    Add_Clue('GASKELL',  47);
    Add_Clue('GOGOL',    41);
    Add_Clue('HAMSUN',   53);
    Add_Clue('HELLER',   35);
    Add_Clue('JEROME',   53);
    Add_Clue('KAFKA',    74);
    Add_Clue('LESSING',  45);
    Add_Clue('NESBIT',   45);
    Add_Clue('PARKER',   58);
    Add_Clue('POTTER',   47);
    Add_Clue('PROUST',   42);
    Add_Clue('QUENEAU',  56);
    Add_Clue('RANSOME',  45);
    Add_Clue('RENAULT',  40);
    Add_Clue('SALINGER', 55);
    Add_Clue('SHUTE',    37);
    Add_Clue('SYMONS',   50);
    Add_Clue('WALTON',   49);
  END Setup_Puzzle3;

  Procedure Setup_Puzzle4 AS
  BEGIN
    -- the letters of the word JUMBLE DECREASE in value from left to right
    Add_Clue('ZERO',     73);
    Add_Clue('TEN',      15);
    Add_Clue('ONE',      35);
    Add_Clue('HUNDREDS', 95);
    Add_Clue('TWO',      30);
    Add_Clue('THOUSAND', 93);
    Add_Clue('PI',       29);
    Add_Clue('MILLION',  76);
    Add_Clue('FIVE',     55);
    Add_Clue('BILLION',  72); 
    Add_Clue('EIGHT',    41);
    Add_Clue('CLOCK',    80);
    Add_Clue('NINE',     15);
  END Setup_Puzzle4;


  Procedure Setup_Puzzle(p_Puzzle_Id NUMBER)
  AS
  BEGIN
    Reset_Puzzle;
    
    IF    p_Puzzle_Id = 1 Then  Setup_Puzzle1;
    ELSIF p_Puzzle_Id = 2 Then  Setup_Puzzle2;
    ELSIF p_Puzzle_Id = 3 Then  Setup_Puzzle3;
    ELSIF p_Puzzle_Id = 4 Then  Setup_Puzzle4;
    END If;
    Add_New_Clues;
    Set_Letters_Used;
  END;

END AC_SETUP;
/

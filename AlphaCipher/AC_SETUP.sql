CREATE OR REPLACE PACKAGE AC_SETUP AS 

  Procedure Setup_Puzzle(p_Puzzle_Id NUMBER);

END AC_SETUP;
/


CREATE OR REPLACE PACKAGE BODY AC_SETUP AS

  PKG_CLUE_ID   NUMBER := 0;

  Procedure Reset_Puzzle AS
  BEGIN
     DELETE FROM AC_SOLUTION_CLUE;
     DELETE FROM AC_SOLUTION;
     DELETE FROM AC_CLUE;

     PKG_CLUE_ID  := 0;
  END;
  
  Procedure Add_Clue(p_Word  Varchar2, p_Total NUMBER)
  AS
  BEGIN
     PKG_CLUE_ID  := PKG_CLUE_ID + 1;
     
     INSERT INTO AC_CLUE(Clue_Id, Clue_Word, Clue_Total, Processed)  
     Values (PKG_CLUE_ID, p_Word, p_Total, 'N');
  END;

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
  END;

END AC_SETUP;
/

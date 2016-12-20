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

  Procedure Setup_Puzzle(p_Puzzle_Id NUMBER)
  AS
  BEGIN
    Reset_Puzzle;
    
    IF p_Puzzle_Id = 1
    Then
       Setup_Puzzle1;
    ELSIF p_Puzzle_Id = 2
    Then
       Setup_Puzzle2;
    END If;
  END;

END AC_SETUP;
/

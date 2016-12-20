CREATE OR REPLACE PACKAGE AC_SETUP AS 

  Procedure Setup_Puzzle1;

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
    Reset_Puzzle;

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

END AC_SETUP;
/

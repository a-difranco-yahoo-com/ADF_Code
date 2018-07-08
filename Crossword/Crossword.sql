CREATE OR REPLACE PACKAGE CROSSWORD AS 

  Procedure Clear_Crossword;
  Procedure Set_Crossword_Size(p_Rows NUMBER, p_Columns NUMBER);
  Procedure Add_Crossword_Word(p_Row   NUMBER,  p_Column NUMBER, p_Clue_No NUMBER,
                               p_AorD VARCHAR2, p_Length NUMBER, p_Word    VARCHAR2);

END;
/


CREATE OR REPLACE PACKAGE BODY CROSSWORD AS


  Procedure Clear_Crossword AS
  BEGIN
     DELETE FROM CROSSWORD_CELL;
  END;

  Procedure Set_Crossword_Size(p_Rows NUMBER, p_Columns NUMBER)
  AS
  BEGIN
     FOR r in 1..p_Rows
     LOOP
        FOR c in 1..p_Columns
        LOOP
           INSERT INTO CROSSWORD_CELL (Row_No, Column_No, Entry)
           VALUES (r, c, '.');
        END LOOP;
     END LOOP;
  END;

  Procedure Add_Crossword_Word(p_Row   NUMBER,  p_Column NUMBER, p_Clue_No NUMBER,
                               p_AorD VARCHAR2, p_Length NUMBER, p_Word    VARCHAR2)
  AS
     Loc_Row_End     NUMBER;
     Loc_Column_End  NUMBER;
     Loc_Pos         NUMBER := 0;
  BEGIN
     IF p_AorD = 'A'
     THEN
        loc_Row_End    := p_Row;
        loc_Column_End := p_Column + p_Length - 1;
     ELSIF p_AorD = 'D'
     THEN
        loc_Row_End    := p_Row + p_Length - 1;
        loc_Column_End := p_Column;
     ELSE
        RAISE_APPLICATION_ERROR(-20123, 'Add_Crossword_Word: p_AorD (' || p_AorD || ') must be A or D');
     END IF;

     FOR r in p_Row..loc_Row_End
     LOOP
        FOR c in p_Column..loc_Column_End
        LOOP
           IF p_Word IS NULL
           THEN
              INSERT INTO CROSSWORD_CELL (Row_No, Column_No, Entry)
              VALUES(r, c, '.');
           ELSE
              Loc_Pos := Loc_Pos + 1;
              INSERT INTO CROSSWORD_CELL (Row_No, Column_No, Entry)
              VALUES (r, c, substr(p_Word, Loc_Pos, 1) );
           END IF;
        END LOOP;
     END LOOP;
  END;
END;
/

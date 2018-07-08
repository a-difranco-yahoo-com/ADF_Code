CREATE OR REPLACE PACKAGE CROSSWORD AS 

  FUNCTION Get_Cell_Entry(p_Row  NUMBER,   p_Column NUMBER)   RETURN VARCHAR2;
  FUNCTION Get_No_Of_Rows    RETURN NUMBER;
  FUNCTION Get_No_Of_Columns RETURN NUMBER;

  Procedure Clear_Crossword;
  Procedure Set_Crossword_Size(p_Rows NUMBER, p_Columns NUMBER);
  Procedure Add_Crossword_Word(p_Row   NUMBER,  p_Column NUMBER, p_Clue_No NUMBER,
                               p_AorD VARCHAR2, p_Length NUMBER, p_Word    VARCHAR2);

END;
/


CREATE OR REPLACE PACKAGE BODY CROSSWORD AS

  FUNCTION Get_Cell_Entry(p_Row  NUMBER,   p_Column NUMBER)
     RETURN VARCHAR2
  IS
     Loc_Entry VARCHAR2(1);
  BEGIN
     SELECT Entry
     INTO   Loc_Entry
     FROM   CROSSWORD_CELL
     WHERE  Row_No    = p_Row
     AND    Column_No = p_Column;
     
     RETURN Loc_Entry;
  END;

  FUNCTION Get_No_Of_Rows RETURN NUMBER
  IS
     Loc_Rows NUMBER;
  BEGIN
     SELECT No_Of_Rows
     INTO   Loc_Rows
     FROM   CROSSWORD_DIMENSION;
     
     RETURN Loc_Rows;
  END;

  FUNCTION Get_No_Of_Columns RETURN NUMBER
  IS
     Loc_Columns NUMBER;
  BEGIN
     SELECT No_Of_Columns
     INTO   Loc_Columns
     FROM   CROSSWORD_DIMENSION;
     
     RETURN Loc_Columns;
  END;

 PROCEDURE  Check_AorD(p_Clue_No NUMBER, p_AorD VARCHAR2)
 IS
  BEGIN
     IF nvl(p_AorD, 'x') NOT IN ('A', 'D')
     THEN
        RAISE_APPLICATION_ERROR(-20123, 'Check_AorD: ' || p_Clue_No || p_AorD ||
                                        ' A(cross)/D(own) is incorrect : ' || p_AorD);
     END IF;
  END;

  PROCEDURE Check_Word_Length(p_Clue_No NUMBER, p_AorD VARCHAR2, p_Length NUMBER, p_Word    VARCHAR2)
  IS
  BEGIN
     IF p_Word IS NOT NULL AND length(p_Word) != p_Length
     THEN
        RAISE_APPLICATION_ERROR(-20123, 'Check_Word_Length: ' || p_Clue_No || p_AorD ||
                                        ' Word has incorrect length : ' || p_Word || ' v ' || p_Length);
     END IF;
  END;

  PROCEDURE Check_Cell_Entry(p_Row  NUMBER,   p_Column NUMBER, p_Clue_No NUMBER,
                             p_AorD VARCHAR2, p_Cell    VARCHAR2)
  IS
     Loc_Current_Entry VARCHAR2(1);
  BEGIN
     Loc_Current_Entry := Get_Cell_Entry(p_Row, p_Column);
     
     IF Loc_Current_Entry Not IN ('x', '.') AND
        Loc_Current_Entry != p_Cell
     THEN
        RAISE_APPLICATION_ERROR(-20123, 'Check_Cell_Entry: ' || p_Clue_No || p_AorD ||
                                        ' Cell has inconsisent value : ' || Loc_Current_Entry || ' v ' || p_Cell);
     END IF;
  END;


  Procedure Set_Cell_Entry(p_Row NUMBER, p_Column NUMBER, p_Clue_No NUMBER, p_AorD VARCHAR2, p_Cell VARCHAR2)
  AS
     Loc_Entry  VARCHAR2(1);
  BEGIN
     IF P_Cell != 'x'
     THEN
        Check_Cell_Entry(p_Row, p_Column, p_Clue_No, p_AorD, p_Cell);
     END IF;

     UPDATE CROSSWORD_CELL
     SET    Entry = CASE WHEN Entry  = '.' THEN p_Cell
                         WHEN p_Cell = 'x' THEN Entry
                         ELSE p_Cell
                         END
     WHERE  Row_No    = p_Row
     AND    Column_No = p_Column;
  END;

  Procedure Clear_Crossword AS
  BEGIN
     DELETE FROM CROSSWORD_DIMENSION;
     DELETE FROM CROSSWORD_CELL;
  END;

  Procedure Set_Crossword_Size(p_Rows NUMBER, p_Columns NUMBER)
  AS
  BEGIN
     INSERT INTO CROSSWORD_DIMENSION (No_Of_Rows, No_Of_Columns) VALUES (p_Rows, p_Columns);
     
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
     Check_AorD       (p_Clue_No, p_AorD);
     Check_Word_Length(p_Clue_No, p_AorD, p_Length, p_Word);
  
     IF p_AorD = 'A'
     THEN
        loc_Row_End    := p_Row;
        loc_Column_End := p_Column + p_Length - 1;
     ELSE
        loc_Row_End    := p_Row + p_Length - 1;
        loc_Column_End := p_Column;
     END IF;

     FOR r in p_Row..loc_Row_End
     LOOP
        FOR c in p_Column..loc_Column_End
        LOOP
           IF p_Word IS NULL
           THEN
              Set_Cell_Entry(r, c, p_Clue_No, p_AorD, 'x');
           ELSE
              Loc_Pos := Loc_Pos + 1;
              Set_Cell_Entry(r, c, p_Clue_No, p_AorD, substr(p_Word, Loc_Pos, 1) );
           END IF;
        END LOOP;
     END LOOP;
  END;
END;
/

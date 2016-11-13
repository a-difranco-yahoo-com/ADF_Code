CREATE OR REPLACE PACKAGE GS_SETUP AS 

    Procedure Setup_Puzzle(p_Puzzle_Id  NUMBER);

END GS_SETUP;
/


CREATE OR REPLACE PACKAGE BODY GS_SETUP AS

/*  *************************************************************
    GET FUNCTIONS
    *************************************************************  */
  Function  Get_Pattern_Id(p_Pattern_Code VARCHAR2)
      RETURN Number
  AS
    Loc_Pattern_Id    NUMBER;
  BEGIN
     BEGIN
        SELECT Distinct Pattern_Id
        INTO   Loc_Pattern_Id
        FROM   GS_GT_PATTERN
        WHERE  Pattern_Code= p_Pattern_Code;
     EXCEPTION
        WHEN NO_DATA_FOUND THEN
           SELECT nvl(max(Pattern_Id), 0) + 1
           INTO   Loc_Pattern_Id
           FROM   GS_GT_PATTERN;
     END;
     
     Return Loc_Pattern_Id;
  END;

  Function  Get_Max_Length
      RETURN Number
  AS
    Loc_Max_Length    NUMBER;
  BEGIN
     SELECT max(Sequence_Length)
     INTO   Loc_Max_Length
     FROM   GS_GT_PATTERN_SEQUENCE;
        
     Return Loc_Max_Length;
  END;

  Function  Get_Max_Combination_Id
      RETURN Number
  AS
    Loc_Max_Combination_Id    NUMBER;
  BEGIN
     SELECT max(Combination_Id)
     INTO   Loc_Max_Combination_Id
     FROM   GS_GT_COMBINATION_SEQUENCE;
        
     Return Loc_Max_Combination_Id;
  END;

  Function  Get_Max_Sequence_No
      RETURN Number
  AS
    Loc_Max_Sequence_No    NUMBER;
  BEGIN
     SELECT max(Sequence_No)
     INTO   Loc_Max_Sequence_No
     FROM   GS_GT_PATTERN_SEQUENCE;
        
     Return Loc_Max_Sequence_No;
  END;

  Function  Get_Max_Dimension
      RETURN Number
  AS
    Loc_Max_Dimension    NUMBER;
  BEGIN
     SELECT greatest(No_Of_Rows, No_Of_Columns)
     INTO   Loc_Max_Dimension
     FROM   GS_DIMENSION;
     
     Return Loc_Max_Dimension;
  END;

  Function  Get_Max_Rows
      RETURN Number
  AS
    Loc_Max_Rows    NUMBER;
  BEGIN
     SELECT No_Of_Rows
     INTO   Loc_Max_Rows
     FROM   GS_DIMENSION;
     
     Return Loc_Max_Rows;
  END;

  Function  Get_Max_Cols
      RETURN Number
  AS
    Loc_Max_Cols    NUMBER;
  BEGIN
     SELECT No_Of_Columns
     INTO   Loc_Max_Cols
     FROM   GS_DIMENSION;
     
     Return Loc_Max_Cols;
  END;

/*  *************************************************************
    COMBINATION PROCEDURES
    *************************************************************  */
    Procedure Setup_First_Combinations
    IS
    BEGIN
       INSERT INTO GS_GT_COMBINATION_SEQUENCE 
       (Pattern_Id, Combination_Id, Sequence_No, Start_Pos, End_Pos)
       SELECT PS.Pattern_Id, Rownum, PS.Sequence_No, S.Start_Pos, S.End_Pos
       FROM   GS_GT_PATTERN_SEQUENCE PS
         JOIN GS_GT_SEQUENCE          S ON S.Sequence_Length = PS.Sequence_Length
       WHERE  PS.Sequence_No = 1;
    END;

    Procedure Setup_Combinations(p_Sequence_No NUMBER, p_Combination_Id NUMBER)
    IS
    BEGIN
       INSERT INTO GS_GT_COMBINATION_SEQUENCE 
       (Pattern_Id, Combination_Id, Prev_Combination_Id, Sequence_No, Start_Pos, End_Pos)
       SELECT PS.Pattern_Id, Rownum + p_Combination_Id, CS.Combination_Id, PS.Sequence_No, S.Start_Pos, S.End_Pos
       FROM   GS_GT_PATTERN_SEQUENCE     PS
         JOIN GS_GT_SEQUENCE              S ON  S.Sequence_Length = PS.Sequence_Length
         JOIN GS_GT_COMBINATION_SEQUENCE CS ON CS.Sequence_No     = PS.Sequence_No - 1
                                           AND CS.Pattern_Id      = PS.Pattern_Id
       WHERE  PS.Sequence_No = p_Sequence_No
       AND    S.Start_Pos    > CS.End_Pos + 1;
    END;

    Procedure Copy_Combinations(p_Sequence_No NUMBER)
    IS
    BEGIN
       INSERT INTO GS_GT_COMBINATION_SEQUENCE 
       (Pattern_Id, Combination_Id, Sequence_No, Start_Pos, End_Pos)
       SELECT C.Pattern_Id, C.Combination_Id, P.Sequence_No, P.Start_Pos, P.End_Pos
       FROM   GS_GT_COMBINATION_SEQUENCE C
         JOIN GS_GT_COMBINATION_SEQUENCE P ON P.Combination_Id = C.Prev_Combination_Id
       WHERE  C.Sequence_No = p_Sequence_No;
    END;

    Procedure Clear_Combinations(p_Sequence_No NUMBER, p_Combination_Id NUMBER)
    IS
    BEGIN
       DELETE FROM GS_GT_COMBINATION_SEQUENCE CS
       WHERE  CS.Combination_Id <= p_Combination_Id
       AND EXISTS (SELECT 1
                   FROM   GS_GT_PATTERN_SEQUENCE     PS
                   WHERE  PS.Sequence_No = p_Sequence_No
                   AND    PS.Pattern_Id  = CS.Pattern_Id);
    END;

    Procedure Build_Line_Combination
    IS
    BEGIN
       INSERT INTO GS_LINE_COMBINATION
       (Row_Or_Col, Line_No, Solution_Id,  Combination_Id)
       SELECT P.Row_Or_Col, P.Line_No, 1, CS.Combination_Id
       FROM   GS_GT_PATTERN               P
         JOIN GS_GT_COMBINATION_SEQUENCE CS ON CS.Pattern_Id = P.Pattern_Id
       WHERE  CS.Sequence_No = 1;
    END;

    Procedure Build_Combination_Sequence
    IS
    BEGIN
       INSERT INTO GS_COMBINATION_SEQUENCE
       (Combination_Id, Start_Pos, End_Pos)
       SELECT Combination_Id, Start_Pos, End_Pos
       FROM   GS_GT_COMBINATION_SEQUENCE;
    END;

/*  *************************************************************
    BUILD PROCEDURES
    *************************************************************  */
  Procedure  Build_Pattern_Sequence(p_Pattern_Id NUMBER, p_Pattern_Code  VARCHAR2)
  AS
     loc_Pattern_Code  VARCHAR2(30) := p_Pattern_Code;
     loc_Sequence_No   NUMBER       := 0;
  BEGIN
     While loc_Pattern_Code IS NOT NULL
     LOOP
        loc_Sequence_No := loc_Sequence_No + 1;

        INSERT INTO GS_GT_PATTERN_SEQUENCE (Pattern_Id, Sequence_No, Sequence_Length)
        VALUES (p_Pattern_Id, loc_Sequence_No, regexp_replace(loc_Pattern_Code, ':.*', '') );

        loc_Pattern_Code := regexp_replace(loc_Pattern_Code, '^[^:]*:', '');
     END LOOP;
  END;

  Procedure  Build_Pattern_Sequences
  AS
  BEGIN
     FOR PAT_REC IN (SELECT Distinct Pattern_Id, Pattern_Code
                     FROM   GS_GT_PATTERN)
     LOOP
        Build_Pattern_Sequence(PAT_REC.Pattern_Id, PAT_REC.Pattern_Code);
     END LOOP;
  END;

  Procedure  Build_Sequences
  AS
     Loc_Max_Length NUMBER;
     Loc_Max_Start  NUMBER;
  BEGIN
     Loc_Max_Length := Get_Max_Length;
     Loc_Max_Start  := Get_Max_Dimension;

     INSERT INTO GS_GT_SEQUENCE (Sequence_Length, Start_Pos, End_Pos)
     SELECT L.Sequence_Length, P.Start_Pos, P.Start_Pos + L.Sequence_Length - 1
     FROM       (SELECT Rownum Sequence_Length FROM ALL_OBJECTS WHERE Rownum <= Loc_Max_Length) L
     CROSS JOIN (SELECT Rownum Start_Pos       FROM ALL_OBJECTS WHERE Rownum <= Loc_Max_Start)  P
     WHERE  P.Start_Pos + L.Sequence_Length - 1 <= Loc_Max_Start;
  END;

  Procedure  Build_Combinations
  AS
     Loc_Max_Sequence_No    NUMBER;
     Loc_Max_Combination_Id NUMBER;
  BEGIN
     Loc_Max_Sequence_No  := Get_Max_Sequence_No;

     Setup_First_Combinations;
     FOR i in 2..Loc_Max_Sequence_No
     LOOP
        Loc_Max_Combination_Id := Get_Max_Combination_Id;
        Setup_Combinations(i, Loc_Max_Combination_Id);
        Copy_Combinations(i);
        Clear_Combinations(i, Loc_Max_Combination_Id);
     END LOOP;

     Build_Line_Combination;
     Build_Combination_Sequence;
  END;

  Procedure  Build_Solutions
  AS
     Loc_Max_Rows NUMBER;
     Loc_Max_Cols NUMBER;
  BEGIN
     Loc_Max_Rows  := Get_Max_Rows;
     Loc_Max_Cols  := Get_Max_Cols;

     FOR R in 1..Loc_Max_Rows
     LOOP
        FOR C in 1..Loc_Max_Cols
        LOOP
           INSERT INTO GS_SOLUTION (Row_No, Col_No, Solution_Id, Is_Filled)  VALUES (R, C, 1, 'U');
        END LOOP;
     END LOOP;    
  END;

/*  *************************************************************
    SETUP PROCEDURES
    *************************************************************  */
  Procedure  Set_Dimensions(p_Rows NUMBER, p_Cols NUMBER)
  AS
  BEGIN
     INSERT INTO GS_DIMENSION (No_of_Rows, No_Of_Columns ) VALUES (p_Rows, p_Cols);
  END;

  Procedure  Setup_Pattern(p_Row_Or_Col VARCHAR2, p_Line_No NUMBER, p_Pattern_Code VARCHAR2)
  AS
    Loc_Pattern_Id    NUMBER;
  BEGIN
     Loc_Pattern_Id := Get_Pattern_Id(p_Pattern_Code);

     INSERT INTO GS_GT_PATTERN (Row_Or_Col, Line_No, Pattern_Id, Pattern_Code)
     VALUES (p_Row_Or_Col, p_Line_No, Loc_Pattern_Id, p_Pattern_Code);
  END;

  Procedure Setup_Puzzle1
  AS
  BEGIN
    Set_Dimensions(25, 25);
--
    Setup_Pattern('R',  1, '7:3:1:1:7:');
    Setup_Pattern('R',  2, '1:1:2:2:1:1:');
    Setup_Pattern('R',  3, '1:3:1:3:1:1:3:1:');
    Setup_Pattern('R',  4, '1:3:1:1:6:1:3:1:');
    Setup_Pattern('R',  5, '1:3:1:5:2:1:3:1:');
--
    Setup_Pattern('R',  6, '1:1:2:1:1:');
    Setup_Pattern('R',  7, '7:1:1:1:1:1:7:');
    Setup_Pattern('R',  8, '3:3:');
    Setup_Pattern('R',  9, '1:2:3:1:1:3:1:1:2:');
    Setup_Pattern('R', 10, '1:1:3:2:1:1:');
--
    Setup_Pattern('R', 11, '4:1:4:2:1:2:');
    Setup_Pattern('R', 12, '1:1:1:1:1:4:1:3:');
    Setup_Pattern('R', 13, '2:1:1:1:2:5:');
    Setup_Pattern('R', 14, '3:2:2:6:3:1:');
    Setup_Pattern('R', 15, '1:9:1:1:2:1:');
--
    Setup_Pattern('R', 16, '2:1:2:2:3:1:');
    Setup_Pattern('R', 17, '3:1:1:1:1:5:1:');
    Setup_Pattern('R', 18, '1:2:2:5:');
    Setup_Pattern('R', 19, '7:1:2:1:1:1:3:');
    Setup_Pattern('R', 20, '1:1:2:1:2:2:1:');
--
    Setup_Pattern('R', 21, '1:3:1:4:5:1:');
    Setup_Pattern('R', 22, '1:3:1:3:10:2:');
    Setup_Pattern('R', 23, '1:3:1:1:6:6:');
    Setup_Pattern('R', 24, '1:1:2:1:1:2:');
    Setup_Pattern('R', 25, '7:2:1:2:5:');
--
    Setup_Pattern('C',  1, '7:2:1:1:7:');
    Setup_Pattern('C',  2, '1:1:2:2:1:1:');
    Setup_Pattern('C',  3, '1:3:1:3:1:3:1:3:1:');
    Setup_Pattern('C',  4, '1:3:1:1:5:1:3:1:');
    Setup_Pattern('C',  5, '1:3:1:1:4:1:3:1:');
--
    Setup_Pattern('C',  6, '1:1:1:2:1:1:');
    Setup_Pattern('C',  7, '7:1:1:1:1:1:7:');
    Setup_Pattern('C',  8, '1:1:3:');
    Setup_Pattern('C',  9, '2:1:2:1:8:2:1:');
    Setup_Pattern('C', 10, '2:2:1:2:1:1:1:2:');
--
    Setup_Pattern('C', 11, '1:7:3:2:1:');
    Setup_Pattern('C', 12, '1:2:3:1:1:1:1:1:');
    Setup_Pattern('C', 13, '4:1:1:2:6:');
    Setup_Pattern('C', 14, '3:3:1:1:1:3:1:');
    Setup_Pattern('C', 15, '1:2:5:2:2:');
--
    Setup_Pattern('C', 16, '2:2:1:1:1:1:1:2:1:');
    Setup_Pattern('C', 17, '1:3:3:2:1:8:1:');
    Setup_Pattern('C', 18, '6:2:1:');
    Setup_Pattern('C', 19, '7:1:4:1:1:3:');
    Setup_Pattern('C', 20, '1:1:1:1:4:');
--
    Setup_Pattern('C', 21, '1:3:1:3:7:1:');
    Setup_Pattern('C', 22, '1:3:1:1:1:2:1:1:4:');
    Setup_Pattern('C', 23, '1:3:1:4:3:3:');
    Setup_Pattern('C', 24, '1:1:2:2:2:6:1:');
    Setup_Pattern('C', 25, '7:1:3:2:1:1:');
  END;

  Procedure Setup_Puzzle(p_Puzzle_Id  NUMBER)
  AS
  BEGIN
    DELETE FROM GS_DIMENSION;
    DELETE FROM GS_LINE_COMBINATION;
    DELETE FROM GS_COMBINATION_SEQUENCE;
    DELETE FROM GS_SOLUTION;
    COMMIT;

    IF p_Puzzle_Id = 1
    THEN
       Setup_Puzzle1;     
    END IF;
    Build_Pattern_Sequences;
    Build_Sequences;
    Build_Combinations;
    Build_Solutions;
  END;

END GS_SETUP;
/

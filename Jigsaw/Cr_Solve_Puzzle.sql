
CREATE OR REPLACE PACKAGE SOLVE_PUZZLE AS
   PROCEDURE Puzzle_Solver;
END;
/

CREATE OR REPLACE PACKAGE BODY SOLVE_PUZZLE AS

   FUNCTION Is_Finished RETURN BOOLEAN
   AS
      Loc_Unknowns   NUMBER := 0;
   BEGIN
      SELECT Count(*)
      INTO   Loc_Unknowns
      FROM   PUZZLE 
      WHERE  Status = 'U';
      
      RETURN (Loc_Unknowns = 0);
   EXCEPTION
      WHEN OTHERS THEN
         RAISE_APPLICATION_ERROR(20173, 'ERROR: In SOLVE_PUZZLE.Is_Finished : ' || Sqlerrm);
   END;

   FUNCTION Get_Max_Puzzle_Id RETURN PUZZLE.Puzzle_Id%Type
   AS
      Loc_Puzzle_Id PUZZLE.Puzzle_Id%Type;
   BEGIN
      SELECT max(Puzzle_Id)
      INTO   Loc_Puzzle_Id
      FROM   PUZZLE;

      RETURN  Loc_Puzzle_Id;
   EXCEPTION
      WHEN OTHERS THEN
         RAISE_APPLICATION_ERROR(20173, 'ERROR: In SOLVE_PUZZLE.Get_Max_Puzzle_Id : ' || Sqlerrm);
   END;

/* --------------------------------------------------------- */
   PROCEDURE Add_Square(p_Square_Id  REF_SQUARE.Square_Id%Type,
                        p_Row_Number REF_SQUARE.Row_Number%Type,
                        p_Col_Number REF_SQUARE.Column_Number%Type)
   AS
      Loc_Square_Id   NUMBER := 0;
   BEGIN
      INSERT INTO REF_SQUARE (Square_Id, Row_Number, Column_Number)
      VALUES (p_Square_Id, p_Row_Number, p_Col_Number);
   EXCEPTION
      WHEN OTHERS THEN
         RAISE_APPLICATION_ERROR(20173, 'ERROR: In SOLVE_PUZZLE.Add_Square : ' || Sqlerrm);
   END;

   PROCEDURE Add_Shape(p_Shape_Id   SHAPE.Shape_Id%Type,
                       p_Row_Offset SHAPE.Row_Offset%Type,
                       p_Col_Offset SHAPE.Column_Offset%Type,
                       p_Letter     SHAPE.Letter%Type)
   AS
      Loc_Square_Id   NUMBER := 0;
   BEGIN
      INSERT INTO SHAPE (Shape_Id, Row_Offset, Column_Offset, Letter)
      VALUES (p_Shape_Id, p_Row_Offset, p_Col_Offset, p_Letter);
   EXCEPTION
      WHEN OTHERS THEN
         RAISE_APPLICATION_ERROR(20173, 'ERROR: In SOLVE_PUZZLE.Add_Shape : ' || Sqlerrm);
   END;

   PROCEDURE Add_Placement_Id(p_Placement_Id PLACEMENT.Placement_Id%Type,
                              p_Row_Orig     REF_SQUARE.Row_Number%Type,
                              p_Column_Orig  REF_SQUARE.Column_Number%Type,
                              p_Shape_Id     SHAPE.Shape_Id%Type)
   AS
   BEGIN
      INSERT INTO PLACEMENT (Placement_Id, Shape_Id, Square_Id, Letter)
      SELECT p_Placement_Id, p_Shape_Id, R.Square_Id, S.Letter
      FROM   SHAPE S
        JOIN REF_SQUARE R ON R.Row_Number    = p_Row_Orig    + S.Row_Offset
                         AND R.Column_Number = p_Column_Orig + S.Column_Offset                 
      WHERE  S.Shape_Id = p_Shape_Id;
   EXCEPTION
      WHEN OTHERS THEN
         RAISE_APPLICATION_ERROR(20173, 'ERROR: In SOLVE_PUZZLE.Add_Placement_Id : ' || Sqlerrm);
   END;
   
   PROCEDURE Delete_Puzzle(p_Puzzle_Id PUZZLE.Puzzle_Id%Type)
   AS
   BEGIN
      DELETE FROM PUZZLE
      WHERE  Puzzle_Id = p_Puzzle_Id;
   EXCEPTION
      WHEN OTHERS THEN
         RAISE_APPLICATION_ERROR(20173, 'ERROR: In SOLVE_PUZZLE.Delete_Puzzle : ' || Sqlerrm);
   END;
   

/* --------------------------------------------------------- */
   PROCEDURE Clear_Puzzle
   AS
   BEGIN
      DELETE FROM PUZZLE;
      DELETE FROM SHAPE;
      DELETE FROM PLACEMENT;
      DELETE FROM REF_SQUARE;
   EXCEPTION
      WHEN OTHERS THEN
         RAISE_APPLICATION_ERROR(20173, 'ERROR: In SOLVE_PUZZLE.Clear_Puzzle : ' || Sqlerrm);
   END;

   PROCEDURE Setup_Ref_Square
   AS
      Loc_Square_Id   NUMBER := 0;
   BEGIN
      FOR Row_No IN 1..8
      LOOP
         FOR Col_No IN 1..8
         LOOP
            Loc_Square_Id := Loc_Square_Id + 1;
            Add_Square(Loc_Square_Id, Row_No, Col_No);
         END LOOP;
      END LOOP;
   EXCEPTION
      WHEN OTHERS THEN
         RAISE_APPLICATION_ERROR(20173, 'ERROR: In SOLVE_PUZZLE.Setup_Ref_Square : ' || Sqlerrm);
   END;

   PROCEDURE Setup_Shapes
   AS
   BEGIN
      -- NONDA
      Add_Shape(1, 0, 0, 'N');
      Add_Shape(1, 1, 0, 'O');
      Add_Shape(1, 1, 1, 'N');
      Add_Shape(1, 1, 2, 'D');
      Add_Shape(1, 2, 2, 'A');

      -- NDROI
      Add_Shape(2, -1,  0, 'N');
      Add_Shape(2,  0, -1, 'D');
      Add_Shape(2,  0,  0, 'R');
      Add_Shape(2,  0,  1, 'O');
      Add_Shape(2,  1,  0, 'I');

      -- SEONZ
      Add_Shape(3, 0, 0, 'S');
      Add_Shape(3, 0, 1, 'E');
      Add_Shape(3, 1, 0, 'O');
      Add_Shape(3, 2, 0, 'N');
      Add_Shape(3, 3, 0, 'Z');

      -- SEAIN
      Add_Shape(4, 0,  0, 'S');
      Add_Shape(4, 1, -1, 'E');
      Add_Shape(4, 1,  0, 'A');
      Add_Shape(4, 2, -2, 'I');
      Add_Shape(4, 2, -1, 'N');

      -- IELOC
      Add_Shape(5, 0, 0, 'I');
      Add_Shape(5, 1, 0, 'E');
      Add_Shape(5, 2, 0, 'L');
      Add_Shape(5, 2, 1, 'O');
      Add_Shape(5, 2, 2, 'C');

      -- ONTI
      Add_Shape(6, 0, 0, 'O');
      Add_Shape(6, 0, 1, 'N');
      Add_Shape(6, 1, 0, 'T');
      Add_Shape(6, 1, 1, 'I');

      -- LNIER
      Add_Shape(7, 0, 0, 'L');
      Add_Shape(7, 1, 0, 'N');
      Add_Shape(7, 2, 0, 'I');
      Add_Shape(7, 3, 0, 'E');
      Add_Shape(7, 4, 0, 'R');

      -- HNDIS
      Add_Shape(8, 0, 0, 'H');
      Add_Shape(8, 0, 1, 'N');
      Add_Shape(8, 1, 1, 'D');
      Add_Shape(8, 2, 0, 'I');
      Add_Shape(8, 2, 1, 'S');

      -- CEONA
      Add_Shape(9, 0,  0, 'C');
      Add_Shape(9, 1,  0, 'E');
      Add_Shape(9, 2, -1, 'O');
      Add_Shape(9, 2,  0, 'N');
      Add_Shape(9, 2,  1, 'A');

      -- TSCLO
      Add_Shape(10, 0,  0, 'T');
      Add_Shape(10, 0,  1, 'S');
      Add_Shape(10, 1, -2, 'C');
      Add_Shape(10, 1, -1, 'L');
      Add_Shape(10, 1,  0, 'O');

      -- DATMI
      Add_Shape(11, 0,  0, 'D');
      Add_Shape(11, 1, -1, 'A');
      Add_Shape(11, 1,  0, 'T');
      Add_Shape(11, 1,  1, 'M');
      Add_Shape(11, 1,  2, 'I');

      -- VEUNE
      Add_Shape(12, 0,  0, 'V');
      Add_Shape(12, 0,  1, 'E');
      Add_Shape(12, 1, -1, 'U');
      Add_Shape(12, 1,  0, 'N');
      Add_Shape(12, 2,  0, 'E');

      -- DOSON
      Add_Shape(13, 0,  0, 'D');
      Add_Shape(13, 1, -1, 'O');
      Add_Shape(13, 1,  0, 'S');
      Add_Shape(13, 2, -1, 'O');
      Add_Shape(13, 2,  0, 'N');
   EXCEPTION
      WHEN OTHERS THEN
         RAISE_APPLICATION_ERROR(20173, 'ERROR: In SOLVE_PUZZLE.Setup_Shapes : ' || Sqlerrm);
   END;

   PROCEDURE Setup_Placements
   AS
      Loc_Placement_Id   NUMBER := 0;
   BEGIN
      FOR Row_Orig IN 1..8
      LOOP
         FOR Col_Orig IN 1..8
         LOOP
            FOR SHP_REC IN (SELECT   Shape_Id,
                                     min(Row_Orig + Row_Offset)    Min_Row_No, max(Row_Orig + Row_Offset)    Max_Row_No,
                                     min(Col_Orig + Column_Offset) Min_Col_No, max(Col_Orig + Column_Offset) Max_Col_No
                            FROM     SHAPE
                            GROUP BY Shape_Id)
            LOOP
               IF    SHP_REC.Min_Row_No Between 1 AND 8  AND SHP_REC.Max_Row_No Between 1 AND 8 
                 AND SHP_REC.Min_Col_No Between 1 AND 8  AND SHP_REC.Max_Col_No Between 1 AND 8 
               THEN
                  Loc_Placement_Id := Loc_Placement_Id + 1;
                  Add_Placement_Id(Loc_Placement_Id, Row_Orig, Col_Orig, SHP_REC.Shape_Id);
               END IF;
            END LOOP;
         END LOOP;
      END LOOP;
   EXCEPTION
      WHEN OTHERS THEN
         RAISE_APPLICATION_ERROR(20173, 'ERROR: In SOLVE_PUZZLE.Setup_Placements : ' || Sqlerrm);
   END;

   PROCEDURE Initialise_Puzzle
   AS
      Loc_Placement_Id   NUMBER := 0;
   BEGIN
      INSERT INTO PUZZLE (Puzzle_Id, Square_Id, Placement_Id, Status)
      SELECT     Distinct 1, S.Square_Id, P.Placement_Id, 'U'
      FROM       REF_SQUARE S
      CROSS JOIN PLACEMENT  P;
      
      UPDATE PUZZLE PU
      SET    Status = 'N'
      WHERE NOT EXISTS (SELECT 1
                        FROM   PLACEMENT PL
                        WHERE  PL.Placement_Id = PU.Placement_Id
                        AND    PL.Square_Id    = PU.Square_Id);
   EXCEPTION
      WHEN OTHERS THEN
         RAISE_APPLICATION_ERROR(20173, 'ERROR: In SOLVE_PUZZLE.Initialise_Puzzle : ' || Sqlerrm);
   END;

/* --------------------------------------------------------- */
   PROCEDURE  Clone_Puzzle(p_From_Puzzle_Id PUZZLE.Puzzle_Id%Type, 
                           p_To_Puzzle_Id   PUZZLE.Puzzle_Id%Type, 
                           p_Placement_Id   PLACEMENT.Placement_Id%Type)
   AS
      Loc_Max_Puzzle_Id   NUMBER;
   BEGIN
       -- Copy PUZZLE rows
       INSERT INTO PUZZLE (Puzzle_Id, Square_Id, Placement_Id, Status)
       SELECT p_To_Puzzle_Id, Square_Id, Placement_Id, Status
       FROM   PUZZLE
       WHERE  Puzzle_Id = p_From_Puzzle_Id;       

       -- Mark  p_Placement_Id as 'Y'
       UPDATE PUZZLE
       SET    Status       = 'Y'
       WHERE  Puzzle_Id    = p_To_Puzzle_Id    
       AND    Placement_Id = p_Placement_Id
       AND    Status       = 'U';       

       -- Mark any other Placement covering same squares as p_Placement_Id as 'N'
       FOR NO_REC IN (SELECT PN.Placement_Id
                      FROM   PLACEMENT PY
                        JOIN PLACEMENT PN ON PN.Square_Id     = PY.Square_Id
                                         AND PN.Placement_Id != PY.Placement_Id
                      WHERE  PY.Placement_Id = p_Placement_Id)
       LOOP
          UPDATE PUZZLE
          SET    Status       = 'N'
          WHERE  Puzzle_Id    = p_To_Puzzle_Id    
          AND    Placement_Id = NO_REC.Placement_Id;       
       END LOOP;

       -- Mark any other Placement covering same shape as p_Placement_Id as 'N'
       FOR NO_REC IN (SELECT PN.Placement_Id
                      FROM   PLACEMENT PY
                        JOIN PLACEMENT PN ON PN.Shape_Id      = PY.Shape_Id
                                         AND PN.Placement_Id != PY.Placement_Id
                      WHERE  PY.Placement_Id = p_Placement_Id)
       LOOP
          UPDATE PUZZLE
          SET    Status       = 'N'
          WHERE  Puzzle_Id    = p_To_Puzzle_Id    
          AND    Placement_Id = NO_REC.Placement_Id;       
       END LOOP;
   EXCEPTION
      WHEN OTHERS THEN
         RAISE_APPLICATION_ERROR(20173, 'ERROR: In SOLVE_PUZZLE.Make_Move : ' || Sqlerrm);
   END;

   PROCEDURE  Make_Move(p_Puzzle_Id PUZZLE.Puzzle_Id%Type, p_Square_Id REF_SQUARE.Square_Id%Type)
   AS
      Loc_Max_Puzzle_Id   PUZZLE.Puzzle_Id%Type;
   BEGIN
       Loc_Max_Puzzle_Id := Get_Max_Puzzle_Id();
       FOR PUZ_REC IN (SELECT Placement_Id
                       FROM   PUZZLE
                       WHERE  Puzzle_Id = p_Puzzle_Id
                       AND    Square_Id = p_Square_Id
                       AND    Status    = 'U')
       LOOP
          Loc_Max_Puzzle_Id := Loc_Max_Puzzle_Id + 1;
          Clone_Puzzle(p_Puzzle_Id, Loc_Max_Puzzle_Id, PUZ_REC.Placement_Id);
       END LOOP;
       Delete_Puzzle(p_Puzzle_Id);
   EXCEPTION
      WHEN OTHERS THEN
         RAISE_APPLICATION_ERROR(20173, 'ERROR: In SOLVE_PUZZLE.Make_Move : ' || Sqlerrm);
   END;

   PROCEDURE Make_Next_Move
   AS
      Loc_Placement_Id   NUMBER := 0;
   BEGIN
       FOR PUZ_REC IN (SELECT Puzzle_Id, Square_Id
                       FROM  (SELECT Puzzle_Id, Square_Id,
                                     Row_Number() OVER (PARTITION BY Puzzle_Id ORDER BY Is_U) RN
                              FROM  V_PUZZLE_SUMMARY
                              WHERE Is_U > 0)
                       WHERE  RN = 1)
       LOOP
          Make_Move(PUZ_REC.Puzzle_Id, PUZ_REC.Square_Id);
       END LOOP;
   EXCEPTION
      WHEN OTHERS THEN
         RAISE_APPLICATION_ERROR(20173, 'ERROR: In SOLVE_PUZZLE.Make_Next_Move : ' || Sqlerrm);
   END;

   PROCEDURE Remove_Invalid_Puzzles
   AS
   BEGIN
       FOR PUZ_REC IN (SELECT Puzzle_Id
                       FROM  V_PUZZLE_SUMMARY
                       WHERE Is_Y = 0
                       AND   Is_U = 0)
       LOOP
          Delete_Puzzle(PUZ_REC.Puzzle_Id);
       END LOOP;
   EXCEPTION
      WHEN OTHERS THEN
         RAISE_APPLICATION_ERROR(20173, 'ERROR: In SOLVE_PUZZLE.Remove_Invalid_Puzzles : ' || Sqlerrm);
   END;

   PROCEDURE Puzzle_Solver
   AS
   BEGIN
      Clear_Puzzle;
      Setup_Ref_Square;
      Setup_Shapes;
      Setup_Placements;
      Initialise_Puzzle;
      WHILE NOT Is_Finished
      LOOP
         Make_Next_Move;
         Remove_Invalid_Puzzles;
      END LOOP;
   EXCEPTION
      WHEN OTHERS THEN
         RAISE_APPLICATION_ERROR(20173, 'ERROR: In SOLVE_PUZZLE.Puzzle_Solver : ' || Sqlerrm);
   END;
END;
/


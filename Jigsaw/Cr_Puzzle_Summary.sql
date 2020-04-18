
CREATE OR REPLACE VIEW V_PUZZLE_SUMMARY
AS
SELECT   Puzzle_Id, Square_Id,
         Sum(Decode(Status, 'Y', 1, 0) ) Is_Y,
         Sum(Decode(Status, 'U', 1, 0) ) Is_U,
         Sum(Decode(Status, 'N', 1, 0) ) Is_N
FROM     PUZZLE
GROUP BY Puzzle_Id, Square_Id
/
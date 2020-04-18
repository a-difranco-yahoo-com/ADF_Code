
CREATE TABLE PUZZLE (
Puzzle_Id       NUMBER      NOT NULL,
Square_Id       NUMBER      NOT NULL,
Placement_Id    NUMBER      NOT NULL,
Status          VARCHAR2(1) NOT NULL)
/


CREATE INDEX IDX_PUZZLE_ID ON PUZZLE (PUZZLE_ID, Placement_Id);
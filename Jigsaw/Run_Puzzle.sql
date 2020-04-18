
DESC PLACEMENT;
DESC PUZZLE;

SELECT * FROM   PUZZLE;
SELECT * FROM PLACEMENT;

SELECT Placement_Id, Shape_ID, count(*)
FROM   PLACEMENT
GROUP BY Placement_Id, Shape_ID
ORDER BY Shape_ID, Placement_Id, Shape_ID
/
SELECT Placement_Id, count(*)
FROM   PLACEMENT
GROUP BY Placement_Id
ORDER BY Placement_Id
/

SELECT *
FROM   PLACEMENT
WHERE  Placement_Id Between 1 and 6
ORDER BY Shape_ID, Placement_Id, Shape_ID
/

SELECT * FROM V_PUZZLE_SUMMARY
ORDER BY Is_Y, Is_U, Square_Id;

SELECT  Puzzle_Id,
        sum(Is_Y) Found,
        min( CASE WHEN Is_U = 0 THEN 999 ELSE Is_U END) Best_Unknown
FROM    V_PUZZLE_SUMMARY
GROUP BY Puzzle_Id
ORDER BY Puzzle_Id
/
SELECT count(*) FROM PUZZLE
/


SELECT 
       RS.Row_Number,
       max(decode(RS.Column_Number, 1, PL.Letter, NULL)) L1,
       max(decode(RS.Column_Number, 2, PL.Letter, NULL)) L2,
       max(decode(RS.Column_Number, 3, PL.Letter, NULL)) L3,
       max(decode(RS.Column_Number, 4, PL.Letter, NULL)) L4,
       max(decode(RS.Column_Number, 5, PL.Letter, NULL)) L5,
       max(decode(RS.Column_Number, 6, PL.Letter, NULL)) L6,
       max(decode(RS.Column_Number, 7, PL.Letter, NULL)) L7,
       max(decode(RS.Column_Number, 8, PL.Letter, NULL)) L8
FROM   PUZZLE     PU
  JOIN PLACEMENT  PL ON PL.Placement_Id = PU.Placement_Id
                    AND PL.Square_Id    = PU.Square_Id
  JOIN REF_SQUARE RS ON RS.Square_Id    = PU.Square_Id
WHERE  Status = 'Y'
GROUP BY RS.Row_Number
ORDER BY RS.Row_Number
/


SELECT Segment_Name, Bytes / (1024 * 1024) Mb
FROM   USER_SEGMENTS
ORDER BY Bytes Desc
/
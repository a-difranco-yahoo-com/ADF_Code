
-- N51� 36.517 W000� 18.683

DROP TABLE HIO_GOLFER         PURGE;
DROP TABLE HIO_HOLE_IN_ONE_ON PURGE;
DROP TABLE HIO_ROUND_PER_WEEK PURGE;
DROP TABLE HIO_HOME           PURGE;
DROP TABLE HIO_SCENARIO       PURGE;
DROP TABLE HIO_COMBINATION    PURGE;

CREATE TABLE HIO_GOLFER         (Golfer  Varchar2(10) );
CREATE TABLE HIO_HOLE_IN_ONE_ON (Hole    Number );
CREATE TABLE HIO_ROUND_PER_WEEK (Rounds  Number );
CREATE TABLE HIO_HOME           (Home    Varchar2(10), Westing NUMBER );

INSERT INTO HIO_GOLFER (Golfer) VALUES ('David');
INSERT INTO HIO_GOLFER (Golfer) VALUES ('Ron');
INSERT INTO HIO_GOLFER (Golfer) VALUES ('Nick');
INSERT INTO HIO_GOLFER (Golfer) VALUES ('Shabbir');

INSERT INTO HIO_HOLE_IN_ONE_ON (Hole) VALUES (4);
INSERT INTO HIO_HOLE_IN_ONE_ON (Hole) VALUES (6);
INSERT INTO HIO_HOLE_IN_ONE_ON (Hole) VALUES (8);
INSERT INTO HIO_HOLE_IN_ONE_ON (Hole) VALUES (10);

INSERT INTO HIO_ROUND_PER_WEEK (Rounds) VALUES (1);
INSERT INTO HIO_ROUND_PER_WEEK (Rounds) VALUES (2);
INSERT INTO HIO_ROUND_PER_WEEK (Rounds) VALUES (3);
INSERT INTO HIO_ROUND_PER_WEEK (Rounds) VALUES (4);

INSERT INTO HIO_HOME (Home, Westing) VALUES ('Northwood', 4);
INSERT INTO HIO_HOME (Home, Westing) VALUES ('Stanmore',  3);
INSERT INTO HIO_HOME (Home, Westing) VALUES ('Edgware',   2);
INSERT INTO HIO_HOME (Home, Westing) VALUES ('Barnet',    1);

CREATE TABLE HIO_SCENARIO
AS
SELECT     *
FROM       HIO_GOLFER
CROSS JOIN HIO_HOLE_IN_ONE_ON
CROSS JOIN HIO_ROUND_PER_WEEK
CROSS JOIN HIO_HOME
/

SELECT * FROM HIO_SCENARIO
/
DELETE FROM HIO_SCENARIO WHERE  Golfer = 'Ron'      AND Hole IN (4, 6);      -- 1b
DELETE FROM HIO_SCENARIO WHERE  Golfer = 'Nick'     AND Rounds = 1;          -- 2b
DELETE FROM HIO_SCENARIO WHERE  Golfer = 'David'    AND Hole IN (4);         -- 3a
DELETE FROM HIO_SCENARIO WHERE  Home   = 'Barnet'   AND Rounds = 4;          -- 4a
DELETE FROM HIO_SCENARIO WHERE  Golfer = 'Nick'     AND Home   = 'Stanmore'; -- 5a
DELETE FROM HIO_SCENARIO WHERE  Golfer = 'Nick'     AND Hole IN (8);         -- 5b


CREATE TABLE HIO_COMBINATION
AS
SELECT 
       D.Golfer David,   D.Hole David_Hole,   D.Rounds David_Rounds,   D.Home David_Home,   D.Westing David_Westing,
       R.Golfer Ron,     R.Hole Ron_Hole,     R.Rounds Ron_Rounds,     R.Home Ron_Home,     R.Westing Ron_Westing,
       N.Golfer Nick,    N.Hole Nick_Hole,    N.Rounds Nick_Rounds,    N.Home Nick_Home,    N.Westing Nick_Westing,
       S.Golfer Shabbir, S.Hole Shabbir_Hole, S.Rounds Shabbir_Rounds, S.Home Shabbir_Home, S.Westing Shabbir_Westing
FROM   HIO_SCENARIO D
  JOIN HIO_SCENARIO R ON R.Golfer = 'Ron'
  JOIN HIO_SCENARIO N ON N.Golfer = 'Nick'
  JOIN HIO_SCENARIO S ON S.Golfer = 'Shabbir'
WHERE  D.Golfer = 'David'
AND    D.Hole NOT IN (R.Hole, N.Hole, S.Hole) 
AND    R.Hole NOT IN (N.Hole, S.Hole) 
AND    N.Hole NOT IN (S.Hole) 
--
AND    D.Rounds NOT IN (R.Rounds, N.Rounds, S.Rounds) 
AND    R.Rounds NOT IN (N.Rounds, S.Rounds) 
AND    N.Rounds NOT IN (S.Rounds) 
--
AND    D.Home NOT IN (R.Home, N.Home, S.Home) 
AND    R.Home NOT IN (N.Home, S.Home) 
AND    N.Home NOT IN (S.Home) 
/
SELECT * FROM  HIO_COMBINATION
/

SELECT Distinct David_Westing, Ron_Westing FROM  HIO_COMBINATION;
DELETE FROM  HIO_COMBINATION WHERE David_Westing <= Ron_Westing + 1;  -- 1a

SELECT Distinct Ron_Rounds, Shabbir_Rounds FROM  HIO_COMBINATION;
DELETE FROM  HIO_COMBINATION WHERE Ron_Rounds  <  Shabbir_Rounds;   -- 1c

SELECT Distinct Nick_Westing, David_Rounds,  David_Westing    FROM HIO_COMBINATION WHERE David_Rounds   = 1;
SELECT Distinct Nick_Westing, Ron_Rounds,    Ron_Westing      FROM HIO_COMBINATION WHERE Ron_Rounds     = 1;
SELECT Distinct Nick_Westing, Shabbir_Rounds, Shabbir_Westing FROM HIO_COMBINATION WHERE Shabbir_Rounds = 1;

DELETE FROM  HIO_COMBINATION WHERE David_Rounds   = 1 AND abs(Nick_Westing - David_Westing)   = 1;  -- 2b
DELETE FROM  HIO_COMBINATION WHERE Ron_Rounds     = 1 AND abs(Nick_Westing - Ron_Westing)     = 1;  -- 2b
DELETE FROM  HIO_COMBINATION WHERE Shabbir_Rounds = 1 AND abs(Nick_Westing - Shabbir_Westing) = 1;  -- 2b

SELECT Distinct David_Westing, Nick_Hole,    Nick_Westing    FROM  HIO_COMBINATION WHERE Nick_Hole    = 4;
SELECT Distinct David_Westing, Ron_Hole,     Ron_Westing     FROM  HIO_COMBINATION WHERE Ron_Hole     = 4;
SELECT Distinct David_Westing, Shabbir_Hole, Shabbir_Westing FROM  HIO_COMBINATION WHERE Shabbir_Hole = 4;

DELETE FROM  HIO_COMBINATION WHERE Ron_Hole     = 4 AND David_Westing - Ron_Westing     <= 1;  -- 3b
DELETE FROM  HIO_COMBINATION WHERE Nick_Hole    = 4 AND David_Westing - Nick_Westing    <= 1;  -- 3b
DELETE FROM  HIO_COMBINATION WHERE Shabbir_Hole = 4 AND David_Westing - Shabbir_Westing <= 1;  -- 3b

SELECT Distinct Nick_Westing, David_Hole,   David_Westing   FROM  HIO_COMBINATION WHERE David_Hole   = 8;
SELECT Distinct Nick_Westing, Ron_Hole,     Ron_Westing     FROM  HIO_COMBINATION WHERE Ron_Hole     = 8;
SELECT Distinct Nick_Westing, Shabbir_Hole, Shabbir_Westing FROM  HIO_COMBINATION WHERE Shabbir_Hole = 8;

DELETE FROM  HIO_COMBINATION WHERE David_Hole   = 8 AND Nick_Westing - David_Westing   != 1;  -- 5c
DELETE FROM  HIO_COMBINATION WHERE Ron_Hole     = 8 AND Nick_Westing - Ron_Westing     != 1;  -- 5c
DELETE FROM  HIO_COMBINATION WHERE Shabbir_Hole = 8 AND Nick_Westing - Shabbir_Westing != 1;  -- 5c

SELECT 
       CASE WHEN David_Hole   = 4 THEN 'David'
            WHEN Ron_Hole     = 4 THEN 'Ron'
            WHEN Nick_Hole    = 4 THEN 'Nick'
            WHEN Shabbir_Hole = 4 THEN 'Shabbir'
            ELSE 'ERROR' END Hole_In_4,
       CASE WHEN David_Hole   = 4 THEN David_Westing
            WHEN Ron_Hole     = 4 THEN Ron_Westing
            WHEN Nick_Hole    = 4 THEN Nick_Westing
            WHEN Shabbir_Hole = 4 THEN Shabbir_Westing
            END Hole_In_4_Westing,
       CASE WHEN David_Hole   = 10 THEN 'David'
            WHEN Ron_Hole     = 10 THEN 'Ron'
            WHEN Nick_Hole    = 10 THEN 'Nick'
            WHEN Shabbir_Hole = 10 THEN 'Shabbir'
            ELSE 'ERROR' END Hole_In_10,
       CASE WHEN David_Hole   = 10 THEN David_Westing
            WHEN Ron_Hole     = 10 THEN Ron_Westing
            WHEN Nick_Hole    = 10 THEN Nick_Westing
            WHEN Shabbir_Hole = 10 THEN Shabbir_Westing
            END Hole_In_10_Westing
FROM  HIO_COMBINATION
/
DELETE FROM  HIO_COMBINATION  -- 6a
WHERE abs(CASE WHEN David_Hole   = 4 THEN David_Westing
               WHEN Ron_Hole     = 4 THEN Ron_Westing
               WHEN Nick_Hole    = 4 THEN Nick_Westing
               WHEN Shabbir_Hole = 4 THEN Shabbir_Westing
               END -
          CASE WHEN David_Hole   = 10 THEN David_Westing
               WHEN Ron_Hole     = 10 THEN Ron_Westing
               WHEN Nick_Hole    = 10 THEN Nick_Westing
               WHEN Shabbir_Hole = 10 THEN Shabbir_Westing
               END ) = 1
/


/*
xx 1a. David lives west of, but not immediately next to, the place where Ron lives.
xx 1b. Ron didn't get a hole in one on the 4th or the 6th
xx 1c  Ron practices more than Shabbir.

xx 2a. Nick isn't the one who only practices once per week
xx 2b  Nick does not live immediately next to the golfer who practices once a week.

xx  3a. Hole in one on the 4th is not David.
xx  3b. Hole in one on the 4th lives east of, but not immediately next to, the place occupied by David.

xx 4a. Barnet isn't the place occupied by the person who practices most frequently.

xx 5a. Nick doesn't live in Stanmore.
xx 5b. Nick is not the golfer who got a hole in one on the 8th.
xx 5c. Nick actually lives in the next town due west of the one occupied by Hole in one on the 8th.

xx 6a. Hole in one on the 10th doesn't live immediately next to Hole in one on the 4th.

*/
SELECT * FROM DBA_DIRECTORIES;

Create Or Replace Directory EXPDP_DIR as 'E:\My Dropbox\Dropbox\MyBackup';

SELECT Time_Remaining, Message FROM V$Session_Longops WHERE Time_Remaining > 0;
SELECT * FROM V$SEssion WHERE Username IS NOT NULL;
ALTER SYSTEM KILL SESSION '371,	51460'; 
SELECT * FROM V$SQLAREA;

SELECT * FROM GEOCACHE_BY_DAY;

SELECT sum(Caches)     FROM GEOCACHE_BY_DAY   ;
SELECT sum(Days_Found) FROM V_GEOCACHE_TO_FIND_BY_MONTH   ;

SELECT * FROM    V_GEOCACHE_BY_MONTH;
SELECT * FROM    V_GEOCACHE_BY_DAY_OF_MONTH Order By  2 Desc;
SELECT * FROM    V_GEOCACHE_TO_FIND_BY_MONTH;


Create Or Replace Function Checksum(p_Number NUMBER)
    RETURN NUMBER
AS
  Loc_Number   NUMBER := p_number;
  Loc_Checksum NUMBER := 0;
BEGIN
   while Loc_Number > 9
   Loop
       Loc_Checksum := Loc_Checksum + mod(Loc_Number, 10);
       Loc_Number   := floor(Loc_Number / 10);
   End Loop;
   
   Return Loc_Checksum + Loc_Number; 
END;
/


SELECT Owner, Segment_Name, Bytes / (1024 * 1024) Mb
FROM   DBA_SEGMENTS
WHERE  Owner != 'SYS'
AND    Segment_Name Like '%QUAG%'
ORDER BY Bytes Desc
/

SELECT   Tablespace_Name, sum(Bytes) / (1024 * 1024)
FROM     DBA_FREE_SPACE
GROUP BY Tablespace_Name
/



SELECT Word
FROM   DICTIONARY.Word_List
WHERE  length(Word) = 8
AND    Word Like '%T%'
AND    Word Like '%A%'
AND    Word Like '%K%'
AND    Word Like '%E%'
AND    Word Like '%N%'
AND    Word Like '%B%'
AND    Word Like '%U%'
AND    Word Like '%M%'
;

drop table DARTS_PL Purge;

CREATE TABLE DARTS_PL ( 
YEAR NUMBER,
ROUND VARCHAR2(2),
PLAYER_H VARCHAR2(50),
SCORE_H NUMBER,
SCORE_A NUMBER,
PLAYER_A VARCHAR2(50))
/
SELECT Player_H FROM DARTS_PL
UNION
SELECT Player_A FROM DARTS_PL
/


SELECT Player,
       sum(Decode(Score, 'W', 1, 0)) Ws,
       sum(Decode(Score, 'D', 1, 0)) Ds,
       sum(Decode(Score, 'L', 1, 0)) Ls
FROM  (
        SELECT Player_H Player, 
               CASE WHEN Score_H > Score_A THEN 'W'
                    WHEN Score_H = Score_A THEN 'D'
                                           ELSE 'L'
                    END Score
        FROM   DARTS_PL
        UNION ALL
        SELECT Player_A, 
               CASE WHEN Score_A > Score_H THEN 'W'
                    WHEN Score_A = Score_H THEN 'D'
                                           ELSE 'L'
                    END Score
        FROM   DARTS_PL
       ) 
GROUP BY Player
ORDER BY Ws - Ds Desc
/

SELECT Year, Player,
       Count(1) Played,
       sum(CASE WHEN F > A THEN 1 ELSE 0 END) W,
       sum(CASE WHEN F = A THEN 1 ELSE 0 END) D,
       sum(CASE WHEN F < A THEN 1 ELSE 0 END) L,
       sum(F) F, sum(A) A,
       sum(CASE WHEN F > A THEN 2
                WHEN F = A THEN 1 ELSE 0 END) Pts
FROM  (
        SELECT Year, Player_H Player, Score_H F, Score_A A  FROM   DARTS_PL WHERE (Score_H + Score_A) > 0 AND Round Not Like '%F'
        UNION ALL
        SELECT Year, Player_A Player, Score_A F, Score_H A  FROM   DARTS_PL WHERE (Score_H + Score_A) > 0 AND Round Not Like '%F'
       ) 
WHERE    Year = 2018
GROUP BY Year, Player
ORDER BY Year, Pts Desc, F - A Desc
/

SELECT *
FROM   DARTS_PL
WHERE  ROUND = 'F'
ORDER BY Year
/

SELECT * FROM   ALL_TABLES;
SELECT * FROM   ALL_USERS Where User_ID between 112 AND 1000 Order By Created Desc;

SELECT count(*)
FROM  (
WITH StartPoint AS (SELECT Rownum X FROM ALL_OBJECTS WHERE Rownum <= 15)
SELECT *
FROM   StartPoint S1
  JOIN StartPoint S2  ON (2  > 5 AND S2.X  = 15) OR (2  <= 5 AND S2.X  > S1.X)
  JOIN StartPoint S3  ON (3  > 5 AND S3.X  = 15) OR (3  <= 5 AND S3.X  > S2.X)
  JOIN StartPoint S4  ON (4  > 5 AND S4.X  = 15) OR (4  <= 5 AND S4.X  > S3.X)
  JOIN StartPoint S5  ON (5  > 5 AND S5.X  = 15) OR (5  <= 5 AND S5.X  > S4.X)
  JOIN StartPoint S6  ON (6  > 5 AND S6.X  = 15) OR (6  <= 5 AND S6.X  > S5.X)
  JOIN StartPoint S7  ON (7  > 5 AND S7.X  = 15) OR (7  <= 5 AND S7.X  > S6.X)
  JOIN StartPoint S8  ON (8  > 5 AND S8.X  = 15) OR (8  <= 5 AND S8.X  > S7.X)
  JOIN StartPoint S9  ON (9  > 5 AND S9.X  = 15) OR (9  <= 5 AND S9.X  > S8.X)
  JOIN StartPoint S10 ON (10 > 5 AND S10.X = 15) OR (10 <= 5 AND S10.X > S9.X)
  JOIN StartPoint S11 ON (11 > 5 AND S11.X = 15) OR (11 <= 5 AND S11.X > S10.X)
  JOIN StartPoint S12 ON (12 > 5 AND S12.X = 15) OR (12 <= 5 AND S12.X > S11.X)
  JOIN StartPoint S13 ON (13 > 5 AND S13.X = 15) OR (13 <= 5 AND S13.X > S12.X)
  JOIN StartPoint S14 ON (14 > 5 AND S14.X = 15) OR (14 <= 5 AND S14.X > S13.X)
  JOIN StartPoint S15 ON (15 > 5 AND S15.X = 15) OR (15 <= 5 AND S15.X > S14.X)
)
/

SELECT * FROM V$SESSION WHERE Username Is Not NULL;
ALTER SYSTEM KILL SESSION '244,	14850';

SELECT Sysdate + (Time_Remaining/ (60 * 60 * 24) ) ETA, Time_Remaining, username, Message 
FROM V$Session_Longops 
WHERE Time_Remaining > 0 
order by 1;
SELECT S.Username, S.SQL_ID, T.SQL_Text
FROM   V$Session S
  JOIN V$Sqlarea T ON T.Sql_Id = S.Sql_Id
/

SELECT
  (1000 - 960) -- Paddington Dare (W London)
+ (1000 - 850) -- 16th Century Pub (Central London)
+ (1000 - 672) -- Reflections of Neal's Yard
+ (1000 - 606) -- The Palace of Westminster (Houses of Parliament)
+ (1000 - 509) -- The Winchester Geese
+ (1000 - 473) -- Last Delivery (London)
+ (1000 - 416) -- Under the boardwalk (SE1, London)
-- + (1000 - 396) -- Catastrophe, Calamity, Cataclysm Part 3
-- + (1000 - 392) -- Gibbon's Rent
       Required
FROM DUAL
/
-- 2514

SELECT * FROM DBA_DIRECTORIES;

Create Or Replace Directory EXPDP_DIR as 'E:\My Dropbox\Dropbox\MyBackup';

SELECT Time_Remaining, Message FROM V$Session_Longops WHERE Time_Remaining > 0;
SELECT * FROM V$SEssion WHERE Username IS NOT NULL;
ALTER SYSTEM KILL SESSION '392,	61899'; 
SELECT * FROM V$SQLAREA;

SELECT * FROM GEOCACHE_BY_DAY;

SELECT sum(Caches)     FROM GEOCACHE_BY_DAY   ;
SELECT sum(Days_Found) FROM V_GEOCACHE_TO_FIND_BY_MONTH   ;

SELECT * FROM    V_GEOCACHE_BY_MONTH;
SELECT * FROM    V_GEOCACHE_BY_DAY_OF_MONTH Order By  2 Desc;
SELECT * FROM    V_GEOCACHE_TO_FIND_BY_MONTH;
SELECT * FROM    GEO_CACHE_RUN_REPORT;


SELECT
  (1000 - 883) -- 16th Century Pub (Central London)
+ (1000 - 689) -- Reflections of Neal's Yard
+ (1000 - 633) -- The Palace of Westminster (Houses of Parliament)
+ (1000 - 519) -- The Winchester Geese
+ (1000 - 481) -- Last Delivery (London)
+ (1000 - 426) -- Under the boardwalk (SE1, London)
-- + (1000 - 411) -- Catastrophe, Calamity, Cataclysm Part 3
-- + (1000 - 393) -- Gibbon's Rent
       Required
FROM DUAL
/
-- 2369

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
AND    Segment_Name Like '%KC%'
ORDER BY Bytes Desc
/

SELECT   Tablespace_Name, sum(Bytes) / (1024 * 1024 * 1024) Gb
FROM     DBA_FREE_SPACE
GROUP BY Tablespace_Name
/

SELECT * FROM   ALL_TABLES;
SELECT * FROM   ALL_USERS Where User_ID between 112 AND 1000 Order By Created Desc;


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

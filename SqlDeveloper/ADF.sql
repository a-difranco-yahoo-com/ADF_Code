
SELECT * FROM DBA_DIRECTORIES;

Create Or Replace Directory EXPDP_DIR as 'E:\My Dropbox\Dropbox\MyBackup';

SELECT Time_Remaining, Message FROM V$Session_Longops WHERE Time_Remaining > 0;
SELECT * FROM V$SEssion WHERE Username IS NOT NULL;
ALTER SYSTEM KILL SESSION '388,	48841'; 
SELECT * FROM V$SQLAREA;

SELECT * FROM GEOCACHE_BY_DAY;

SELECT sum(Caches)     FROM GEOCACHE_BY_DAY   ;
SELECT sum(Days_Found) FROM V_GEOCACHE_TO_FIND_BY_MONTH   ;

SELECT * FROM    V_GEOCACHE_BY_MONTH;
SELECT * FROM    V_GEOCACHE_BY_DAY_OF_MONTH Order By  2 Desc;
SELECT * FROM    V_GEOCACHE_TO_FIND_BY_MONTH;
SELECT Month, Day_Of_Month FROM    GEO_CACHES_ORDERED WHERE Got_Cache = 'N' Order By Day_No;


SELECT
  (1000 - 972) -- 16th Century Pub (Central London)
+ (1000 - 768) -- Tower Bridge TB HOTEL
+ (1000 - 740) -- Reflections of Neal's Yard
+ (1000 - 684) -- The Palace of Westminster (Houses of Parliament)
-- + (1000 - 565) -- The Winchester Geese
-- + (1000 - 536) -- Gibbon's Rent
-- + (1000 - 495) -- Last Delivery (London)
       Required
FROM DUAL
/
SELECT to_char(Sysdate + 836, 'DD-MON-YYYY') FROM DUAL;

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
SELECT * FROM   DBA_USERS Where Account_Status Not Like '%LOCKED%' AND Username Not Like '%SYS%';
SELECT * FROM   DBA_USERS Where Account_Status  Like '%GRACE%' AND Username Not Like '%SYS%';
SELECT 'ALTER USER ' || Username || ' ACCOUNT UNLOCK;' FROM   DBA_USERS Where Account_Status Not Like '%LOCKED%' AND Username Not Like '%SYS%';
ALTER PROFILE "DEFAULT" LIMIT PASSWORD_VERIFY_FUNCTION NULL;

Alter user ADF identified by 'Sam5Par2'  account unlock;


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


SELECT * FROM DBA_DIRECTORIES;

Create Or Replace Directory EXPDP_DIR as 'E:\My Dropbox\Dropbox\MyBackup';

SELECT Time_Remaining, Message FROM V$Session_Longops WHERE Time_Remaining > 0;
SELECT * FROM V$SEssion WHERE Username IS NOT NULL;
ALTER SYSTEM KILL SESSION '143,	24110'; 
SELECT * FROM V$SQLAREA;



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


SELECT Owner, Segment_Name, Bytes / (1024 * 1024) Mb, Extents
FROM   DBA_SEGMENTS
WHERE  Owner != 'SYS'
AND    Segment_Name Like '%MAGNETISM%'
ORDER BY Bytes Desc
/
SELECT * FROM DBA_SEGMENTS;

-- MAGNETISM_BCDEFGJ	537.375
-- MAGNETISM_DEGJ	    184
-- MAGNETISM_ABCDEFGJ	112.1875
-- MAGNETISM_BCDEGJ	    97.625
-- MAGNETISM_BDEGJ	    89.1875
-- MAGNETISM_TIMING	    77.5

alter table "GEOCACHE_SOLVER"."MAGNETISM_BDEGJ" enable row movement;
alter table "GEOCACHE_SOLVER"."MAGNETISM_ABCDEFGHJ" shrink space cascade;
alter table "GEOCACHE_SOLVER"."MAGNETISM_ABCDEFGJ"  shrink space cascade;
alter table "GEOCACHE_SOLVER"."MAGNETISM_BCDEFGJ"   shrink space cascade;
alter table "GEOCACHE_SOLVER"."MAGNETISM_BCDEGJ"    shrink space cascade;
alter table "GEOCACHE_SOLVER"."MAGNETISM_BDEGJ"     shrink space cascade;
alter table "GEOCACHE_SOLVER"."MAGNETISM_TIMING"    shrink space cascade;


SELECT to_char(Start_Time, 'YYYYMM'), count(*), sum(rows_inserted), Sum(rows_deleted)
FROM   GEOCACHE_SOLVER.MAGNETISM_TIMING
GROUP BY to_char(Start_Time, 'YYYYMM')
ORDER BY count(*)
/
DELETE FROM   GEOCACHE_SOLVER.MAGNETISM_TIMING
WHERE  to_char(Start_Time, 'YYYYMM') = '202003'
/


SELECT   Tablespace_Name, sum(Bytes) / (1024 * 1024 * 1024) Gb
FROM     DBA_FREE_SPACE
GROUP BY Tablespace_Name
/

/*

SELECT * FROM   ALL_TABLES;
SELECT * FROM   ALL_USERS Where User_ID between 112 AND 1000 Order By Created Desc;
SELECT * FROM   DBA_USERS Where Account_Status Not Like '%LOCKED%' AND Username Not Like '%SYS%';
SELECT * FROM   DBA_USERS Where Account_Status  Like '%GRACE%' AND Username Not Like '%SYS%';
SELECT 'ALTER USER ' || Username || ' ACCOUNT UNLOCK;' FROM   DBA_USERS Where Account_Status Not Like '%LOCKED%' AND Username Not Like '%SYS%';
ALTER PROFILE "DEFAULT" LIMIT PASSWORD_VERIFY_FUNCTION NULL;

Alter user ADF identified by 'Sam5Par2'  account unlock;


*/

SELECT * FROM V$SESSION WHERE Username Is Not NULL;
ALTER SYSTEM KILL SESSION '13,	27735';

SELECT Sysdate + (Time_Remaining/ (60 * 60 * 24) ) ETA, Time_Remaining, username, Message 
FROM V$Session_Longops 
WHERE Time_Remaining > 0 
order by 1
/
SELECT S.Username, S.SQL_ID, T.* -- T.SQL_Text
FROM   V$Session S
  JOIN V$Sqlarea T ON T.Sql_Id = S.Sql_Id
/
SELECT * FROM GEOCACHE_SOLVER.MAGNETISM_ROWS;

SELECT * FROM GEOCACHE_SOLVER.MAGNETISM_TIMING Order By Start_Time Desc, End_Time desc;
SELECT Procedure_Name, 
       round(avg(End_Time - Start_Time) * (24 * 60 * 60), 1) Avg_Seconds, 
       round(min(End_Time - Start_Time) * (24 * 60 * 60), 1) Min_Seconds, 
       round(max(End_Time - Start_Time) * (24 * 60 * 60), 1) Max_Seconds, 
       round(avg(Rows_Inserted), 1) Avg_Inserted, 
       round(avg(Rows_Deleted),  1) Avg_Deleted, 
       Count(*)
FROM GEOCACHE_SOLVER.MAGNETISM_TIMING
GROUP By  Procedure_Name;

   UPDATE GEOCACHE_SOLVER.MAGNETISM_STOP SET Stop_Date = sysdate;
   COMMIT;

-- 0	0	104524	2713774	1021638	2313530	3905002	209723	1228352	0

/

SELECT   Tablespace_Name, sum(Bytes) / (1024 * 1024 * 1024) Gb
GROUP BY Tablespace_Name
/

SELECT CLIENT_NAME, STATUS
FROM   DBA_AUTOTASK_CLIENT
--WHERE  CLIENT_NAME = 'auto optimizer stats collection';
/

BEGIN
   DBMS_AUTO_TASK_ADMIN.DISABLE(client_name => 'auto optimizer stats collection', operation => NULL, window_name => NULL);
   DBMS_AUTO_TASK_ADMIN.DISABLE(client_name => 'auto space advisor',              operation => NULL, window_name => NULL);
   DBMS_AUTO_TASK_ADMIN.DISABLE(client_name => 'sql tuning advisor',              operation => NULL, window_name => NULL);
END;
/
SELECT * FROM V$SESSION WHERE Username Is Not NULL;
ALTER SYSTEM KILL SESSION '244,	14850';

BEGIN
   DBMS_AUTO_TASK_ADMIN.ENABLE(client_name => 'auto optimizer stats collection', operation => NULL, window_name => NULL);
   DBMS_AUTO_TASK_ADMIN.ENABLE(client_name => 'auto space advisor',              operation => NULL, window_name => NULL);
   DBMS_AUTO_TASK_ADMIN.ENABLE(client_name => 'sql tuning advisor',              operation => NULL, window_name => NULL);
END;
/

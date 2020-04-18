
SELECT * FROM DBA_DIRECTORIES;

Create Or Replace Directory EXPDP_DIR as 'E:\My Dropbox\Dropbox\MyBackup';

SELECT sum(Caches)      FROM GEOCACHE_BY_DAY   ;
SELECT Caches, Count(*)      FROM GEOCACHE_BY_DAY GROUP BY Caches ORDER BY Caches;
SELECT * FROM    V_GEOCACHE_BY_MONTH;
SELECT * FROM    V_GEOCACHE_BY_DAY_OF_MONTH Order By  2 Desc;
SELECT * FROM    GEOCACHE_BY_DAY;

SELECT Star_Level, to_char(Sum(ISO_Needed), '9,999,999') ISO_Needed FROM PUZZLE_QUEST GROUP BY Star_Level;

SELECT
+ (1000 - 958) -- Tower Bridge TB HOTEL
+ (1000 - 768) -- Reflections of Neal's Yard
+ (1000 - 727) -- The Palace of Westminster (Houses of Parliament)
-- + (1000 - 679) -- Gibbon's Rent
-- + (1000 - 609) -- The Winchester Geese
-- + (1000 - 559) -- Platform 9 3/4
-- + (1000 - 516) -- Last Delivery (London)
-- + (1000 - 445) -- Space Invader (NOT 24/7. TB Hotel)
       Required
FROM DUAL
/
SELECT to_char(Sysdate + 547, 'DD-MON-YYYY') FROM DUAL;

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

Dragons12Zebre39

SELECT Owner, Segment_Name, Bytes / (1024 * 1024) Mb
FROM   DBA_SEGMENTS
WHERE  Owner != 'SYS'
AND    Segment_Name Not Like '%MAGNETISM%'
ORDER BY Bytes Desc
/
SELECT Owner, sum(Bytes) / (1024 * 1024) Mb
FROM   DBA_SEGMENTS
WHERE  Owner != 'SYS'
AND    Segment_Name Not Like '%MAGNETISM%'
GROUP BY Owner
ORDER BY 2 Desc
/


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

-- 0	0	141412	3486775	1020053	1448554	4427584	3252899	1369270	0
-- 0	0	141412	1702168	1094354	1316594	3509742	1777772	0	0

/

SELECT   Tablespace_Name, sum(Bytes) / (1024 * 1024 * 1024) Gb
FROM     DBA_FREE_SPACE
GROUP BY Tablespace_Name
/


SELECT * FROM DBA_SCHEDULER_JOBS ;

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

BEGIN
   DBMS_AUTO_TASK_ADMIN.ENABLE(client_name => 'auto optimizer stats collection', operation => NULL, window_name => NULL);
   DBMS_AUTO_TASK_ADMIN.ENABLE(client_name => 'auto space advisor',              operation => NULL, window_name => NULL);
   DBMS_AUTO_TASK_ADMIN.ENABLE(client_name => 'sql tuning advisor',              operation => NULL, window_name => NULL);
END;
/

WITH DIGITS AS (SELECT Rownum X FROM ALL_OBJECTS WHERE RowNum <= 7)
SELECT Rownum, A.x, B.x, C.x, D.x, E.x, F.x, G.x
FROM   DIGITS A
  JOIN DIGITS B ON B.X NOT IN (A.X)
  JOIN DIGITS C ON C.X NOT IN (A.X, B.X)
  JOIN DIGITS D ON D.X NOT IN (A.X, B.X, C.X)
  JOIN DIGITS E ON E.X NOT IN (A.X, B.X, C.X, D.X)
  JOIN DIGITS F ON F.X NOT IN (A.X, B.X, C.X, D.X, E.X)
  JOIN DIGITS G ON G.X NOT IN (A.X, B.X, C.X, D.X, E.X, F.X)
WHERE  (A.X + B.X + C.X) = (D.X + E.X + F.X)
AND    (A.X + B.X + C.X) = (C.X + D.X + G.X)

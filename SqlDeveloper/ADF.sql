

SELECT Time_Remaining, Message FROM V$Session_Longops WHERE Time_Remaining > 0;
SELECT * FROM V$SEssion;


SELECT * FROM GEOCACHE_BY_DAY;

SELECT sum(Caches)     FROM GEOCACHE_BY_DAY   ;
SELECT sum(Days_Found) FROM V_GEOCACHE_TO_FIND_BY_MONTH   ;

SELECT * FROM    V_GEOCACHE_BY_MONTH;
SELECT * FROM    V_GEOCACHE_BY_DAY_OF_MONTH;
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
AND    Segment_Name Like '%SFA%'
ORDER BY Bytes Desc
/

SELECT   Tablespace_Name, sum(Bytes) / (1024 * 1024)
FROM     DBA_FREE_SPACE
GROUP BY Tablespace_Name
/


SELECT Sysdate + (Time_Remaining/ (60 * 60 * 24) ) ETA, Time_Remaining, Message FROM V$Session_Longops WHERE Time_Remaining > 0 order by 1;
SELECT S.Username, T.SQL_Text
FROM   V$Session S
  JOIN V$Sqlarea T ON T.Sql_Id = S.Sql_Id;


--interpret vital telexes
-- nrpr

Drop   Table GC_IVT Purge;
Create Table GC_IVT
AS
SELECT   Distinct Word, length(Word) Word_Length
FROM     DICTIONARY.Word_List
WHERE    length(Word) IN (5, 7, 9)
AND      translate(Word, 'xINTERPRETVITALTELEXES', 'x') IS NULL
/

Drop   Table GC_IVT_ANSWER Purge
/
Create Table GC_IVT_ANSWER
AS
SELECT *
FROM  (
SELECT L7.Word W7, L5.Word W5, L9.Word W9, L7.Word || L5.Word || L9.Word Word 
FROM   GC_IVT L9
  JOIN GC_IVT L5 ON L5.Word_Length = 5
  JOIN GC_IVT L7 ON L7.Word_Length = 7
WHERE  L9.Word_Length = 9
)
WHERE  Word Like '%X%'
AND    Word Like '%V%'
AND    Word Like '%P%'
AND    Word Like '%L%L%'
AND    Word Like '%N%'
AND    Word Like '%A%'
AND    Word Like '%S%'
AND    Word Like '%I%I%'
AND    Word Like '%R%R%'
AND    Word Like '%T%T%T%T%'
AND    Word Like '%E%E%E%E%E%'
/
Select * FROM GC_IVT_ANSWER
Order By W7
/

SELECT Word
FROM   DICTIONARY.Word_List
WHERE  length(Word) = 8
AND    Word Like '%B%'
AND    Word Like '%K%'
AND    Word Like '%P%'
AND    Word Like '%S%'
AND    Word Like '%O%O%O%'
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
GROUP BY Year, Player
ORDER BY Year, Pts Desc, F - A Desc
/

SELECT *
FROM   DARTS_PL
WHERE  ROUND = 'F'
ORDER BY Year
/



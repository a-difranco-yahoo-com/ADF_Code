


SELECT Time_Remaining, Message FROM V$Session_Longops WHERE Time_Remaining > 0;
SELECT * FROM SYS.V$Session;

--------------------------------------------------------
--  DDL for Table MISSING_DIGITAL_COMIC
--------------------------------------------------------


Create Or Replace View Missed_Issue_Mini_Series
AS
/
SELECT Distinct Title, Volume, Low_Issue, high_issue, high_series_run
FROM   MISSING_DIGITAL_COMIC
WHERE  Low_series_run  Is Not Null
AND    High_series_run Is Not Null
AND NOT (Title  = 'B.P.R.D._ Hell on Earth - The Return of the Master' 
     AND Volume = 2012  AND Low_Issue = 2 AND High_Issue = 100)
ORDER BY Title, Volume;

SELECT sin(45) FROM DUAL;


BEGIN
   COMICS.Rebuild_Missing_Single_Issue;
   COMICS.Rebuild_Missing_Sub_Issue;
   COMICS.Rebuild_Missing_Mini_Series;
END;
/

BEGIN
COMICS.parse_pull_list;
COMICS.Set_ComicId;
END;
/
BEGIN
COMICS.Find_High_Pull_Matches(80);
END;
/

BEGIN
  COMICS.Update_Matched_Comics;
  COMICS.Find_Got_New_Issuees;
END;
/
BEGIN
  COMICS.Update_New_Comics;
  COMICS.Update_Got_Comics;
  COMICS.Update_Digital_Comics;
  COMICS.Update_BackIssue_Comics;
  COMICS.Update_OneShots_Comics;
  COMICS.Update_BackIssue_Pull;
  COMICS.Update_Digital_Pull;
END;
/


SELECT Title, Volume, Year, Issue, Count(*)
FROM   New_Digital_comic
GROUP BY Title, Volume, Year, Issue
HAVING Count(*) > 1
ORDER BY Title, Volume, Year, Issue

/
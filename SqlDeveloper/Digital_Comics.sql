
SELECT Time_Remaining, Message FROM V$Session_Longops WHERE Time_Remaining > 0;
SELECT * FROM SYS.V$Session;

--------------------------------------------------------
--  DDL for Table MISSING_DIGITAL_COMIC
--------------------------------------------------------

BEGIN
   COMICS.parse_pull_list;
   COMICS.Set_ComicId;
END;
/
BEGIN
   COMICS.Find_Pull_Matches(80);
   COMICS.Find_Wish_Matches;
END;
/

BEGIN
  COMICS.Update_Matched_Pull_List;
  COMICS.Update_Matched_Wish_List;
  COMICS.Find_Got_New_Issues;
END;
/
BEGIN
  COMICS.Update_New_Comics;
  COMICS.Update_Got_Comics;
  COMICS.Update_OneShots_Comics;
  COMICS.Update_BackIssue_Comics;
  COMICS.Update_Digital_Comics;
  COMICS.Update_Digital_Pull;
  COMICS.Update_WishList_Pull;
END;
/

 
BEGIN
   COMICS.Rebuild_Summary;
   COMMIT;
END;
/

DEFINE Text="%Prome%"
SELECT * FROM V_DIGITAL_RUN_DETAIL      WHERE upper(Title) Like upper('%&&Text%') Order By Volume,Title,Start_Issue;
SELECT * FROM V_DIGITAL_WISH_RUN_DETAIL WHERE Title Like '%&&Text%' Order By Title;

SELECT * FROM V_DIGITAL_MULTI_RUN_DETAIL;
SELECT * FROM V_DIGITAL_ALL_MULTI_RUN_DETAIL;            


BEGIN
   COMICS.Load_Wish_List('Adventures of Superman Annual',	1987,	6,	6);
END;
/


SELECT   Title, Volume, Count(*) Quantity
FROM     WISH_LIST 
GROUP BY Title, Volume
ORDER BY Count(*) Desc;

SELECT   to_char(Last_Updated, 'YYYYMM-MON') Month, Count(*)
FROM     SUBSCRIPTION
GROUP BY to_char(Last_Updated, 'YYYYMM-MON')
ORDER BY 2
/


SELECT L.Title, H.Title, L.Volume, L.Start_Issue, L.End_Issue, L.Series_Run, H.Start_Issue, H.End_Issue, H.Series_Run
FROM   V_DIGITAL_RUN_DETAIL L
  JOIN V_DIGITAL_RUN_DETAIL H ON H.Volume = L.Volume
                             AND H.Start_Issue = L.End_Issue + 1
WHERE  SYS.utl_match.jaro_winkler_similarity(upper(L.Title),  upper(H.Title)) between 75 and 85
AND    coalesce(H.SubIssue, L.SubIssue) IS NULL
AND    L.Title > 'The She'
--AND    H.Title Like '%B.P.%'
ORDER BY L.Title
/

SELECT * FROM V_DIFFERING_DIGITAL_COMIC_DETAILS
ORDER BY Title, Issue, Source
/


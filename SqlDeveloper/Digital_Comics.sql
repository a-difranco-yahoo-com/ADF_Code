
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

DEFINE Text="%Mon%Unl%%%"
SELECT * FROM V_DIGITAL_RUN_DETAIL      WHERE Title Like '%&&Text%' Order By Volume,Title;
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


DROP   TABLE LIST_HIERARCHY PURGE;
CREATE TABLE LIST_HIERARCHY
AS
SELECT
      CASE WHEN List1_First > List2_First THEN List1 ELSE List2 END First_List,
      CASE WHEN List1_First > List2_First THEN List2 ELSE List1 END Second_List
FROM  (      
SELECT List1, List2, count(*),
       SUM(CASE WHEN Min_List1_Issue < Min_List2_Issue THEN 1 ELSE 0 END) List1_First,
       SUM(CASE WHEN Min_List1_Issue > Min_List2_Issue THEN 1 ELSE 0 END) List2_First
FROM  (
        SELECT T1.List List1, T2.List List2, T1.Title,
               min( (T1.Volume * 1000000) + T1.Issue) Min_List1_Issue,
               min( (T2.Volume * 1000000) + T2.Issue) Min_List2_Issue
        FROM   MERGED_READING_ORDER T1
          JOIN MERGED_READING_ORDER T2 ON T2.Title = T1.Title
                                      AND T2.List  > T1.List
        GROUP BY T1.List, T2.List, T1.Title
)
GROUP BY List1, List2
)
ORDER BY 1, 2
/

UPDATE LIST_ORDER L
SET    Reading_Order = Reading_Order + 1
WHERE EXISTS (SELECT 1
              FROM    LIST_HIERARCHY H
                JOIN  LIST_ORDER     B ON B.List = H.First_List
              WHERE   H.Second_List = L.List
              AND     B.Reading_Order >= L.Reading_Order)
/

SELECT *
FROM   LIST_ORDER
ORDER By 2, 1
/
CREATE TABLE DELETE_LIST_HIERARCHY
AS
SELECT First_List, Second_List
FROM   LIST_HIERARCHY
INTERSECT
SELECT L1.First_List, L2.Second_List
FROM   LIST_HIERARCHY L1
  JOIN LIST_HIERARCHY L2 ON L2.First_List = L1.SECOND_LIST
/
DELETE
FROM   LIST_HIERARCHY
WHERE (First_List, Second_List) IN
           (SELECT L1.First_List, L2.Second_List
            FROM   LIST_HIERARCHY L1
              JOIN LIST_HIERARCHY L2 ON L2.First_List = L1.SECOND_LIST)
/

INSERT INTO List_Hierarchy
SELECT Distinct List, List
FROM   MERGED_READING_ORDER
WHERE  List NOT IN (SELECT Second_List FROM List_Hierarchy)
/

SELECT List, count(*) 
FROM   MERGED_READING_ORDER
GROUP BY List
ORDER BY 2
/

SELECT L.*, Level
FROM   LIST_HIERARCHY L
CONNECT BY PRIOR Second_List = First_List AND Second_List != First_List
START WITH First_List = Second_List
ORDER BY Level
/


SELECT *
FROM   merged_reading_order
WHERE  List IN ('Inhumanity', 'Avengers_Standoff')
AND    Title = 'New Avengers'


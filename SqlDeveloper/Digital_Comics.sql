
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
   COMICS.Find_Pull_Matches(70);
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
--
  COMICS.Update_Digital_Pull;
  COMICS.Update_WishList_Pull;
END;
/

 
BEGIN
   COMICS.Rebuild_Summary;
   COMMIT;
END;
/

SELECT * FROM V_DIGITAL_MULTI_RUN_DETAIL;
SELECT * FROM V_DIGITAL_ALL_MULTI_RUN_DETAIL;

/

SELECT * FROM V_DIGITAL_RUN_DETAIL Where Title Like '%Who%Arc%' ORDER BY Volume, Title, Start_Issue;


BEGIN
   COMICS.Load_Wish_List('Conan the Barbarian', 1970,   2, 5);
END;
/

SELECT * FROM WISH_LIST WHERE Title Like '%Mis%Mir%' AND Volume > 1007 ORDER BY Volume, Issue;
COMMIT;


SELECT   Title, Volume, Count(*) Quantity
FROM     WISH_LIST 
GROUP BY Title, Volume
ORDER BY Count(*) Desc;


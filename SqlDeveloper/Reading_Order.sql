
DELETE FROM   merged_reading_order
WHERE  List IN ('Convergence')
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

SELECT L.*, Level
FROM   LIST_HIERARCHY L
CONNECT BY PRIOR Second_List = First_List AND Second_List != First_List
START WITH First_List = Second_List
--START WITH First_List IN ('Wolverine_Goes_to_Hell', 'Minimum_Carnage', 'X_Termination', 'Spider_Man_Team_Up', 'Revolutionary_War')
ORDER BY Level
/

SELECT List, count(*) Comics, count(distinct Title) Titles
FROM   MERGED_READING_ORDER
--WHERE  List IN ('', '', '', '', '', '', 'Civil_War_II')
GROUP BY List
ORDER BY 2
/
SELECT *
FROM   MERGED_READING_ORDER
WHERE  List IN ('', '', '', '', '', '', 'Civil_War_II')
--Order By List, Sequence_Number
--Order By List, Title, Sequence_Number
Order By  List, Title, Issue
/
SELECT List, Title, min(Issue) Min_Issue, max(Issue) Max_Issue
FROM   MERGED_READING_ORDER
WHERE  List IN ('', '', '', '', '', '', 'Civil_War_II')
Group By  List, Title
ORDER BY  List, Title
/


SELECT List, Title, Issue_Str,
       Dense_Rank() OVER (ORDER BY Title) DRank,
       Dense_Rank() OVER (PARTITION By List ORDER BY Title) DRank
FROM   MERGED_READING_ORDER
WHERE  List IN ('', '', '', '', '', '', 'Civil_War_II')
Order By List, Title, Issue
/



SELECT Title, List, min(Issue), max(Issue)
FROM   MERGED_READING_ORDER
WHERE  Title IN (SELECT Title
                 FROM   MERGED_READING_ORDER
                 WHERE  Title IN (SELECT Title
                                  FROM   MERGED_READING_ORDER
                                  WHERE  List IN ('Civil_War_II') )
                 AND    List NOT IN ('Civil_War_II') )
Group By Title,List
Order By Title,List
/

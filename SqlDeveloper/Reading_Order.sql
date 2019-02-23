
DELETE FROM   merged_reading_order
WHERE  List = 'Spider_Verse'
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
ORDER BY Level
/

SELECT List, count(*) 
FROM   MERGED_READING_ORDER
WHERE  List IN ('Convergence', 'Batman_Endgame', 'Multiversity', 'Gothtopia', 'Superman_Doomed')
GROUP BY List
ORDER BY 2
/


SELECT *
FROM   merged_reading_order
WHERE  List IN ('Convergence', 'Batman_Endgame', 'Multiversity', 'Gothtopia', 'Superman_Doomed')
--WHERE  Title = 'Batman and Robin'
--Order By List, Sequence_Number
Order By List, Title, Sequence_Number
/

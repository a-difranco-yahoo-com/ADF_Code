
BEGIN
   LINK_COMICDB.Add_Links;
   LINK_COMICDB.Find_ComicDB_Matches('Unl%Acc', 2013, 0, 'Y');
END;
/


SELECT Title, Volume FROM COMICDB_COMIC MINUS SELECT Title, Volume FROM LINK_COMICDB_COMIC;


SELECT Title, Volume, Count(*)
FROM  (SELECT Title, Volume, Issue, SubIssue FROM COMICDB_COMIC Where Title Like '%%'
       MINUS
       SELECT Title, Volume, Issue, SubIssue FROM ARCHIVE_DIGITAL_COMIC)
WHERE  Title > 'E'       
GROUP BY Title, Volume
HAVING   Count(*) = 1
ORDER BY Count(*) Desc, Title, Volume
/


SELECT 'COMICDB' Src, Title, Volume, min(Issue) Min_Issue, max(Issue) Max_Issue, count(*) Comics
FROM   COMICDB_COMIC
WHERE  upper(Title) LIKE '%DEATH%MATE%%'
--AND    Issue > 60
--AND    Volume = 1997
GROUP BY Title, Volume
--ORDER BY Title, Volume
UNION
SELECT 'DIGITAL' SRC, Title, Volume, min(Issue) Min_Issue, max(Issue) Max_Issue, count(*) Comics
FROM   ARCHIVE_DIGITAL_COMIC
WHERE  upper(Title) LIKE '%DEATH%MATE%%'
--AND    Issue > 60
--AND    Volume = 1997
GROUP BY Title, Volume
ORDER BY Volume, Title
/

SELECT Title, Volume, Issue, SubIssue FROM   COMICDB_COMIC         WHERE  upper(Title) LIKE '%DAKEN%%'
MINUS
SELECT Title, Volume, Issue, SubIssue FROM   ARCHIVE_DIGITAL_COMIC WHERE  upper(Title) LIKE '%DAKEN%%'
ORDER BY Volume, Title
/

SELECT * FROM (
SELECT 'DIGITAL' Source, Title, Volume, Issue, SubIssue FROM   ARCHIVE_DIGITAL_COMIC
UNION
SELECT 'COMICDB' Source, Title, Volume, Issue, SubIssue FROM   COMICDB_COMIC
)
WHERE  upper(Title) LIKE '%%X%PATR%' --AND Issue > 611
/



DROP   TABLE COMICDB_COMIC PURGE
/
CREATE TABLE COMICDB_COMIC
AS
SELECT * FROM ARCHIVE_DIGITAL_COMIC
WHERE  Title = 'xXx'
/
ALTER TABLE COMICDB_COMIC Add (
Orig_Title        Varchar2(100),
Orig_Issue_Number Varchar2(100)
)
/
CREATE TABLE LINK_COMICDB_COMIC
AS
SELECT Title, Volume FROM ARCHIVE_DIGITAL_COMIC
WHERE  Title = 'xXx'
/

INSERT INTO COMICDB_COMIC (Orig_Title, Orig_Issue_Number)
SELECT Distinct Title, Issue_Number FROM ADF.COMICDB_COLLECTION
/

-- Set Title / Volume
UPDATE COMICDB_COMIC
SET    Title  = substr(Orig_Title, 1, length(Orig_Title) - 7),
       Volume = substr(Orig_Title, -5, 4)
/

-- Adjust Orig Issue Number
UPDATE COMICDB_COMIC
SET    Orig_Issue_Number  = replace(Orig_Issue_Number, '#', '')
/

-- Set Issue
UPDATE COMICDB_COMIC
SET    Issue = replace(Orig_Issue_Number, '#', '')
WHERE  translate(Orig_Issue_Number, 'x-.0123456789', 'x') IS NULL
/
UPDATE COMICDB_COMIC
SET    Title = Title || ' TPB DE',
       Issue = replace(Orig_Issue_Number, 'TPB DE vol.', '')
WHERE  Issue IS NULL
AND    Orig_Issue_Number LIKE '%TPB DE vol.%'
/
UPDATE COMICDB_COMIC
SET    Title = Title || ' The Bonanzai Edition',
       Issue = replace(Orig_Issue_Number, 'The Bonanzai Edition TPB vol.', '')
WHERE  Issue IS NULL
AND    Orig_Issue_Number LIKE '%The Bonanzai Edition TPB vol.%'
/
UPDATE COMICDB_COMIC
SET    Title = Title || ' TPB',
       Issue = replace(Orig_Issue_Number, 'TPB vol.', '')
WHERE  Issue IS NULL
AND    Orig_Issue_Number LIKE '%TPB vol.%'
/
UPDATE COMICDB_COMIC
SET    Title = Title || ' TPB',
       Issue = nvl(replace(Orig_Issue_Number, 'TPB', ''), 1)
WHERE  Issue IS NULL
AND    Orig_Issue_Number LIKE '%TPB%'
/
UPDATE COMICDB_COMIC
SET    Title = Title || ' ' || Orig_Issue_Number,
       Issue = 1
WHERE  Issue IS NULL
AND    Orig_Issue_Number IN ('Fifth Anniversary Special', 'Holiday Special', 'Infinite Crisis Special')
/
UPDATE COMICDB_COMIC
SET    Title = Title || ' Special',
       Issue = nvl(replace(Orig_Issue_Number, 'Special', ''), 1)
WHERE  Issue IS NULL
AND    Orig_Issue_Number LIKE '%Special%'
/

UPDATE COMICDB_COMIC
SET    Title = Title || ' Halloween Annual',
       Issue = nvl(replace(Orig_Issue_Number, 'Halloween Annual', ''), 1)
WHERE  Issue IS NULL
AND    Orig_Issue_Number LIKE '%Halloween Annual%'
/
UPDATE COMICDB_COMIC
SET    Title = Title || ' Annual',
       Issue = nvl(replace(Orig_Issue_Number, 'Annual', ''), 1)
WHERE  Issue IS NULL
AND    Orig_Issue_Number LIKE '%Annual%'
/
UPDATE COMICDB_COMIC
SET    Title = Title || ' Album',
       Issue = nvl(replace(Orig_Issue_Number, 'Album', ''), 1)
WHERE  Issue IS NULL
AND    Orig_Issue_Number LIKE '%Album%'
/
UPDATE COMICDB_COMIC
SET    Issue = nvl(replace(Orig_Issue_Number, 'OGN SC', ''), 1)
WHERE  Issue IS NULL
AND    Orig_Issue_Number LIKE '%OGN SC%'
/
UPDATE COMICDB_COMIC
SET    Issue = 1
WHERE  Issue IS NULL
AND    Orig_Issue_Number IN ('One Shot', 'OGN SC', 'OGN HC', 'Collected', 'Infinity', 'Sourcebook', 'Preview',
                             'Omega', 'Reader', 'Epilogue', 'Prologue', 'Red', 'Blue', 'Yellow', 'Black')
/
UPDATE COMICDB_COMIC
SET    Issue = 112
WHERE  Issue IS NULL
AND    Orig_Issue_Number = '112/113'
/
UPDATE COMICDB_COMIC
SET    Issue    = nvl(translate(Orig_Issue_Number, 'xABEX', 'x'), 1),
       SubIssue = translate(Orig_Issue_Number, 'x0123456789', 'x')
WHERE  Issue IS NULL
AND    Orig_Issue_Number IN ('13A', '1B', '1E', '52A', '52B', 'A', 'B2', 'X')
/
---------------------------------------------------------------------------------------------------------------------------------

Create Or Replace View V_Possible_ComicDB_Link
AS
SELECT SC.Title ComicDB_Title, SC.Volume ComicDB_Volume, SA.Title Digital_Title, SA.Volume Digital_Volume,
       SYS.utl_match.jaro_winkler_similarity(upper(SA.Title),  upper(SC.Title)) SIM,
       SC.Comics ComicDB_Comics, SA.Comics Digital_Comics, sum(CASE WHEN C.Issue = A.Issue THEN 1 ELSE 0 END) Matches,
       sum(CASE WHEN C.Issue = A.Issue AND nvl(C.SubIssue, 'NULL') = nvl(A.SubIssue, 'NULL') THEN 1 ELSE 0 END) SubMatches,
       decode(L.title, NULL, 'N', 'Y') Matched
FROM       (SELECT Title, Volume, count(*) Comics FROM COMICDB_COMIC         GROUP BY Title, Volume) SC
CROSS JOIN (SELECT Title, Volume, count(*) Comics FROM ARCHIVE_DIGITAL_COMIC GROUP BY Title, Volume) SA
LEFT  JOIN  LINK_COMICDB_COMIC L ON L.Title  IN (SC.Title,  SA.Title)
                                AND L.Volume IN (SC.Volume, SA.Volume)
  JOIN COMICDB_COMIC         C ON C.Volume = SC.Volume
                              AND C.Title  = SC.Title
  JOIN ARCHIVE_DIGITAL_COMIC A ON A.Volume = SA.Volume
                              AND A.Title  = SA.Title
WHERE    nvl(L.Title,  C.Title)  = C.Title
AND      nvl(L.Title,  A.Title)  = A.Title
AND      nvl(L.Volume, C.Volume) = C.Volume
AND      nvl(L.Volume, A.Volume) = A.Volume
GROUP BY SC.Title, SC.Volume, SA.Title, SA.Volume, SC.Comics, SA.Comics, L.Title
/

---------------------------------------------------------------------------------------------------------------------------------
SELECT Distinct Orig_Issue_Number
FROM   COMICDB_COMIC
WHERE  Issue IS NULL
ORDER BY 1
/
SELECT * FROM COMICDB_COMIC
WHERE  Orig_Issue_Number LIKE '%X%'
ORDER BY Orig_Issue_Number
/
SELECT * FROM ARCHIVE_DIGITAL_COMIC
--WHERE  Title Like '%Para%X%%'
--AND    Title Like '%nh%%'
WHERE  SubIssue is not null
/


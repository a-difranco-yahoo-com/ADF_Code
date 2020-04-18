
BEGIN
   LINK_COMICDB.Add_Links;
   LINK_COMICDB.Find_ComicDB_Matches('%Twist%', 2013, 70, 'Y');
END;
/


SELECT   Title, Volume, Count(*)
FROM     V_MISSING_COMICDB_COMIC
--WHERE    upper(Title) Like upper('%hope%')
GROUP BY Title, Volume
--ORDER BY Count(*) Desc, Title, Volume
ORDER BY Title, Volume
/
SELECT * FROM V_MISSING_COMICDB_COMIC
WHERE    upper(Title) LIKE upper('%ol%ian%') -- AND Issue BETWEEN 1 AND 1
/

SELECT * FROM V_DIGITAL_AND_COMICDB_COMIC_SUMMARY_DETAILS
WHERE    upper(Title) LIKE upper('%Chillers%%') -- AND Issue BETWEEN 1 AND 1
--AND      Volume BETWEEN 1990 AND 2000
ORDER BY Volume, Src, Title
/

SELECT * FROM V_DIGITAL_AND_COMICDB_COMIC_DETAILS
WHERE    upper(Title) LIKE upper('%Uncanny%X%')  AND Issue BETWEEN 533 AND 535
/


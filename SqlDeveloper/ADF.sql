
SELECT Time_Remaining, Message FROM V$Session_Longops WHERE Time_Remaining > 0;

SELECT Count(*), Count(Distinct Solution_ID), Count(Distinct Clue_ID)  FROM   ALPHACIPHER.AC_SOLUTION_CLUE;
SELECT * FROM   ALPHACIPHER.AC_SOLUTION_CLUE;
SELECT * FROM ALPHACIPHER.AC_CLUE ORDER BY Length(REmaining_Letters), PROCESSED;


SELECT * FROM GEOCACHE_BY_DAY;

SELECT sum(Caches)     FROM GEOCACHE_BY_DAY   ;
SELECT sum(Days_Found) FROM V_GEOCACHE_TO_FIND_BY_MONTH   ;

SELECT * FROM    V_GEOCACHE_BY_MONTH;
SELECT * FROM    V_GEOCACHE_BY_DAY_OF_MONTH;
SELECT * FROM    V_GEOCACHE_TO_FIND_BY_MONTH;


-- => 2 Known Cells : 503 6mins 23s
-- => 4 Known Cells : 283 4mins 43s
BEGIN
  KS_PUZZLE.Setup_Puzzle2;
  KS_ANALYSE.Analyse; 
  KS_SOLVER.Find_Solution(1000);
END;
/
TRUNCATE Table KS_SOLUTION;


SELECT * FROM   KS_SOLUTION;
SELECT * FROM   KS_SUMSET ORDER BY No_Of_Cells, No_Of_Combinations;
SELECT *
FROM   KS_CELL C
  JOIN Ks_Sumset S ON S.Sumset_Id = C.Sumset_Id
Order By Ordinal;



SELECT Solution_Id, Rowno,
       max( Decode(Colno, 1, Digit, 0) ) Col1,
       max( Decode(Colno, 2, Digit, 0) ) Col2,
       max( Decode(Colno, 3, Digit, 0) ) Col3,
       max( Decode(Colno, 4, Digit, 0) ) Col4,
       max( Decode(Colno, 5, Digit, 0) ) Col5,
       max( Decode(Colno, 6, Digit, 0) ) Col6,
       max( Decode(Colno, 7, Digit, 0) ) Col7,
       max( Decode(Colno, 8, Digit, 0) ) Col8,
       max( Decode(Colno, 9, Digit, 0) ) Col9
FROM   KS_Solution
GROUP BY Solution_Id, Rowno
ORDER BY Solution_Id, Rowno
/

WITH DIGITS AS (SELECT rownum - 1 Nos FROM All_Objects Where Rownum < 11)
SELECT 'N 51 29.' || E.Nos || '0' || G.Nos Northing,
       'W 000 09.' ||  (E.Nos + G.Nos - 7) || '16' Westing
FROM   Digits E
CROSS JOIN Digits G
WHERE  (E.Nos + G.Nos - 7) Between 0 and 9
/
WITH DIGITS AS (SELECT rownum - 1 Nos FROM All_Objects Where Rownum < 11)
SELECT E.Nos, Count(*)
FROM   Digits E
CROSS JOIN Digits G
WHERE  (E.Nos + G.Nos - 7) Between 0 and 9
Group By E.Nos
Order By 1
/

SELECT   Object_Type, Count(*)
FROM     USER_OBJECTS
GROUP BY Object_Type
ORDER BY Count(*) Desc
/




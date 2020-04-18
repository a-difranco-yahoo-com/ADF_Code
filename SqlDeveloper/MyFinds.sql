
DELETE FROM CACHE;

SELECT *
FROM   GEOCACHE    
/

DROP   TABLE  GEOCACHE PURGE;
CREATE TABLE  GEOCACHE (
Cache_Name     Varchar2(200),
Date_Placed    Varchar2(200),
Cache_Type     Varchar2(200),
Container      Varchar2(200),
Difficulty     Varchar2(200),
Terrain        Varchar2(200),
Country        Varchar2(200),
State          Varchar2(200),
Date_Found     Varchar2(200)
)
/

--SELECT *
SELECT Distinct substr(Date_Placed, 1, 7) Placed--|| substr(Date_Placed, 9, 2) Month
FROM   GEOCACHE    
ORDER BY 1
/
SELECT Distinct substr(Date_Found, 6, 2) || substr(Date_Found, 9, 2) Month
FROM   GEOCACHE    
/
SELECT Difficulty,
       Sum( decode(Terrain, 1,   1, 0) ) T1,
       Sum( decode(Terrain, 1.5, 1, 0) ) T15,
       Sum( decode(Terrain, 2,   1, 0) ) T2,
       Sum( decode(Terrain, 2.5, 1, 0) ) T25,
       Sum( decode(Terrain, 3,   1, 0) ) T3,
       Sum( decode(Terrain, 3.5, 1, 0) ) T35,
       Sum( decode(Terrain, 4,   1, 0) ) T4,
       Sum( decode(Terrain, 4.5, 1, 0) ) T45,
       Sum( decode(Terrain, 5,   1, 0) ) T5
FROM   GEOCACHE
GROUP BY Difficulty
ORDER BY Difficulty
/


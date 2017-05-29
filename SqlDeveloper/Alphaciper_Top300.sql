

Drop Table ComicsTop300 Purge;
Create Table ComicsTop300 (
YearMonth    Varchar2(200),
Rank         Varchar2(200),
EstIndex     Varchar2(200),
Title        Varchar2(200),
Price        Varchar2(200),
Pub          Varchar2(200),
EstQty       Varchar2(200)
);

SELECT yearmonth, Count(*) FROM ComicsTop300 group by yearmonth Order By Count(*);

SELECT Rank,   Count(*) FROM comicstop300 GROUP BY Rank;
SELECT Price,  Count(*) FROM comicstop300 GROUP BY Price;
SELECT EstQty, Count(*) FROM comicstop300 GROUP BY EstQty;






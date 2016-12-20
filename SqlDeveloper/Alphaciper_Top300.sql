

the letters of the word JUMBLE DECREASE in value from left to right
ZERO 73 TEN      15 ONE   35 HUNDREDS 95
TWO  30 THOUSAND 93 PI    29 MILLION  76
FIVE 55 BILLION  72 EIGHT 41 CLOCK    80
NINE 15



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






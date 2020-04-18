/*
Letsmartman has been caching for years.
He found his first cache on the 1st of march 2006 and up to and including the 9th of May 2012 he has amassed a vast total of 7,574 finds.
That’s a find rate of 3.3484 per day.
TofPronks is by comparison relatively new to the game, having found his first cache on 21 Feb 2011,
but his prolific find rate of 6.7613 finds per day, means that after including the 9th of May 2012 he has already found 3,002 caches.
*/
SELECT * FROM (
WITH DATA AS ( SELECT 7574 / (to_date('09/05/2012', 'DD/MM/YYYY') - to_date('01/03/2006', 'DD/MM/YYYY') + 1) Slow_Rate,
                      3002 / (to_date('09/05/2012', 'DD/MM/YYYY') - to_date('21/02/2011', 'DD/MM/YYYY') + 1) Fast_Rate,
                      7574 Slow_Finds, 3002 Fast_Finds
               FROM   DUAL)
SELECT Rownum Days, to_date('09/05/2012', 'DD/MM/YYYY') + Rownum Day_Now,
       floor(Slow_Finds + (Rownum * Slow_Rate) ) Slow_Total, floor(Fast_Finds + (Rownum * Fast_Rate) ) Fast_Total,
       Slow_Finds + (Rownum * Slow_Rate) Slow_Total_No, Fast_Finds + (Rownum * Fast_Rate) Fast_Total_No
FROM   DATA
CROSS JOIN ALL_OBJECTS
)
WHERE  Slow_Total < Fast_Total
/
/*
Write your answer in the format DD/MM/20YY then use this formula AB/CD/20EF to determine the values of A,B,C,D,E & F
The co-ordinates of the cache are:
N 50 5(F+E).(D+2)(F-2)C, W 000 0(F+2).(F-A)BA
10 01 16 : N 50 57.340, W 000 08.501

*/
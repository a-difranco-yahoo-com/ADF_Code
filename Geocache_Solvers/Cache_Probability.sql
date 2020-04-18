
-- 14 October 1066
-- AB CD EFGH 14 10 1066

WITH   STATS AS (SELECT 205 June_Finds, 30 * 4 June_Days,
                         22 Dec_Finds,  31 * 3 Dec_Days,  1179 Total_Finds FROM DUAL)
SELECT round(100 * June_Finds / Total_Finds, 2) Jun_Prob, round(100 * Dec_Finds / Total_Finds, 2) Dec_Prob,
       round(June_Finds / June_Days, 2) Jun_Per_Day, round(Dec_Finds / Dec_Days, 2) Dec_Per_Day
        
FROM   STATS
/
Q1 AB.CD% = 17.39
Q2  E.FG% =  1.87
Q3  J.KL  =  1.71 
Q4  P.QR  =  0.24
 
The cache can be found at
N 50 56.867, W000 08.761
N 50 5(G-J).(F+P)(B-A)(C+R), W000 08.(D-Q)(G-E)(K-G+L)



WITH   STATS AS (SELECT (2050 + 1758 + 603 + 229 + 53 + 32) Terrain_25_Plus,
                        (906 + 308 + 191 + 50 + 57) Difficulty_3_Plus,
                         18900 Total_Finds FROM DUAL)
SELECT round(100 * Terrain_25_Plus   / Total_Finds, 2) Terrain_Prob,
       round(100 * Difficulty_3_Plus / Total_Finds, 2) Difficulty_3_Plus        
FROM   STATS
/
-- AB = 25  : C = 8
SELECT 18900 - (8564 + 2669) - (247 + 1011)
             - (59   + 320)  - (57  + 183)
             - (10   +  71)  - (18  +  48)
             - (6    +  10)  - (9   +   8) Over_2_2
FROM   DUAL
/

SELECT round(100 * (5610 * 5609 * 5608) / (18900 * 18899 * 18898), 3) Prob,
       round(100 * (5610 * 5610 * 5610) / (18900 * 18900 * 18900), 3) Prob
FROM   DUAL
/
-- AB = 25  : C = 8 : DEF = 261

N 50 57 . 029 : W 000 06 . 739

WITH   ANSWERS AS (SELECT 2 A, 5 B, 8 C, 2 D, 6 E, 1 F FROM DUAL)
SELECT  'N 50 5' || to_char(A+B) || '.' || to_char(A-D) || to_char(D) || to_char(C+F) Northing,
       'W 000 0' || to_char(E) || '.'|| to_char(E+F) || to_char(D+F) || to_char(C+F)
FROM   ANSWERS
/
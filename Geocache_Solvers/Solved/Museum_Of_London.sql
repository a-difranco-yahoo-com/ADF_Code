/*

Q1. London before London Gallery. Three Ways Wharf. Number of people depicted in the fireplace/hearth graphic (2 digits) = A
Q2. Roman Gallery. Slate tombstone of a soldier-Flavius Agricola, in what number Legion did he serve (1 digit) = B
Q3. Roman Gallery. Mint Condition. How many coins are displayed with their Mint Marks (1 digit) = C.
Q4. Medieval Gallery. Lundonburg, founded in ???AD (3 digits) = D
Q5. Medieval Gallery. Black Death (London) occurred in which year ???? (4 digits) = E
Q6. Medieval Gallery. Arms of the Hanseatic League, created by Gabriel Cibber in which year 1?70 (1 digit) = F

Q7. War, Plague and Fire Gallery. First purpose built London Playhouse - The 'Theatre' - was built in Shoreditch in ???? (4 digits) = G
Q8. War, Plague and Fire Gallery. The Copper Plate Map dates from which year ???? (4 digits) = H
Q9. Expanding City Gallery, 1670-1830.George Ravenscroft set up his Glasshouse in the Savoy Precinct in which year ???? (4 digits) = J
Q10. People City Gallery, 1850-1940 Unic Taxi number plate ID ???? (4 digits) = K
Q11. World City Gallery, 1950-Today.% of Londoners under 25 in 1961 ?? (2 digits) = L
Q12. World City Gallery, 1950-Today. Multicultural London, in the 2011 Census the number of Ethnicity Classification groups expanded to how many ?? (2 digits) = M

Cache Location = N51 31.0?? E-((AxBxF)+(D+C)) = ?? / W000 05.??? ((G+H+J+K)-(L)-(M+3))/10 = ???
*/

CREATE OR REPLACE VIEW V_MUSUEM_LONDON_NORTH_ANALYSIS
AS
WITH DIGITS AS (SELECT Rownum - 1 X FROM ALL_OBJECTS)
SELECT A.X A, B.X B, C.X C, D.X D, E.X E, F.X F, -- G.X G, H.X H, J.X J, K.X K, L.X L, M.X M,
       E.X -((A.X * B.X * F.X) + (D.X + C.X)) North_Coord
FROM   DUAL
  JOIN DIGITS A ON A.X Between   10 AND   99
  JOIN DIGITS B ON B.X Between    0 AND    9
  JOIN DIGITS C ON C.X Between    0 AND    9
  JOIN DIGITS D ON D.X Between  100 AND  999
  JOIN DIGITS E ON E.X Between 1000 AND 1999
  JOIN DIGITS F ON F.X Between    0 AND    9
WHERE  B.X = 6
AND    D.X Between 410 AND 999
AND    E.X = 1348
AND    F.X = 6
/

DROP   TABLE MUSUEM_LONDON_NORTH_ANALYSIS PURGE;
CREATE TABLE MUSUEM_LONDON_NORTH_ANALYSIS 
AS
SELECT * FROM V_MUSUEM_LONDON_NORTH_ANALYSIS 
/
DELETE FROM MUSUEM_LONDON_NORTH_ANALYSIS 
WHERE North_Coord NOT Between 0 AND 99
/

SELECT count(*) FROM MUSUEM_LONDON_NORTH_ANALYSIS 
/
SELECT   North_Coord, count(*)
FROM     MUSUEM_LONDON_NORTH_ANALYSIS 
GROUP BY North_Coord
ORDER BY North_Coord
;



CREATE OR REPLACE VIEW V_MUSUEM_LONDON_WEST_ANALYSIS
AS
WITH DIGITS AS (SELECT Rownum - 1 X FROM ALL_OBJECTS)
SELECT G.X G, H.X H, J.X J, K.X K, L.X L, M.X M,
       ((G.X + H.X + J.X + K.X) - (L.X)-(M.X+3))/10 West_Coord
FROM   DUAL
  JOIN DIGITS G ON G.X Between 1000 AND 1999
  JOIN DIGITS H ON H.X Between 1000 AND 1999
  JOIN DIGITS J ON J.X Between 1000 AND 1999
  JOIN DIGITS K ON K.X Between    0 AND 9999
  JOIN DIGITS L ON L.X Between   10 AND   99
  JOIN DIGITS M ON M.X Between   10 AND   99
WHERE  G.X = 1576
AND    H.X Between 1550 AND 1669
AND    J.X = 1673
AND    L.X Between 31 AND 33
AND    M.X = 18
/

DROP   TABLE MUSUEM_LONDON_WEST_ANALYSIS PURGE;
CREATE TABLE MUSUEM_LONDON_WEST_ANALYSIS 
AS
SELECT * FROM V_MUSUEM_LONDON_WEST_ANALYSIS 
/
DELETE FROM MUSUEM_LONDON_WEST_ANALYSIS 
WHERE WEST_Coord NOT Between 0 AND 999
/
DELETE FROM MUSUEM_LONDON_WEST_ANALYSIS 
WHERE WEST_Coord != floor(west_coord)
/

SELECT count(*) FROM MUSUEM_LONDON_WEST_ANALYSIS 
/
SELECT H, count(*) FROM MUSUEM_LONDON_WEST_ANALYSIS GROUP BY H ORDER BY H
/
SELECT * FROM MUSUEM_LONDON_WEST_ANALYSIS 
/
SELECT West_Coord, count(*) FROM MUSUEM_LONDON_WEST_ANALYSIS 
GROUP BY West_Coord
ORDER BY West_Coord
;


SELECT count(Distinct A), count(Distinct B), count(Distinct C), count(Distinct D), count(Distinct E), count(Distinct F), count(*)
FROM   MUSUEM_LONDON_NORTH_ANALYSIS 
/
SELECT count(Distinct G), count(Distinct H), count(Distinct J), count(Distinct K), count(Distinct L), count(Distinct M), count(*)
FROM   MUSUEM_LONDON_WEST_ANALYSIS 
/

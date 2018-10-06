
BEGIN
   CROSSWORD.Clear_Crossword;
   CROSSWORD.Set_Crossword_Size(15, 15);

   CROSSWORD.Add_Crossword_Word( 1, 11,  1, 'A',  4, 'LORD');
   CROSSWORD.Add_Crossword_Word( 3,  1,  2, 'A',  6, 'TWENTY');
   CROSSWORD.Add_Crossword_Word( 3,  9,  4, 'A',  7, 'COCKPIT');
   CROSSWORD.Add_Crossword_Word( 5,  3,  6, 'A', 10, 'GEOCACHING');
   CROSSWORD.Add_Crossword_Word( 7,  6,  8, 'A',  5, 'BLACK');
   CROSSWORD.Add_Crossword_Word( 8, 11, 11, 'A',  5, 'PLANE');
   CROSSWORD.Add_Crossword_Word( 9,  5, 12, 'A',  6, 'POPLAR');
   CROSSWORD.Add_Crossword_Word(11,  2, 13, 'A',  8, 'DUELLIST');
   CROSSWORD.Add_Crossword_Word(15,  2, 14, 'A',  7, 'TOWNLEY');

   CROSSWORD.Add_Crossword_Word( 1, 11,  1, 'D',  5, 'LUCAN');
   CROSSWORD.Add_Crossword_Word( 3,  3,  3, 'D',  5, 'EIGHT');
   CROSSWORD.Add_Crossword_Word( 3, 15,  5, 'D',  8, 'THIRTEEN');
   CROSSWORD.Add_Crossword_Word( 5,  8,  7, 'D',  7, 'CHARLES');
   CROSSWORD.Add_Crossword_Word( 7, 12,  9, 'D',  8, 'CLARENCE');
   CROSSWORD.Add_Crossword_Word( 8,  2, 10, 'D',  6, 'LONDON');
   CROSSWORD.Add_Crossword_Word( 9,  5, 12, 'D',  7, 'PELICAN');

   CROSSWORD.Add_Key_Cell( 1, 14); -- D
   CROSSWORD.Add_Key_Cell( 6,  3); -- H
   CROSSWORD.Add_Key_Cell( 8,  2); -- L
   CROSSWORD.Add_Key_Cell( 9,  9); -- A
   CROSSWORD.Add_Key_Cell(13,  5); -- C
   CROSSWORD.Add_Key_Cell(14, 12); -- E
   COMMIT;
END;
/

-- N. 51 30.(x+1)(x-1)(x-5) W. 000 08.(x+6)(x+2)(x-4)
WITH DiGITS AS (SELECT rownum X FROM ALL_OBJECTS WHERE Rownum <= 26)
SELECT  X1.X X1, X2.X X2, X3.X X3, X4.X X4, X5.X X5, X6.X X6, 
        'N 51  30.' || (X1.X + 1) || (X2.X - 1) || (X3.X - 5) Northing,
        'W 000 08.' || (X4.X + 6) || (X5.X + 2) || (X6.X - 4) Westing
FROM   DIGITS X1
 JOIN  DIGITS X2 ON X2.X = 8 -- H
 JOIN  DIGITS X3 ON X3.X  Between 12  AND 12 -- L
 JOIN  DIGITS X4 ON X4.X  Between 1  AND 1 -- A
 JOIN  DIGITS X5 ON X5.X = 3 -- C
 JOIN  DIGITS X6 ON X6.X = 5 -- E
WHERE  X1.X = 4 -- D
AND   (X3.X - 5) Between 0 AND 9
AND   (X4.X + 6) Between 0 AND 9
/ 

CREATE TABLE SING_AS_YOU_GO_LETTER (Letter Varchar2(1) );
INSERT INTO SING_AS_YOU_GO_LETTER VALUES ('E');
INSERT INTO SING_AS_YOU_GO_LETTER VALUES ('P');
INSERT INTO SING_AS_YOU_GO_LETTER VALUES ('L');
INSERT INTO SING_AS_YOU_GO_LETTER VALUES ('A');
INSERT INTO SING_AS_YOU_GO_LETTER VALUES ('M');

CREATE TABLE SING_AS_YOU_GO_WORD
AS
SELECT Distinct Word FROM (
SELECT L1.Letter || L2.Letter || L3.Letter || L4.Letter || L5.Letter || L6.Letter || L7.Letter || L8.Letter || L9.Letter Word 
FROM       SING_AS_YOU_GO_LETTER L1
CROSS JOIN SING_AS_YOU_GO_LETTER L2
CROSS JOIN SING_AS_YOU_GO_LETTER L3
CROSS JOIN SING_AS_YOU_GO_LETTER L4
CROSS JOIN SING_AS_YOU_GO_LETTER L5
CROSS JOIN SING_AS_YOU_GO_LETTER L6
CROSS JOIN SING_AS_YOU_GO_LETTER L7
CROSS JOIN SING_AS_YOU_GO_LETTER L8
CROSS JOIN SING_AS_YOU_GO_LETTER L9
)
WHERE  length(Word) = 9
AND    Word Like '%E%'
AND    Word Like '%P%P%'
AND    Word Like '%L%L%'
AND    Word Like '%A%A%'
AND    Word Like '%M%M%'
/

SELECT *
FROM   SING_AS_YOU_GO_WORD S
  JOIN SING_FIRST_NAME     F ON S.Word Like F.Firstname || '%'
  JOIN SING_LAST_NAME      L ON S.Word Like '%' || L.Lastname
WHERE  F.Firstname Like 'E%'
AND    L.Lastname Like 'L%PP'
ORDER BY length(F.Firstname || L.Lastname) Desc
/

SELECT count(*) FROM   SING_FIRST_NAME;
SELECT count(*) FROM   SING_LAST_NAME;
/
CREATE TABLE SING_FIRST_NAME
AS
SELECT Firstname
FROM   DICTIONARY.First_Name 
WHERE  translate(Firstname, 'xMAPLE', 'x') IS NULL
/
CREATE TABLE SING_LAST_NAME
AS
SELECT Lastname
FROM   DICTIONARY.Last_Name 
WHERE  translate(Lastname, 'xMAPLE', 'x') IS NULL
/



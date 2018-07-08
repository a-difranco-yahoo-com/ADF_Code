SELECT Word, length(WorD)
FROM   DICTIONARY.WORD_LIST W 
WHERE  W.Word IN ('ANEW', 'ANEK')
/

-- Find extra 4 letters - word
ALTER TABLE SOLVE_22_TO_DO Add (Unused_Letters Varchar2(26) );
UPDATE SOLVE_22_TO_DO Set Unused_Letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
SELECT length(S.Solution_String), length(S.Unused_Letters), S.* FROM SOLVE_22_TO_DO S;

BEGIN
  for i in 1..22
  loop
      UPDATE SOLVE_22_TO_DO
      Set Unused_Letters = replace(Unused_Letters, substr(Solution_String, i, 1), '');
  end loop;
END;
/

DELETE FROM   SOLVE_22_TO_DO S
WHERE NOT EXISTS (SELECT 1
                  FROM   DICTIONARY.WORD_LIST W 
                  WHERE  length(W.Word) = 4
                  AND    instr(W.Word, substr(S.Unused_Letters, 1, 1) ) > 0
                  AND    instr(W.Word, substr(S.Unused_Letters, 2, 1) ) > 0
                  AND    instr(W.Word, substr(S.Unused_Letters, 3, 1) ) > 0
                  AND    instr(W.Word, substr(S.Unused_Letters, 4, 1) ) > 0)
/

DELETE FROM   SOLVE_22_TO_DO S
WHERE NOT EXISTS (SELECT 1
                  FROM   DICTIONARY.WORD_LIST W 
                  WHERE  W.Word = substr(S.Solution_String,  2, 1) || substr(S.Solution_String,  3, 1) ||
                                  substr(S.Solution_String, 10, 1) || substr(S.Solution_String,  9, 1) )
/

SELECT * FROM   SOLVE_22_TO_DO S;
COMMIT;

--- Word 12 : 1-21 : 22
INSERT INTO  SOLVE_22_TO_DO (Solution_Id, Solution_String, New_Word)
SELECT Rownum + 600, S.SOLUTION_STRING, W.WORD
FROM   SOLVE_22_TO_DO       S
  JOIN DICTIONARY.WORD_LIST W ON length(W.Word) = 4
WHERE  substr(W.Word, 1, 1)  = substr(S.Solution_String, 14, 1) 
AND    substr(W.Word, 2, 1)  = substr(S.Solution_String,  2, 1) 
AND    substr(W.Word, 4, 1)  = substr(S.Solution_String, 10, 1) 
AND    instr(S.Solution_String, substr(W.Word, 3, 1) ) = 0
/

DELETE FROM SOLVE_22_TO_DO WHERE Solution_Id < 600;

UPDATE SOLVE_22_TO_DO
Set Solution_String = substr(Solution_String, 1, 21) || substr(New_Word, 3, 1) ||  substr(Solution_String, 23)
/

SELECT length(S.Solution_String), S.* FROM SOLVE_22_TO_DO S;
COMMIT;

--- Word 11 : 1-20 : 21
INSERT INTO  SOLVE_22_TO_DO (Solution_Id, Solution_String, New_Word)
SELECT Rownum + 500, S.SOLUTION_STRING, W.WORD
FROM   SOLVE_22_TO_DO       S
  JOIN DICTIONARY.WORD_LIST W ON length(W.Word) = 4
WHERE  substr(W.Word, 1, 1)  = substr(S.Solution_String,  2, 1) 
AND    substr(W.Word, 3, 1)  = substr(S.Solution_String,  6, 1) 
AND    substr(W.Word, 4, 1)  = substr(S.Solution_String, 16, 1) 
AND    instr(S.Solution_String, substr(W.Word, 2, 1) ) = 0
/

DELETE FROM SOLVE_22_TO_DO WHERE Solution_Id < 500;

UPDATE SOLVE_22_TO_DO
Set Solution_String = substr(Solution_String, 1, 20) || substr(New_Word, 2, 1) ||  substr(Solution_String, 22)
/

SELECT length(S.Solution_String), S.* FROM SOLVE_22_TO_DO S;
COMMIT;

--- Word 10 : 1-18 + 20 : 19
INSERT INTO  SOLVE_22_TO_DO (Solution_Id, Solution_String, New_Word)
SELECT Rownum + 400, S.SOLUTION_STRING, W.WORD
FROM   SOLVE_22_TO_DO       S
  JOIN DICTIONARY.WORD_LIST W ON length(W.Word) = 5
WHERE  substr(W.Word, 2, 1)  = substr(S.Solution_String, 18, 1) 
AND    substr(W.Word, 3, 1)  = substr(S.Solution_String, 10, 1) 
AND    substr(W.Word, 4, 1)  = substr(S.Solution_String, 10, 1) 
AND    substr(W.Word, 5, 1)  = substr(S.Solution_String,  3, 1)
AND    instr(S.Solution_String, substr(W.Word, 1, 1) ) = 0
/

DELETE FROM SOLVE_22_TO_DO WHERE Solution_Id < 400;

UPDATE SOLVE_22_TO_DO
Set Solution_String = substr(Solution_String, 1, 18) || substr(New_Word, 1, 1) ||  substr(Solution_String, 20)
/

SELECT length(S.Solution_String), S.* FROM SOLVE_22_TO_DO S;
COMMIT;

--- Word 9 : 2-15 + 17-18 + 20 : 1 + 16 => 1-18 + 20
INSERT INTO  SOLVE_22_TO_DO (Solution_Id, Solution_String, New_Word)
SELECT Rownum + 300, S.SOLUTION_STRING, W.WORD
FROM   SOLVE_22_TO_DO       S
  JOIN DICTIONARY.WORD_LIST W ON length(W.Word) = 7
WHERE  substr(W.Word, 2, 1)  = substr(S.Solution_String, 18, 1) 
AND    substr(W.Word, 4, 1)  = substr(S.Solution_String,  8, 1)
AND    substr(W.Word, 5, 1)  = substr(S.Solution_String, 10, 1) 
AND    substr(W.Word, 6, 1)  = substr(S.Solution_String,  5, 1)
AND    substr(W.Word, 7, 1)  = substr(S.Solution_String,  4, 1)
AND    substr(W.Word, 1, 1) != substr(W.Word, 3, 1)
AND    instr(S.Solution_String, substr(W.Word, 1, 1) ) = 0
AND    instr(S.Solution_String, substr(W.Word, 3, 1) ) = 0
/

DELETE FROM SOLVE_22_TO_DO WHERE Solution_Id < 300;

UPDATE SOLVE_22_TO_DO
Set Solution_String = substr(Solution_String, 1, 15) || substr(New_Word, 1, 1) ||  substr(Solution_String, 17)
/
UPDATE SOLVE_22_TO_DO
Set Solution_String = substr(Solution_String, 1, 0) || substr(New_Word, 3, 1) ||  substr(Solution_String, 2)
/
UPDATE SOLVE_22_TO_DO
Set Solution_String = substr(Solution_String, 1, 12) || substr(New_Word, 4, 1) ||  substr(Solution_String, 14)
/

SELECT * FROM SOLVE_22_TO_DO;
COMMIT;


--- Word 8 : 2-7 + 9-12 + 14-15 + 17 + 20 : 8 + 13 + 18 => 2-15 + 17-18 + 20
INSERT INTO  SOLVE_22_TO_DO (Solution_Id, Solution_String, New_Word)
SELECT Rownum + 200, S.SOLUTION_STRING, W.WORD
FROM   SOLVE_22_TO_DO       S
  JOIN DICTIONARY.WORD_LIST W ON length(W.Word) = 9
WHERE  substr(W.Word, 3, 1)  = substr(S.Solution_String,  7, 1) 
AND    substr(W.Word, 5, 1)  = substr(S.Solution_String, 10, 1)
AND    substr(W.Word, 6, 1)  = substr(S.Solution_String, 14, 1)
AND    substr(W.Word, 7, 1)  = substr(S.Solution_String, 10, 1)
AND    substr(W.Word, 8, 1)  = substr(S.Solution_String,  3, 1)
AND    substr(W.Word, 9, 1)  = substr(S.Solution_String,  4, 1)
AND    substr(W.Word, 1, 1) != substr(W.Word, 2, 1)
AND    substr(W.Word, 1, 1) != substr(W.Word, 4, 1)
AND    substr(W.Word, 2, 1) != substr(W.Word, 4, 1)
AND    instr(S.Solution_String, substr(W.Word, 1, 1) ) = 0
AND    instr(S.Solution_String, substr(W.Word, 2, 1) ) = 0
AND    instr(S.Solution_String, substr(W.Word, 4, 1) ) = 0
/

DELETE FROM SOLVE_22_TO_DO WHERE Solution_Id < 200;

UPDATE SOLVE_22_TO_DO
Set Solution_String = substr(Solution_String, 1, 7) || substr(New_Word, 1, 1) ||  substr(Solution_String, 9)
/
UPDATE SOLVE_22_TO_DO
Set Solution_String = substr(Solution_String, 1, 17) || substr(New_Word, 2, 1) ||  substr(Solution_String, 19)
/
UPDATE SOLVE_22_TO_DO
Set Solution_String = substr(Solution_String, 1, 12) || substr(New_Word, 4, 1) ||  substr(Solution_String, 14)
/

SELECT * FROM SOLVE_22_TO_DO;
COMMIT;


--- Word 7 : 2-7 + 10 - 12 + 14 + 15 + 17 + 20 : 9 =>  2-7 + 9-12 + 14-15 + 17 + 20
INSERT INTO  SOLVE_22_TO_DO (Solution_Id, Solution_String, New_Word)
SELECT Rownum + 100, S.SOLUTION_STRING, W.WORD
FROM   SOLVE_22_TO_DO       S
  JOIN DICTIONARY.WORD_LIST W ON length(W.Word) = 4
WHERE  substr(W.Word, 2, 1)  = substr(S.Solution_String, 10, 1) 
AND    substr(W.Word, 3, 1)  = substr(S.Solution_String,  2, 1)
AND    substr(W.Word, 4, 1)  = substr(S.Solution_String,  3, 1)
AND    instr(S.Solution_String, substr(W.Word, 1, 1) ) = 0
/

DELETE FROM SOLVE_22_TO_DO WHERE Solution_Id < 100;

UPDATE SOLVE_22_TO_DO
Set Solution_String = substr(Solution_String, 1, 8) || substr(New_Word, 1, 1) ||  substr(Solution_String, 10)
/

SELECT * FROM SOLVE_22_TO_DO;
COMMIT;

--- Word 6 : 2-7 + 10 - 12 + 14 + 15 + 17 + 20
INSERT INTO  SOLVE_22_TO_DO (Solution_Id, Solution_String, New_Word)
SELECT Rownum, S.SOLUTION_STRING, W.WORD
FROM   SOLVE_22_TO_DO       S
  JOIN DICTIONARY.WORD_LIST W ON length(W.Word) = 6
WHERE  substr(W.Word, 1, 1)  = substr(S.Solution_String, 14, 1) 
AND    substr(W.Word, 2, 1)  = substr(S.Solution_String,  2, 1)
AND    substr(W.Word, 3, 1)  = substr(S.Solution_String, 17, 1)
AND    substr(W.Word, 4, 1)  = substr(S.Solution_String,  7, 1)
AND    substr(W.Word, 5, 1)  = substr(S.Solution_String,  2, 1)
AND    substr(W.Word, 6, 1)  = substr(S.Solution_String, 17, 1)
/  

DELETE FROM SOLVE_22_TO_DO WHERE Solution_Id > 500;

COMMIT;

--- Word 5 : 2-7 + 10 - 12 + 14 + 15 + 17 : 20
INSERT INTO  SOLVE_22_TO_DO (Solution_Id, Solution_String, New_Word)
SELECT Rownum + 500, S.SOLUTION_STRING, W.WORD
FROM   SOLVE_22_TO_DO       S
  JOIN DICTIONARY.WORD_LIST W ON length(W.Word) = 3
WHERE  substr(W.Word, 1, 1)  = substr(S.Solution_String, 10, 1) 
AND    substr(W.Word, 3, 1)  = substr(S.Solution_String, 10, 1)
AND    instr(S.Solution_String, substr(W.Word, 2, 1) ) = 0
/

DELETE FROM SOLVE_22_TO_DO WHERE Solution_Id < 500;

UPDATE SOLVE_22_TO_DO
Set Solution_String = substr(Solution_String, 1, 19) || substr(New_Word, 2, 1) ||  substr(Solution_String, 21)
/

SELECT * FROM SOLVE_22_TO_DO;
COMMIT;

--- Word 4 : 2-7 + 11 + 12 + 14 + 15 : 10 + 17
INSERT INTO  SOLVE_22_TO_DO (Solution_Id, Solution_String, New_Word)
SELECT Rownum + 400, S.SOLUTION_STRING, W.WORD
FROM   SOLVE_22_TO_DO       S
  JOIN DICTIONARY.WORD_LIST W ON length(W.Word) = 7
WHERE  substr(W.Word, 1, 1)  = substr(S.Solution_String,  7, 1) 
AND    substr(W.Word, 3, 1)  = substr(S.Solution_String,  2, 1) 
AND    substr(W.Word, 4, 1)  = substr(S.Solution_String,  3, 1) 
AND    substr(W.Word, 6, 1)  = substr(S.Solution_String, 12, 1)
AND    substr(W.Word, 2, 1)  = substr(W.Word, 5, 1)
AND    substr(W.Word, 2, 1) != substr(W.Word, 7, 1)
AND    instr(S.Solution_String, substr(W.Word, 2, 1) ) = 0
AND    instr(S.Solution_String, substr(W.Word, 7, 1) ) = 0
/
DELETE FROM SOLVE_22_TO_DO WHERE Solution_Id < 400;

UPDATE SOLVE_22_TO_DO
Set Solution_String = substr(Solution_String, 1,  9) || substr(New_Word, 2, 1) ||  substr(Solution_String, 11)
/
UPDATE SOLVE_22_TO_DO
Set Solution_String = substr(Solution_String, 1, 16) || substr(New_Word, 7, 1) ||  substr(Solution_String, 18)
/

SELECT * FROM SOLVE_22_TO_DO;
COMMIT;

--- Word 3 : 2-7 + 11 + 12 : 14 + 15
INSERT INTO  SOLVE_22_TO_DO (Solution_Id, Solution_String, New_Word)
SELECT Rownum + 200, S.SOLUTION_STRING, W.WORD
FROM   SOLVE_22_TO_DO       S
  JOIN DICTIONARY.WORD_LIST W ON length(W.Word) = 4
WHERE  substr(W.Word, 1, 1)  = substr(S.Solution_String, 7, 1) 
AND    substr(W.Word, 2, 1)  = substr(S.Solution_String, 2, 1) 
AND    substr(W.Word, 3, 1) != substr(W.Word, 4, 1)
AND    instr(S.Solution_String, substr(W.Word, 3, 1) ) = 0
AND    instr(S.Solution_String, substr(W.Word, 4, 1) ) = 0
/
DELETE FROM SOLVE_22_TO_DO WHERE Solution_Id < 200;

UPDATE SOLVE_22_TO_DO
Set Solution_String = substr(Solution_String, 1, 13) || substr(New_Word, 3, 1) ||  substr(Solution_String, 15)
/
UPDATE SOLVE_22_TO_DO
Set Solution_String = substr(Solution_String, 1, 14) || substr(New_Word, 4, 1) ||  substr(Solution_String, 16)
/

SELECT * FROM SOLVE_22_TO_DO;
COMMIT;


--- Word 2
INSERT INTO  SOLVE_22_TO_DO (Solution_Id, Solution_String, New_Word)
SELECT Rownum + 100, S.SOLUTION_STRING, W.WORD
FROM   SOLVE_22_TO_DO       S
  JOIN DICTIONARY.WORD_LIST W ON length(W.Word) = 4
WHERE  substr(W.Word, 1, 1)  = substr(S.Solution_String, 2, 1) 
AND    substr(W.Word, 3, 1)  = substr(S.Solution_String, 2, 1) 
AND    substr(W.Word, 2, 1) != substr(W.Word, 4, 1)
AND    instr(S.Solution_String, substr(W.Word, 2, 1) ) = 0
AND    instr(S.Solution_String, substr(W.Word, 4, 1) ) = 0
/
DELETE FROM SOLVE_22_TO_DO WHERE Solution_Id < 100;

UPDATE SOLVE_22_TO_DO
Set Solution_String = substr(Solution_String, 1, 10) || substr(New_Word, 2, 1) ||  substr(Solution_String, 12)
/
UPDATE SOLVE_22_TO_DO
Set Solution_String = substr(Solution_String, 1, 11) || substr(New_Word, 4, 1) ||  substr(Solution_String, 13)
/

SELECT * FROM SOLVE_22_TO_DO;
COMMIT;

--- Word 1
Drop   Table SOLVE_22_TO_DO Purge
/
Create Table SOLVE_22_TO_DO
AS
SELECT Rownum Solution_Id, '--------------------------' Solution_String, Word New_Word
FROM   DICTIONARY.WORD_LIST
WHERE  length(Word) = 7
AND    Word     Like '%ID'
AND    Word Not Like '%I%ID'
AND    substr(Word, 1, 1)  = substr(Word, 4, 1) 
AND    substr(Word, 1, 1) != substr(Word, 3, 1) 
/

UPDATE SOLVE_22_TO_DO
Set Solution_String = substr(Solution_String, 1, 1) || substr(New_Word, 1, 1) ||  substr(Solution_String, 3)
/
UPDATE SOLVE_22_TO_DO
Set Solution_String = substr(Solution_String, 1, 2) || substr(New_Word, 2, 1) ||  substr(Solution_String, 4)
/
UPDATE SOLVE_22_TO_DO
Set Solution_String = substr(Solution_String, 1, 3) || substr(New_Word, 3, 1) ||  substr(Solution_String, 5)
/
UPDATE SOLVE_22_TO_DO
Set Solution_String = substr(Solution_String, 1, 4) || substr(New_Word, 5, 1) ||  substr(Solution_String, 6)
/
UPDATE SOLVE_22_TO_DO
Set Solution_String = substr(Solution_String, 1, 5) || substr(New_Word, 6, 1) ||  substr(Solution_String, 7)
/
UPDATE SOLVE_22_TO_DO
Set Solution_String = substr(Solution_String, 1, 6) || substr(New_Word, 7, 1) ||  substr(Solution_String, 8)
/

SELECT * FROM SOLVE_22_TO_DO;
COMMIT;

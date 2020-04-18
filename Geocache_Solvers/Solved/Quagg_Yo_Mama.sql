

BEGIN
dbms_output.enable(200000);
dbms_output.put_line( to_char(sysdate, 'HH24:MI:SS') || ' : GO');

   QUAGMIRE_SOLVER.Prepare_Cipher('Trib');
   QUAGMIRE_SETUP.Assign_Word(5,  'THE');
   QUAGMIRE_SETUP.Assign_Word(124, 'CACHE');
/*
   QUAGMIRE_SETUP.Assign_Word(1,  'ENTER');
   QUAGMIRE_SETUP.Assign_Word(2,  'THE');
   QUAGMIRE_SETUP.Assign_Word(3,  'RIVER');
   QUAGMIRE_SETUP.Assign_Word(21, 'YOU');
   QUAGMIRE_SETUP.Assign_Word(22, 'GET');
   QUAGMIRE_SETUP.Assign_Word(41, 'FLUME');
   QUAGMIRE_SETUP.Assign_Word(56, 'BUT');
   QUAGMIRE_SETUP.Assign_Word(98, 'AROUND');
   QUAGMIRE_SETUP.Assign_Word(124, 'CACHE');
--   QUAGMIRE_SOLVER.Ignore_Word(76);
--   QUAGMIRE_SOLVER.Ignore_Word(85);
--   QUAGMIRE_SOLVER.Ignore_Word(98);
*/
   QUAGMIRE_SOLVER.Solve_Cipher;
   QUAGMIRE_SUGGEST.Suggest_Words;

dbms_output.put_line( to_char(sysdate, 'HH24:MI:SS') || ' : STOP');
END;
/


SELECT *
FROM   V_QUAGMIRE_COMMON_OFFSET
WHERE  Word_Id1 NOT IN (SELECT Word_Id FROM QUAGMIRE_DIAGNOSTIC_RUN)
AND    Word_Id2     IN (SELECT Word_Id FROM QUAGMIRE_DIAGNOSTIC_RUN WHERE Solved = 'Y')
ORDER By MATCHED_LETTERS Desc, MISMATCHED_LETTERS Desc
/

SELECT * FROM QUAGMIRE_DIAGNOSTIC_RUN ORDER BY Word_Id ;
SELECT * FROM QUAGMIRE_DIAGNOSTIC_MISMATCH;
SELECT * FROM QUAGMIRE_SUGGESTED_WORD ;
SELECT * FROM QUAGMIRE_SOLUTION ;

SELECT Mismatch_Word_Id, count(distinct Attempted_Word_Id) FROM QUAGMIRE_DIAGNOSTIC_MISMATCH GROUP BY Mismatch_Word_Id Order By 2 Desc;
SELECT count(*),  Solved  FROM QUAGMIRE_DIAGNOSTIC_RUN  GROUP BY Solved  ORDER BY Solved;



SELECT *
FROM   QUAGMIRE_DIAGNOSTIC_RUN
/
SELECT DT.Word, count(distinct Word_Id2)
FROM   QUAGMIRE_DIAGRAPH   DG
  JOIN QUAGMIRE_DICTIONARY DT ON DT.Dictionary_Id = DG.Dictionary_Id1
GROUP BY DT.Word Order By 2 Desc;


SELECT DR.Word_Id, D.WORD, DR.Suggested_Word
FROM   QUAGMIRE_DIAGNOSTIC_RUN  DR
  JOIN QUAGMIRE_DICTIONARY_WORD DW ON DW.Word_Id       = DR.Word_Id
                                  AND DW.Valid         = 'Y'
  JOIN QUAGMIRE_DICTIONARY       D ON  D.Dictionary_Id = DW.Dictionary_Id
WHERE  DR.Solved = 'Y'
UNION
SELECT Word_Id, Suggested_Word, 'Suggested_Word'
FROM   QUAGMIRE_SUGGESTED_WORD
UNION
SELECT Attempted_Word_Id, Attempted_Word, 'Attempted_Word : ' || Mismatch_Word_Id
FROM QUAGMIRE_DIAGNOSTIC_MISMATCH
ORDER BY 1, 2
/  

SELECT WORD, mod(Word_Position, 6), count(*)
FROM   QUAGMIRE_WORD
GROUP  BY WORD, mod(Word_Position, 6)
ORDER  BY count(*) Desc
/  
SELECT *
FROM   QUAGMIRE_WORD
WHERE  Word = 'tnk'
/  
SELECT *
FROM   QUAGMIRE_LETTER
WHERE  Word_Id IN (136)
/  
SELECT *
FROM   QUAGMIRE_LETTER
WHERE  Offset = 0
ORDER BY Letter
/  

-SELECT *
FROM   USER_INDEXES
WHERE  Table_Name Like 'QUAGMIRE_DICTIONARY%'
/

INSERT INTO QUAGMIRE_DIAGRAPH (Word_Id1, Word_Id2, Dictionary_Id1, Dictionary_Id2) 
/
SELECT DW1.Word_Id, DW2.Word_Id, DW1.Dictionary_Id, DW2.Dictionary_Id 
FROM   QUAGMIRE_DICTIONARY_WORD DW1   
  JOIN QUAGMIRE_DICTIONARY      D1  ON  D1.Dictionary_Id = DW1.Dictionary_Id
  JOIN QUAGMIRE_DICTIONARY_WORD DW2 ON DW2.Word_Id       = 40
                                   AND DW2.Valid         = 'Y'
  JOIN QUAGMIRE_DICTIONARY      D2  ON  D2.Dictionary_Id = DW2.Dictionary_Id
WHERE  DW1.Word_Id = 100
AND    DW1.Valid   = 'Y'
AND    substr(D1.Word, 3, 1)  != substr(D2.Word, 1, 1)
AND    substr(D1.Word, 9, 1)   = substr(D2.Word, 1, 1)
AND    substr(D1.Word, 4, 1)  != substr(D2.Word, 2, 1)
AND    substr(D1.Word, 10, 1) != substr(D2.Word, 2, 1)
AND    substr(D1.Word, 5, 1)  != substr(D2.Word, 3, 1)
AND    substr(D1.Word, 11, 1) != substr(D2.Word, 3, 1) 
/
SELECT * FROM QUAGMIRE_DIAGRAPH;
SELECT * FROM QUAGMIRE_DICTIONARY;

SELECT   Word_Id, Count(*)
FROM     QUAGMIRE_DICTIONARY_WORD
WHERE    Valid = 'Y'
GROUP BY Word_Id
ORDER BY Word_Id
;

CREATE UNIQUE INDEX IDX_QD_DICT_ID  ON QUAGMIRE_DICTIONARY      (DICTIONARY_ID);
CREATE  INDEX IDX_QDW_WORD_ID ON QUAGMIRE_DICTIONARY_WORD (WORD_ID);
CREATE  INDEX IDX_QDW_DICT_ID ON QUAGMIRE_DICTIONARY_WORD (DICTIONARY_ID);

SELECT Count(Distinct Solution_Id) FROM QUAGMIRE_SOLUTION ;


        SELECT *
        FROM  (SELECT *
               FROM   V_QUAGMIRE_COMMON_OFFSET
               WHERE  Word_Id1 NOT IN (SELECT Word_Id FROM QUAGMIRE_DIAGNOSTIC_RUN)
               AND    Word_Id2     IN (SELECT Word_Id FROM QUAGMIRE_DIAGNOSTIC_RUN WHERE Solved = 'Y')
               ORDER By MATCHED_LETTERS Desc, MISMATCHED_LETTERS Desc)
        WHERE  Rownum = 1;



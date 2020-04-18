

DROP TABLE CWC_Word Purge
/
CREATE TABLE CWC_Word
AS
SELECT   Word, length(Word) Word_Length
FROM     DICTIONARY.WORD_LIST
Where    translate(Word, 'xINTERPRETVITALTELEXES', 'x') Is Null
And      length(Word) IN (5, 7, 9)
/

DROP TABLE CWC_Combination Purge
/
CREATE TABLE CWC_Combination
AS
SELECT Word7, Word5, Word9, 'Y' Valid
FROM  (
        SELECT W7.Word Word7, W5.Word Word5, W9.Word Word9,
               W7.Word || W5.Word || W9.Word Word759
        FROM   CWC_Word W7
          JOIN CWC_Word W5 ON W5.Word_Length = 5
          JOIN CWC_Word W9 ON W9.Word_Length = 9
        WHERE  W7.Word_Length = 7
      )
WHERE  Word759 Like '%A%'
AND    Word759 Like '%E%E%E%E%E%'
AND    Word759 Like '%I%I%'
AND    Word759 Like '%L%L%'
AND    Word759 Like '%N%'
AND    Word759 Like '%P%'
AND    Word759 Like '%R%R%'
AND    Word759 Like '%S%'
AND    Word759 Like '%T%T%T%T%'
AND    Word759 Like '%V%'
AND    Word759 Like '%X%'
/


SELECT * FROM (
SELECT Word7, count(*) Freq FROM   CWC_Combination WHERE Valid = 'Y' GROUP BY Word7 UNION
SELECT Word5, count(*) Freq FROM   CWC_Combination WHERE Valid = 'Y' GROUP BY Word5 UNION
SELECT Word9, count(*) Freq FROM   CWC_Combination WHERE Valid = 'Y'  GROUP BY Word9
)
Where Freq between 6 and 4111
ORDER BY Freq Desc;






CREATE TABLE PC_CS_Word
AS
SELECT   Word, length(Word) Word_Length
FROM     DICTIONARY.WORD_LIST
Where    translate(Word, 'xCROWDSLID', 'x') Is Null
And      length(Word) <= 9
/

CREATE TABLE CWC_Combination
AS
/
SELECT Word1, Word2, Word12
FROM  (
        SELECT W1.Word Word1, W2.Word Word2, 
               W1.Word || W2.Word  Word12
        FROM   PC_CS_Word W1
          JOIN PC_CS_Word W2 ON W2.Word != W1.Word
--          JOIN PC_CS_Word W3 ON W3.Word Not In (W1.Word, W2.Word)
      )
WHERE  Word12 Like '%C%'
AND    Word12 Like '%R%'
AND    Word12 Like '%O%'
AND    Word12 Like '%W%'
AND    Word12 Like '%D%D%'
AND    Word12 Like '%S%'
AND    Word12 Like '%L%'
AND    Word12 Like '%I%'
AND    length(Word12) = 9
AND    Word12 Like 'D%%'
/
MP (Moving Pictures) = 9 : 


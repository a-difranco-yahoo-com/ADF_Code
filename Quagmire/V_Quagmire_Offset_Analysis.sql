

CREATE OR REPLACE VIEW V_QUAGMIRE_OFFSET_ANALYSIS
AS
SELECT Word_Id1,
       min(Matched_Letters) min_Matched_Letters, 
       max(Matched_Letters) max_Matched_Letters
FROM   V_QUAGMIRE_COMMON_OFFSET
WHERE  Word_Id1 IN (SELECT Word_Id FROM QUAGMIRE_TARGETED_WORD WHERE Solved = 'N')
AND    Word_Id2 IN (SELECT Word_Id FROM QUAGMIRE_TARGETED_WORD WHERE Solved = 'Y')
Group By Word_Id1
/

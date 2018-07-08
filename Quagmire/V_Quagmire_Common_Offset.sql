

CREATE OR REPLACE VIEW V_QUAGMIRE_COMMON_OFFSET
AS
SELECT W1.Word_Id Word_Id1, W2.Word_Id Word_Id2,
       SUM(CASE WHEN W1.Letter  = W2.Letter THEN 1 ELSE 0 END) Matched_Letters, 
       SUM(CASE WHEN W1.Letter != W2.Letter THEN 1 ELSE 0 END) MisMatched_Letters, 
       count(*) Common_Offset
FROM   QUAGMIRE_LETTER W1
  JOIN QUAGMIRE_LETTER W2 ON W2.Offset   = W1.Offset
                         AND W2.Word_Id != W1.Word_Id 
GROUP BY W1.Word_Id, W2.Word_Id
/

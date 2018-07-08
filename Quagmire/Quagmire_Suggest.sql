
CREATE OR REPLACE PACKAGE QUAGMIRE_SUGGEST
AS 
  Procedure Suggest_Words;
END QUAGMIRE_SUGGEST;
/

CREATE OR REPLACE PACKAGE BODY QUAGMIRE_SUGGEST 
AS
--
   Procedure Setup_Suggested_Letters(p_Word_Id NUMBER)
   AS
      Loc_Length  NUMBER;
   BEGIN
      Execute Immediate 'TRUNCATE TABLE QUAGMIRE_SUGGESTED_LETTER';

      INSERT INTO QUAGMIRE_SUGGESTED_LETTER (Word_Id, Letter_Position, Letter)
      WITH ALPHABET AS (SELECT 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' Alphabet, Rownum X FROM ALL_OBJECTS WHERE Rownum <= 26)
      SELECT L.Word_Id, L.Letter_Position, substr(A.Alphabet, A.X, 1)
      FROM   QUAGMIRE_LETTER L
      CROSS JOIN ALPHABET    A   
      WHERE  L.Word_Id = p_Word_Id;
   END;

   Procedure Remove_Matching_Offsets(p_Word_Id NUMBER)
   AS
   BEGIN
      FOR DEL_REC IN (SELECT  L1.Letter_Position, substr(DR.Suggested_Word, L2.Letter_Position, 1) Suggested_Letter
                       FROM   QUAGMIRE_LETTER         L1
                         JOIN QUAGMIRE_LETTER         L2 ON L2.Word_Id        != L1.Word_Id
                                                        AND L2.Offset          = L1.Offset
                                                        AND L2.Letter          = L1.Letter
                         JOIN QUAGMIRE_DIAGNOSTIC_RUN DR ON DR.Word_Id         = L2.Word_Id
                                                        AND DR.Solved          = 'Y'
                                                        AND DR.Suggested_Word Is Not NULL
                      WHERE   L1.Word_Id = p_Word_Id)
      LOOP
         DELETE FROM QUAGMIRE_SUGGESTED_LETTER
         WHERE  Word_Id = p_Word_Id
         AND    Letter_Position = DEL_REC.Letter_Position
         AND    Letter         != DEL_REC.Suggested_Letter;
      END LOOP;
   END;

   Procedure Remove_MisMatching_Offsets(p_Word_Id NUMBER)
   AS
   BEGIN
      FOR DEL_REC IN (SELECT  L1.Letter_Position, substr(DR.Suggested_Word, L2.Letter_Position, 1) Suggested_Letter
                       FROM   QUAGMIRE_LETTER         L1
                         JOIN QUAGMIRE_LETTER         L2 ON L2.Word_Id        != L1.Word_Id
                                                        AND L2.Offset          = L1.Offset
                                                        AND L2.Letter         != L1.Letter
                         JOIN QUAGMIRE_DIAGNOSTIC_RUN DR ON DR.Word_Id         = L2.Word_Id
                                                        AND DR.Solved          = 'Y'
                                                        AND DR.Suggested_Word Is Not NULL
                      WHERE   L1.Word_Id = p_Word_Id)
      LOOP
         DELETE FROM QUAGMIRE_SUGGESTED_LETTER
         WHERE  Word_Id = p_Word_Id
         AND    Letter_Position = DEL_REC.Letter_Position
         AND    Letter          = DEL_REC.Suggested_Letter;
      END LOOP;
   END;

   Procedure Setup_Suggested_Words(p_Word_Id NUMBER)
   AS
      Loc_Length  NUMBER;
   BEGIN
      INSERT INTO QUAGMIRE_SUGGESTED_WORD (Word_Id, Suggested_Word)
      SELECT Word_Id, Letter
      FROM   QUAGMIRE_SUGGESTED_LETTER
      WHERE  Letter_Position = 1;
      
      FOR LET_REC IN (SELECT   Distinct Letter_Position 
                      FROM     QUAGMIRE_SUGGESTED_LETTER
                      WHERE    Letter_Position > 1
                      ORDER BY Letter_Position)
      LOOP
         INSERT INTO QUAGMIRE_SUGGESTED_WORD (Word_Id, Suggested_Word)
         SELECT W.Word_Id, W.Suggested_Word || L.Letter
         FROM   QUAGMIRE_SUGGESTED_WORD   W
           JOIN QUAGMIRE_SUGGESTED_LETTER L ON L.Word_Id         = W.Word_Id
                                           AND L.Letter_Position = LET_REC.Letter_Position
         WHERE  W.Word_Id = p_Word_Id;

         DELETE FROM QUAGMIRE_SUGGESTED_WORD
         WHERE  Word_Id = p_Word_Id
         AND    length(Suggested_Word) < LET_REC.Letter_Position;
      END LOOP;
   END;


   Procedure Suggest_Words
   AS
   BEGIN
      Execute Immediate 'TRUNCATE TABLE QUAGMIRE_SUGGESTED_WORD';
      FOR SUG_REC IN (SELECT Word_Id FROM QUAGMIRE_DIAGNOSTIC_RUN WHERE Solved = 'N')
      LOOP
         Setup_Suggested_Letters(SUG_REC.Word_Id);
         Remove_Matching_Offsets(SUG_REC.Word_Id);
         Remove_MisMatching_Offsets(SUG_REC.Word_Id);
         Setup_Suggested_Words(SUG_REC.Word_Id);
      END LOOP;
   END;

END QUAGMIRE_SUGGEST;
/

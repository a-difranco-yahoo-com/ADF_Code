
CREATE OR REPLACE Package GC_NUMBER_CRUNCH
AS
   Procedure  Setup_Puzzle;
   Procedure  Apply_Rules;
END;
/

CREATE OR REPLACE Package Body GC_NUMBER_CRUNCH
AS

   Procedure Clear_Tables
   AS
   BEGIN
        DELETE FROM  GCNC_1Down;
        DELETE FROM  GCNC_2Across;
        DELETE FROM  GCNC_2Down;
        DELETE FROM  GCNC_3Down;
        DELETE FROM  GCNC_4Across;
        DELETE FROM  GCNC_4Down;
        DELETE FROM  GCNC_5Across;
        DELETE FROM  GCNC_6Down;
        DELETE FROM  GCNC_7Across;
        DELETE FROM  GCNC_8Down;
        DELETE FROM  GCNC_9Across;
        DELETE FROM  GCNC_10Across;
        DELETE FROM  GCNC_11Across;
        DELETE FROM  GCNC_12Across;
        DELETE FROM  GCNC_13Across;
        DELETE FROM  GCNC_14Across;
        DELETE FROM  GCNC_15Across;
        DELETE FROM  GCNC_16Down;
        DELETE FROM  GCNC_17Across;
        DELETE FROM  GCNC_17Down;
        DELETE FROM  GCNC_18Across;
        DELETE FROM  GCNC_19Down;
   EXCEPTION
      WHEN OTHERS THEN
         RAISE_APPLICATION_ERROR(-21342, 'ERROR: In Clear_Tables : ' || sqlerrm);
   END;

   Procedure Load_Tables
   AS
   BEGIN
        -- Single digit clues:
        FOR i IN 1..9
        LOOP
            INSERT INTO GCNC_10Across Values (i, i);
            INSERT INTO GCNC_12Across Values (i, i);
        END LOOP;

        -- 2 digit clues:
        FOR i IN 10..99
        LOOP
            INSERT INTO GCNC_1Down     Values (i, i);
            INSERT INTO GCNC_2Down     Values (i, i);
            INSERT INTO GCNC_3Down     Values (i, i);
            INSERT INTO GCNC_4Across   Values (i, i);
            INSERT INTO GCNC_5Across   Values (i, i);
            INSERT INTO GCNC_7Across   Values (i, i);
            INSERT INTO GCNC_9Across   Values (i, i);
            INSERT INTO GCNC_13Across  Values (i, i);
            INSERT INTO GCNC_14Across  Values (i, i);
            INSERT INTO GCNC_15Across  Values (i, i);
            INSERT INTO GCNC_16Down    Values (i, i);
            INSERT INTO GCNC_17Across  Values (i, i);
            INSERT INTO GCNC_17Down    Values (i, i);
            INSERT INTO GCNC_19Down    Values (i, i);
        END LOOP;

        -- 3 digit clues:
        FOR i IN 100..999
        LOOP
            INSERT INTO GCNC_2Across   Values (i, i);
            INSERT INTO GCNC_8Down     Values (i, i);
            INSERT INTO GCNC_18Across  Values (i, i);
        END LOOP;

        -- 5 digit clues:
        FOR i IN 10000..99999
        LOOP
            INSERT INTO GCNC_4Down   Values (i, i);
            INSERT INTO GCNC_6Down     Values (i, i);
            INSERT INTO GCNC_11Across  Values (i, i);
        END LOOP;
   EXCEPTION
      WHEN OTHERS THEN
         RAISE_APPLICATION_ERROR(-21342, 'ERROR: In Load_Tables : ' || sqlerrm);
   END;

   Procedure  Setup_Puzzle
   AS
   BEGIN
      Clear_Tables;
      Load_Tables;
   END;

   /* 2A = 8D + 19D */
   Procedure  Apply_2_Across
   AS
   BEGIN
      DELETE FROM GCNC_2Across
      WHERE  A2_Number NOT IN (SELECT     D8_Number + D19_Number
                               FROM       GCNC_8Down
                               CROSS JOIN GCNC_19Down);

      DELETE FROM GCNC_8Down
      WHERE  D8_Number  NOT IN (SELECT    A2_Number - D19_Number
                               FROM       GCNC_2Across
                               CROSS JOIN GCNC_19Down);

      DELETE FROM GCNC_19Down
      WHERE  D19_Number  NOT IN (SELECT     A2_Number - D8_Number
                                 FROM       GCNC_2Across
                                 CROSS JOIN GCNC_8Down);
   END;

   /* 4A = 57 (Heinz varieties */
   Procedure  Apply_4_Across
   AS
   BEGIN
      DELETE FROM GCNC_4Across
      WHERE  A4_Number != 57;
   END;

   /* 5A = (2/3) 3D */
   Procedure  Apply_5_Across
   AS
   BEGIN
      DELETE FROM GCNC_5Across
      WHERE  A5_Number NOT IN (SELECT     D3_Number * (2 / 3)
                               FROM       GCNC_3Down);

      DELETE FROM GCNC_3Down
      WHERE  D3_Number  NOT IN (SELECT    A5_Number * (3 / 2)
                               FROM       GCNC_5Across);

   END;

   /* 9A = 50 (Half a century */
   Procedure  Apply_9_Across
   AS
   BEGIN
      DELETE FROM GCNC_9Across
      WHERE  A9_Number != 50;
   END;

   /* 10A =  366 (days in a leap year) - 18A */
   Procedure  Apply_10_Across
   AS
   BEGIN
      DELETE FROM GCNC_10Across
      WHERE  A10_Number NOT IN (SELECT   366 - A18_Number
                                FROM     GCNC_18Across);

      DELETE FROM GCNC_18Across
      WHERE  A18_Number NOT IN (SELECT 366 - A10_Number
                                FROM   GCNC_10Across);
   END;

   /* 11A =  5A cubed x 7 */
   Procedure  Apply_11_Across
   AS
   BEGIN
      DELETE FROM GCNC_11Across
      WHERE  A11_Number NOT IN (SELECT   7 * A5_Number * A5_Number * A5_Number
                                FROM     GCNC_5Across);

      DELETE FROM GCNC_5Across
      WHERE  (7 * A5_Number * A5_Number * A5_Number) NOT IN (SELECT A11_Number
                                                             FROM   GCNC_11Across);
   END;

   /* 12A =  cube root of 19D => 19D = 12A cubed */
   Procedure  Apply_12_Across
   AS
   BEGIN
      DELETE FROM GCNC_19Down
      WHERE  D19_Number NOT IN (SELECT   A12_Number * A12_Number * A12_Number
                                FROM     GCNC_12Across);

      DELETE FROM GCNC_12Across
      WHERE  (A12_Number * A12_Number * A12_Number) NOT IN (SELECT D19_Number
                                                            FROM   GCNC_19Down);
   END;

   /* 13A =  12A x 3 */
   Procedure  Apply_13_Across
   AS
   BEGIN
      DELETE FROM GCNC_13Across
      WHERE  A13_Number NOT IN (SELECT   3 * A12_Number
                                FROM     GCNC_12Across);

      DELETE FROM GCNC_12Across
      WHERE  (3 * A12_Number) NOT IN (SELECT A13_Number
                                      FROM   GCNC_13Across);
   END;

   /* 14A =  9A - 1 */
   Procedure  Apply_14_Across
   AS
   BEGIN
      DELETE FROM GCNC_14Across
      WHERE  A14_Number NOT IN (SELECT   A9_Number - 1
                                FROM     GCNC_9Across);

      DELETE FROM GCNC_9Across
      WHERE  A9_Number NOT IN (SELECT A14_Number + 1
                               FROM   GCNC_14Across);
   END;

   /* 15A = 10A + 17D */
   Procedure  Apply_15_Across
   AS
   BEGIN
      DELETE FROM GCNC_15Across
      WHERE  A15_Number NOT IN (SELECT    A10_Number + D17_Number
                               FROM       GCNC_10Across
                               CROSS JOIN GCNC_17Down);

      DELETE FROM GCNC_10Across
      WHERE  A10_Number  NOT IN (SELECT   A15_Number - D17_Number
                               FROM       GCNC_15Across
                               CROSS JOIN GCNC_17Down);

      DELETE FROM GCNC_17Down
      WHERE  D17_Number  NOT IN (SELECT     A15_Number - A10_Number 
                                 FROM       GCNC_10Across
                                 CROSS JOIN GCNC_15Across);
   END;

   /* 17A =  15A + 1 */
   Procedure  Apply_17_Across
   AS
   BEGIN
      DELETE FROM GCNC_17Across
      WHERE  A17_Number NOT IN (SELECT A15_Number + 1
                                FROM   GCNC_15Across);

      DELETE FROM GCNC_15Across
      WHERE  A15_Number NOT IN (SELECT A17_Number - 1
                               FROM   GCNC_17Across);
   END;

   /* 18A =  1D squared */
   Procedure  Apply_18_Across
   AS
   BEGIN
      DELETE FROM GCNC_18Across
      WHERE  A18_Number NOT IN (SELECT   D1_Number * D1_Number
                                FROM     GCNC_1Down);

      DELETE FROM GCNC_1Down
      WHERE  (D1_Number * D1_Number) NOT IN (SELECT A18_Number
                                             FROM   GCNC_18Across);
   END;

   /* 1D =  147 (max snooker break) - 8D */
   Procedure  Apply_1_Down
   AS
   BEGIN
      DELETE FROM GCNC_1Down
      WHERE  D1_Number NOT IN (SELECT   147 - D8_Number
                                FROM     GCNC_8Down);

      DELETE FROM GCNC_8Down
      WHERE  D8_Number NOT IN (SELECT 147 - D1_Number
                                FROM   GCNC_1Down);
   END;

   /* 2D =  1D - (First digit of 3D) */
   Procedure  Apply_2_Down
   AS
   BEGIN
      DELETE FROM GCNC_2Down
      WHERE  D2_Number NOT IN (SELECT      D1_Number - substr(D3_String, 1, 1)
                                FROM       GCNC_1Down
                                CROSS JOIN GCNC_3Down);

      DELETE FROM GCNC_1Down
      WHERE  D1_Number NOT IN (SELECT      D2_Number + substr(D3_String, 1, 1)
                                FROM       GCNC_2Down
                                CROSS JOIN GCNC_3Down);

      DELETE FROM GCNC_3Down
      WHERE  substr(D3_String, 1, 1) NOT IN (SELECT     D1_Number - D2_Number
                                             FROM       GCNC_2Down
                                             CROSS JOIN GCNC_1Down);
   END;

   /* 4D =  (11A * 3) - 500 */
   Procedure  Apply_4_Down
   AS
   BEGIN
      DELETE FROM GCNC_4Down
      WHERE  D4_Number NOT IN (SELECT  (A11_Number * 3) - 500
                                FROM    GCNC_11Across);

      DELETE FROM GCNC_11Across
      WHERE  (A11_Number * 3) NOT IN (SELECT D4_Number + 500
                                      FROM   GCNC_4Down);
   END;

   /* 6D =  (8D - 1) * 18A */
   Procedure  Apply_6_Down
   AS
   BEGIN
      DELETE FROM GCNC_6Down
      WHERE  D6_Number NOT IN (SELECT     (D8_Number - 1) * A18_Number
                                FROM       GCNC_8Down
                                CROSS JOIN GCNC_18Across);

      DELETE FROM GCNC_18Across 
      WHERE  A18_Number  NOT IN (SELECT    D6_Number / (D8_Number - 1) 
                                FROM       GCNC_6Down
                                CROSS JOIN GCNC_8Down);

      DELETE FROM GCNC_8Down  
      WHERE  D8_Number  NOT IN (SELECT     (D6_Number /  A18_Number) + 1
                                FROM       GCNC_6Down
                                CROSS JOIN GCNC_18Across);
   END;

   /* 8D =  2 * 19D */
   Procedure  Apply_8_Down
   AS
   BEGIN
      DELETE FROM GCNC_8Down
      WHERE  D8_Number NOT IN (SELECT 2 * D19_Number
                                FROM  GCNC_19Down);

      DELETE FROM GCNC_19Down
      WHERE  2 * D19_Number NOT IN (SELECT D8_Number
                                    FROM  GCNC_8Down);
   END;

   /* 16D =  2nd Digit 1D * 2nd digit of 2D */
   Procedure  Apply_16_Down
   AS
   BEGIN
      DELETE FROM GCNC_16Down
      WHERE  D16_String NOT IN (SELECT     substr(D1_String, 2, 1) * substr(D2_String, 2, 1)
                                FROM       GCNC_1Down
                                CROSS JOIN GCNC_2Down);
   END;

   /* 17D =  5A Reversed */
   Procedure  Apply_17_Down
   AS
   BEGIN
      DELETE FROM GCNC_17Down
      WHERE  D17_String NOT IN (SELECT substr(A5_String, 2, 1) || substr(A5_String, 1, 1)
                                FROM  GCNC_5Across);

      DELETE FROM GCNC_5Across
      WHERE  A5_String NOT IN (SELECT substr(D17_String, 2, 1) || substr(D17_String, 1, 1)
                                    FROM  GCNC_17Down);
   END;

   /* 19D =  15A Reversed */
   Procedure  Apply_19_Down
   AS
   BEGIN
      DELETE FROM GCNC_19Down
      WHERE  D19_String NOT IN (SELECT substr(A15_String, 2, 1) || substr(A15_String, 1, 1)
                                FROM  GCNC_15Across);

      DELETE FROM GCNC_15Across
      WHERE  A15_String NOT IN (SELECT substr(D19_String, 2, 1) || substr(D19_String, 1, 1)
                                FROM  GCNC_19Down);
   END;

   Procedure  Apply_Rules
   AS
   BEGIN
      Apply_2_Across;
      Apply_4_Across;
      Apply_5_Across;
      Apply_9_Across;
      Apply_10_Across;
      Apply_11_Across;
      Apply_12_Across;
      Apply_13_Across;
      Apply_13_Across;
      Apply_14_Across;
      Apply_15_Across;
      Apply_17_Across;
      Apply_18_Across;
--
      Apply_1_Down;
      Apply_2_Down;
--      Apply_3_Down;
      Apply_4_Down;
      Apply_6_Down;
      Apply_8_Down;
      Apply_16_Down;
      Apply_17_Down;
      Apply_19_Down;
   END;
END;
/


Create Table GCNC_1Down    (D1_Number  Number, D1_String  Varchar2(2));
Create Table GCNC_2Across  (A2_Number  Number, A2_String  Varchar2(3));
Create Table GCNC_2Down    (D2_Number  Number, D2_String  Varchar2(2));
Create Table GCNC_3Down    (D3_Number  Number, D3_String  Varchar2(2));
Create Table GCNC_4Across  (A4_Number  Number, A4_String  Varchar2(2));
Create Table GCNC_4Down    (D4_Number  Number, D4_String  Varchar2(5));
Create Table GCNC_5Across  (A5_Number  Number, A5_String  Varchar2(2));
Create Table GCNC_6Down    (D6_Number  Number, D6_String  Varchar2(5));
Create Table GCNC_7Across  (A7_Number  Number, A7_String  Varchar2(2));
Create Table GCNC_8Down    (D8_Number  Number, D8_String  Varchar2(3));
Create Table GCNC_9Across  (A9_Number  Number, A9_String  Varchar2(2));
Create Table GCNC_10Across (A10_Number Number, A10_String Varchar2(1));
Create Table GCNC_11Across (A11_Number Number, A11_String Varchar2(5));
Create Table GCNC_12Across (A12_Number Number, A12_String Varchar2(1));
Create Table GCNC_13Across (A13_Number Number, A13_String Varchar2(2));
Create Table GCNC_14Across (A14_Number Number, A14_String Varchar2(2));
Create Table GCNC_15Across (A15_Number Number, A15_String Varchar2(2));
Create Table GCNC_16Down   (D16_Number Number, D16_String Varchar2(2));
Create Table GCNC_17Across (A17_Number Number, A17_String Varchar2(2));
Create Table GCNC_17Down   (D17_Number Number, D17_String Varchar2(2));
Create Table GCNC_18Across (A18_Number Number, A18_String Varchar2(3));
Create Table GCNC_19Down   (D19_Number Number, D19_String Varchar2(2));

BEGIN
   GC_NUMBER_CRUNCH.Setup_Puzzle;
END;
/
BEGIN
   GC_NUMBER_CRUNCH.Apply_Rules;
END;
/

SELECT 'GCNC_1Down',    Count(*) FROM  GCNC_1Down    UNION ALL 
SELECT 'GCNC_2Across',  Count(*) FROM  GCNC_2Across  UNION ALL 
SELECT 'GCNC_2Down',    Count(*) FROM  GCNC_2Down    UNION ALL 
SELECT 'GCNC_3Down',    Count(*) FROM  GCNC_3Down    UNION ALL 
SELECT 'GCNC_4Across',  Count(*) FROM  GCNC_4Across  UNION ALL 
SELECT 'GCNC_4Down',    Count(*) FROM  GCNC_4Down    UNION ALL 
SELECT 'GCNC_5Across',  Count(*) FROM  GCNC_5Across  UNION ALL 
SELECT 'GCNC_6Down',    Count(*) FROM  GCNC_6Down    UNION ALL 
SELECT 'GCNC_7Across',  Count(*) FROM  GCNC_7Across  UNION ALL 
SELECT 'GCNC_8Down',    Count(*) FROM  GCNC_8Down    UNION ALL 
SELECT 'GCNC_9Across',  Count(*) FROM  GCNC_9Across  UNION ALL 
SELECT 'GCNC_10Across', Count(*) FROM  GCNC_10Across UNION ALL 
SELECT 'GCNC_11Across', Count(*) FROM  GCNC_11Across UNION ALL 
SELECT 'GCNC_12Across', Count(*) FROM  GCNC_12Across UNION ALL 
SELECT 'GCNC_13Across', Count(*) FROM  GCNC_13Across UNION ALL 
SELECT 'GCNC_14Across', Count(*) FROM  GCNC_14Across UNION ALL 
SELECT 'GCNC_15Across', Count(*) FROM  GCNC_15Across UNION ALL 
SELECT 'GCNC_16Down',   Count(*) FROM  GCNC_16Down   UNION ALL 
SELECT 'GCNC_17Across', Count(*) FROM  GCNC_17Across UNION ALL 
SELECT 'GCNC_17Down',   Count(*) FROM  GCNC_17Down   UNION ALL 
SELECT 'GCNC_18Across', Count(*) FROM  GCNC_18Across UNION ALL 
SELECT 'GCNC_19Down',   Count(*) FROM  GCNC_19Down
/

SELECT * FROM GCNC_1Down;
SELECT * FROM GCNC_2Across;
SELECT * FROM GCNC_3Down;
SELECT * FROM GCNC_4Down;
SELECT * FROM GCNC_4Across;
SELECT * FROM GCNC_5Across;
SELECT * FROM GCNC_6Down;
SELECT * FROM GCNC_7Across;
SELECT * FROM GCNC_8Down;
SELECT * FROM GCNC_9Across;
SELECT * FROM GCNC_10Across;
SELECT * FROM GCNC_11Across;
SELECT * FROM GCNC_12Across;
SELECT * FROM GCNC_13Across;
SELECT * FROM GCNC_14Across;
SELECT * FROM GCNC_15Across;
SELECT * FROM GCNC_16Down;
SELECT * FROM GCNC_17Across;
SELECT * FROM GCNC_17Down;
SELECT * FROM GCNC_18Across;
SELECT * FROM GCNC_19Down;



SELECT sysdate FROM DUAL;

Drop   Table GS_CRAZY_ADDITION Purge;
Create Table GS_CRAZY_ADDITION (
Combination_String  Varchar2(10),
No_of_Digits        Number,
Digit_Total         Number)
/

DELETE FROM GS_CRAZY_ADDITION;

INSERT INTO GS_CRAZY_ADDITION
(Combination_String, No_of_Digits, Digit_Total)
WITH DIGITS AS (SELECT rownum - 1 X FROM All_OBJECTS WHERE Rownum <= 10)
SELECT X, decode(X, 0, 0, 1), X
FROM   DIGITS
/

DECLARE
   Loc_No_of_Digits  NUMBER := 3;
   Loc_Digit_Total   NUMBER := 22;
BEGIN
  FOR i IN 2..10
  LOOP  
        INSERT INTO GS_CRAZY_ADDITION
        (Combination_String, No_of_Digits, Digit_Total)
        WITH DIGITS AS (SELECT rownum - 1 X FROM All_OBJECTS WHERE Rownum <= 10)
        SELECT S.Combination_String || D.X, decode(D.X, 0, S.No_of_Digits, S.No_of_Digits + 1), S.Digit_Total + D.X
        FROM   GS_CRAZY_ADDITION S
          JOIN DIGITS            D on D.X = 0 OR S.Combination_String Like '%0';

        DELETE FROM GS_SUMAMI WHERE  length(Combination_String) < i;
/*
        DELETE FROM GS_CRAZY_ADDITION WHERE  No_of_Digits > Loc_No_of_Digits;
        DELETE FROM GS_CRAZY_ADDITION WHERE  Digit_Total  > Loc_Digit_Total;

        DELETE FROM GS_CRAZY_ADDITION WHERE  No_of_Digits = Loc_No_of_Digits AND Digit_Total != Loc_Digit_Total;
*/
        COMMIT;
  END LOOP;
--
/*
   DELETE FROM GS_CRAZY_ADDITION WHERE  No_of_Digits != Loc_No_of_Digits;
   DELETE FROM GS_CRAZY_ADDITION WHERE  Digit_Total  != Loc_Digit_Total;
*/
END;
/

SELECT sysdate FROM DUAL;

SELECT count(*)
FROM   GS_CRAZY_ADDITION
/
SELECT   No_Of_Digits, Digit_Total, count(*)
FROM     GS_CRAZY_ADDITION
GROUP BY No_Of_Digits, Digit_Total
/

--------------------------------------

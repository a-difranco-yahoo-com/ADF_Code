--------------------------------------------------------
--  DDL for Table TEMP_SOLUTION
--------------------------------------------------------

DROP TABLE TEMP_SOLUTION PURGE
/

CREATE GLOBAL TEMPORARY TABLE TEMP_SOLUTION (
SOLUTION_ID NUMBER, 
AMOUNT1 NUMBER, 
AMOUNT2 NUMBER, 
AMOUNT3 NUMBER, 
AMOUNT4 NUMBER
)
ON COMMIT DELETE ROWS ;

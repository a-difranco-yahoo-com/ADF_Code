

SELECT sysdate FROM DUAL;

Drop   Table GS_SUMAMI Purge;
Create Table GS_SUMAMI (
Combination_String   Varchar2(10),
No_of_Groups         Number,
Group_1_Total        Number,
Group_2_Total        Number,
Group_3_Total        Number,
Group_4_Total        Number,
Group_5_Total        Number)
/


DECLARE
   Loc_Group_1_Total  NUMBER := 8;
   Loc_Group_2_Total  NUMBER := 10;
   Loc_Group_3_Total  NUMBER := 18;
   Loc_Group_4_Total  NUMBER := 0;
   Loc_Group_5_Total  NUMBER := 0;
BEGIN
   DELETE FROM GS_SUMAMI;

   INSERT INTO GS_SUMAMI
   (Combination_String, No_of_Groups, Group_1_Total, Group_2_Total, Group_3_Total, Group_4_Total, Group_5_Total)
   WITH DIGITS AS (SELECT rownum - 1 X FROM All_OBJECTS WHERE Rownum <= 10)
   SELECT X, decode(X, 0, 0, 1), X, 0, 0, 0, 0
   FROM   DIGITS;

  FOR i IN 2..10
  LOOP  
        INSERT INTO GS_SUMAMI
        (Combination_String, No_of_Groups, Group_1_Total, Group_2_Total, Group_3_Total, Group_4_Total, Group_5_Total)
        WITH DIGITS AS (SELECT rownum - 1 X FROM All_OBJECTS WHERE Rownum <= 10)
        SELECT Combination_String || X, New_Groups,
               decode(New_Groups, 1,  Group_1_Total + X, Group_1_Total) Group_1_Total,
               decode(New_Groups, 2,  Group_2_Total + X, Group_2_Total) Group_2_Total,
               decode(New_Groups, 3,  Group_3_Total + X, Group_3_Total) Group_3_Total,
               decode(New_Groups, 4,  Group_4_Total + X, Group_4_Total) Group_4_Total,
               decode(New_Groups, 5,  Group_5_Total + X, Group_5_Total) Group_5_Total
        FROM  (
                SELECT S.Combination_String, D.X,
                       CASE WHEN S.Combination_String Like '%0' AND D.X != 0
                            THEN S.No_of_Groups + 1
                            ELSE S.No_of_Groups
                            END  New_Groups,
                       S.Group_1_Total, S.Group_2_Total, S.Group_3_Total, S.Group_4_Total, S.Group_5_Total       
                FROM   GS_SUMAMI S
                  JOIN DIGITS    D on D.X = 0 OR S.Combination_String Not Like '%' || D.X || '%'
            );

        DELETE FROM GS_SUMAMI WHERE  length(Combination_String) < i;

        DELETE FROM GS_SUMAMI WHERE  Group_1_Total > Loc_Group_1_Total;
        DELETE FROM GS_SUMAMI WHERE  Group_2_Total > Loc_Group_2_Total;
        DELETE FROM GS_SUMAMI WHERE  Group_3_Total > Loc_Group_3_Total;
        DELETE FROM GS_SUMAMI WHERE  Group_4_Total > Loc_Group_4_Total;
        DELETE FROM GS_SUMAMI WHERE  Group_5_Total > Loc_Group_5_Total;

        DELETE FROM GS_SUMAMI WHERE  No_of_Groups > 1 AND Group_1_Total != Loc_Group_1_Total;
        DELETE FROM GS_SUMAMI WHERE  No_of_Groups > 2 AND Group_2_Total != Loc_Group_2_Total;
        DELETE FROM GS_SUMAMI WHERE  No_of_Groups > 3 AND Group_3_Total != Loc_Group_3_Total;
        DELETE FROM GS_SUMAMI WHERE  No_of_Groups > 4 AND Group_4_Total != Loc_Group_4_Total;
        
        COMMIT;
  END LOOP;
--
  DELETE FROM GS_SUMAMI WHERE  Group_1_Total != Loc_Group_1_Total;
  DELETE FROM GS_SUMAMI WHERE  Group_2_Total != Loc_Group_2_Total;
  DELETE FROM GS_SUMAMI WHERE  Group_3_Total != Loc_Group_3_Total;
  DELETE FROM GS_SUMAMI WHERE  Group_4_Total != Loc_Group_4_Total;
  DELETE FROM GS_SUMAMI WHERE  Group_5_Total != Loc_Group_5_Total;
END;
/

SELECT sysdate FROM DUAL;

SELECT count(*) FROM   GS_SUMAMI;
SELECT   substr(Combination_String, 5, 1), Count(*)
FROM     GS_SUMAMI
GROUP BY substr(Combination_String, 5, 1)
ORDER BY substr(Combination_String, 5, 1)
;


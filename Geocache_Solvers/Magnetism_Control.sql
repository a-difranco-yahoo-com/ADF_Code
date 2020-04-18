
CREATE OR REPLACE PACKAGE MAGNETISM_CONTROL
AS
    Procedure Reset;
    Procedure Load_EG(p_StopTime DATE);
    Procedure Load_EGJ(p_StopTime DATE);
    Procedure Load_DEGJ(p_StopTime DATE);
    Procedure Load_BDEGJ(p_StopTime DATE);
    Procedure Load_BCDEGJ(p_StopTime DATE);
    Procedure Load_BCDEFGJ(p_StopTime DATE);
    Procedure Load_ABCDEFGJ(p_StopTime DATE);
    Procedure Load_ABCDEFGHJ(p_StopTime DATE);
    Procedure Load_ABCDEFGHJK(p_StopTime DATE);
    
    Procedure  Get_Rows;
    Procedure  Set_Rows;
    Procedure  Update_Rows;
    Procedure  Log_Time(p_Start_Time     DATE,   p_End_Time     DATE,
                        p_Procedure_Name VARCHAR2,
                        p_Rows_Inserted  NUMBER, p_Rows_Deleted NUMBER);

    PKG_LIMIT   CONSTANT NUMBER := 1000000;
    MAG_RECORD  MAGNETISM_ROWS%Rowtype;
END;
/

CREATE OR REPLACE PACKAGE BODY MAGNETISM_CONTROL
AS
    Procedure  Log_Time(p_Start_Time     DATE,   p_End_Time     DATE,
                        p_Procedure_Name VARCHAR2,
                        p_Rows_Inserted  NUMBER, p_Rows_Deleted NUMBER)
    AS
    BEGIN
       INSERT INTO MAGNETISM_TIMING
       (  Start_Time,   End_Time,   Procedure_Name,   Rows_Inserted,   Rows_Deleted)
       VALUES
       (p_Start_Time, p_End_Time, p_Procedure_Name, p_Rows_Inserted, p_Rows_Deleted);
    EXCEPTION
       WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20345, 'ERROR: MAGNETISM_CONTROL.Log_Time : ' || sqlerrm);
    END;

    Procedure Get_Rows
    AS
    BEGIN
       SELECT *
       INTO   MAG_RECORD
       FROM   MAGNETISM_ROWS;
    EXCEPTION
       WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20345, 'ERROR: MAGNETISM_CONTROL.Get_Rows : ' || sqlerrm);
    END;

    Procedure Set_Rows
    AS
    BEGIN
       SELECT count(*) INTO MAG_RECORD.Rows_G          FROM MAGNETISM_ORIG_G;
       SELECT count(*) INTO MAG_RECORD.Rows_EG         FROM MAGNETISM_EG;
       SELECT count(*) INTO MAG_RECORD.Rows_EGJ        FROM MAGNETISM_EGJ;
       SELECT count(*) INTO MAG_RECORD.Rows_DEGJ       FROM MAGNETISM_DEGJ;
       SELECT count(*) INTO MAG_RECORD.Rows_BDEGJ      FROM MAGNETISM_BDEGJ;
       SELECT count(*) INTO MAG_RECORD.Rows_BCDEGJ     FROM MAGNETISM_BCDEGJ;
       SELECT count(*) INTO MAG_RECORD.Rows_BCDEFGJ    FROM MAGNETISM_BCDEFGJ;
       SELECT count(*) INTO MAG_RECORD.Rows_ABCDEFGJ   FROM MAGNETISM_ABCDEFGJ;
       SELECT count(*) INTO MAG_RECORD.Rows_ABCDEFGHJ  FROM MAGNETISM_ABCDEFGHJ;
       SELECT count(*) INTO MAG_RECORD.Rows_ABCDEFGHJK FROM MAGNETISM_ABCDEFGHJK;

      Update_Rows;
    EXCEPTION
       WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20345, 'ERROR: MAGNETISM_CONTROL.Set_Rows : ' || sqlerrm);
    END;

    Procedure Update_Rows
    AS
    BEGIN
       UPDATE MAGNETISM_ROWS
       SET     ROWS_G          = MAG_RECORD.ROWS_G,
               ROWS_EG         = MAG_RECORD.ROWS_EG,
               ROWS_EGJ        = MAG_RECORD.ROWS_EGJ,
               ROWS_DEGJ       = MAG_RECORD.ROWS_DEGJ,
               ROWS_BDEGJ      = MAG_RECORD.ROWS_BDEGJ,
               ROWS_BCDEGJ     = MAG_RECORD.ROWS_BCDEGJ,
               ROWS_BCDEFGJ    = MAG_RECORD.ROWS_BCDEFGJ,
               ROWS_ABCDEFGJ   = MAG_RECORD.ROWS_ABCDEFGJ,
               ROWS_ABCDEFGHJ  = MAG_RECORD.ROWS_ABCDEFGHJ,
               ROWS_ABCDEFGHJK = MAG_RECORD.ROWS_ABCDEFGHJK;

       COMMIT;
    EXCEPTION
       WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20345, 'ERROR: MAGNETISM_CONTROL.Update_Rows : ' || sqlerrm);
    END;

    Procedure Delete_Rows
    AS
       Loc_Start_Time      DATE;
       Loc_End_Time        DATE;
       Loc_Rows_Inserted   NUMBER;
       Loc_Rows_Deleted    NUMBER;    
    BEGIN
       IF MAG_RECORD.Rows_ABCDEFGHJK > 0
       THEN
          Loc_Start_Time := SYSDATE;
          DELETE FROM MAGNETISM_ABCDEFGHJK
          WHERE (North_Minute = 8  AND  North_Minute_Thousand < 139)
          OR    (North_Minute = 9  AND  North_Minute_Thousand > 219)
          OR    (West_Minute = 29  AND  West_Minute_Thousand  < 193)
          OR    (West_Minute = 30  AND  West_Minute_Thousand  > 909);
       
          Loc_Rows_Inserted := 0;
          Loc_Rows_Deleted  := SQL%RowCount;
          Loc_End_Time      := SYSDATE;

          Log_Time(Loc_Start_Time, Loc_End_Time, 'Delete_Rows', Loc_Rows_Inserted, Loc_Rows_Deleted);
          MAG_RECORD.Rows_ABCDEFGHJK := MAG_RECORD.Rows_ABCDEFGHJK - Loc_Rows_Deleted;
          Update_Rows;
       END IF;
    EXCEPTION
       WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20345, 'ERROR: MAGNETISM_CONTROL.Delete_Rows : ' || sqlerrm);
    END;
    
    Procedure Append_Frequency
    AS
       Loc_Start_Time      DATE;
       Loc_End_Time        DATE;
       Loc_Rows_Inserted   NUMBER;
       Loc_Rows_Deleted    NUMBER;    
    BEGIN
       IF MAG_RECORD.Rows_ABCDEFGHJK > 0
       THEN
           Loc_Start_Time      := SYSDATE;
           MERGE INTO MAGNETISM_ABCDEFGHJK_FREQ F
           USING (SELECT Variable, Number_Value, Frequency FROM V_MAGNETISM_ABCDEFGHJK_FREQ) M
           ON    (F.Variable  = M.Variable AND F.Number_Value = M.Number_Value)
           WHEN MATCHED THEN
               UPDATE SET F.Frequency = F.Frequency + M.Frequency
           WHEN NOT MATCHED THEN
               INSERT (  Variable,   Number_Value,   Frequency)  
               VALUES (M.Variable, M.Number_Value, M.Frequency);

          Loc_Rows_Inserted := 0;
          Loc_Rows_Deleted  := 0;
          Loc_End_Time      := SYSDATE;

          Log_Time(Loc_Start_Time, Loc_End_Time, 'Append_Frequency', Loc_Rows_Inserted, Loc_Rows_Deleted);
       END IF;
    EXCEPTION
       WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20345, 'ERROR: MAGNETISM_CONTROL.Append_Frequency : ' || sqlerrm);
    END;

    Procedure Clear_Rows
    AS
       Loc_Start_Time      DATE;
       Loc_End_Time        DATE;
       Loc_Rows_Inserted   NUMBER;
       Loc_Rows_Deleted    NUMBER;    
    BEGIN
       IF MAG_RECORD.Rows_ABCDEFGHJK > 0
       THEN
          Loc_Start_Time      := SYSDATE;
          DELETE FROM MAGNETISM_ABCDEFGHJK;
       
          Loc_Rows_Inserted := 0;
          Loc_Rows_Deleted  := SQL%RowCount;
          Loc_End_Time      := SYSDATE;

          Log_Time(Loc_Start_Time, Loc_End_Time, 'Clear_Rows', Loc_Rows_Inserted, Loc_Rows_Deleted);
          MAG_RECORD.Rows_ABCDEFGHJK := MAG_RECORD.Rows_ABCDEFGHJK - Loc_Rows_Deleted;
          Update_Rows;
       END IF;
    EXCEPTION
       WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20345, 'ERROR: MAGNETISM_CONTROL.Clear_Rows : ' || sqlerrm);
    END;

    Procedure Reset_Tables
    AS
    BEGIN
       DELETE FROM MAGNETISM_BASE;

       DELETE FROM MAGNETISM_ORIG_A;
       DELETE FROM MAGNETISM_ORIG_B;
       DELETE FROM MAGNETISM_ORIG_C;
       DELETE FROM MAGNETISM_ORIG_D;
       DELETE FROM MAGNETISM_ORIG_E;
       DELETE FROM MAGNETISM_ORIG_F;
       DELETE FROM MAGNETISM_ORIG_G;
       DELETE FROM MAGNETISM_ORIG_H;
       DELETE FROM MAGNETISM_ORIG_J;
       DELETE FROM MAGNETISM_ORIG_K;
       
       DELETE FROM MAGNETISM_EG;
       DELETE FROM MAGNETISM_EGJ;
       DELETE FROM MAGNETISM_DEGJ;
       DELETE FROM MAGNETISM_BDEGJ;
       DELETE FROM MAGNETISM_BCDEGJ;
       DELETE FROM MAGNETISM_BCDEFGJ;
       DELETE FROM MAGNETISM_ABCDEFGJ;
       DELETE FROM MAGNETISM_ABCDEFGHJ;
       DELETE FROM MAGNETISM_ABCDEFGHJK;
    EXCEPTION
       WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20345, 'ERROR: MAGNETISM_CONTROL.Reset_Tables : ' || sqlerrm);
    END;

    Procedure Build_Base
    AS
    BEGIN
       INSERT INTO MAGNETISM_BASE (L1, L2, L3)
       WITH Digits AS (SELECT rownum Nos FROM ALL_OBJECTS WHERE Rownum <= 26)
       SELECT L1.Nos L1, L2.Nos L2, L3.Nos L3
       FROM    Digits L1
         JOIN  Digits L2 ON L2.Nos NOT IN (L1.Nos)
         JOIN  Digits L3 ON L3.Nos NOT IN (L1.Nos, L2.Nos);
    EXCEPTION
       WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20345, 'ERROR: MAGNETISM_CONTROL.Build_Base : ' || sqlerrm);
    END;

    Procedure Build_Letters
    AS
    BEGIN
       INSERT INTO MAGNETISM_ORIG_A (LetterA,  N2, N13, N16) SELECT L1 - L2 - L3, L1, L2, L3   FROM    MAGNETISM_BASE;
       INSERT INTO MAGNETISM_ORIG_B (LetterB, N14, N20, N17) SELECT L1 + L2 - L3, L1, L2, L3   FROM    MAGNETISM_BASE;
       INSERT INTO MAGNETISM_ORIG_C (LetterC,  N5, N19, N14) SELECT L1 - L2 - L3, L1, L2, L3   FROM    MAGNETISM_BASE;
       INSERT INTO MAGNETISM_ORIG_D (LetterD, N17,  N6, N18) SELECT L1 + L2 - L3, L1, L2, L3   FROM    MAGNETISM_BASE;
       INSERT INTO MAGNETISM_ORIG_E (LetterE,  N3,  N7, N12) SELECT L1 - L2 - L3, L1, L2, L3   FROM    MAGNETISM_BASE;
       INSERT INTO MAGNETISM_ORIG_F (LetterF,  N8, N15, N19) SELECT L1 - L2 - L3, L1, L2, L3   FROM    MAGNETISM_BASE;
       INSERT INTO MAGNETISM_ORIG_G (LetterG, N11, N16, N14) SELECT L1 + L2 - L3, L1, L2, L3   FROM    MAGNETISM_BASE;
       INSERT INTO MAGNETISM_ORIG_H (LetterH, N17, N18, N13) SELECT L1 + L2 - L3, L1, L2, L3   FROM    MAGNETISM_BASE;
       INSERT INTO MAGNETISM_ORIG_J (LetterJ,  N1, N12,  N3) SELECT L1 + L2 - L3, L1, L2, L3   FROM    MAGNETISM_BASE;
       INSERT INTO MAGNETISM_ORIG_K (LetterK,  N2, N17,  N9) SELECT L1 + L2 - L3, L1, L2, L3   FROM    MAGNETISM_BASE;
       
       -- N :  51 08.679 : N  51 G(D-J)... => G = 0
       -- W : 000 30.051 : W 000 (A+F)E... => (A+F)E = 29 or 30 
       DELETE  FROM  MAGNETISM_ORIG_G WHERE LetterG != 0;
       DELETE  FROM  MAGNETISM_ORIG_E WHERE LetterE Not IN (0, 9);
    EXCEPTION
       WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20345, 'ERROR: MAGNETISM_CONTROL.Build_Letters : ' || sqlerrm);
    END;

    Procedure Load_EG(p_StopTime DATE)
    AS
       Loc_N11   NUMBER;
    BEGIN
       Get_Rows;
       IF MAG_RECORD.Rows_G     > 0 AND MAG_RECORD.Rows_EG     < PKG_LIMIT AND Sysdate < p_StopTime
       THEN
          SELECT N11 INTO Loc_N11 FROM V_MAGNETISM_G WHERE Rownum = 1;

          INSERT INTO MAGNETISM_EG 
                (LetterE, LetterG, N3, N7, N11, N12, N14, N16)
          SELECT LetterE, LetterG, N3, N7, N11, N12, N14, N16
          FROM   V_MAGNETISM_E 
            JOIN V_MAGNETISM_G ON N11 = Loc_N11
                              AND N11 NOT IN (N3, N7, N12)
                              AND N14 NOT IN (N3, N7, N12)
                              AND N16 NOT IN (N3, N7, N12);
          MAG_RECORD.Rows_EG := MAG_RECORD.Rows_EG + SQL%RowCount;

          DELETE FROM V_MAGNETISM_G WHERE  N11 = Loc_N11;
          MAG_RECORD.Rows_G := MAG_RECORD.Rows_G - SQL%RowCount;

          Update_Rows;
       END IF;
    EXCEPTION
       WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20345, 'ERROR: MAGNETISM_CONTROL.Load_EG : ' || sqlerrm);
    END;

    Procedure Load_EGJ(p_StopTime DATE)
    AS
       Loc_N3    NUMBER;
    BEGIN
       Get_Rows;
       IF MAG_RECORD.Rows_EG     > 0 AND MAG_RECORD.Rows_EGJ     < PKG_LIMIT AND Sysdate < p_StopTime
       THEN
          SELECT N3 INTO Loc_N3 FROM MAGNETISM_EG WHERE Rownum = 1;

          INSERT INTO MAGNETISM_EGJ
                (LetterE, LetterG, LetterJ,   N1,   N3,   N7,   N11,   N12,   N14,   N16)
          SELECT LetterE, LetterG, LetterJ, J.N1, M.N3, M.N7, M.N11, M.N12, M.N14, M.N16
          FROM   MAGNETISM_EG  M
            JOIN V_MAGNETISM_J J ON J.N3  = M.N3
                                AND J.N12 = M.N12
                                AND J.N1 NOT IN (M.N3, M.N7, M.N11, M.N12, M.N14, M.N16)
          WHERE M.N3  = Loc_N3;
          MAG_RECORD.Rows_EGJ := MAG_RECORD.Rows_EGJ + SQL%Rowcount;

          DELETE FROM MAGNETISM_EG WHERE N3  = Loc_N3;
          MAG_RECORD.Rows_EG := MAG_RECORD.Rows_EG - SQL%Rowcount;

          Update_Rows;
       END IF;
    EXCEPTION
       WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20345, 'ERROR: MAGNETISM_CONTROL.Load_EGJ : ' || sqlerrm);
    END;

    Procedure Load_DEGJ(p_StopTime DATE)
    AS
       Loc_N1    NUMBER;
       Loc_Start_Time      DATE;
       Loc_End_Time        DATE;
       Loc_Rows_Inserted   NUMBER;
       Loc_Rows_Deleted    NUMBER;
    BEGIN
       Get_Rows;
       WHILE MAG_RECORD.Rows_EGJ     > 0 AND MAG_RECORD.Rows_DEGJ     < PKG_LIMIT AND Sysdate < p_StopTime
       LOOP
          Loc_Start_Time := SYSDATE;
          SELECT N1 INTO Loc_N1 FROM MAGNETISM_EGJ WHERE Rownum = 1;

          INSERT INTO MAGNETISM_DEGJ
                (LetterD, LetterE, LetterG, LetterJ,   N1,   N3,   N6,   N7,   N11,   N12,   N14,   N16,   N17,   N18)
          SELECT LetterD, LetterE, LetterG, LetterJ, M.N1, M.N3, D.N6, M.N7, M.N11, M.N12, M.N14, M.N16, D.N17, D.N18
          FROM   MAGNETISM_EGJ M
            JOIN V_MAGNETISM_D D ON D.LetterD - M.LetterJ IN (8, 9)
                                AND D.N6  NOT IN (M.N1, M.N3, M.N7, M.N11, M.N12, M.N14, M.N16)
                                AND D.N17 NOT IN (M.N1, M.N3, M.N7, M.N11, M.N12, M.N14, M.N16)
                                AND D.N18 NOT IN (M.N1, M.N3, M.N7, M.N11, M.N12, M.N14, M.N16)
          WHERE M.N1 = Loc_N1;
          Loc_Rows_Inserted := SQL%RowCount;

          DELETE FROM MAGNETISM_EGJ WHERE N1 = Loc_N1;
          Loc_Rows_Deleted := SQL%RowCount;
          Loc_End_Time := SYSDATE;
          Log_Time(Loc_Start_Time, Loc_End_Time, 'Load_DEGJ', Loc_Rows_Inserted, Loc_Rows_Deleted);

          MAG_RECORD.Rows_DEGJ := MAG_RECORD.Rows_DEGJ + Loc_Rows_Inserted;
          MAG_RECORD.Rows_EGJ  := MAG_RECORD.Rows_EGJ  - Loc_Rows_Deleted;
          Update_Rows;
       END LOOP;
    EXCEPTION
       WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20345, 'ERROR: MAGNETISM_CONTROL.Load_DEGJ : ' || sqlerrm);
    END;

    Procedure Load_BDEGJ(p_StopTime DATE)
    AS
       Loc_N17  NUMBER;
       Loc_Start_Time      DATE;
       Loc_End_Time        DATE;
       Loc_Rows_Inserted   NUMBER;
       Loc_Rows_Deleted    NUMBER;
    BEGIN
       Get_Rows;
       WHILE MAG_RECORD.Rows_DEGJ     > 0 AND MAG_RECORD.Rows_BDEGJ     < PKG_LIMIT AND Sysdate < p_StopTime
       LOOP
          Loc_Start_Time := SYSDATE;
          SELECT N17 INTO Loc_N17 FROM MAGNETISM_DEGJ WHERE Rownum = 1;

           INSERT INTO MAGNETISM_BDEGJ
                 (LetterB, LetterD, LetterE, LetterG, LetterJ,   N1,   N3,   N6,   N7,   N11,   N12,   N14,   N16,   N17,   N18,   N20)
           SELECT LetterB, LetterD, LetterE, LetterG, LetterJ, M.N1, M.N3, M.N6, M.N7, M.N11, M.N12, M.N14, M.N16, M.N17, M.N18, B.N20
           FROM   MAGNETISM_DEGJ M
             JOIN V_MAGNETISM_B  B ON M.LetterD - B.LetterB BETWEEN 0 AND 9
                                  AND B.N14 = M.N14
                                  AND B.N17 = M.N17
                                  AND B.N20 NOT IN (M.N1, M.N3, M.N6, M.N7, M.N11, M.N12, M.N14, M.N16, M.N17, M.N18)
           WHERE M.N17 = Loc_N17;
           Loc_Rows_Inserted := SQL%RowCount;

           DELETE FROM MAGNETISM_DEGJ WHERE N17 = Loc_N17;
           Loc_Rows_Deleted := SQL%RowCount;
           Loc_End_Time := SYSDATE;
           Log_Time(Loc_Start_Time, Loc_End_Time, 'Load_BDEGJ', Loc_Rows_Inserted, Loc_Rows_Deleted);

           MAG_RECORD.Rows_BDEGJ := MAG_RECORD.Rows_BDEGJ + Loc_Rows_Inserted;
           MAG_RECORD.Rows_DEGJ  := MAG_RECORD.Rows_DEGJ  - Loc_Rows_Deleted;
           Update_Rows;
       END LOOP;
    EXCEPTION
       WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20345, 'ERROR: MAGNETISM_CONTROL.Load_BDEGJ : ' || sqlerrm);
    END;

    Procedure Load_BCDEGJ(p_StopTime DATE)
    AS
       Loc_N14  NUMBER;
       Loc_Start_Time      DATE;
       Loc_End_Time        DATE;
       Loc_Rows_Inserted   NUMBER;
       Loc_Rows_Deleted    NUMBER;
    BEGIN
       Get_Rows;
       WHILE MAG_RECORD.Rows_BDEGJ     > 0 AND MAG_RECORD.Rows_BCDEGJ     < PKG_LIMIT AND Sysdate < p_StopTime
       LOOP
          Loc_Start_Time := SYSDATE;
          SELECT N14 INTO Loc_N14 FROM MAGNETISM_BDEGJ WHERE Rownum = 1;

          INSERT INTO MAGNETISM_BCDEGJ
                (LetterB, LetterC, LetterD, LetterE, LetterG, LetterJ,   N1,   N3,   N5,   N6,   N7,   N11,   N12,   N14,   N16,   N17,   N18,   N19,   N20)
          SELECT LetterB, LetterC, LetterD, LetterE, LetterG, LetterJ, M.N1, M.N3, C.N5, M.N6, M.N7, M.N11, M.N12, M.N14, M.N16, M.N17, M.N18, C.N19, M.N20
          FROM   MAGNETISM_BDEGJ M
            JOIN V_MAGNETISM_C   C ON M.LetterB - C.LetterC BETWEEN 0 AND 9
                                  AND C.N14 = M.N14
                                  AND C.N5  NOT IN (M.N1, M.N3, M.N6, M.N7, M.N11, M.N12, M.N14, M.N16, M.N17, M.N18, M.N20)
                                  AND C.N19 NOT IN (M.N1, M.N3, M.N6, M.N7, M.N11, M.N12, M.N14, M.N16, M.N17, M.N18, M.N20)
          WHERE M.N14 = Loc_N14;
          Loc_Rows_Inserted := SQL%RowCount;

          DELETE FROM MAGNETISM_BDEGJ WHERE N14 = Loc_N14;
          Loc_Rows_Deleted := SQL%RowCount;
          Loc_End_Time := SYSDATE;
          Log_Time(Loc_Start_Time, Loc_End_Time, 'Load_BCDEGJ', Loc_Rows_Inserted, Loc_Rows_Deleted);

          MAG_RECORD.Rows_BCDEGJ := MAG_RECORD.Rows_BCDEGJ + Loc_Rows_Inserted;
          MAG_RECORD.Rows_BDEGJ  := MAG_RECORD.Rows_BDEGJ  - Loc_Rows_Deleted;
          Update_Rows;
       END LOOP;
    EXCEPTION
       WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20345, 'ERROR: MAGNETISM_CONTROL.Load_BCDEGJ : ' || sqlerrm);
    END;

    Procedure Load_BCDEFGJ(p_StopTime DATE)
    AS
       Loc_N19  NUMBER;
       Loc_Start_Time      DATE;
       Loc_End_Time        DATE;
       Loc_Rows_Inserted   NUMBER;
       Loc_Rows_Deleted    NUMBER;
    BEGIN
       Get_Rows;
       WHILE MAG_RECORD.Rows_BCDEGJ    > 0 AND MAG_RECORD.Rows_BCDEFGJ    < PKG_LIMIT AND Sysdate < p_StopTime
       LOOP
          Loc_Start_Time := SYSDATE;
          SELECT N19 INTO Loc_N19 FROM MAGNETISM_BCDEGJ WHERE Rownum = 1;

          INSERT INTO MAGNETISM_BCDEFGJ
                (LetterB, LetterC, LetterD, LetterE, LetterF, LetterG, LetterJ,
                   N1,   N3,   N5,   N6,   N7,   N8,   N11,   N12,   N14,   N15,  N16,   N17,   N18,   N19,   N20)
          SELECT LetterB, LetterC, LetterD, LetterE, LetterF, LetterG, LetterJ,
                 M.N1, M.N3, M.N5, M.N6, M.N7, F.N8, M.N11, M.N12, M.N14, F.N15, M.N16, M.N17, M.N18, M.N19, M.N20
          FROM   MAGNETISM_BCDEGJ M
            JOIN V_MAGNETISM_F    F ON M.LetterC + F.LetterF BETWEEN 0 AND 9
                                   AND F.LetterF + M.LetterJ BETWEEN 0 AND 9
                                   AND F.N19 = M.N19
                                   AND F.N8  NOT IN (M.N1, M.N3, M.N5, M.N6, M.N7, M.N11, M.N12, M.N14, M.N16, M.N17, M.N18, M.N19, M.N20)
                                   AND F.N15 NOT IN (M.N1, M.N3, M.N5, M.N6, M.N7, M.N11, M.N12, M.N14, M.N16, M.N17, M.N18, M.N19, M.N20)
          WHERE M.N19 = Loc_N19;
          Loc_Rows_Inserted := SQL%RowCount;

          DELETE FROM MAGNETISM_BCDEGJ WHERE N19 = Loc_N19;
          Loc_Rows_Deleted := SQL%RowCount;
          Loc_End_Time := SYSDATE;
          Log_Time(Loc_Start_Time, Loc_End_Time, 'Load_BCDEFGJ', Loc_Rows_Inserted, Loc_Rows_Deleted);

          MAG_RECORD.Rows_BCDEFGJ := MAG_RECORD.Rows_BCDEFGJ + Loc_Rows_Inserted;
          MAG_RECORD.Rows_BCDEGJ  := MAG_RECORD.Rows_BCDEGJ  - Loc_Rows_Deleted;
          Update_Rows;
       END LOOP;
    EXCEPTION
       WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20345, 'ERROR: MAGNETISM_CONTROL.Load_BCDEFGJ : ' || sqlerrm);
    END;

    Procedure Load_ABCDEFGJ(p_StopTime DATE)
    AS
       Loc_N5   NUMBER;
       Loc_Start_Time      DATE;
       Loc_End_Time        DATE;
       Loc_Rows_Inserted   NUMBER;
       Loc_Rows_Deleted    NUMBER;
    BEGIN
       Get_Rows;
       WHILE MAG_RECORD.Rows_BCDEFGJ   > 0 AND MAG_RECORD.Rows_ABCDEFGJ   < PKG_LIMIT AND Sysdate < p_StopTime
       LOOP
          Loc_Start_Time := SYSDATE;
          SELECT N5 INTO Loc_N5 FROM MAGNETISM_BCDEFGJ WHERE Rownum = 1;

          INSERT INTO MAGNETISM_ABCDEFGJ
                (LetterA, LetterB, LetterC, LetterD, LetterE, LetterF, LetterG, LetterJ,
                   N1,   N2,   N3,   N5,   N6,   N7,   N8,   N11,   N12,   N13,   N14,   N15,  N16,   N17,   N18,   N19,   N20)
          SELECT LetterA, LetterB, LetterC, LetterD, LetterE, LetterF, LetterG, LetterJ,
                 M.N1, A.N2, M.N3, M.N5, M.N6, M.N7, M.N8, M.N11, M.N12, A.N13, M.N14, M.N15, M.N16, M.N17, M.N18, M.N19, M.N20
          FROM   MAGNETISM_BCDEFGJ M
            JOIN V_MAGNETISM_A     A ON (A.LetterA + M.LetterF) = decode(M.LetterE, 0, 3, 9, 2)
                                    AND A.N16 = M.N16
                                    AND A.N2  NOT IN (M.N1, M.N3, M.N5, M.N6, M.N7, M.N8, M.N11, M.N12, M.N14, M.N15, M.N16, M.N17, M.N18, M.N19, M.N20)
                                    AND A.N13 NOT IN (M.N1, M.N3, M.N5, M.N6, M.N7, M.N8, M.N11, M.N12, M.N14, M.N15, M.N16, M.N17, M.N18, M.N19, M.N20)
          WHERE M.N5  = Loc_N5;
          Loc_Rows_Inserted := SQL%RowCount;

          DELETE FROM MAGNETISM_BCDEFGJ WHERE N5 = Loc_N5;
          Loc_Rows_Deleted := SQL%RowCount;
          Loc_End_Time := SYSDATE;
          Log_Time(Loc_Start_Time, Loc_End_Time, 'Load_ABCDEFGJ', Loc_Rows_Inserted, Loc_Rows_Deleted);

          MAG_RECORD.Rows_ABCDEFGJ := MAG_RECORD.Rows_ABCDEFGJ + Loc_Rows_Inserted;
          MAG_RECORD.Rows_BCDEFGJ  := MAG_RECORD.Rows_BCDEFGJ  - Loc_Rows_Deleted;
          Update_Rows;
       END LOOP;
    EXCEPTION
       WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20345, 'ERROR: MAGNETISM_CONTROL.Load_ABCDEFGJ : ' || sqlerrm);
    END;

    Procedure Load_ABCDEFGHJ(p_StopTime DATE)
    AS
       Loc_N3   NUMBER;
       Loc_Start_Time      DATE;
       Loc_End_Time        DATE;
       Loc_Rows_Inserted   NUMBER;
       Loc_Rows_Deleted    NUMBER;
    BEGIN
       Get_Rows;
       WHILE MAG_RECORD.Rows_ABCDEFGJ  > 0 AND MAG_RECORD.Rows_ABCDEFGHJ  < PKG_LIMIT AND Sysdate < p_StopTime
       LOOP
          Loc_Start_Time := SYSDATE;
          SELECT N3 INTO Loc_N3 FROM MAGNETISM_ABCDEFGJ WHERE Rownum = 1;

          INSERT INTO MAGNETISM_ABCDEFGHJ
                (LetterA, LetterB, LetterC, LetterD, LetterE, LetterF, LetterG, LetterH, LetterJ,
                   N1,   N2,   N3,   N5,   N6,   N7,   N8,   N11,   N12,   N13,   N14,   N15,  N16,   N17,   N18,   N19,   N20)
          SELECT LetterA, LetterB, LetterC, LetterD, LetterE, LetterF, LetterG, LetterH, LetterJ,
                 M.N1, M.N2, M.N3, M.N5, M.N6, M.N7, M.N8, M.N11, M.N12, M.N13, M.N14, M.N15, M.N16, M.N17, M.N18, M.N19, M.N20
          FROM   MAGNETISM_ABCDEFGJ M
            JOIN V_MAGNETISM_H      H ON 1 = 1 --(A.LetterA + M.LetterF) = decode(M.LetterE, 0, 3, 9, 2)
                                     AND H.N13 = M.N13
                                     AND H.N17 = M.N17
                                     AND H.N18 = M.N18
          WHERE M.N3 = Loc_N3;
          Loc_Rows_Inserted := SQL%RowCount;

          DELETE FROM MAGNETISM_ABCDEFGJ WHERE N3 = Loc_N3;
          Loc_Rows_Deleted := SQL%RowCount;
          Loc_End_Time := SYSDATE;
          Log_Time(Loc_Start_Time, Loc_End_Time, 'Load_ABCDEFGHJ', Loc_Rows_Inserted, Loc_Rows_Deleted);
          
          MAG_RECORD.Rows_ABCDEFGHJ := MAG_RECORD.Rows_ABCDEFGHJ + Loc_Rows_Inserted;
          MAG_RECORD.Rows_ABCDEFGJ  := MAG_RECORD.Rows_ABCDEFGJ  - Loc_Rows_Deleted;
          Update_Rows;
      END LOOP;
    EXCEPTION
       WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20345, 'ERROR: MAGNETISM_CONTROL.Load_ABCDEFGHJ : ' || sqlerrm);
    END;

    Procedure Load_ABCDEFGHJK(p_StopTime DATE)
    AS
       Loc_N2              NUMBER;
       Loc_Start_Time      DATE;
       Loc_End_Time        DATE;
       Loc_Rows_Inserted   NUMBER;
       Loc_Rows_Deleted    NUMBER;
    BEGIN
      Get_Rows;
      WHILE MAG_RECORD.Rows_ABCDEFGHJ > 0 AND Sysdate < p_StopTime
      LOOP
         Loc_Start_Time := SYSDATE;
         SELECT N2 INTO Loc_N2 FROM MAGNETISM_ABCDEFGHJ WHERE Rownum = 1;

         INSERT INTO MAGNETISM_ABCDEFGHJK
                (LetterA, LetterB, LetterC, LetterD, LetterE, LetterF, LetterG, LetterH, LetterJ, LetterK,
                  N1,   N2,   N3,   N5,   N6,   N7,   N8,   N9,   N11,   N12,   N13,   N14,   N15,  N16,   N17,   N18,   N19,   N20)
         SELECT LetterA, LetterB, LetterC, LetterD, LetterE, LetterF, LetterG, LetterH, LetterJ, LetterK,
                M.N1, M.N2, M.N3, M.N5, M.N6, M.N7, M.N8, K.N9, M.N11, M.N12, M.N13, M.N14, M.N15, M.N16, M.N17, M.N18, M.N19, M.N20
         FROM   MAGNETISM_ABCDEFGHJ M
           JOIN V_MAGNETISM_K       K ON M.LetterH + K.LetterK  BETWEEN 0 AND 9
                                     AND K.N2  = M.N2
                                     AND K.N17 = M.N17
                                     AND K.N9  NOT IN (M.N1, M.N2, M.N3, M.N5, M.N6, M.N7, M.N8, M.N11, M.N12, M.N13, M.N14, M.N15, M.N16, M.N17, M.N18, M.N19, M.N20)
         WHERE M.N2 = Loc_N2;
         Loc_Rows_Inserted := SQL%RowCount;

         DELETE FROM MAGNETISM_ABCDEFGHJ WHERE N2 = Loc_N2;
         Loc_Rows_Deleted := SQL%RowCount;
         Loc_End_Time := SYSDATE;
         Log_Time(Loc_Start_Time, Loc_End_Time, 'Load_ABCDEFGHJK', Loc_Rows_Inserted, Loc_Rows_Deleted);

         MAG_RECORD.Rows_ABCDEFGHJK := MAG_RECORD.Rows_ABCDEFGHJK + Loc_Rows_Inserted;
         MAG_RECORD.Rows_ABCDEFGHJ  := MAG_RECORD.Rows_ABCDEFGHJ  - Loc_Rows_Deleted;         
         Update_Rows;

         Delete_Rows;
         Append_Frequency;
         Clear_Rows;
      END LOOP;
    EXCEPTION
       WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20345, 'ERROR: MAGNETISM_CONTROL.Load_ABCDEFGHJK : ' || sqlerrm);
    END;

    Procedure Reset
    AS
    BEGIN
       Reset_Tables;
       Build_Base;
       Build_Letters;
    END;

END;
/
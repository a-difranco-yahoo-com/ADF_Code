
N 51� 30.500 W 000� 20.515 
/
CREATE TABLE GEO_BULLEYES (
N_Or_W          Varchar2(1),
Hour            Number,
Minute          Number,
Ordinal         Number)
/
CREATE TABLE GEO_DARTBOARD (
Dart_No         Number,
Start_Degree    Number,
End_Degree      Number)
/

BEGIN
DELETE FROM GEO_BULLEYES;
INSERT INTO GEO_BULLEYES (N_Or_W, Hour, Minute,Ordinal) VALUES ('N', 11, 57, 1);
INSERT INTO GEO_BULLEYES (N_Or_W, Hour, Minute,Ordinal) VALUES ('N', 12, 03, 2);
INSERT INTO GEO_BULLEYES (N_Or_W, Hour, Minute,Ordinal) VALUES ('N',  2, 30, 3);
--
INSERT INTO GEO_BULLEYES (N_Or_W, Hour, Minute,Ordinal) VALUES ('W', NULL, NULL, 4);
INSERT INTO GEO_BULLEYES (N_Or_W, Hour, Minute,Ordinal) VALUES ('W', NULL, NULL, 5);
INSERT INTO GEO_BULLEYES (N_Or_W, Hour, Minute,Ordinal) VALUES ('W', NULL, NULL, 6);
--
INSERT INTO GEO_BULLEYES (N_Or_W, Hour, Minute,Ordinal) VALUES ('N', NULL, NULL, 7);
INSERT INTO GEO_BULLEYES (N_Or_W, Hour, Minute,Ordinal) VALUES ('N',    7,   42, 8);
INSERT INTO GEO_BULLEYES (N_Or_W, Hour, Minute,Ordinal) VALUES ('N',    9,   58, 9);
--
INSERT INTO GEO_BULLEYES (N_Or_W, Hour, Minute,Ordinal) VALUES ('W',    4,   23, 10);
INSERT INTO GEO_BULLEYES (N_Or_W, Hour, Minute,Ordinal) VALUES ('W', NULL, NULL, 11);
INSERT INTO GEO_BULLEYES (N_Or_W, Hour, Minute,Ordinal) VALUES ('W',    5,   43, 12);
--
INSERT INTO GEO_BULLEYES (N_Or_W, Hour, Minute,Ordinal) VALUES ('N',   10,   14, 13);
INSERT INTO GEO_BULLEYES (N_Or_W, Hour, Minute,Ordinal) VALUES ('N', NULL, NULL, 14);
INSERT INTO GEO_BULLEYES (N_Or_W, Hour, Minute,Ordinal) VALUES ('N', NULL, NULL, 15);
--
INSERT INTO GEO_BULLEYES (N_Or_W, Hour, Minute,Ordinal) VALUES ('W',    2,   42, 16);
INSERT INTO GEO_BULLEYES (N_Or_W, Hour, Minute,Ordinal) VALUES ('W',    5,   58, 17);
INSERT INTO GEO_BULLEYES (N_Or_W, Hour, Minute,Ordinal) VALUES ('W', NULL, NULL, 18);
--
END;
/
BEGIN
DELETE FROM GEO_DARTBOARD;

INSERT INTO GEO_DARTBOARD (Dart_No, Start_Degree, End_Degree) VALUES (20,   0,   9);
INSERT INTO GEO_DARTBOARD (Dart_No, Start_Degree, End_Degree) VALUES ( 1,   9,  27);
INSERT INTO GEO_DARTBOARD (Dart_No, Start_Degree, End_Degree) VALUES (18,  27,  45);
INSERT INTO GEO_DARTBOARD (Dart_No, Start_Degree, End_Degree) VALUES ( 4,  45,  63);
INSERT INTO GEO_DARTBOARD (Dart_No, Start_Degree, End_Degree) VALUES (13,  63,  81);
INSERT INTO GEO_DARTBOARD (Dart_No, Start_Degree, End_Degree) VALUES ( 6,  81,  99);
INSERT INTO GEO_DARTBOARD (Dart_No, Start_Degree, End_Degree) VALUES (10,  99, 117);
INSERT INTO GEO_DARTBOARD (Dart_No, Start_Degree, End_Degree) VALUES (15, 117, 135);
INSERT INTO GEO_DARTBOARD (Dart_No, Start_Degree, End_Degree) VALUES ( 2, 135, 153);
INSERT INTO GEO_DARTBOARD (Dart_No, Start_Degree, End_Degree) VALUES (17, 153, 171);
INSERT INTO GEO_DARTBOARD (Dart_No, Start_Degree, End_Degree) VALUES ( 3, 171, 189);
INSERT INTO GEO_DARTBOARD (Dart_No, Start_Degree, End_Degree) VALUES (19, 189, 207);
INSERT INTO GEO_DARTBOARD (Dart_No, Start_Degree, End_Degree) VALUES ( 7, 207, 225);
INSERT INTO GEO_DARTBOARD (Dart_No, Start_Degree, End_Degree) VALUES (16, 225, 243);
INSERT INTO GEO_DARTBOARD (Dart_No, Start_Degree, End_Degree) VALUES ( 8, 243, 261);
INSERT INTO GEO_DARTBOARD (Dart_No, Start_Degree, End_Degree) VALUES (11, 261, 279);
INSERT INTO GEO_DARTBOARD (Dart_No, Start_Degree, End_Degree) VALUES (14, 279, 297);
INSERT INTO GEO_DARTBOARD (Dart_No, Start_Degree, End_Degree) VALUES ( 9, 297, 315);
INSERT INTO GEO_DARTBOARD (Dart_No, Start_Degree, End_Degree) VALUES (12, 315, 333);
INSERT INTO GEO_DARTBOARD (Dart_No, Start_Degree, End_Degree) VALUES ( 5, 333, 351);
INSERT INTO GEO_DARTBOARD (Dart_No, Start_Degree, End_Degree) VALUES (20, 351, 360);

END;
/

-- 60 m = 360 degree  => 1 m = 6 degree
CREATE OR REPLACE VIEW V_GEO_BULLEYES
AS
SELECT N_Or_W, Hour, Minute, Ordinal, Minute * 6 Degrees
FROM   GEO_BULLEYES
/

SELECT    N_Or_W, Hour, Minute, Ordinal, nvl(Dart_No, 0), Degrees, Start_Degree, End_Degree
FROM      V_GEO_BULLEYES 
LEFT JOIN GEO_DARTBOARD ON Degrees Between Start_Degree AND End_Degree
ORDER BY N_Or_W, Ordinal
/

-- 51 0 7/8 9
@@ -1,119 +0,0 @@

SELECT Chapter_Name, Chapter_No FROM SCHEMA1;
SELECT Chapter_Name             FROM SCHEMA2;
SELECT Chapter_Name, Chapter_No FROM SCHEMA3;
SELECT Chapter_Name, Chapter_No FROM SCHEMA4;

-- Chapter Name
-- Schema 1 no overlap with the rest
SELECT Chapter_Name FROM SCHEMA1 INTERSECT SELECT Chapter_Name             FROM SCHEMA2;
SELECT Chapter_Name FROM SCHEMA1 INTERSECT SELECT Chapter_Name             FROM SCHEMA3;
SELECT Chapter_Name FROM SCHEMA1 INTERSECT SELECT Chapter_Name             FROM SCHEMA4;

SELECT Chapter_Name FROM SCHEMA2 INTERSECT SELECT Chapter_Name             FROM SCHEMA3;
(SELECT '2', Chapter_Name FROM SCHEMA2 MINUS     SELECT '2', Chapter_Name             FROM SCHEMA3)
UNION
(SELECT '3', Chapter_Name FROM SCHEMA3 MINUS     SELECT '3', Chapter_Name             FROM SCHEMA2)
ORDER BY 2, 1
/

SELECT *
FROM   (
SELECT Chapter_Name,
       max(decode(Src, '1', 'Y', 'N')) On_1,
       max(decode(Src, '2', 'Y', 'N')) On_2,
       max(decode(Src, '3', 'Y', 'N')) On_3,
       max(decode(Src, '4', 'Y', 'N')) On_4
FROM  (
SELECT '1' Src, Chapter_Name FROM SCHEMA1 UNION
SELECT '2' Src, Chapter_Name FROM SCHEMA2 UNION
SELECT '3' Src, Chapter_Name FROM SCHEMA3 UNION
SELECT '4' Src, Chapter_Name FROM SCHEMA4 
)
GROUP BY Chapter_Name
ORDER BY Chapter_Name
)
WHERE On_1 = 'N'
OR    On_2 = 'N'
OR    On_3 = 'N'
OR    On_4 = 'N'
/

UPDATE SCHEMA1 Set Chapter_Name = rtrim(Chapter_Name);
UPDATE SCHEMA2 Set Chapter_Name = rtrim(Chapter_Name);
UPDATE SCHEMA3 Set Chapter_Name = rtrim(Chapter_Name);
UPDATE SCHEMA4 Set Chapter_Name = rtrim(Chapter_Name);

SELECT '1', Details FROM SCHEMA1 WHERE Details Like '%Jaime%' UNION
SELECT '2', Details FROM SCHEMA2 WHERE Details Like '%Jaime%' UNION
SELECT '3', Details FROM SCHEMA3 WHERE Details Like '%Jaime%' UNION
SELECT '4', Details FROM SCHEMA4 WHERE Details Like '%Jaime%' 
/
SELECT * FROM SCHEMA1;
SELECT * FROM SCHEMA2;
SELECT * FROM SCHEMA3;
SELECT * FROM SCHEMA4;

SELECT *
FROM   (
SELECT Chapter_No,
       max(decode(Src, '1', 'Y', 'N')) On_1,
       max(decode(Src, '3', 'Y', 'N')) On_3,
       max(decode(Src, '4', 'Y', 'N')) On_4
FROM  (
SELECT '1' Src, Chapter_No FROM SCHEMA1 UNION
SELECT '3' Src, Chapter_No FROM SCHEMA3 UNION
SELECT '4' Src, Chapter_No FROM SCHEMA4 
)
GROUP BY Chapter_No
ORDER BY Chapter_No
)
WHERE On_1 = 'N'
OR    On_3 = 'N'
OR    On_4 = 'N'
/


SELECT S1.Chapter_No, S3.Chapter_No, S4.Chapter_No
FROM   SCHEMA1 S1
  JOIN SCHEMA2 S2 ON S2.Chapter_Name = S1.Chapter_Name
  JOIN SCHEMA3 S3 ON S3.Chapter_Name = S1.Chapter_Name
  JOIN SCHEMA4 S4 ON S4.Chapter_Name = S1.Chapter_Name
WHERE  S1.Chapter_No != S3.Chapter_No
OR     S1.Chapter_No != S4.Chapter_No
/

CREATE OR REPLACE VIEW V_ASOIAF_SUMMARY
AS
SELECT S1.Chapter_Name,
       S1.Read_Order RO1, S2.Read_Order RO2, S3.Read_Order RO3, S4.Read_Order  RO4
FROM   SCHEMA1 S1
  JOIN SCHEMA2 S2 ON S2.Chapter_Name = S1.Chapter_Name
  JOIN SCHEMA3 S3 ON S3.Chapter_Name = S1.Chapter_Name
  JOIN SCHEMA4 S4 ON S4.Chapter_Name = S1.Chapter_Name
ORDER BY to_number(2)
/

SELECT Sum( abs(RO1 - RO2) ) Diff_1v2, Sum( abs(RO1 - RO3) ) Diff_1v3, Sum( abs(RO1 - RO4) ) Diff_1v4,
       Sum( abs(RO2 - RO1) ) Diff_2v1, Sum( abs(RO2 - RO3) ) Diff_2v3, Sum( abs(RO2 - RO4) ) Diff_2v4,
       Sum( abs(RO3 - RO1) ) Diff_3v1, Sum( abs(RO3 - RO2) ) Diff_3v2, Sum( abs(RO3 - RO4) ) Diff_3v4,
       Sum( abs(RO4 - RO1) ) Diff_4v1, Sum( abs(RO4 - RO2) ) Diff_4v2, Sum( abs(RO4 - RO3) ) Diff_4v3
FROM   V_ASOIAF_SUMMARY 
/
SELECT Sum( abs(RO1 - RO3) ) Diff_1v3, Sum( abs(RO1 - RO4) ) Diff_1v4,
       Sum( abs(RO3 - RO1) ) Diff_3v1, Sum( abs(RO3 - RO4) ) Diff_3v4,
       Sum( abs(RO4 - RO1) ) Diff_4v1, Sum( abs(RO4 - RO3) ) Diff_4v3
FROM   V_ASOIAF_SUMMARY 
/

SELECT Chapter_Name, RO1, RO3, CASE WHEN RO1 != RO3 THEN 'Diff' ELSE NULL END Comments
FROM   V_ASOIAF_SUMMARY
/
SELECT S1.Chapter_Name, S1.Chapter_No,
       S1.Read_Order RO1, S3.Read_Order RO3,
       CASE WHEN S1.Read_Order != S3.Read_Order THEN 'Diff' ELSE NULL END Comments
FROM   SCHEMA1 S1
  JOIN SCHEMA3 S3 ON S3.Chapter_Name = S1.Chapter_Name
ORDER BY to_number(S1.Read_Order)
/

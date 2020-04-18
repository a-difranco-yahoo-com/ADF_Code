
SELECT Day, Karma, logdate, Log_No, to_char(LogDate, 'DAY')
FROM (
SELECT Day, Karma, to_date('2018/12/31', 'YYYY/MM/DD') + Day logdate, Rownum Log_No
FROM (
WITH Day AS (SELECT Rownum Day FROM ALL_OBJECTS)
SELECT Day, 100 * (30 + Day) / (300 + Day) Karma
FROM   Day
)
WHERE  Karma = floor(Karma)
)
WHERE Karma IN (25, 40, 64, 99)
OR    Log_No = 10
/

A=5 B=8 C=2 D=6 E=1 F=5 
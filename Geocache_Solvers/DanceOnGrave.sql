
-- https://en.wikipedia.org/wiki/List_of_UK_Singles_Chart_number_ones_of_the_1950s
-- N 51° 31.889 W 000° 06.862  :  N 51 3A.BCD W 0 0E.FGH
--:  N 51 31.960 W 0 06.878

SELECT D.Song_Name,
       Letter4  - Letter6            A,
       Letter8  - Letter3  - Letter9 B,
       Letter5  + Letter7            C,
       Letter10 - Letter6            D,
       Letter9  + Letter11           E,
       Letter2  - Letter6  + Letter3 F,
       Letter1  - Letter3  - Letter5 G,
       Letter2 -  Letter10 + Letter5 H,
       'x' Dummy
FROM  DOG_SONG_LIST D
WHERE Letter4 -Letter6            Between 0 AND 9 
AND   Letter8 - Letter3 - Letter9 Between 0 AND 9 
AND   Letter5 + Letter7           Between 0 AND 9 



UPDATE DOG_SONG_LIST
SET    Clean_Song_Name = upper(Song_Name)
/
UPDATE DOG_SONG_LIST
SET    Clean_Song_Name = replace(Clean_Song_Name, ' ', '')
/
UPDATE DOG_SONG_LIST
SET    Clean_Song_Name = replace(Clean_Song_Name, '-', '')
/
UPDATE DOG_SONG_LIST
SET    Clean_Song_Name = replace(Clean_Song_Name, '''', '')
/
UPDATE DOG_SONG_LIST
SET    Clean_Song_Name = replace(Clean_Song_Name, '?', '')
/
UPDATE DOG_SONG_LIST
SET    Clean_Song_Name = 'CHERRYPINKANDAPPLEBLOSSOMWHITE'
WHERE  Clean_Song_Name = 'CHERRYPINK(ANDAPPLEBLOSSOMWHITE)'
/
UPDATE DOG_SONG_LIST
SET    Clean_Song_Name = 'WHATEVERWILLBEWILLBEQUESERASERA'
WHERE  Clean_Song_Name = 'WHATEVERWILLBEWILLBE(QUESERASERA)'
/
INSERT INTO DOG_SONG_LIST (Song_Name, Clean_Song_Name)
VALUES ('Whatever Will Be Will Be (Que Sera Sera)', 'QUESERASERA')
/
UPDATE DOG_SONG_LIST
SET    Clean_Song_Name = 'HOWMUCHISTHATDOGGIEINTHEWINDOW'
WHERE  Clean_Song_Name = '(HOWMUCHIS)THATDOGGIEINTHEWINDOW'
/
INSERT INTO DOG_SONG_LIST (Song_Name, Clean_Song_Name)
VALUES ('(How Much Is) That Doggie in the Window?', 'THATDOGGIEINTHEWINDOW')
/

UPDATE DOG_SONG_LIST SET    Letter1  = instr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', substr(Clean_Song_Name,  1, 1));
UPDATE DOG_SONG_LIST SET    Letter2  = instr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', substr(Clean_Song_Name,  2, 1));
UPDATE DOG_SONG_LIST SET    Letter3  = instr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', substr(Clean_Song_Name,  3, 1));
UPDATE DOG_SONG_LIST SET    Letter4  = instr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', substr(Clean_Song_Name,  4, 1));
UPDATE DOG_SONG_LIST SET    Letter5  = instr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', substr(Clean_Song_Name,  5, 1));
UPDATE DOG_SONG_LIST SET    Letter6  = instr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', substr(Clean_Song_Name,  6, 1));
UPDATE DOG_SONG_LIST SET    Letter7  = instr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', substr(Clean_Song_Name,  7, 1));
UPDATE DOG_SONG_LIST SET    Letter8  = instr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', substr(Clean_Song_Name,  8, 1));
UPDATE DOG_SONG_LIST SET    Letter9  = instr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', substr(Clean_Song_Name,  9, 1));
UPDATE DOG_SONG_LIST SET    Letter10 = instr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', substr(Clean_Song_Name, 10, 1));
UPDATE DOG_SONG_LIST SET    Letter11 = instr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', substr(Clean_Song_Name, 11, 1));

SELECT Distinct substr(Clean_Song_Name, 1,  1), Letter1 FROM DOG_SONG_LIST ORDER BY 1;
SELECT Distinct substr(Clean_Song_Name, 2,  1), Letter2 FROM DOG_SONG_LIST ORDER BY 1;
SELECT Distinct substr(Clean_Song_Name, 3,  1), Letter3 FROM DOG_SONG_LIST ORDER BY 1;

SELECT Distinct substr(Clean_Song_Name, 11,  1), Letter11 FROM DOG_SONG_LIST ORDER BY 1;



SELECT Distinct translate( Clean_Song_Name, 'xABCDEFGHIJKLMNOPQRSTUVWXYZ', 'x')
FROM   DOG_SONG_LIST
/
SELECT *
FROM   DOG_SONG_LIST
WHERE  Song_Name Like '%(%'
OR     Song_Name Like '%)%'
/


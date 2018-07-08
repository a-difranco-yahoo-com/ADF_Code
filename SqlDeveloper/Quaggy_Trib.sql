

SELECT L.Word, L.WORD_POSITION, H.WORD_POSITION, (H.WORD_POSITION - L.WORD_POSITION) / 6 Periods
FROM   GS_QUAG_TRIB L
 JOIN  GS_QUAG_TRIB H ON H.Word = L.Word
                     AND H.WORD_POSITION > L.WORD_POSITION
 ORDER BY 1, 2,3
/


SELECT L.Word, H.Word, L.WORD_POSITION, H.WORD_POSITION
FROM   GS_QUAG_TRIB L
 JOIN  GS_QUAG_TRIB H ON H.Word_Id = L.Word_Id + 1
                     AND H.WORD_Length = 3
WHERE L.WORD_Length = 5
/

SELECT N.Word, F.Word, O.Word, -- D.Word,
       N.WORD_POSITION, F.WORD_POSITION, O.WORD_POSITION
FROM   GS_QUAG_TRIB N
 JOIN  GS_QUAG_TRIB F ON F.Word_Id = N.Word_Id + 1
                     AND F.WORD_Length = 5
 JOIN  GS_QUAG_TRIB O ON O.Word_Id = F.Word_Id + 1
                     AND O.WORD_Length = 3
-- JOIN  GS_QUAG_TRIB D ON D.Word_Id = O.Word_Id + 1
--                     AND D.WORD_Length IN (3, 4, 6, 7)
WHERE N.WORD_Length = 5
/

SELECT *
FROM   GS_QUAG_TRIB L
WHERE L.WORD_Length = 7
/


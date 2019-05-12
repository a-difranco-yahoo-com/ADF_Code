SET TIMING ON 

BEGIN
  SFA_Setup.Reset;
END;
/

BEGIN
for i in 1..7
loop
for SOL_REC in (SELECT * FROM V_Word_Max_Solution WHERE rownum = 1)
   loop
      SFA_Solver.Split_Word(SOL_REC.Word_Id, SOL_REC.Max_Solutions);
      SFA_Solver.Use_All_Words;
      SFA_Solver.Delete_All_Solutions;
   end loop;
end loop;
END;
/

BEGIN
      SFA_Solver.Use_All_Words;
      SFA_Solver.Delete_All_Solutions;
END;
/
BEGIN
for i in 1..50000
loop
for SOL_REC in (SELECT * FROM V_Unsolved_Word_Count WHERE rownum = 1)
   loop
      SFA_Solver.Split_Word(SOL_REC.Word_Id, SOL_REC.No_Of_Words);
      SFA_Solver.Use_All_Words;
      SFA_Solver.Delete_All_Solutions;
   end loop;
end loop;
END;
/

--------------------------------------------------------------------------------

SELECT    M.Word_Id, M.Word, C.Word_Id, C.Word, Count(*) Occurs
FROM      SFA_WORD M
LEFT JOIN SFA_WORD C ON C.Solution_Id = M.Solution_Id
                    AND C.Start_Col   = M.Start_Col 
                    AND C.End_Col     = M.End_Col 
                    AND C.Word_Id    != M.Word_Id 
WHERE  M.Word IS NOT NULL
Group By M.Word_Id, M.Word, C.Word_Id, C.Word 
Order By M.Word_Id, M.Word, C.Word_Id, C.Word
/

SELECT * FROM V_Solution_Words_Count;
SELECT * FROM V_Word_Max_Solution;
SELECT * FROM V_Solved_Word_Count;
SELECT * FROM V_Words_To_Solve_Count;
SELECT * FROM V_Solution_Count;
SELECT * FROM V_Unsolved_Word_Count;


SELECT Solution_Id, count(Distinct Word_Id)
FROM   SFA_FOUND_WORD
WHERE  Word IN (
'HEY', 'OH,', 'LET''S', 'GO!', 'HEAD', 'FOR',
'FIFTY', 'FIFTY', 'TWO', '.', 'THIRTY',         --- 11 but 2 .s
'NINE', 'THREE','NORTH', 'THEN', 'ZERO',        -- 3 NINEs, 2 ZEROs no THEN
'ZERO', 'ONE', 'SEVENTEEN', '.', 'SIX',         -- Total 19/21 NINE outstqanding
'NINE', 'NINE', 'WEST.', 'IT', 'CAN', 'BE',
'FOUND', 'INSIDE', 'THE', 'CAP', 'OF', 'A',
'TUBULAR', 'BLACK', 'MIRROR', 'POST.',
'I', 'HOPE', 'YOU',  'ENJOY', 'THE', 'FIRST',
'SOMEWHERE', 'FURTHER', 'AFIELD.',
'Xx')
GROUP BY Solution_Id
ORDER BY 2 Desc
/

--------------------------------------------------------------------------------
TRUNCATE TABLE SFA_FOUND_WORD;
TRUNCATE TABLE SFA_WORD;
TRUNCATE TABLE SFA_LETTER;
TRUNCATE TABLE SFA_SOLUTION_TO_MOVE;

alter index IDX_SFA_FW rebuild;
alter index IDX_SFA_W rebuild;
alter index IDX_SFA_L rebuild;


--------------------------------------------------------------------------------

SELECT count(Distinct Solution_ID) FROM SFA_WORD_DONE;
SELECT count(Distinct Solution_ID) FROM SFA_WORD_BKP;


SELECT * FROM SFA_WORD;
SELECT * FROM SFA_FOUND_WORD;
SELECT * FROM SFA_LETTER;

--------------------------------------------------------------------------------

SELECT Solution_Id FROM SFA_WORD_DONE       MINUS SELECT Solution_Id FROM SFA_FOUND_WORD;
SELECT Solution_Id FROM SFA_FOUND_WORD_DONE MINUS SELECT Solution_Id FROM SFA_WORD;
SELECT Solution_Id FROM SFA_LETTER_DONE     MINUS SELECT Solution_Id FROM SFA_FOUND_WORD;
SELECT Solution_Id FROM SFA_FOUND_WORD_DONE MINUS SELECT Solution_Id FROM SFA_LETTER;
SELECT Solution_Id FROM SFA_LETTER_DONE     MINUS SELECT Solution_Id FROM SFA_WORD;
SELECT Solution_Id FROM SFA_WORD_DONE       MINUS SELECT Solution_Id FROM SFA_LETTER;

--------------------------------------------------------------------------------

SELECT Distinct Word
FROM   SFA_FOUND_WORD
WHERE  WorD_Id IN (37)
/

DELETE FROM   SFA_FOUND_WORD WHERE  Word_Id = 46 AND    Word  = 'ANNOTTO';
DELETE FROM   SFA_FOUND_WORD WHERE  Word_Id = 22 AND    Word  = 'NOUN';
DELETE FROM   SFA_FOUND_WORD WHERE  Word_Id = 15 AND    Word  = 'CHEF';
DELETE FROM   SFA_FOUND_WORD WHERE  Word_Id = 31 AND    Word  = 'CHE';
DELETE FROM   SFA_FOUND_WORD WHERE  Word_Id =  5 AND    Word != 'HEAD';
DELETE FROM   SFA_FOUND_WORD WHERE  Word_Id =  1 AND    Word != 'HEY';
DELETE FROM   SFA_FOUND_WORD WHERE  Word_Id = 10 AND    Word != '.';
DELETE FROM   SFA_FOUND_WORD WHERE  Word_Id = 20 AND    Word != '.';
DELETE FROM   SFA_FOUND_WORD WHERE  Word_Id = 33 AND    Word != 'A';

DELETE FROM   SFA_FOUND_WORD
WHERE  Word_Id = 3
AND    Word IN ('EUT''S','EUW''S','IFT''S','IFW''S','LEW''S','LUT''S','LUW''S',
'EFT''S','EFW''S','OFT''S','OFW''S')
/

DELETE FROM   SFA_FOUND_WORD
WHERE  Word IN ('GE!','GH!','GI!','MH!','TH!')
/
DELETE FROM   SFA_FOUND_WORD
WHERE  Word IN ('GE!','GH!','GI!','MH!','TH!')
/
DELETE FROM   SFA_FOUND_WORD
WHERE  Word IN ('RD','RS','TR','SD','PR', 'ES', 'FR', 'PF', 'TD', 'II', 'NE', 'PO', 'FA', 'DI', 'SE', 'FD', 'FE', 'FF',
'LE', 'EA', 'DE','DF', 'BA','RO','OS','LA','SA','BD','NF','LD','LY','ET', 'RO.', 'SD.', 'FA.', 'LD.', 'LY.', 'BA.', 'RS.', 
'SE.', 'FE.', 'EA.', 'FD', 'FD.', 'BD.', 'TR.', 'SA.', 'TD.', 'RD.', 'ET.','PRFER','NFLD.','DIIS.', 'FID', 'FIE', 'FIO', 'IES',
'OER', 'OFO', 'ORA', 'ORO', 'OTE', 'OTO', 'SES', 'STR', 'ILS.', 'EFT.', 'ELD.')
/
DELETE FROM   SFA_FOUND_WORD
WHERE  Word IN ('TAI','ANI','EAN','TAD','TAO','PHI','PAP','PHO','THO','PHD','CAF','CHI','CAD')
/


DELETE FROM   SFA_FOUND_WORD WHERE  Word    = 'FEY'   AND    Word_Id = 1;
DELETE FROM   SFA_FOUND_WORD WHERE  Word    = 'CHE.'  AND    Word_Id = 15;
DELETE FROM   SFA_FOUND_WORD WHERE  Word    = 'FINED' AND    Word_Id = 28;

DELETE FROM   SFA_FOUND_WORD WHERE  Word IN ('ELD', 'FER', 'FRO', 'IDO', 'IST', 'ILS', 'LAT', 'RA.', 'ZEA', 'SOT', 'STO')  AND  Word_Id = 6;
DELETE FROM   SFA_FOUND_WORD WHERE  Word IN ('ELD', 'FER', 'FRO', 'IDO', 'IST', 'ILS', 'LAT', 'RA.', 'ZEA', 'SOT', 'STO')  AND  Word_Id = 21;
DELETE FROM   SFA_FOUND_WORD WHERE  Word IN ('EBRO', 'ESTO', 'ETAT', 'ORDO', 'STRT', 'ZEA.')  AND  Word_Id = 16;

DELETE FROM   SFA_FOUND_WORD WHERE  Word IN ('ANDIRA', 'CAPSID', 'EFFETE', 'PANZER', 'PAPIST', 'PHOEBE');
DELETE FROM   SFA_FOUND_WORD WHERE  Word IN ('ANDIRA.','CAPSID.','EFFETE.','PANZER.','PAPIST.','PHOEBE.');

DELETE FROM   SFA_FOUND_WORD WHERE Word_Id = 15 AND  Word IN ('TAPA','TAT.','THEA');

DELETE FROM   SFA_FOUND_WORD WHERE Word_Id = 6 AND  Word IN ('BO.','BOT','FR.','LAO','LOO','RAO','SAR','ST.','TA.','TAT','TOT');
DELETE FROM   SFA_FOUND_WORD WHERE Word_Id = 11 AND  Word IN ('AFFORD','AFIELD','EFFORT','THIRST');
DELETE FROM   SFA_FOUND_WORD WHERE Word_Id = 21 AND  Word IN ('EFT','EST','FIR','FIT','FIX','SIR','SIT');
DELETE FROM   SFA_FOUND_WORD WHERE Word_Id = 26 AND  Word IN ('CAP');
DELETE FROM   SFA_FOUND_WORD WHERE Word_Id = 27 AND  Word IN ('BO','LO','RA','SO','ST');
DELETE FROM   SFA_FOUND_WORD WHERE Word_Id = 15 AND  Word IN ('CAP.','CHEN','TAP.','THE.');
DELETE FROM   SFA_FOUND_WORD WHERE Word_Id = 6 AND  Word IN ('FAR');
DELETE FROM   SFA_FOUND_WORD WHERE Word_Id = 25 AND  Word IN ('I.');

DELETE FROM   SFA_FOUND_WORD WHERE Word_Id = 31 AND  Word IN ('CHE');
/

SELECT Distinct Word
FROM   SFA_FOUND_WORD
WHERE  WorD_Id = 37


BEGIN
   CROSSWORD.Clear_Crossword;
   CROSSWORD.Set_Crossword_Size(13, 13);

   CROSSWORD.Add_Crossword_Word( 1,  5,  3, 'A', 9, 'LONGITUDE');
   CROSSWORD.Add_Crossword_Word( 2,  1,  8, 'A', 4, 'GRAB');
   CROSSWORD.Add_Crossword_Word( 3,  6,  9, 'A', 8, '');  
   CROSSWORD.Add_Crossword_Word( 4,  1, 10, 'A', 6, 'OPENLY'); -- 
   CROSSWORD.Add_Crossword_Word( 6,  1, 13, 'A', 5, 'ADDED');
   CROSSWORD.Add_Crossword_Word( 6,  7, 14, 'A', 7, 'SITUATE');
   CROSSWORD.Add_Crossword_Word( 7,  6, 15, 'A', 3, '');
   CROSSWORD.Add_Crossword_Word( 8,  1, 16, 'A', 7, 'CIRCUIT');
   CROSSWORD.Add_Crossword_Word( 8,  9, 17, 'A', 5, 'CLEAN');
   CROSSWORD.Add_Crossword_Word(10,  8, 21, 'A', 6, 'VIOLET');
   CROSSWORD.Add_Crossword_Word(11,  1, 22, 'A', 8, 'LATITUDE');
   CROSSWORD.Add_Crossword_Word(12, 10, 23, 'A', 4, 'STAT');
   CROSSWORD.Add_Crossword_Word(13,  1, 24, 'A', 9, 'GRADIENTS');

   CROSSWORD.Add_Crossword_Word( 1,  1,  1, 'D', 9, 'IGNORANCE');  -- INNOCENCE
   CROSSWORD.Add_Crossword_Word( 1,  3,  2, 'D', 9, 'CALENDERS');
   CROSSWORD.Add_Crossword_Word( 1,  6,  4, 'D', 5, '');
   CROSSWORD.Add_Crossword_Word( 1,  8,  5, 'D', 7, 'GEOCOIN');
   CROSSWORD.Add_Crossword_Word( 1, 10,  6, 'D', 4, '');
   CROSSWORD.Add_Crossword_Word( 1, 12,  7, 'D', 4, '');
   CROSSWORD.Add_Crossword_Word( 5, 11, 11, 'D', 9, 'SATELLITE');
   CROSSWORD.Add_Crossword_Word( 5, 13, 12, 'D', 9, 'REINSTATE');
   CROSSWORD.Add_Crossword_Word( 6,  7, 14, 'D', 3, 'SET');
   CROSSWORD.Add_Crossword_Word( 7,  6, 15, 'D', 7, 'PICTURE');
   CROSSWORD.Add_Crossword_Word( 9,  8, 18, 'D', 5, 'EVENT');
   CROSSWORD.Add_Crossword_Word(10,  2, 19, 'D', 4, '');
   CROSSWORD.Add_Crossword_Word(10,  4, 20, 'D', 4, 'FIND');

   CROSSWORD.Add_Key_Cell( 1,  8); -- A
   CROSSWORD.Add_Key_Cell(13,  4); -- A
   CROSSWORD.Add_Key_Cell( 8,  2); -- B
   CROSSWORD.Add_Key_Cell(11, 11); -- B
   CROSSWORD.Add_Key_Cell( 8,  7); -- C
   CROSSWORD.Add_Key_Cell( 1,  6); -- C
   CROSSWORD.Add_Key_Cell( 5,  8); -- D
   CROSSWORD.Add_Key_Cell(13,  7); -- D
   CROSSWORD.Add_Key_Cell(10,  8); -- E
   CROSSWORD.Add_Key_Cell( 8, 13); -- E
   CROSSWORD.Add_Key_Cell( 6,  1); -- F
   CROSSWORD.Add_Key_Cell( 2,  3); -- F
   CROSSWORD.Add_Key_Cell( 1, 12); -- G
   CROSSWORD.Add_Key_Cell(12, 12); -- G
   CROSSWORD.Add_Key_Cell(11,  4); -- H
   CROSSWORD.Add_Key_Cell( 3,  6); -- H
   CROSSWORD.Add_Key_Cell( 7, 11); -- I
   CROSSWORD.Add_Key_Cell( 4,  5); -- I
   CROSSWORD.Add_Key_Cell( 6,  9); -- J
   CROSSWORD.Add_Key_Cell( 2,  2); -- J

   COMMIT;
END;
/


-- 9,673
SELECT Word
FROM   DICTIONARY.WORD_LIST
WHERE  length(Word) = 4
AND   (Word Like 'O_AY' OR Word Like 'O_AY')
/
SELECT Word
FROM   DICTIONARY.WORD_LIST
WHERE  length(Word) = 9
AND    Word Like '%A_C_'
/

AND    Word Like '%G%'
AND    Word Like '%L%'
AND    Word Like '%U%'
AND    Word Like '%E%'
AND    Word Like '%D%'
AND    Word Like '%I%'
AND    Word Like '%N%'
AND    Word Like '%T%'
AND    Word Like '%O%'
/

SELECT   *
FROM     V_CROSSWORD_CELL
WHERE    Is_Key_Cell = 'Y'
ORDER BY Key_No
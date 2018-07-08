
BEGIN
   CROSSWORD.Clear_Crossword;
   CROSSWORD.Set_Crossword_Size(13, 13);

   CROSSWORD.Add_Crossword_Word( 1,  1,  1, 'A', 6, 'ABROAD');
   CROSSWORD.Add_Crossword_Word( 1,  8,  4, 'A', 6, 'SCYTHE');
   CROSSWORD.Add_Crossword_Word( 3,  1,  9, 'A', 5, 'RESIN');
   CROSSWORD.Add_Crossword_Word( 3,  7, 10, 'A', 7, 'WRINKLE');
   CROSSWORD.Add_Crossword_Word( 5,  1, 11, 'A', 7, 'SQUEEZE');
   CROSSWORD.Add_Crossword_Word( 5,  9, 12, 'A', 5, 'SANTA');
   CROSSWORD.Add_Crossword_Word( 7,  1, 13, 'A', 6, 'CEREAL');
   CROSSWORD.Add_Crossword_Word( 7,  8, 15, 'A', 6, 'INGEST');
   CROSSWORD.Add_Crossword_Word( 9,  1, 18, 'A', 5, 'MERCI');
   CROSSWORD.Add_Crossword_Word( 9,  7, 20, 'A', 7, 'INSIPID');
   CROSSWORD.Add_Crossword_Word(11,  1, 23, 'A', 7, 'INFLATE');
   CROSSWORD.Add_Crossword_Word(11,  9, 24, 'A', 5, 'RIOJA');
   CROSSWORD.Add_Crossword_Word(13,  1, 25, 'A', 6, 'EXTRAS');
   CROSSWORD.Add_Crossword_Word(13,  8, 26, 'A', 6, 'TWEETS');

   CROSSWORD.Add_Crossword_Word( 1,  1,  1, 'D', 5, 'ACRES');
   CROSSWORD.Add_Crossword_Word( 1,  3,  2, 'D', 7, 'RESCUER');
   CROSSWORD.Add_Crossword_Word( 1,  5,  3, 'D', 5, 'ANNIE');
   CROSSWORD.Add_Crossword_Word( 1,  9,  5, 'D', 7, 'CRIMSON');
   CROSSWORD.Add_Crossword_Word( 1, 11,  6, 'D', 5, 'TAKEN');
   CROSSWORD.Add_Crossword_Word( 1, 13,  7, 'D', 7, 'ELEGANT');
   CROSSWORD.Add_Crossword_Word( 2,  7,  8, 'D', 5, '');
   CROSSWORD.Add_Crossword_Word( 7,  1, 13, 'D', 7, 'COMPILE');
   CROSSWORD.Add_Crossword_Word( 7,  5, 14, 'D', 7, 'ALIBABA');
   CROSSWORD.Add_Crossword_Word( 7, 11, 16, 'D', 7, 'EXPLORE');
   CROSSWORD.Add_Crossword_Word( 8,  7, 17, 'D', 5, 'LIGER');
   CROSSWORD.Add_Crossword_Word( 9,  3, 19, 'D', 5, 'REFIT');
   CROSSWORD.Add_Crossword_Word( 9,  9, 21, 'D', 5, 'STRAW');
   CROSSWORD.Add_Crossword_Word( 9, 13, 22, 'D', 5, 'DRAYS');
   
   COMMIT;
END;
/


SELECT Distinct Entry -- Missing V
FROM   CROSSWORD_CELL
ORDER BY Entry
/


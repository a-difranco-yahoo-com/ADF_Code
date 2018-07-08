
SELECT * FROM ASCII_CODEs;

Drop   Table Meta_Data
/
Create Table Meta_Data (
Seq_No     Number,
Bin_Code   Varchar2(8) )
/

DECLARE
   loc_Clue1   Varchar2(200) := '01010100011010000110010100100000011010110110010101111001001000000110';
   loc_Clue2   Varchar2(200) := '10010111001100100000011000110110000101100011011010000110010100101110';
--
--
   loc_Clue   Varchar2(6000) := loc_Clue1  || loc_Clue2;
   Loc_Size    Number := 8;
   Loc_Seq_No  NUMBER;
BEGIN
   DELETE FROM BITS_INFO;

   Loc_Seq_No := 0;
   While Loc_Clue IS NOT NULL
   LOOP
      Loc_Seq_No := Loc_Seq_No + 1;
      INSERT INTO Meta_Data (Bin_Code, Seq_No)
      VALUES (substr(loc_Clue,   1, Loc_Size), Loc_Seq_No); 
      
      Loc_Clue := substr(loc_Clue, Loc_Size + 1);
   END LOOP;
END;
/

SELECT * FROM META_DATA;

SELECT A.Symbol
FROM   ASCII_CODES A
  JOIN META_DATA   M ON M.Bin_Code = A.Bin_Code
ORDER BY M.Seq_No
/

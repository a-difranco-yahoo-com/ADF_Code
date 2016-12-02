
Drop   Table ALPHABET Purge
/

Create Table ALPHABET (
Letter Varchar2(26) )
/

DECLARE
   Loc_Alphabet Varchar2(26) := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
BEGIN
   DELETE FROM ALPHABET;

   For i in 1..26
   Loop
      INSERT INTO ALPHABET Values ( substr(Loc_Alphabet, i, 1));
   End Loop;
END;
/



DROP   TABLE GS_CRYPTIC_GENERAL PURGE
/
CREATE TABLE GS_CRYPTIC_GENERAL (
Id          NUMBER,
Bin_Code    Varchar2(8),
Asc_Code    Varchar2(2),
Rot13_Code  Varchar2(2)
)
/

DECLARE
   Loc_Id    NUMBER := 1;
   Loc_Text  VARCHAR2(2000) := '01100111011000010110001001110011011101100110000101101' ||
                               '101011001100110011101110110011101010110001001100001011000' ||
                               '100110000101100111011100100111001101100011011101000111001' ||
                               '001100101011100100110100001100111011101010110010101100010' ||
                               '011000100111010101110000011001110111000101100101011001100' ||
                               '110010101100010011001010111011001100111011011100111010101' ||
                               '110010011001110111011001110010011100010110011101100001011' ||
                               '001100111000001110011011101000111001001101011011100100111' ||
                               '001001101100011001110111001001110101011101100110010101110' ||
                               '010011001100110101001110100011100100110001001101001011100' ||
                               '100111001101110010011000010111001001110010011001010111011' ||
                               '001100001011100100111011001100111011100100110001101101001' ||
                               '011001100111001001110100011100100110000101100110011011000' ||
                               '110011001100010011100100110011101110010011101010111001000' ||
                               '101010';
BEGIN
   DELETE FROM GS_CRYPTIC_GENERAL;
   
   WHILE Loc_Text IS NOT NULL
   LOOP
      INSERT INTO GS_CRYPTIC_GENERAL (Id, Bin_Code) VALUES (Loc_Id, substr(Loc_Text, 1, 8) );

      Loc_Id   := Loc_Id + 1;
      Loc_Text := substr(Loc_Text, 9);
   END LOOP;

END;
/

UPDATE GS_CRYPTIC_GENERAL CG
SET    Asc_Code = (SELECT Symbol
                   FROM   ASCII_CODES A
                   WHERE  A.Bin_Code = CG.Bin_Code)
/

DECLARE
   Loc_Alphabet    VARCHAR2(26) := 'abcdefghijklmnopqrstuvwxyz';
BEGIN
   UPDATE GS_CRYPTIC_GENERAL CG
   SET    Rot13_Code = substr(Loc_Alphabet, instr(Loc_Alphabet, Asc_Code) + 13, 1)
   WHERE  Asc_Code BETWEEN 'a' AND 'm';

   UPDATE GS_CRYPTIC_GENERAL CG
   SET    Rot13_Code = substr(Loc_Alphabet, instr(Loc_Alphabet, Asc_Code) - 13, 1)
   WHERE  Asc_Code BETWEEN 'n' AND 'z';
END;
/

SELECT Across, 
       max(decode(Down, 0, Rot13_Code)) || max(decode(Down, 1, Rot13_Code)) ||
       max(decode(Down, 2, Rot13_Code)) || max(decode(Down, 3, Rot13_Code)) ||
       max(decode(Down, 4, Rot13_Code)) || max(decode(Down, 5, Rot13_Code)) ||
       max(decode(Down, 6, Rot13_Code)) || max(decode(Down, 7, Rot13_Code)) ||
       max(decode(Down, 8, Rot13_Code)) || max(decode(Down, 9, Rot13_Code)) ||
       ' '  W2
FROM (SELECT Id, mod(ID - 1, 10) Across, floor(Id / 10) Down, Asc_Code, Rot13_Code FROM GS_CRYPTIC_GENERAL)
GROUP BY Across
ORDER BY Across;

SELECT * FROM GS_CRYPTIC_GENERAL;
SELECT * FROM ASCII_CODES;

the cache is
north fifty one degrees fourteen point six seven three 
west zero degrees forty eight point one eight seven 

N 51 14.673 647 (-27)
W 0 48.187  268 (+81)



N 51° 14.647 W 000° 48.268 

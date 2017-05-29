

SELECT * FROM ASCII_CODES;

DECLARE
  Loc_Message  Varchar2(200) := '0101010001101000011001010010000001101011011001010111100100100000011010010111001100100000011000110110000101100011011010000110010100101110';
  Loc_Plain    Varchar2(200);
  Loc_Pos      Number; 
BEGIN
  Loc_Pos := 1;
  
  DBMS_OUTPUT.ENABLE(20000);
  while Loc_Pos < length(Loc_Message)
  Loop
     SELECT Description
     INTO   Loc_Plain
     FROM   ASCII_CODES
     WHERE  Bin_Code = substr(Loc_Message, Loc_Pos, 8);
     
     DBMS_OUTPUT.PUT_LINE(Loc_Plain);
     Loc_Pos :=   Loc_Pos + 8;     
  End Loop;
End;
/



 The key is  cache
Period, dot or full stop
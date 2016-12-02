
Drop   Table PUNCTUATION_CHAR Purge
/

Create Table PUNCTUATION_CHAR (
Punct_Char Varchar2(20) )
/

INSERT INTO PUNCTUATION_CHAR
Values ('‘’,.;:!?"()—*')
/

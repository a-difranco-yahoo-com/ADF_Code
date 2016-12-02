

Drop   Table ABBREVIATED_WORD_SPLIT Purge
/

Create Table ABBREVIATED_WORD_SPLIT (
Abbreviated_Word Varchar2(200),
Split_Words      Varchar2(200)
)
/

INSERT INTO ABBREVIATED_WORD_SPLIT (Abbreviated_Word, Split_Words) Values ('THERE''D', 'THERE HAD'); 
INSERT INTO ABBREVIATED_WORD_SPLIT (Abbreviated_Word, Split_Words) Values ('I''D',     'I HAD');
INSERT INTO ABBREVIATED_WORD_SPLIT (Abbreviated_Word, Split_Words) Values ('HE''D',    'HE HAD');
INSERT INTO ABBREVIATED_WORD_SPLIT (Abbreviated_Word, Split_Words) Values ('YOU''D',   'YOU HAD');
--
INSERT INTO ABBREVIATED_WORD_SPLIT (Abbreviated_Word, Split_Words) Values ('AIN''T',     'AM NOT');
INSERT INTO ABBREVIATED_WORD_SPLIT (Abbreviated_Word, Split_Words) Values ('WEREN''T',   'WERE NOT');
INSERT INTO ABBREVIATED_WORD_SPLIT (Abbreviated_Word, Split_Words) Values ('CAN''T',     'CAN NOT');
INSERT INTO ABBREVIATED_WORD_SPLIT (Abbreviated_Word, Split_Words) Values ('MAYN''T',    'MAY NOT');
INSERT INTO ABBREVIATED_WORD_SPLIT (Abbreviated_Word, Split_Words) Values ('SHOULDN''T', 'SHOULD NOT');
INSERT INTO ABBREVIATED_WORD_SPLIT (Abbreviated_Word, Split_Words) Values ('WARN''T',    'WAS NOT');
INSERT INTO ABBREVIATED_WORD_SPLIT (Abbreviated_Word, Split_Words) Values ('DON''T',     'DO NOT');
INSERT INTO ABBREVIATED_WORD_SPLIT (Abbreviated_Word, Split_Words) Values ('WOULDN''T',  'WOULD NOT');
INSERT INTO ABBREVIATED_WORD_SPLIT (Abbreviated_Word, Split_Words) Values ('DIDN''T',    'DID NOT');
INSERT INTO ABBREVIATED_WORD_SPLIT (Abbreviated_Word, Split_Words) Values ('WASN''T',    'WAS NOT');
INSERT INTO ABBREVIATED_WORD_SPLIT (Abbreviated_Word, Split_Words) Values ('WON''T',     'WILL NOT');
INSERT INTO ABBREVIATED_WORD_SPLIT (Abbreviated_Word, Split_Words) Values ('HADN''T',    'HAD NOT');
INSERT INTO ABBREVIATED_WORD_SPLIT (Abbreviated_Word, Split_Words) Values ('COULDN''T',  'COULD NOT');
INSERT INTO ABBREVIATED_WORD_SPLIT (Abbreviated_Word, Split_Words) Values ('DOESN''T',   'DOES NOT');
--
INSERT INTO ABBREVIATED_WORD_SPLIT (Abbreviated_Word, Split_Words) Values ('I''M',     'I AM');
--
INSERT INTO ABBREVIATED_WORD_SPLIT (Abbreviated_Word, Split_Words) Values ('YOUR''N',   'YOURS');


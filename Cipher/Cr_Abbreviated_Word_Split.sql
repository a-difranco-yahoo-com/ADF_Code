

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
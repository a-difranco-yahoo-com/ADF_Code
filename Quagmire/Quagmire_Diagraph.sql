
DROP TABLE QUAGMIRE_DIAGRAPH PURGE
/
CREATE TABLE QUAGMIRE_DIAGRAPH (
WORD_ID1       NUMBER, 
WORD_ID2       NUMBER, 
DICTIONARY_ID1 NUMBER, 
DICTIONARY_ID2 NUMBER 
)
/

CREATE INDEX IDX_DIA_ID ON QUAGMIRE_DIAGRAPH (DICTIONARY_ID1)
/
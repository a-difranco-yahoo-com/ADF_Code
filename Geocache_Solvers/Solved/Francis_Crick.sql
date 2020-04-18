

Create Table FC_TRIPLES (
Triple_Id    NUMBER,
Triple_Text  Varchar2(3) )
/

DROP   TABLE FC_CODE_TABLE PURGE;
CREATE TABLE FC_CODE_TABLE
AS
SELECT Code_Word, Rownum Code_No, 'x' Code_Letter
FROM (
WITH NOS_1234  AS (SELECT Rownum X FROM ALL_OBJECTS WHERE Rownum <= 4),
     Word_ACGU AS (SELECT 'ACGU' Word FROM DUAL)
SELECT C1.X, C2.X, C3.X, 
       substr(W.Word, C1.X, 1) || substr(W.Word, C2.X, 1) || substr(W.Word, C3.X, 1) Code_Word
FROM   Word_ACGU W
CROSS  JOIN NOS_1234  C1
CROSS  JOIN NOS_1234  C2
CROSS  JOIN NOS_1234  C3
)
ORDER BY Code_Word
/

UPDATE FC_CODE_TABLE SET Code_Letter = 'F' WHERE Code_Word IN ('UUU', 'UUC');
UPDATE FC_CODE_TABLE SET Code_Letter = 'L' WHERE Code_Word IN ('UUA', 'UUG');
UPDATE FC_CODE_TABLE SET Code_Letter = 'L' WHERE Code_Word IN ('CUU', 'CUC','CUA', 'CUG');
UPDATE FC_CODE_TABLE SET Code_Letter = 'I' WHERE Code_Word IN ('AUU', 'AUC','AUA');
UPDATE FC_CODE_TABLE SET Code_Letter = 'M' WHERE Code_Word IN ('AUG');
UPDATE FC_CODE_TABLE SET Code_Letter = 'V' WHERE Code_Word IN ('GUU', 'GUC','GUA', 'GUG');
UPDATE FC_CODE_TABLE SET Code_Letter = 'S' WHERE Code_Word IN ('UCU', 'UCC','UCA', 'UCG');
UPDATE FC_CODE_TABLE SET Code_Letter = 'P' WHERE Code_Word IN ('CCU', 'CCC','CCA', 'CCG');
UPDATE FC_CODE_TABLE SET Code_Letter = 'T' WHERE Code_Word IN ('ACU', 'ACC','ACA', 'ACG');
UPDATE FC_CODE_TABLE SET Code_Letter = 'A' WHERE Code_Word IN ('GCU', 'GCC','GCA', 'GCG');
UPDATE FC_CODE_TABLE SET Code_Letter = 'Y' WHERE Code_Word IN ('UAU', 'UAC');
UPDATE FC_CODE_TABLE SET Code_Letter = '.' WHERE Code_Word IN ('UAA', 'UAG');
UPDATE FC_CODE_TABLE SET Code_Letter = 'H' WHERE Code_Word IN ('CAU', 'CAC');
UPDATE FC_CODE_TABLE SET Code_Letter = 'Q' WHERE Code_Word IN ('CAA', 'CAG');
UPDATE FC_CODE_TABLE SET Code_Letter = 'N' WHERE Code_Word IN ('AAU', 'AAC');
UPDATE FC_CODE_TABLE SET Code_Letter = 'K' WHERE Code_Word IN ('AAA', 'AAG');
UPDATE FC_CODE_TABLE SET Code_Letter = 'D' WHERE Code_Word IN ('GAU', 'GAC');
UPDATE FC_CODE_TABLE SET Code_Letter = 'E' WHERE Code_Word IN ('GAA', 'GAG');
UPDATE FC_CODE_TABLE SET Code_Letter = 'C' WHERE Code_Word IN ('UGU', 'UGC');
UPDATE FC_CODE_TABLE SET Code_Letter = '.' WHERE Code_Word IN ('UGA');
UPDATE FC_CODE_TABLE SET Code_Letter = 'W' WHERE Code_Word IN ('UGG');
UPDATE FC_CODE_TABLE SET Code_Letter = 'R' WHERE Code_Word IN ('CGU', 'CGC', 'CGA', 'CGG');
UPDATE FC_CODE_TABLE SET Code_Letter = 'S' WHERE Code_Word IN ('AGU', 'AGC');
UPDATE FC_CODE_TABLE SET Code_Letter = 'R' WHERE Code_Word IN ('AGA', 'AGG');
UPDATE FC_CODE_TABLE SET Code_Letter = 'G' WHERE Code_Word IN ('GGU', 'GGC', 'GGA', 'GGG');


DECLARE
   Loc_Id       Number := 0;
   Loc_Text     Varchar2(200);
BEGIN
   Loc_Text := 'A';
   Loc_Text := Loc_Text || 'UGAA';    -- Pairs
   Loc_Text := Loc_Text || 'CUUUAUU'; -- Circle
   Loc_Text := Loc_Text || 'UUCA';    -- Pairs
   Loc_Text := Loc_Text || 'C';       -- Single
   Loc_Text := Loc_Text || 'CUACC';    -- Pairs
   Loc_Text := Loc_Text || 'AGAACGAGACGCAUAUAC';       -- Single
   Loc_Text := Loc_Text || 'GG';          -- Pairs
   Loc_Text := Loc_Text || 'ACAUA';       -- Circle
   Loc_Text := Loc_Text || 'CC';          -- Pairs
   Loc_Text := Loc_Text || 'AAAA';        -- Single
   Loc_Text := Loc_Text || 'UGAAA';       -- Pairs
   Loc_Text := Loc_Text || 'AUAUCAAUGAA'; -- Circle
   Loc_Text := Loc_Text || 'UUUCA';       -- Pairs
   Loc_Text := Loc_Text || 'ACG';         -- Single
   Loc_Text := Loc_Text || 'GACUU';       -- Pairs
   Loc_Text := Loc_Text || 'AUAGCG';      -- Circle
   Loc_Text := Loc_Text || 'AAGUC';       -- Pairs
   Loc_Text := Loc_Text || 'GAGAA';       -- Single
   Loc_Text := Loc_Text || 'UU';          -- Pairs
   Loc_Text := Loc_Text || 'G';           -- Single
   Loc_Text := Loc_Text || 'GC';          -- Pairs
   Loc_Text := Loc_Text || 'A';           -- Single
   Loc_Text := Loc_Text || 'GC';          -- Pairs
   Loc_Text := Loc_Text || 'AACA';        -- Circle
   Loc_Text := Loc_Text || 'GC';          -- Pairs
   Loc_Text := Loc_Text || 'AAA';         -- Single
   Loc_Text := Loc_Text || 'GC';          -- Pairs
   Loc_Text := Loc_Text || 'G';           -- Single
   Loc_Text := Loc_Text || 'AA';          -- Pairs
   Loc_Text := Loc_Text || 'G';           -- Single
   Loc_Text := Loc_Text || 'UGGA';        -- Pairs
   Loc_Text := Loc_Text || 'GAAC';        -- Circle
   Loc_Text := Loc_Text || 'UCCG';        -- Pairs
   Loc_Text := Loc_Text || 'A';           -- Single
   Loc_Text := Loc_Text || 'GGUAG';       -- Pairs
   Loc_Text := Loc_Text || 'AGAACUUUCAG'; -- Single
   Loc_Text := Loc_Text || 'AGG';         -- Pairs
   Loc_Text := Loc_Text || 'ACAUAUA';     -- Circle
   Loc_Text := Loc_Text || 'CCU';         -- Pairs
   Loc_Text := Loc_Text || 'GGCAAUAA';    -- Single
   
   DELETE FROM FC_TRIPLES;

   Loc_Id := 0;
   While Loc_Text IS NOT NULL
   LOOP
      Loc_Id := Loc_Id + 1;
      INSERT INTO FC_TRIPLES (Triple_Id, Triple_Text)  Values (Loc_Id, substr(Loc_Text, 1, 3) );
      Loc_Text := substr(Loc_Text, 4);
   END LOOP;  
END;
/

SELECT T.*, C.Code_No, C.Code_Letter
FROM   FC_TRIPLES T
  JOIN FC_CODE_TABLE C ON C.Code_Word = T.Triple_Text
ORDER BY Triple_Id
/


M
N FIFTY / QNE / THIRTY / QNE / NINE / FQRTY / SEVEN
.
QQQQ / SEVEN / SEVEN / FQRTY / TWQ
.
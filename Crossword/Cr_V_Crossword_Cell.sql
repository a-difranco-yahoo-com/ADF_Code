
CREATE OR REPLACE VIEW V_CROSSWORD_CELL
AS
SELECT    C.Row_No, C.Column_No,  C.Entry, K.Key_No, decode(K.Key_No, NULL, 'N', 'Y') Is_Key_Cell,
          instr('ABCDEFGHIJKLMNOPQRSTUVWXYZ', C.Entry) Lookup_Value
FROM      CROSSWORD_CELL     C
LEFT JOIN CROSSWORD_KEY_CELL K ON K.Row_No    = C.Row_No
                              AND K.Column_No = C.Column_No
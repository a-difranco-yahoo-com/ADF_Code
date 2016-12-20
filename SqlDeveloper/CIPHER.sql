
BEGIN
   Build_Raw_Word.Reload_Table;
END;
/
BEGIN
   Rebuild_Ref_Tables.Rebuild_Tables;
END;
/

SELECT * FROM RAW_WORD WHERE Word_Text = 'THE';
SELECT * FROM REF_LETTER   ORDER BY Frequency Desc;
SELECT * FROM REF_DIGRAPH  ORDER BY Frequency Desc;
SELECT * FROM REF_TRIGRAPH ORDER BY Frequency Desc;

SELECT * FROM REF_LETTER   ORDER BY Starts_With Desc;
SELECT * FROM REF_LETTER   ORDER BY End_With Desc;

/
SELECT instr('ABCD', 'f') FROM Dual;
/  

SELECT   Letter,  Frequency
FROM     GT_LETTER_RARE_CONTACT
ORDER BY 2 Desc
;



Drop   Table  GT_LETTER_ANALYSIS Purge
/

Create Global Temporary Table  GT_LETTER_ANALYSIS (
Letter       Varchar2(1),
Word_Length  Number,
Frequency    Number,
Position     Number)
ON COMMIT DELETE ROWS
/


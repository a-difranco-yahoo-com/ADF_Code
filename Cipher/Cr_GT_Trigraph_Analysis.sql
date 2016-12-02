
Drop   Table  GT_TRIGRAPH_ANALYSIS Purge
/

Create Global Temporary Table  GT_TRIGRAPH_ANALYSIS (
Trigraph     Varchar2(3),
Word_Length  Number,
Frequency    Number,
Position     Number)
ON COMMIT DELETE ROWS
/


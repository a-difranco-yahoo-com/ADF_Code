
Drop   Table  GT_DIGRAPH_ANALYSIS Purge
/

Create Global Temporary Table  GT_DIGRAPH_ANALYSIS (
Digraph      Varchar2(2),
Word_Length  Number,
Frequency    Number,
Position     Number)
ON COMMIT DELETE ROWS
/



Drop   Table  GT_LETTER_RARE_CONTACT Purge
/

Create Global Temporary Table  GT_LETTER_RARE_CONTACT (
Letter       Varchar2(1),
Frequency    Number)
ON COMMIT DELETE ROWS
/


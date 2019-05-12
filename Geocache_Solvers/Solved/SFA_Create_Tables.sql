

Drop  Table SFA_WORD       Purge;
Drop  Table SFA_LETTER     Purge;
Drop  Table SFA_FOUND_WORD Purge;
-----------------
Create Table SFA_WORD (
Solution_Id     NUMBER NOT NULL,
Word_Id         NUMBER NOT NULL,
Row_No          NUMBER NOT NULL,
Start_Col       NUMBER NOT NULL,
End_Col         NUMBER NOT NULL,
Word            Varchar2(10),
Solved          Varchar2(1)
)
/
Create Table SFA_LETTER (
Solution_Id     NUMBER      NOT NULL,
Col_No          NUMBER      NOT NULL,
Letter          Varchar2(1) NOT NULL,
Used            Varchar2(1) NOT NULL
)
/

Create  Table SFA_FOUND_WORD (
Solution_Id     NUMBER        NOT NULL,
Word_Id         NUMBER        NOT NULL,
Word            Varchar2(10)  NOT NULL
)
/
CREATE INDEX IDX_SFA_W  ON SFA_WORD       (SOLUTION_ID);
CREATE INDEX IDX_SFA_L  ON SFA_LETTER     (SOLUTION_ID);
CREATE INDEX IDX_SFA_FW ON SFA_FOUND_WORD (SOLUTION_ID);


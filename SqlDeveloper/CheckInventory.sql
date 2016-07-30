

BEGIN
  COMPARE_COLLECTIONS.Run_Comparison;  
End;
/

Select title, count(*)
From Merged_Compare_Collection 
Group By Title
ORDER BY 2, Title;


DEFINE Text="%Strange%1974%"

Select * From Merged_Compare_Collection Where  Title Like '%&&Text%' Order By Title, Details;
Select * From Ipad_Inventory     Where Title Like '%&&Text%' Order By Title;
Select * From ComicDB_COLLECTION Where Title Like '%&&Text%' Order By Title, Issue_Number;


Ipad
world tour 1-4, 
tpb 1-2	Bagged	0



Comicbookdb

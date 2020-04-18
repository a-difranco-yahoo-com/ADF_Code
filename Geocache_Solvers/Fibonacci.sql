
DROP TABLE GS_FIBONACCI PURGE
/
CREATE TABLE GS_FIBONACCI (
Id                   Number,
Cache_Date           Date,
Cache_Finds          Number,
Total_Cache_Finds    Number,
Active_Caches        Number)
/

DECLARE
   Loc_Start_Month          NUMBER := 5;
   Loc_Start_Year           NUMBER := 2012;
   Loc_Start_Caches         NUMBER := 1750000;
   Loc_New_Caches_Per_Month NUMBER := 25000;
--
   Loc_Cur_Month               NUMBER;
   Loc_Cur_Year                NUMBER;
   Loc_Cur_Active_Caches       NUMBER;
   Loc_Caches_Found_Last_Month NUMBER;
   Loc_Caches_Found_This_Month NUMBER;
   Loc_Tmp_Caches_Found_This_Month NUMBER;
   Loc_Total_Caches_Found      NUMBER;
   Loc_Id                      NUMBER;
BEGIN
   /* Initialise */
   Loc_Cur_Month               := Loc_Start_Month;
   Loc_Cur_Year                := Loc_Start_Year;
   Loc_Cur_Active_Caches       := Loc_Start_Caches;
   Loc_Caches_Found_Last_Month := 0;
   Loc_Caches_Found_This_Month := 0;
   Loc_Total_Caches_Found      := 0;
   Loc_Id                      := 0;
  
   DELETE FROM GS_FIBONACCI;
   WHILE Loc_Total_Caches_Found <= Loc_Cur_Active_Caches
   LOOP
      Loc_Id := Loc_Id + 1;
      IF Loc_Cur_Month = 12
      THEN
         Loc_Cur_Month := 1;
         Loc_Cur_Year  := Loc_Cur_Year  + 1;
      ELSE
         Loc_Cur_Month := Loc_Cur_Month + 1;
      END IF;

      IF Loc_Cur_Year != Loc_Start_Year
      THEN
         Loc_Cur_Active_Caches  := Loc_Cur_Active_Caches + Loc_New_Caches_Per_Month;
      END IF;

      IF Loc_Id <= 2
      THEN
         Loc_Tmp_Caches_Found_This_Month := 1;
      ELSE
         Loc_Tmp_Caches_Found_This_Month := Loc_Caches_Found_Last_Month + Loc_Caches_Found_This_Month;
      END IF;
      Loc_Caches_Found_Last_Month     := Loc_Caches_Found_This_Month;
      Loc_Caches_Found_This_Month     := Loc_Tmp_Caches_Found_This_Month;
      Loc_Total_Caches_Found          := Loc_Total_Caches_Found + Loc_Tmp_Caches_Found_This_Month;

      INSERT INTO GS_FIBONACCI (Id, Cache_Date, Cache_Finds, Total_Cache_Finds, Active_Caches)
      VALUES (Loc_Id, to_date(Loc_Cur_Month || '/' || Loc_Cur_Year, 'MM/YYYY'),
              Loc_Caches_Found_This_Month,  Loc_Total_Caches_Found, Loc_Cur_Active_Caches);
   END LOOP;
END;
/
SELECT * FROM GS_FIBONACCI;

/*
AB,CDE = 10,945
FG    = 12
HJ    = 14
*/

N 50 56 . 758
W 000 07 . 905   

N 50 5(J+F+H) . (C-G)(E)(D+D)
W 000 0(E+G) . CB(J+A)   

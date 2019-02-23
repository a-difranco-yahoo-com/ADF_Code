
CREATE OR REPLACE PACKAGE LINK_COMICDB
AS
   Procedure Find_ComicDB_Matches(p_Search_Text Varchar2, p_Digital_Volume_Cutoff Number, p_Minimum_SIM Number, p_Include_Matched_Titles Varchar2);
   Procedure Add_Links;
END;
/

CREATE OR REPLACE PACKAGE BODY LINK_COMICDB
AS

   Function ComicDB_Exists(p_Title Varchar2, p_Volume Number) RETURN BOOLEAN
   AS
      Loc_Count NUMBER;
   BEGIN
      SELECT Count(*)
      INTO   Loc_Count
      FROM   COMICDB_COMIC
      WHERE  Title  = p_Title
      AND    Volume = p_Volume;
      
      RETURN (Loc_Count > 0);
   END;

   Function Digital_Exists(p_Title Varchar2, p_Volume Number) RETURN BOOLEAN
   AS
      Loc_Count NUMBER;
   BEGIN
      SELECT Count(*)
      INTO   Loc_Count
      FROM   ARCHIVE_DIGITAL_COMIC
      WHERE  Title  = p_Title
      AND    Volume = p_Volume;
      
      RETURN (Loc_Count > 0);
   END;

   Function Link_Exists(p_Title Varchar2, p_Volume Number) RETURN BOOLEAN
   AS
      Loc_Count NUMBER;
   BEGIN
      SELECT Count(*)
      INTO   Loc_Count
      FROM   LINK_COMICDB_COMIC
      WHERE  Title  = p_Title
      AND    Volume = p_Volume;
      
      RETURN (Loc_Count > 0);
   END;

   Procedure Update_ComicDB_Details(p_ComicDB_Title Varchar2, p_ComicDB_Volume Number, p_Digital_Title Varchar2, p_Digital_Volume Number)
   AS
   BEGIN
      UPDATE COMICDB_COMIC
      SET    Title  = p_Digital_Title,
             Volume = p_Digital_Volume
      WHERE  Title  = p_ComicDB_Title
      AND    Volume = p_ComicDB_Volume;
   END;

   Procedure Add_Link(p_Title Varchar2, p_Volume Number)
   AS
   BEGIN
      INSERT INTO LINK_COMICDB_COMIC(Title, Volume)
      VALUES (p_Title, p_Volume);
   END;

   Procedure Make_Link(p_ComicDB_Title Varchar2, p_ComicDB_Volume Number, p_Digital_Title Varchar2, p_Digital_Volume Number)
   AS
   BEGIN
      IF ComicDB_Exists(p_ComicDB_Title, p_ComicDB_Volume) AND Digital_Exists(p_Digital_Title, p_Digital_Volume)
       AND NOT Link_Exists(p_Digital_Title, p_Digital_Volume)
      THEN
         Update_ComicDB_Details(p_ComicDB_Title, p_ComicDB_Volume, p_Digital_Title, p_Digital_Volume);
         Add_Link(p_Digital_Title, p_Digital_Volume);
      ELSE
         dbms_output.put_line('ERROR: Link not added :' || p_ComicDB_Title || ' (' || p_ComicDB_Volume || ')' );
      END IF;
   END;

   Procedure Add_Links
   AS
   BEGIN
      FOR MAT_REC IN (SELECT * FROM MATCH_COMICDB WHERE Status = 'M')
      LOOP
         Make_Link(MAT_REC.ComicDB_Title, MAT_REC.ComicDB_Volume, MAT_REC.Digital_Title, MAT_REC.Digital_Volume);
      END LOOP;
   END;

   Procedure Find_ComicDB_Matches(p_Search_Text Varchar2, p_Digital_Volume_Cutoff Number, p_Minimum_SIM Number, p_Include_Matched_Titles Varchar2)
   AS
   BEGIN
      DELETE FROM MATCH_COMICDB;

      INSERT INTO MATCH_COMICDB (Comicdb_Title, Comicdb_Volume, Digital_Title, Digital_Volume, Sim, Comicdb_Comics, Digital_Comics, Matches, Submatches, Matched)
      SELECT Comicdb_Title, Comicdb_Volume, Digital_Title, Digital_Volume, Sim, Comicdb_Comics, Digital_Comics, Matches, Submatches, Matched
      FROM   V_POSSIBLE_COMICDB_LINK
      WHERE  ComicDB_Title Like '%' || p_Search_Text || '%'
      AND    Digital_Title Like '%' || p_Search_Text || '%'
      AND    Digital_Volume < p_Digital_Volume_Cutoff
      AND    SIM > p_Minimum_SIM
      AND    (p_Include_Matched_Titles = 'Y' OR Matched = 'N');
   END;
END;
/


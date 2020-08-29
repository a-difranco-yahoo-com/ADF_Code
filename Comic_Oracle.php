<?php

class Comic_Oracle
{
   protected $Connection;

   public function __construct()
   {
      $this->Connect();
   }

   public function Connect()
   {
     $this->Connection = oci_connect('Comics', 'Comics', '');
     if (! $this->Connection) {
           echo("ERROR : Connecting to oracle \n");
          exit(1);
      }
   }


   public function Run_Match($Level) {
      $PLSQL = " BEGIN"
             . "    COMICS.Parse_Pull_List;"
             . "    COMICS.Set_ComicId;"
             . "    COMICS.Find_Pull_Matches($Level);"
             . "    COMICS.Find_Wish_Matches;"
             . " END;";

      $stmt = oci_parse($this->Connection, $PLSQL);
      oci_execute($stmt);
   }

   public function Update_Matches() {
      $PLSQL = " BEGIN"
             . "    COMICS.Update_Matched_Pull_List;"
             . "    COMICS.Update_Matched_Wish_List;"
             . "    COMICS.Find_Got_New_Issues;"
             . " END;";

      $stmt = oci_parse($this->Connection, $PLSQL);
      oci_execute($stmt);
   }

   public function Update_Comics() {
      $PLSQL = " BEGIN"
             . "   COMICS.Update_Digital_Pull;"
             . " END;";

      $stmt = oci_parse($this->Connection, $PLSQL);
      oci_execute($stmt);
   }

   public function Get_Match_Pull_List() {
      $SQL = " SELECT   Match_Id, New_Title, New_Issue, Pull_Title, Pull_Issue"
	    	  . " FROM     V_MATCH_PULL_LIST"
	    	  . " ORDER BY New_Title";

      $stmt = oci_parse($this->Connection, $SQL);
	   oci_execute($stmt);
	   oci_fetch_all($stmt, $rows, 0, 500, OCI_FETCHSTATEMENT_BY_ROW + OCI_RETURN_NULLS + OCI_ASSOC);
	   return $rows;
   }
 
   public function Commit_Match_To_Pull_List($Id) {
      $PLSQL = " BEGIN"
             . "    COMICS.Update_Matched_Pull_List($Id);"
             . " END;";

      $stmt = oci_parse($this->Connection, $PLSQL);
      oci_execute($stmt);
   }

   public function Log_Post_Details($type, $array) {
      $SQL = " INSERT INTO POST_DETAILS (Post_Type, Post_Date, Post_Key, Post_Value) "
           . " VALUES (:type, sysdate, :key, :value)";
      $stmt = oci_parse($this->Connection, $SQL);

      foreach($array as $key => $value) {
         oci_bind_by_name($stmt, ":type",   $type);
         oci_bind_by_name($stmt, ":key",    $key);
         oci_bind_by_name($stmt, ":value",  $value);
         oci_execute($stmt);
      }
   }
 
   public function Get_Match_Wish_List() {
      $SQL = " SELECT   'Status_' || New_ComicId || '_' || Wish_ComicId Id, "
   	     . "          New_Title,  New_Volume,  New_Issue, "
   	     . "          Wish_Title, Wish_Volume, Wish_Issue, Status "
	    	  . " FROM     MATCH_WISH_LIST"
   	     . " ORDER BY New_Title,  New_Volume,  New_Issue";

      $stmt = oci_parse($this->Connection, $SQL);
	   oci_execute($stmt);
	   oci_fetch_all($stmt, $rows, 0, 500, OCI_FETCHSTATEMENT_BY_ROW + OCI_RETURN_NULLS + OCI_ASSOC);
	   return $rows;
   }

   public function Commit_Match_Wish_List($updates) {
      $SQL = " UPDATE MATCH_WISH_LIST"
           . " SET    Status = :Status"
           . " WHERE  :Id    = 'Status_' || New_ComicId || '_' || Wish_ComicId";

      $stmt = oci_parse($this->Connection, $SQL);
      foreach($updates as $key => $value) {
         oci_bind_by_name($stmt, ":Id",      $key);
         oci_bind_by_name($stmt, ":Status",  $value);
         oci_execute($stmt);
      }
      $this->Update_Matches();
   }

   public function Get_New_Comics() {
      $SQL = " SELECT   ComicId, Title,  Volume,  Year, Issue, SubIssue, Series_Run"
	    	  . " FROM     NEW_DIGITAL_COMIC"
   	     . " ORDER BY Title,  Volume, Issue";

      $stmt = oci_parse($this->Connection, $SQL);
	   oci_execute($stmt);
	   oci_fetch_all($stmt, $rows, 0, 500, OCI_FETCHSTATEMENT_BY_ROW + OCI_RETURN_NULLS + OCI_ASSOC);
	   return $rows;
   }

   public function Clear_New_Digital_Comic($Id) {
      $PLSQL = " BEGIN"
             . "    COMICS.Process_New_Digital_Comic($Id);"
             . " END;";

      $stmt = oci_parse($this->Connection, $PLSQL);
      oci_execute($stmt);
   }

   public function Get_Pull_List() {
      $SQL = " SELECT   'Pull_' || ComicId Id, 'RD_' || ComicId RDId, "
           . "          Title,  Volume,  Issue, Full_Name, "
   	     . "          to_char(Release_Date, 'YYYY-MM-DD') Release_Date, Status "
	    	  . " FROM     PULL_LIST"
   	     . " ORDER BY Title,  Volume, Issue";

      $stmt = oci_parse($this->Connection, $SQL);
	   oci_execute($stmt);
	   oci_fetch_all($stmt, $rows, 0, 500, OCI_FETCHSTATEMENT_BY_ROW + OCI_RETURN_NULLS + OCI_ASSOC);
	   return $rows;
   }

   public function Commit_Pull_List_Status($updates) {
      $SQL = " UPDATE PULL_LIST"
           . " SET    Status = :Status"
           . " WHERE  :Id    = 'Pull_' || ComicId";

      $stmt = oci_parse($this->Connection, $SQL);
      foreach($updates as $key => $value) {
         oci_bind_by_name($stmt, ":Id",      $key);
         oci_bind_by_name($stmt, ":Status",  $value);
         oci_execute($stmt);
      }
   }

   public function Commit_Pull_List_Release_Date($updates) {
      $SQL = " UPDATE PULL_LIST"
           . " SET    Release_Date = to_date(:ReleaseDate, 'YYYY-MM-DD')"
           . " WHERE  :Id    = 'RD_' || ComicId";

      $stmt = oci_parse($this->Connection, $SQL);
      foreach($updates as $key => $value) {
         oci_bind_by_name($stmt, ":Id",           $key);
         oci_bind_by_name($stmt, ":ReleaseDate",  $value);
         oci_execute($stmt);
      }
   }

   public function Commit_Pull_List($updates) {
      $this->Commit_Pull_List_Status($updates);
      $this->Commit_Pull_List_Release_Date($updates);
      $this->Update_Comics();

   }

   public function Get_Wish_List() {
      $SQL = " SELECT   'Wish_' || ComicId Id, "
           . "          Title,  Volume,  Issue, "
   	     . "          SubIssue, Series_Run"
	    	  . " FROM     WISH_LIST"
   	     . " ORDER BY Title,  Volume, Issue";

      $stmt = oci_parse($this->Connection, $SQL);
	   oci_execute($stmt);
	   oci_fetch_all($stmt, $rows, 0, 500, OCI_FETCHSTATEMENT_BY_ROW + OCI_RETURN_NULLS + OCI_ASSOC);
	   return $rows;
   }

   public function Get_Run_Gaps() {
      $SQL = " SELECT   'Gap_' || Title_Id Id, "
           . "          Title,  Volume,  Start_Issue, "
   	     . "          End_Issue, SubIssue, Series_Run"
	    	  . " FROM     V_ALL_COMIC_MULTI_RUN"
   	     . " ORDER BY Title,  Volume, Start_Issue";

      $stmt = oci_parse($this->Connection, $SQL);
	   oci_execute($stmt);
	   oci_fetch_all($stmt, $rows, 0, 500, OCI_FETCHSTATEMENT_BY_ROW + OCI_RETURN_NULLS + OCI_ASSOC);
	   return $rows;
   }

   public function Add_Wish_List($titles) {
      $PLSQL = " BEGIN"
             . "  COMICS.Add_Wish_List(:TitleId);"
             . " END;";

      $stmt = oci_parse($this->Connection, $PLSQL);
      foreach($titles as $key => $value) {
         if ( substr($key, 0, 4) == "Gap_" && $value = "Y") {
            oci_bind_by_name($stmt, ":TitleId",  substr($key, 4) );
            oci_execute($stmt);
         }
      }
   }
   public function Get_Run_Details($Search) {
      $SQL = " SELECT   'Run_' || Title_Id Id, "
           . "          Title,  Volume,  Start_Issue, "
   	     . "          End_Issue, SubIssue, Series_Run"
	    	  . " FROM     V_ALL_COMIC_RUN"
	    	  . " WHERE    upper(Title) Like upper('%$Search%')"
	    	  . " AND      Comic_Type = 'DIGITAL'"
   	     . " ORDER BY Title,  Volume, Start_Issue";

      $stmt = oci_parse($this->Connection, $SQL);
	   oci_execute($stmt);
	   oci_fetch_all($stmt, $rows, 0, 500, OCI_FETCHSTATEMENT_BY_ROW + OCI_RETURN_NULLS + OCI_ASSOC);
	   return $rows;
   }

   public function Get_Wish_Details($Search) {
      $SQL = " SELECT   'Run_' || Title_Id Id, "
           . "          Title,  Volume,  Start_Issue, "
   	     . "          End_Issue, SubIssue, Series_Run"
	    	  . " FROM     V_ALL_COMIC_RUN"
	    	  . " WHERE    upper(Title) Like upper('%$Search%')"
	    	  . " AND      Comic_Type = 'WISHLIST'"
   	     . " ORDER BY Title,  Volume, Start_Issue";

      $stmt = oci_parse($this->Connection, $SQL);
	   oci_execute($stmt);
	   oci_fetch_all($stmt, $rows, 0, 500, OCI_FETCHSTATEMENT_BY_ROW + OCI_RETURN_NULLS + OCI_ASSOC);
	   return $rows;
   }

   public function Get_Archive_Difference_Summary() {
      $SQL = " SELECT   Title, count(*) Issues "
	    	  . " FROM     V_DIFFERING_ARCHIVE_COMIC_SUMMARY"
   	     . " GROUP BY Title"
   	     . " ORDER BY Count(*) Desc, Title";

      $stmt = oci_parse($this->Connection, $SQL);
	   oci_execute($stmt);
	   oci_fetch_all($stmt, $rows, 0, 500, OCI_FETCHSTATEMENT_BY_ROW + OCI_RETURN_NULLS + OCI_ASSOC);
	   return $rows;
   }

   public function Get_Archive_Detail($Title, $Min_Volume) {
      $SQL = " SELECT   Source, Title,  Volume,  SubIssue, Series_Run,"
	    	  . "          min(Issue) Min_Issue, max(Issue) Max_Issue,"
	    	  . "          min(Year)  Min_Year,  max(Year)  Max_Year, count(*) Issues"
	    	  . " FROM     V_DIGITAL_AND_ARCHIVE_COMIC_DETAILS"
	    	  . " WHERE    upper(Title) Like '%' || upper(:Title) || '%'"
	    	  . " AND      Volume >= nvl(:Volume, 0)"
   	     . " GROUP BY Source, Title, Volume, SubIssue, Series_Run"
   	     . " ORDER BY Title, Volume, SubIssue";

      $stmt = oci_parse($this->Connection, $SQL);
      oci_bind_by_name($stmt, ":Title",      $Title);
      oci_bind_by_name($stmt, ":Volume",     $Min_Volume);
	   oci_execute($stmt);
	   oci_fetch_all($stmt, $rows, 0, 500, OCI_FETCHSTATEMENT_BY_ROW + OCI_RETURN_NULLS + OCI_ASSOC);
	   return $rows;
   }

   public function Get_ComicDB_Summary() {
      $SQL = " SELECT   Title, Volume, count(*) Issues "
	    	  . " FROM     V_MISSING_FROM_COMICDB"
   	     . " GROUP BY Title, Volume"
   	     . " ORDER BY Count(*) Desc, Title, Volume";

      $stmt = oci_parse($this->Connection, $SQL);
	   oci_execute($stmt);
	   oci_fetch_all($stmt, $rows, 0, 500, OCI_FETCHSTATEMENT_BY_ROW + OCI_RETURN_NULLS + OCI_ASSOC);
	   return $rows;
   }

   public function Get_ComicDB_Missing($Title) {
      $SQL = " SELECT   Title,  Volume,  Issue, SubIssue"
	    	  . " FROM     V_MISSING_FROM_COMICDB"
	    	  . " WHERE    upper(Title) Like '%' || upper(:Title) || '%'"
   	     . " ORDER BY Title, Volume, Issue";

      $stmt = oci_parse($this->Connection, $SQL);
      oci_bind_by_name($stmt, ":Title",      $Title);
	   oci_execute($stmt);
	   oci_fetch_all($stmt, $rows, 0, 500, OCI_FETCHSTATEMENT_BY_ROW + OCI_RETURN_NULLS + OCI_ASSOC);
	   return $rows;
   }

   public function Get_ComicDB_Compare_Summary($Title) {
      $SQL = " SELECT   Src Source,  Title, Volume, Min_Issue, Max_Issue, Comics"
	    	  . " FROM     V_DIGITAL_AND_COMICDB_COMIC_SUMMARY_DETAILS "
	    	  . " WHERE    upper(Title) Like '%' || upper(:Title) || '%'"
   	     . " ORDER BY Title, Volume, Min_Issue";

      $stmt = oci_parse($this->Connection, $SQL);
      oci_bind_by_name($stmt, ":Title",      $Title);
	   oci_execute($stmt);
	   oci_fetch_all($stmt, $rows, 0, 500, OCI_FETCHSTATEMENT_BY_ROW + OCI_RETURN_NULLS + OCI_ASSOC);
	   return $rows;
   }

   public function Get_ComicDB_Compare_Detail($Title) {
      $SQL = " SELECT   Source,  Title, Volume, Issue, SubIssue"
	    	  . " FROM     V_DIGITAL_AND_COMICDB_COMIC_DETAILS "
	    	  . " WHERE    upper(Title) Like '%' || upper(:Title) || '%'"
   	     . " ORDER BY Title, Volume, Issue";

      $stmt = oci_parse($this->Connection, $SQL);
      oci_bind_by_name($stmt, ":Title",      $Title);
	   oci_execute($stmt);
	   oci_fetch_all($stmt, $rows, 0, 500, OCI_FETCHSTATEMENT_BY_ROW + OCI_RETURN_NULLS + OCI_ASSOC);
	   return $rows;
   }

   public function Match_ComicDB($SearchTitle, $Cutoff_Year, $Sim, $IncludeMatches) {
      $PLSQL = " BEGIN"
             . "   LINK_COMICDB.Find_ComicDB_Matches(:TitleId, :Year, :Sim, :Include);"
             . "   COMMIT;"
             . " END;";

      $stmt = oci_parse($this->Connection, $PLSQL);
      oci_bind_by_name($stmt, ":TitleId",  $SearchTitle);
      oci_bind_by_name($stmt, ":Year",     $Cutoff_Year);
      oci_bind_by_name($stmt, ":Sim",      $Sim);
      oci_bind_by_name($stmt, ":Include",  $IncludeMatches);
      oci_execute($stmt);
   }

   public function Get_Match_ComicDB() {
      $SQL = " SELECT   ComicDB_Title,  ComicDB_Volume,  Digital_Title, Digital_Volume, "
   	     . "          Sim, ComicDB_Comics, Digital_Comics, Matches, SubMatches, "
   	     . "          Matched, Status "
	    	  . " FROM     MATCH_COMICDB"
   	     . " ORDER BY ComicDB_Title,  ComicDB_Volume,  Digital_Title, Digital_Volume";

      $stmt = oci_parse($this->Connection, $SQL);
	   oci_execute($stmt);
	   oci_fetch_all($stmt, $rows, 0, 500, OCI_FETCHSTATEMENT_BY_ROW + OCI_RETURN_NULLS + OCI_ASSOC);
	   return $rows;
   }
}
?>
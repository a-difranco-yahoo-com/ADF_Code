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
             . "   COMICS.Update_New_Comics;"
             . "   COMICS.Update_Got_Comics;"
             . "   COMICS.Update_OneShots_Comics;"
             . "   COMICS.Update_BackIssue_Comics;"
             . "   COMICS.Update_Digital_Comics;"
             . "   COMICS.Update_Digital_Pull;"
             . "   COMICS.Update_WishList_Pull;"
             . " END;";

      $stmt = oci_parse($this->Connection, $PLSQL);
      oci_execute($stmt);
   }

   public function Get_Match_Pull_List() {
      $SQL = " SELECT   'Status_' || New_ComicId || '_' || Pull_ComicId Id, New_Title, New_Issue, "
           . "          Pull_Title, Pull_Issue, Status "
	    	  . " FROM     MATCH_PULL_LIST"
	    	  . " ORDER BY New_Title";

      $stmt = oci_parse($this->Connection, $SQL);
	   oci_execute($stmt);
	   oci_fetch_all($stmt, $rows, 0, 500, OCI_FETCHSTATEMENT_BY_ROW + OCI_RETURN_NULLS + OCI_ASSOC);
	   return $rows;
   }
 
   public function Commit_Match_Pull_List($updates) {
      $SQL = " UPDATE MATCH_PULL_LIST"
           . " SET    Status = :Status"
           . " WHERE  :Id    = 'Status_' || New_ComicId || '_' || Pull_ComicId";

      $stmt = oci_parse($this->Connection, $SQL);
      foreach($updates as $key => $value) {
         oci_bind_by_name($stmt, ":Id",      $key);
         oci_bind_by_name($stmt, ":Status",  $value);
         oci_execute($stmt);
      }
      $this->Update_Matches();
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
      $SQL = " SELECT   'New_' || ComicId Id,"
           . "          Title,  Volume,  Year, Issue, "
   	     . "          SubIssue, Series_Run, Status "
	    	  . " FROM     NEW_DIGITAL_COMIC"
   	     . " ORDER BY Title,  Volume, Issue";

      $stmt = oci_parse($this->Connection, $SQL);
	   oci_execute($stmt);
	   oci_fetch_all($stmt, $rows, 0, 500, OCI_FETCHSTATEMENT_BY_ROW + OCI_RETURN_NULLS + OCI_ASSOC);
	   return $rows;
   }

   public function Commit_New_Comics($updates) {
      $SQL = " UPDATE NEW_DIGITAL_COMIC"
           . " SET    Status = :Status"
           . " WHERE  :Id    = 'New_' || ComicId";

      $stmt = oci_parse($this->Connection, $SQL);
      foreach($updates as $key => $value) {
         oci_bind_by_name($stmt, ":Id",      $key);
         oci_bind_by_name($stmt, ":Status",  $value);
         oci_execute($stmt);
      }
      $this->Update_Comics();
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
	    	  . " FROM     V_DIGITAL_ALL_MULTI_RUN_DETAIL"
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
	    	  . " FROM     V_DIGITAL_RUN_DETAIL"
	    	  . " WHERE    upper(Title) Like upper('%$Search%')"
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
	    	  . " FROM     V_DIGITAL_WISH_RUN_DETAIL"
	    	  . " WHERE    upper(Title) Like upper('%$Search%')"
   	     . " ORDER BY Title,  Volume, Start_Issue";

      $stmt = oci_parse($this->Connection, $SQL);
	   oci_execute($stmt);
	   oci_fetch_all($stmt, $rows, 0, 500, OCI_FETCHSTATEMENT_BY_ROW + OCI_RETURN_NULLS + OCI_ASSOC);
	   return $rows;
   }

}
?>
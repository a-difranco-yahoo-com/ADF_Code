<?php

include 'Comic_Oracle.php';

class NewComic_Oracle extends Comic_Oracle
{
   public function Run_Match($Level) {
      $PLSQL = " BEGIN"
             . "    COMICS.Find_Matches(:Level);"
             . " END;";

      $this->Execute_PLSQL_Code($PLSQL, array(":Level"=>$Level) );
   }

   public function Get_Match_Pull_List() {
      $SQL = " SELECT   Match_Id, New_Title, New_Issue, Pull_Title, Pull_Issue"
             . " FROM     V_MATCH_PULL_LIST"
             . " ORDER BY New_Title";

      return $this->Execute_DB_Select($SQL, array() );
   }
 
   public function Commit_Match_To_Pull_List($Id) {
      $PLSQL = " BEGIN"
             . "    COMICS.Update_Matched_Pull_List(:Id);"
             . " END;";

      $this->Execute_PLSQL_Code($PLSQL, array(":Id"=>$Id) );
}

   public function Get_Match_Wish_List() {
      $SQL = " SELECT   Match_Id, "
           . "          New_Title,  New_Volume,  New_Issue, "
           . "          Wish_Title, Wish_Volume, Wish_Issue "
           . " FROM     V_MATCH_WISH_LIST"
           . " ORDER BY New_Title,  New_Volume,  New_Issue";

      return $this->Execute_DB_Select($SQL, array() );
}

   public function Commit_Match_To_Wish_List($MatchId) {
      $PLSQL = " BEGIN"
             . "    COMICS.Update_Matched_Wish_List(:MatchId);"
             . " END;";

      $this->Execute_PLSQL_Code($PLSQL, array(":MatchId"=>$MatchId) );
   }

   public function Get_Match_Existing() {
      $SQL = " SELECT   ComicId, Title,  Volume,  Issue "
           . " FROM     V_EXISTING_NEW_DIGITAL_COMIC"
           . " ORDER BY Title,  Volume,  Issue";

      return $this->Execute_DB_Select($SQL, array() );
   }

   public function Remove_Existing_Comic($ComicId) {
      $PLSQL = " BEGIN"
             . "    COMICS.Remove_New_Digital_Comic(:ComicId);"
             . " END;";

      return $this->Execute_PLSQL_Code($PLSQL, array(":ComicId"=>$ComicId) );
   }

   public function Get_New_Comics() {
      $SQL = " SELECT   ComicId, Title,  Volume,  Year, Issue, SubIssue, Series_Run"
           . " FROM     NEW_DIGITAL_COMIC"
           . " ORDER BY Title,  Volume, Issue";

      return $this->Execute_DB_Select($SQL, array() );
   }

   public function Clear_New_Digital_Comic($ComicId) {
      $PLSQL = " BEGIN"
             . "    COMICS.Process_New_Digital_Comic(:ComicId);"
             . " END;";

      $this->Execute_PLSQL_Code($PLSQL, array(":ComicId"=>$ComicId) );
   }

   public function Clear_Pull_List($ComicId) {
      $PLSQL = " BEGIN"
             . "    COMICS.Process_Pull_List(:ComicId);"
             . " END;";

      $this->Execute_PLSQL_Code($PLSQL, array(":ComicId"=>$ComicId) );
   }

   public function Get_Pull_List() {
      $SQL = " SELECT   ComicId, Title,  Volume,  Issue, Full_Name, "
           . "          to_char(Release_Date, 'YYYY-MM-DD') Release_Date"
           . " FROM     PULL_LIST"
           . " ORDER BY Release_Date Desc, Title,  Volume, Issue";

      return $this->Execute_DB_Select($SQL, array() );
   }

   public function Get_Wish_List() {
      $SQL = " SELECT   Title,  Volume,  Start_Issue, End_Issue, SubIssue, Series_Run"
           . " FROM     V_ALL_COMIC_RUN"
           . " WHERE    Comic_Type = 'WISHLIST'"
           . " ORDER BY Title,  Volume, Start_Issue";

      return $this->Execute_DB_Select($SQL, array() );
   }

}
?>
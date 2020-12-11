<?php

include 'Comic_Oracle.php';

class ViewComicDatabase_Oracle extends Comic_Oracle
{

   public function Add_Wish_List($TitleId) {
      $PLSQL = " BEGIN"
             . "  COMICS.Add_Wish_List(:TitleId);"
             . " END;";

      $this->Execute_PLSQL_Code($PLSQL, array(":TitleId"=>$TitleId) );
   }

   public function Delete_Title($TitleId) {
      $PLSQL = " BEGIN"
             . "    COMICS.Delete_Title(:TitleId);"
             . " END;";

      $this->Execute_PLSQL_Code($PLSQL, array(":TitleId"=>$TitleId) );
   }

   public function Add_Series_Run($ComicDBTitleId, $DigitalTitleId) {
      $PLSQL = " BEGIN"
             . "  COMICS.Add_ComicDB_Series_Run(:ComicDBTitleId, :DigitalTitleId);"
             . " END;";

      $this->Execute_PLSQL_Code($PLSQL, 
        array(":ComicDBTitleId"=>$ComicDBTitleId, ":DigitalTitleId"=>$DigitalTitleId) );
   }

   public function Add_Complete_Run($TitleId, $StartIssue, $EndIssue) {
      $PLSQL = " BEGIN"
             . "  COMICS.Add_Complete_Run(:TitleId, :StartIssue, :EndIssue);"
             . " END;";

      $this->Execute_PLSQL_Code($PLSQL,
      array(":TitleId"=>$TitleId, ":StartIssue"=>$StartIssue, ":EndIssue"=>$EndIssue) );
   }

   public function Get_Run_Gaps() {
      $SQL = " SELECT   Title_Id, Title,  Volume,  Start_Issue, End_Issue, SubIssue, Series_Run"
           . " FROM     V_ALL_COMIC_MULTI_RUN"
           . " ORDER BY Title,  Volume, Start_Issue";

      return $this->Execute_DB_Select($SQL, array() );
   }

   public function Get_Run_Splits() {
      $SQL = " SELECT   Title_Id, Title,  Volume,  Start_Issue, End_Issue, Series_Run"
           . " FROM     V_SPLIT_SERIES_RUN"
           . " ORDER BY Title,  Volume, Start_Issue";

      return $this->Execute_DB_Select($SQL, array() );
   }

   public function Get_Run_Diffs() {
      $SQL = " SELECT   ComicDB_Title_Id, Digital_Title_Id, Title,  Volume, "
           . " ComicDB_Run, ComicDB_Series_Run, Digital_Run, Digital_Series_Run"
           . " FROM     V_DIFF_SERIES_RUN"
           . " ORDER BY Title,  Volume, ComicDB_Run, Digital_Run";

      return $this->Execute_DB_Select($SQL, array() );
   }

   public function Get_Run_Details($Search) {
      $SQL = " SELECT   Title,  Volume,  Start_Issue, End_Issue, SubIssue, Series_Run"
           . " FROM     V_ALL_COMIC_RUN"
           . " WHERE    upper(Title) Like '%' || upper(:Search) || '%'"
           . " AND      Comic_Type = 'DIGITAL'"
           . " ORDER BY Title,  Volume, Start_Issue";

      return $this->Execute_DB_Select($SQL, array(":Search"=>$Search) );
   }

   public function Get_Wish_Details($Search) {
      $SQL = " SELECT   Title,  Volume,  Start_Issue, End_Issue, SubIssue, Series_Run"
           . " FROM     V_ALL_COMIC_RUN"
           . " WHERE    upper(Title) Like '%' || upper(:Search) || '%'"
           . " AND      Comic_Type = 'WISHLIST'"
           . " ORDER BY Title,  Volume, Start_Issue";

      return $this->Execute_DB_Select($SQL, array(":Search"=>"$Search") );
   }

}
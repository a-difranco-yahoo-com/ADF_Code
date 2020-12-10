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
     $this->Connection = oci_pconnect('Comics', 'piCK6mFTyW2iviB0ZI50', 'ADF1');

     if (! $this->Connection) {
           echo("ERROR : Connecting to oracle \n");
          exit(1);
      }
   }

   public function Execute_DB_Select($SQL, $Bind) {
      $stmt = oci_parse($this->Connection, $SQL);
      foreach($Bind as $key => $value) oci_bind_by_name($stmt, $key,  $Bind[$key]);
      oci_execute($stmt);
      oci_fetch_all($stmt, $rows, 0, 500, OCI_FETCHSTATEMENT_BY_ROW + OCI_RETURN_NULLS + OCI_ASSOC);
      return $rows;
   }
 
   public function Execute_PLSQL_Code($PLSQL, $Bind) {
      $stmt = oci_parse($this->Connection, $PLSQL);
      foreach($Bind as $key => $value) oci_bind_by_name($stmt, $key,  $Bind[$key]);
      oci_execute($stmt);
   }
 

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

   public function Log_Post_Details($type, $array) {
      $PLSQL = " DELETE FROM POST_DETAILS WHERE Post_Date < SysDate - 1";
      $this->Execute_PLSQL_Code($PLSQL, array() );

      $PLSQL = " INSERT INTO POST_DETAILS (Post_Type, Post_Date, Post_Key, Post_Value) "
             . " VALUES (:type, sysdate, :key, :value)";

      foreach($array as $key => $value) {
         $this->Execute_PLSQL_Code($PLSQL, 
             array(":type"=>$type, ":key"=>$key, ":value"=>$value) );
      }
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

      $this->Execute_PLSQL_Code($PLSQL, array(":MatchId", $MatchId) );
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

      return $this->Execute_DB_Select($SQL, array(":ComicId"=>$ComicId) );
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

   public function Delete_Title($TitleId) {
      $PLSQL = " BEGIN"
             . "    COMICS.Delete_Title(:TitleId);"
             . " END;";

      $this->Execute_PLSQL_Code($PLSQL, array(":TitleId"=>$TitleId) );
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

   public function Add_Wish_List($TitleId) {
      $PLSQL = " BEGIN"
             . "  COMICS.Add_Wish_List(:TitleId);"
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

   public function Get_Archive_Difference_Summary() {
      $SQL = " SELECT   Title, count(*) Issues "
           . " FROM     V_DIFFERING_ARCHIVE_COMIC_SUMMARY"
           . " GROUP BY Title"
           . " ORDER BY Count(*) Desc, Title";

      return $this->Execute_DB_Select($SQL, array() );
   }

   public function Get_Archive_Detail($Title, $StartYear, $EndYear) {
      $SQL = " SELECT   Title_Id, Comic_Type, Title,  Volume,  Start_Issue, End_Issue, Series_Run"
           . " FROM     V_ALL_COMIC_RUN"
           . " WHERE    upper(Title) Like '%' || upper(:Title) || '%'"
           . " AND      Volume BETWEEN :StartYear AND :EndYear"
           . " AND      Comic_Type IN ('ARCHIVE', 'DIGITAL')"
           . " ORDER BY Title, Volume, Start_Issue";

      return $this->Execute_DB_Select($SQL, 
         array(":Title"=>$Title, ":StartYear"=>$StartYear, ":EndYear"=>$EndYear) );
   }

   public function Get_ComicDB_Summary() {
      $SQL = " SELECT   Title, Volume, count(*) Issues "
           . " FROM     V_MISSING_FROM_COMICDB"
           . " GROUP BY Title, Volume"
           . " ORDER BY Count(*) Desc, Title, Volume";

      return $this->Execute_DB_Select($SQL, array() );
   }

   public function Get_ComicDB_Compare($Search) {
      $SQL = " SELECT   Title_Id, Comic_Type, Title, Volume, Start_Issue, End_Issue"
           . " FROM     V_ALL_COMIC_RUN "
           . " WHERE    Comic_Type IN ('COMICDB', 'DIGITAL')"
           . " AND      upper(Title) Like '%' || upper(:Title) || '%'"
           . " AND      Volume BETWEEN :StartYear AND :EndYear"
           . " ORDER BY Title, Volume, Start_Issue";

      return $this->Execute_DB_Select($SQL, 
         array(":Title"=>$Title, ":StartYear"=>$StartYear, ":EndYear"=>$EndYear) );
   }

   public function Get_ComicDB_Trades($TitleId) {
      $SQL = " SELECT   RowIdToChar(CC.RowId) RowId_CB, CT.Title_Id, CC.Title, CC.Volume, CC.Issue"
           . " FROM     COMIC_TITLE   CT "
           . "   JOIN   COMICDB_COMIC CC ON CC.Title               = CT.Title"
           . "                          AND CC.Volume              = CT.Volume"
           . "                          AND nvl(CC.Series_Run, -1) = nvl(CT.Series_Run, -1)"
           . " WHERE    CT.Title_Id = :TitleId"
           . " ORDER BY Title, Volume, Issue";

      return $this->Execute_DB_Select($SQL, array(":TitleId"=>$TitleId) );
   }

   public function Match_ComicDB($Search) {
      $PLSQL = " BEGIN"
             . "   COMICS.Find_ComicDB_Matches(:Title, :StartYear, :EndYear);"
             . "   COMMIT;"
             . " END;";

      $this->Execute_PLSQL_Code($PLSQL, array(":Title"=>$Search["Title"], 
                                              ":StartYear"=>$Search["StartYear"],
                                              ":EndYear"=>$Search["EndYear"]) );
   }

   public function Match_To_ComicDB($MatchId) {
      $PLSQL = " BEGIN"
             . "   COMICS.Add_ComicDB_Links(:MatchId);"
             . "   COMMIT;"
             . " END;";

      $this->Execute_PLSQL_Code($PLSQL, array(":MatchId"=>$MatchId) );
   }

   public function Get_Match_ComicDB() {
      $SQL = " SELECT   Match_Id, ComicDB_Title,  ComicDB_Volume,  Digital_Title, Digital_Volume, "
           . "          Sim, ComicDB_Comics, Digital_Comics, Matches, SubMatches, Matched"
           . " FROM     V_MATCH_COMICDB"
           . " ORDER BY ComicDB_Title,  ComicDB_Volume,  Digital_Title, Digital_Volume";

      return $this->Execute_DB_Select($SQL, array() );
    }

   public function SplitTrade($RowId, $StartIssue, $EndIssue) {
      $PLSQL = " BEGIN"
             . "   COMICS.Split_Trade(:RowId, :StartIssue, :EndIssue);"
             . "   COMMIT;"
             . " END;";

      $this->Execute_PLSQL_Code($PLSQL,
         array(":RowId"=>$RowId, ":StartIssue"=>$StartIssue, ":EndIssue"=>$EndIssue) );
   }

   public function Get_List_Hierarchy() {
      $SQL = " SELECT First_List, Second_List, Level"
           . " FROM   LIST_HIERARCHY"
           . " CONNECT BY PRIOR Second_List = First_List AND Second_List != First_List"
           . " START WITH First_List = Second_List"
           . " ORDER BY Level";

      return $this->Execute_DB_Select($SQL, array() );
    }

   public function Get_List_Summary() {
      $SQL = " SELECT List, Count(*) Comics, count(Distinct Title) Titles"
           . " FROM   MERGED_READING_ORDER"
           . " GROUP BY List"
           . " ORDER BY Count(*)";

      return $this->Execute_DB_Select($SQL, array() );
    }

   public function Get_List_Title_Summary() {
      $SQL = " SELECT List, Title, min(Issue) Min_Issue, max(Issue) Max_Issue"
           . " FROM   MERGED_READING_ORDER"
           . " GROUP BY List, Title"
           . " ORDER BY List, Title";

      return $this->Execute_DB_Select($SQL, array() );
    }

   public function Get_List_Detail() {
      $SQL = " SELECT List, Sequence_Number, Title, Issue"
           . " FROM   MERGED_READING_ORDER"
           . " ORDER BY List, Sequence_Number";

      return $this->Execute_DB_Select($SQL, array() );
    }

}
?>
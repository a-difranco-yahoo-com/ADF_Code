<?php

include 'Comic_Oracle.php';

class ComicDB_Oracle extends Comic_Oracle
{

   public function Match_To_ComicDB($MatchId) {
      $PLSQL = " BEGIN"
             . "   COMICS.Add_ComicDB_Links(:MatchId);"
             . "   COMMIT;"
             . " END;";

      $this->Execute_PLSQL_Code($PLSQL, array(":MatchId"=>$MatchId) );
   }

   public function Get_ComicDB_Summary() {
      $SQL = " SELECT   Title, Volume, count(*) Issues "
           . " FROM     V_MISSING_FROM_COMICDB"
           . " GROUP BY Title, Volume"
           . " ORDER BY Count(*) Desc, Title, Volume";

      return $this->Execute_DB_Select($SQL, array() );
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

   public function Get_ComicDB_Compare($Search) {
      $SQL = " SELECT   Title_Id, Comic_Type, Title, Volume, Start_Issue, End_Issue"
           . " FROM     V_ALL_COMIC_RUN "
           . " WHERE    Comic_Type IN ('COMICDB', 'DIGITAL')"
           . " AND      upper(Title) Like '%' || upper(:Title) || '%'"
           . " AND      Volume BETWEEN :StartYear AND :EndYear"
           . " ORDER BY Title, Volume, Start_Issue";

      return $this->Execute_DB_Select($SQL, 
         array(":Title"=>$Search['Title'], 
               ":StartYear"=>$Search['StartYear'],
               ":EndYear"=>$Search['EndYear']) );
   }

   public function SplitTrade($RowId, $StartIssue, $EndIssue) {
      $PLSQL = " BEGIN"
             . "   COMICS.Split_Trade(:RowId, :StartIssue, :EndIssue);"
             . "   COMMIT;"
             . " END;";

      $this->Execute_PLSQL_Code($PLSQL,
         array(":RowId"=>$RowId, ":StartIssue"=>$StartIssue, ":EndIssue"=>$EndIssue) );
   }

}
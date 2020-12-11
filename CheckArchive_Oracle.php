<?php

include 'Comic_Oracle.php';

class CheckArchive_Oracle extends Comic_Oracle
{

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

}
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

   public function Commit()
   {
      oci_commit($this->Connection);
   }

   public function CloseConnection()
   {
      oci_close($this->Connection);
   }

   public function ClearComics()
   {
      $DeleteText = "DELETE FROM DIGITAL_COMIC";

      $DelStmt = oci_parse($this->Connection, "$DeleteText");
      oci_execute($DelStmt, OCI_NO_AUTO_COMMIT);
      oci_free_statement($DelStmt);
   }

   public function AddComic($Title, $Volume, $Year, $Issue, $SubIssue, $SeriesRun)
   {
      $InsertText = "INSERT INTO DIGITAL_COMIC";
      $ColumnText = "(Title, Volume, Year, Issue, SubIssue, Series_Run)";
      $ValuesText = "VALUES (:Title, :Volume, :Year, :Issue, :SubIssue, :Series_Run)";

      $InsStmt = oci_parse($this->Connection, "$InsertText $ColumnText $ValuesText");
      oci_bind_by_name($InsStmt, ':Title',      $Title);
      oci_bind_by_name($InsStmt, ':Volume',     $Volume);
      oci_bind_by_name($InsStmt, ':Year',       $Year);
      oci_bind_by_name($InsStmt, ':Issue',      $Issue);
      oci_bind_by_name($InsStmt, ':SubIssue',   $SubIssue);
      oci_bind_by_name($InsStmt, ':Series_Run', $SeriesRun);
      oci_execute($InsStmt, OCI_NO_AUTO_COMMIT);
      oci_free_statement($InsStmt);
   }

   public function AddNewComic($Title, $Volume, $Year, $Issue, $SubIssue, $SeriesRun)
   {
      $InsertText = "INSERT INTO NEW_DIGITAL_COMIC";
      $ColumnText = "(Title, Volume, Year, Issue, SubIssue, Series_Run)";
      $ValuesText = "VALUES (:Title, :Volume, :Year, :Issue, :SubIssue, :Series_Run)";

      $InsStmt = oci_parse($this->Connection, "$InsertText $ColumnText $ValuesText");
      oci_bind_by_name($InsStmt, ':Title',      $Title);
      oci_bind_by_name($InsStmt, ':Volume',     $Volume);
      oci_bind_by_name($InsStmt, ':Year',       $Year);
      oci_bind_by_name($InsStmt, ':Issue',      $Issue);
      oci_bind_by_name($InsStmt, ':SubIssue',   $SubIssue);
      oci_bind_by_name($InsStmt, ':Series_Run', $SeriesRun);
      oci_execute($InsStmt, OCI_NO_AUTO_COMMIT);
      oci_free_statement($InsStmt);
   }

   public function PostLoadRebuilds()
   {
       $BeginText = "BEGIN";
/*	   
       $ProcText1 = "COMICS.Rebuild_Missing_Single_Issue;";
       $ProcText2 = "COMICS.Rebuild_Missing_Sub_Issue;";
       $ProcText3 = "COMICS.Rebuild_Missing_Mini_Series;";
*/
       $ProcText3 = "COMICS.Rebuild_Summary;";   
       $EndText   = "END;";
/*
       $stmt = oci_parse($this->Connection, "$BeginText $ProcText1 $ProcText2 $ProcText3 $EndText");
*/
       $stmt = oci_parse($this->Connection, "$BeginText $ProcText3 $EndText");
       oci_execute($stmt, OCI_DEFAULT);
       oci_free_statement($stmt);
   }

   public function Get_Phrase()
   {
       $SelectText = "SELECT   Line_String";
       $FromText   = "FROM     DIGITAL_PUZZLE_PHRASE";
       $OrderText  = "ORDER BY CHARACTER_NO";
       $stmt = oci_parse($this->Connection, "$SelectText $FromText $OrderText");
       oci_execute($stmt, OCI_DEFAULT);

       $rows = oci_fetch_all($stmt, $results);
       echo("$rows Rows\n");
       oci_free_statement($stmt);
       return $results;
   }

   public function Get_Solution()
   {
       $SelectText = "SELECT   DECRYPT_LINE_STRING Line_String";
       $FromText   = "FROM     DIGITAL_PUZZLE_PHRASE";
       $OrderText  = "ORDER BY CHARACTER_NO";
       $stmt = oci_parse($this->Connection, "$SelectText $FromText $OrderText");
       oci_execute($stmt, OCI_DEFAULT);

       $rows = oci_fetch_all($stmt, $results);
       echo("$rows Rows\n");
       oci_free_statement($stmt);
       return $results;
   }



}
?>

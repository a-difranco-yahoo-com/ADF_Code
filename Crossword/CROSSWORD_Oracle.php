<?php

class CROSSWORD_Oracle
{
    protected $Connection;

   public function __construct()
   {
      $this->Connect();
   }

   public function Connect()
   {
      $this->Connection = oci_connect('GEOCACHE_SOLVER', 'GeoCacheSolver', '');
      if (! $this->Connection) {
           echo("ERROR : Connecting to oracle \n");
          exit(1);
      }
   }

   public function Get_Dimensions()
   {
       $SelectText = "SELECT No_Of_Rows, No_Of_Columns";
       $FromText   = "FROM   CROSSWORD_DIMENSION";
       $stmt = oci_parse($this->Connection, "$SelectText $FromText");
       oci_execute($stmt, OCI_DEFAULT);

       $rows = oci_fetch_all($stmt, $results, null, null, OCI_FETCHSTATEMENT_BY_ROW + OCI_ASSOC);
       oci_free_statement($stmt);
       return $results;
   }

   public function Get_Cells()
   {
       $SelectText = "SELECT Row_No, Column_No,  Entry, Is_Key_Cell";
       $FromText   = "FROM   V_CROSSWORD_CELL";
       $stmt = oci_parse($this->Connection, "$SelectText $FromText");
       oci_execute($stmt, OCI_DEFAULT);

       $rows = oci_fetch_all($stmt, $results, null, null, OCI_FETCHSTATEMENT_BY_ROW + OCI_ASSOC);
       oci_free_statement($stmt);
       return $results;
   }

   public function Get_Key_Cells()
   {
       $SelectText = "SELECT   Key_No, Row_No, Column_No, Entry, Lookup_Value";
       $FromText   = "FROM     V_CROSSWORD_CELL";
       $WhereText  = "WHERE    Key_No IS NOT NULL";
       $OrderText  = "ORDER BY Key_No";
       $stmt = oci_parse($this->Connection, "$SelectText $FromText $WhereText $OrderText");
       oci_execute($stmt, OCI_DEFAULT);

       $rows = oci_fetch_all($stmt, $results, null, null, OCI_FETCHSTATEMENT_BY_ROW + OCI_ASSOC);
       oci_free_statement($stmt);
       return $results;
   }

   public function Get_Clues()
   {
       $SelectText = "SELECT  Row_No, Column_No,  Clue_No";
       $FromText    = "FROM   CROSSWORD_CLUE";
       $stmt = oci_parse($this->Connection, "$SelectText $FromText");
       oci_execute($stmt, OCI_DEFAULT);

       $rows = oci_fetch_all($stmt, $results, null, null, OCI_FETCHSTATEMENT_BY_ROW + OCI_ASSOC);
       oci_free_statement($stmt);
       return $results;
   }
}
?>

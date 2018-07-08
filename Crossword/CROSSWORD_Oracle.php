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
       $SelectText = "SELECT Row_No, Column_No,  Entry";
       $FromText    = "FROM   CROSSWORD_CELL";
       $stmt = oci_parse($this->Connection, "$SelectText $FromText");
       oci_execute($stmt, OCI_DEFAULT);

       $rows = oci_fetch_all($stmt, $results, null, null, OCI_FETCHSTATEMENT_BY_ROW + OCI_ASSOC);
       oci_free_statement($stmt);
       return $results;
   }
}
?>

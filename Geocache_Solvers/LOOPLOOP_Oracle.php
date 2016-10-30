<?php

class LOOPLOOP_Oracle
{
    protected $Connection;

   public function __construct()
   {
      $this->Connect();
   }

   public function Connect()
   {
      $this->Connection = oci_connect('LoopLoop', 'LoopTheLoop', '');
      if (! $this->Connection) {
           echo("ERROR : Connecting to oracle \n");
          exit(1);
      }
   }

   public function Get_Lines($Solution_Id)
   {
       $SelectText = "SELECT Start_Row, Start_Col, End_Row, End_Col, Is_Used";
       $FromText   = "FROM   LL_LINE";
       $WhereText  = "WHERE  Solution_Id = " . $Solution_Id;
       $stmt = oci_parse($this->Connection, "$SelectText $FromText $WhereText");
       oci_execute($stmt, OCI_DEFAULT);

       $rows = oci_fetch_all($stmt, $results, null, null, OCI_FETCHSTATEMENT_BY_COLUMN + OCI_ASSOC);
       echo("$Solution_Id : $rows Rows\n");
       oci_free_statement($stmt);
       return $results;
   }

   public function Get_Solutions()
   {
       $SelectText = "SELECT Distinct Solution_Id";
       $FromText   = "FROM   LL_LINE";
       $stmt = oci_parse($this->Connection, "$SelectText $FromText");
       oci_execute($stmt, OCI_DEFAULT);

       $rows = oci_fetch_all($stmt, $results);
       echo("Solutions : $rows Rows\n");
       oci_free_statement($stmt);
       return $results;
   }

}
?>

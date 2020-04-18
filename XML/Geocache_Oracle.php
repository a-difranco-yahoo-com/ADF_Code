<?php

class Geocache_Oracle
{
   protected $Connection;

   public function __construct()
   {
      $this->Connect();
   }

   public function Connect()
   {
      $this->Connection = oci_connect('adf', 'Sam5Par2', '');
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

   public function ClearCaches()
   {
       $DeleteText  = "DELETE FROM GEOCACHE";
       $stmt = oci_parse($this->Connection, "$DeleteText");
       oci_execute($stmt, OCI_DEFAULT);
       oci_free_statement($stmt);
	  }

   public function AddGeoCache($Name,      $Placed,     $Type, 
                               $Container, $Difficulty, $Terrain, 
 							   $Country,   $State,      $Found)
   {
      $InsertText = "INSERT INTO GEOCACHE";
      $ColumnText = "(Cache_Name, Date_Placed, Cache_Type, Container, Difficulty, Terrain, Country, State, Date_Found)";
      $ValuesText = "VALUES (:Name, :Placed, :Type, :Container, :Difficulty, :Terrain, :Country, :State,  :Found)";


      $InsStmt = oci_parse($this->Connection, "$InsertText $ColumnText $ValuesText");
      oci_bind_by_name($InsStmt, ':Name',       $Name);
      oci_bind_by_name($InsStmt, ':Placed',     $Placed);
      oci_bind_by_name($InsStmt, ':Type',       $Type);
      oci_bind_by_name($InsStmt, ':Container',  $Container);
      oci_bind_by_name($InsStmt, ':Difficulty', $Difficulty);
      oci_bind_by_name($InsStmt, ':Terrain',    $Terrain);
      oci_bind_by_name($InsStmt, ':Country',    $Country);
      oci_bind_by_name($InsStmt, ':State',      $State);
      oci_bind_by_name($InsStmt, ':Found',      $Found);

      oci_execute($InsStmt, OCI_NO_AUTO_COMMIT);
      oci_free_statement($InsStmt);
   }

}
?>
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
 

}
?>
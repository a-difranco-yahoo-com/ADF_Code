<?php

class DIGITAL_Oracle
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


   public function Get_Line_String($Nos)
   {
       $SelectText = "SELECT Distinct Line_String" . $Nos . " Line_String";
       $FromText   = "FROM   DIGITAL_PUZZLE_ALL_COMBINATION";
       $WhereText  = "WHERE  Line_String" . $Nos . " Is Not Null";
       $stmt = oci_parse($this->Connection, "$SelectText $FromText $WhereText");
       oci_execute($stmt, OCI_DEFAULT);

       $rows = oci_fetch_all($stmt, $results);
       echo("$Nos : $rows Rows\n");
       oci_free_statement($stmt);
       return $results;
   }

   public function Get_Solutions()
   {
       $Select1Text = "SELECT Line_String1, Line_String2,  Line_String3,  Line_String4,  Line_String5,  Line_String6, ";
       $Select2Text = " Line_String7,  Line_String8,  Line_String9,  Line_String10,  Line_String11,  Line_String12, ";
       $Select3Text = " Line_String13, Line_String14, Line_String15, Line_String16,  Line_String17,  Line_String18, Line_String19";
       $FromText    = "FROM   DIGITAL_PUZZLE_ALL_COMBINATION";
       $stmt = oci_parse($this->Connection, "$Select1Text $Select2Text $Select3Text $FromText");
       oci_execute($stmt, OCI_DEFAULT);

       $rows = oci_fetch_all($stmt, $results, null, null, OCI_FETCHSTATEMENT_BY_ROW + OCI_NUM);
       echo("Solutions : $rows Rows\n");
       oci_free_statement($stmt);
       return $results;
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

   public function Get_Phrase_Line_Id()
   {
       $SelectText = "SELECT   Line_id";
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

   public function Get_Frequency()
   {
       $SelectText = "SELECT   LS Line_String";
       $FromText   = "FROM     DIGITAL_PUZZLE_FREQUENCY";
       $OrderText  = "ORDER BY FREQUENCY Desc";
       $stmt = oci_parse($this->Connection, "$SelectText $FromText $OrderText");
       oci_execute($stmt, OCI_DEFAULT);

       $rows = oci_fetch_all($stmt, $results);
       echo("$rows Rows\n");
       oci_free_statement($stmt);
       return $results;
   }

}
?>

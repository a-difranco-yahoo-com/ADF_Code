<?php

function connect_to_db()
{
   $conn = oci_connect('adf', 'adf', 'ANT10g');
   if (!$conn)
   {
       $e = oci_error();
       echo("ERROR: Connecting to DB : " . $e['message'] . "\n");
       exit;
   } else {
     return $conn;
   }
}

function Reset_Table($conn)
{
   $DelStmnt=oci_parse($conn,"DELETE FROM ComicsTop300");
   oci_execute($DelStmnt);
   oci_free_statement($DelStmnt);
   oci_commit($conn);
}

function Load_File($infile, $conn)
{
   $IsHeader=TRUE;
   $lines = file($infile);
   foreach($lines as $line)
   {
      $Cols = str_getcsv($line, ',', '"');
      if ( $IsHeader )
      {
         $InsertText="INSERT INTO ComicsTop300 (YearMonth";
         foreach($Cols as $column)
            $InsertText = $InsertText . "," . $column;
         $InsertText = $InsertText . ")";
         $IsHeader=FALSE;
      } else {
         $ValuesText="Values ('" . $infile . "'";
         foreach($Cols as $column)
            $ValuesText = $ValuesText . ", '" . $column . "'";
         $ValuesText = $ValuesText . ")";

         $InsStmnt=oci_parse($conn,"$InsertText $ValuesText");
         oci_execute($InsStmnt);
         oci_free_statement($InsStmnt);
      }
   }
   oci_commit($conn);
}

/* List Html files found in dir  */
function Find_Files($src_dir, $conn)
{

   chdir("$src_dir");

   $files = scandir("$src_dir/");
   foreach ( $files as $file )
   {
      if ( $file != "." && $file != ".." && $file != "Thumbs.db" )
      {
          $srcfile = $src_dir . $file;
          Load_File($srcfile, $conn);
      }
   }
}

$src_dir="F:/Comics/icv2_csv/";
$conn = connect_to_db();
Reset_Table($conn);
Find_Files($src_dir, $conn);

?>

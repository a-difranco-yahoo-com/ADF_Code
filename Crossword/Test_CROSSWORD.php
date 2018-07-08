<?php

include 'CROSSWORD_Oracle.php';
include 'CROSSWORD_PDF.php';


   function DisplayCrossWord($db)
   {
      $dimensions = $db->Get_Dimensions();	  
      $dimension = $dimensions[0];	  
      $rows    = $dimension["NO_OF_ROWS"];
      $columns = $dimension["NO_OF_COLUMNS"];
      $pdf     = new CROSSWORD_PDF();
      $pdf->Reset($rows, $columns);

      $cells = $db->Get_Cells();
      for ($i=0; $i < count($cells); $i++)
      {
         $ThisCell=$cells[$i];
         $pdf->PrintCell( $ThisCell["ROW_NO"], $ThisCell["COLUMN_NO"], $ThisCell["ENTRY"]);
      }
      $pdf->Output("Crossword.pdf");
   }


   $db = new CROSSWORD_Oracle();
   DisplayCrossWord($db);
?>

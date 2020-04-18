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
         $pdf->PrintCell( $ThisCell["ROW_NO"], $ThisCell["COLUMN_NO"], $ThisCell["ENTRY"], $ThisCell["IS_KEY_CELL"]);
      }

      $clues = $db->Get_Clues();
      for ($i=0; $i < count($clues); $i++)
      {
         $ThisClue=$clues[$i];
         $pdf->PrintClueNumber( $ThisClue["ROW_NO"], $ThisClue["COLUMN_NO"], $ThisClue["CLUE_NO"]);
      }

      $pdf->SetupKeyCellPage();
      $cells = $db->Get_Key_Cells();
      for ($i=0; $i < count($cells); $i++)
      {
         $ThisCell=$cells[$i];
         $pdf->PrintKeyCell( $ThisCell["KEY_NO"], $ThisCell["ROW_NO"], $ThisCell["COLUMN_NO"], $ThisCell["ENTRY"], $ThisCell["LOOKUP_VALUE"]);
      }
      $pdf->Output("F", "Crossword.pdf");
   }


   $db = new CROSSWORD_Oracle();
   DisplayCrossWord($db);
?>

<?php

include 'LOOPLOOP_Oracle.php';
include 'LOOPLOOP_PDF.php';

   function DisplaySolutions($db)
   {
      $pdf     = new LOOPLOOP_PDF();

      $results   = $db->Get_Solutions();
      $solutions = $results["SOLUTION_ID"];
      for ($i=0; $i < count($solutions); $i++)
      {
         $ThisSol=$solutions[$i];
         $pdf->PrintSolution($ThisSol);

         $lineres = $db->Get_Lines($ThisSol);
         $StartRow = $lineres["START_ROW"];
         $StartCol = $lineres["START_COL"];
         $EndRow   = $lineres["END_ROW"];
         $EndCol   = $lineres["END_COL"];
         $IsUsed   = $lineres["IS_USED"];

         for ($j=0; $j < count($StartRow); $j++)
         {
            $pdf->PrintLine($StartCol[$j], $StartRow[$j], $EndCol[$j], $EndRow[$j], $IsUsed[$j]);
         }
      }
      $pdf->Output("F", "LoopLoop_Solutions.pdf");
   }


   $db = new LOOPLOOP_Oracle();
   DisplaySolutions ($db);
?>

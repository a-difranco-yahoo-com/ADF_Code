<?php

include 'DIGITAL_Oracle.php';
include 'DIGITAL_PDF.php';


   function DisplayLineString($db)
   {
      $pdf     = new DIGITAL_PDF();
      for ($Nos=1; $Nos<=19; $Nos++)
      {
         $results = $db->Get_Line_String($Nos);
         $lines   = $results["LINE_STRING"];

         $pdf->Reset();
         $pdf->PrintPageTitle($Nos);
         for ($i=0; $i < count($lines); $i++)
            $pdf->PrintLineString($lines[$i]);
      }
      $pdf->Output("Digital_Lines.pdf");
   }

   function DisplayPhrase($db)
   {
      $pdf     = new DIGITAL_PDF();
      $pdf->Reset();
      $results = $db->Get_Phrase();
      $lines   = $results["LINE_STRING"];

      for ($i=0; $i < count($lines); $i++)
      {
         $pdf->PrintCharacter($lines[$i]);
         if ( ($i % 8) == 7 ) $pdf->nextLine();
      }
      $pdf->Output("Digital_Phrase.pdf");
   }

   function DisplaySolutions($db)
   {
      $pdf     = new DIGITAL_PDF();

      $results = $db->Get_Phrase_Line_Id();
      $lineIds   = $results["LINE_ID"];

      $solutions = $db->Get_Solutions();
      for ($i=0; $i < count($solutions); $i++)
      {
         echo("Solution : $i \n");
         $pdf->Reset();
         $ThisSol=$solutions[$i];
         echo("Columns : ". count($ThisSol) . "\n");
         for ($j=0; $j < count($lineIds); $j++)
         {
            $ThisLineId = $lineIds[$j];
            if ( $ThisLineId == 0 )
               $pdf->DrawOutline();
            else
               $pdf->PrintCharacter($ThisSol[$ThisLineId - 1]);
            if ( ($j % 8) == 7 ) $pdf->nextLine();
         }
      }
      $pdf->Output("Digital_Solutions.pdf");
   }

   function DisplayFrequency($db)
   {
      $pdf     = new DIGITAL_PDF();
      $pdf->Reset();
      $results = $db->Get_Frequency();
      $lines   = $results["LINE_STRING"];

      for ($i=0; $i < count($lines); $i++)
         $pdf->PrintLineString($lines[$i]);

      $pdf->Output("Digital_Frequency.pdf");
   }


   $db = new DIGITAL_Oracle();

   DisplayLineString($db);
   DisplayPhrase    ($db);
   DisplaySolutions ($db);
   DisplayFrequency ($db);
?>

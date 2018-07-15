<?php


require('D:\Php_Code\fpdf\fpdf.php');

class CROSSWORD_PDF extends FPDF
{
    protected $Space;


   protected function Init($Rows, $Columns)
   {
	  $XSpace=(210 / ($Columns + 1) );
	  $YSpace=(297 / ($Rows    + 1) );
	  if ($XSpace < $YSpace)
		  $this->Space = $XSpace;
	  else
		  $this->Space = $YSpace;

   }

   public function Reset($Rows, $Columns)
   {
      $this->AddPage();
      $this->SetFont('Arial','B',16);
      $this->SetMargins(1,1,1);
      $this->Init($Rows, $Columns);
   }


   public function PrintClueNumber($Row, $Column, $ClueNumber)
   {
      $this->SetFont('Arial','B',10);
//
      $this->SetXY( ($Column - 0.5) * $this->Space, ($Row - 0.5) * $this->Space);
	  $this->Write(4, $ClueNumber);
   }

   public function PrintCell($Row, $Column, $Entry, $Is_Key_Cell)
   {
      $this->SetLineWidth(0.1);
      $this->SetDrawColor(0,0,0);
      $this->SetFont('Arial','B',16);
	  if     ($Entry       == "." ) $this->SetFillColor(  0,   0,   0);
	  elseif ($Is_Key_Cell == "Y" ) $this->SetFillColor(  0, 255,   0);
	  else                          $this->SetFillColor(255, 255, 255);		  
//
      $this->SetXY( ($Column - 0.5) * $this->Space, ($Row - 0.5) * $this->Space);
	  if ( $Entry == "." || $Entry == "x" )
	  {
		  $this->Cell($this->Space, $this->Space, "",     "LRTB", 0, "C", TRUE);
	  } else {
		  $this->Cell($this->Space, $this->Space, $Entry, "LRTB", 0, "C", TRUE);
	  }
   }

   public function SetupKeyCellPage()
   {
      $this->AddPage();
      $this->SetDrawColor(0,0,0);
      $this->SetFont('Arial','B',8);
      $this->SetMargins(15, 15, 15);
      $this->Ln();
   }

   public function PrintKeyCell($Key_No, $Row, $Column, $Entry, $Value)
   {
      $this->Cell(36, 8, $Key_No, "LRTB", 0, "C", FALSE);
      $this->Cell(36, 8, $Row,    "LRTB", 0, "C", FALSE);
      $this->Cell(36, 8, $Column, "LRTB", 0, "C", FALSE);
      $this->Cell(36, 8, $Entry,  "LRTB", 0, "C", FALSE);
      $this->Cell(36, 8, $Value,  "LRTB", 0, "C", FALSE);
      $this->Ln();
   }


}
?>
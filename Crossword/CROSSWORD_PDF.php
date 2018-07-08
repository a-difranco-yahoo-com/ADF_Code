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


   public function PrintCell($Row, $Column, $Entry)
   {
      $this->SetLineWidth(0.1);
      $this->SetDrawColor(0,0,0);
//
      $this->SetXY( ($Column - 0.5) * $this->Space, ($Row - 0.5) * $this->Space);
	  if ( $Entry == "." )
	  {
		  $this->Cell($this->Space, $this->Space, "", "LRTB", 0, "C", TRUE);
	  } elseif ( $Entry == "x" )
	  {
		  $this->Cell($this->Space, $this->Space, "", "LRTB", 0, "C", FALSE);
	  } else {
		  $this->Cell($this->Space, $this->Space, $Entry, "LRTB", 0, "C", FALSE);
	  }
   }


}
?>
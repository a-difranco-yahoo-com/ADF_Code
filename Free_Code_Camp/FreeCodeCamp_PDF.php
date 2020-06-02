<?php

require('D:\Php_Code\fpdf\fpdf.php');

Class FREECODECAMP_PDF extends FPDF {
   public function AddSubject($Subject)
   {
      $this->AddPage();
      $this->SetFont('Arial','B',20);
      $this->SetMargins(10, 10, 10);
      $this->SetTextColor(0, 0, 255);
	  $this->setXY(0, 150);
	  $this->Cell(0, 0, $Subject, 0, 0, 'C', false);
   }

   public function AddLessonTitle($Title)
   {
      $this->AddPage();
      $this->SetFont('Arial','u',14);
      $this->SetMargins(10, 10, 10);
      $this->SetTextColor(255, 0, 0);
	  $this->SetFillColor(230, 240, 250);
	  $this->Cell(190, 8, $Title, 1, 1, 'C', true);
      $this->Ln();
   }
   
   public function AddLessonText($Text)
   {
      $this->SetFont('courier','',12);
      $this->SetTextColor(0, 0, 0);
	  $this->Write(4, $Text);
      $this->Ln();
      $this->Ln();
   }

   public function AddLessonCode($Code)
   {
      $this->SetFont('Courier','',12);
      $this->SetTextColor(0, 0, 0);
	  $this->Write(4, $Code);
      $this->Ln();
   }
   
   public function DrawCodeArea($NoOfLines)
   {
	  $x= $this->getX();
	  $y= $this->getY();
	  $this->SetFillColor(230, 240, 250);
	  $this->Rect($x, $y, 190, 4 * ($NoOfLines + 2), 'FD');
	  $this->setXY($x, $y);
      $this->Ln();
   }  
}

?>
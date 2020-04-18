<?php


require('E:\Php_Code\fpdf\fpdf.php');

class LOOPLOOP_PDF extends FPDF
{
    protected $Top;
    protected $Len;


   public function PrintLine($Start_Row, $Start_Col, $End_Row, $End_Col, $Is_Used)
   {
     if ( $Is_Used == "Y" )
     {
        $this->SetLineWidth(1.0);
        $this->SetDrawColor(0,0,255);
     } else {
        $this->SetLineWidth(0.1);
        $this->SetDrawColor(0,0,0);
     }

     $this->Line($this->Top + ($this->Len * $Start_Row), $this->Top + ($this->Len * $Start_Col),
                 $this->Top + ($this->Len * $End_Row),   $this->Top + ($this->Len * $End_Col) );
   }

   public function PrintSolution($Solution_Id)
   {
      $this->Top=10;
      $this->Len=5;
//
      $this->AddPage();
      $this->SetFont('Courier', 'B', 16);
      $this->SetMargins(1,1,1);
      $this->SetXY(5, 5);
      $this->Write(4, $Solution_Id);
   }
}
?>
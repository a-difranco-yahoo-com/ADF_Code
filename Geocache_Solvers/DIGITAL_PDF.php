<?php


require('E:\Php_Code\fpdf\fpdf.php');

class DIGITAL_PDF extends FPDF
{
    protected $TopX;
    protected $TopY;


   protected function Init()
   {
      $this->TopX=10;
      $this->TopY=10;
      $this->XLen=5;
      $this->YLen=5;
      $this->YDec=$this->YLen + 2;
      $this->DYLen=(2 * $this->YLen);
      $this->XSpace=$this->XLen + 6;
      $this->YSpace=$this->DYLen + 5;
   }

   public function Reset()
   {
      $this->AddPage();
      $this->SetFont('Arial','B',16);
      $this->SetMargins(1,1,1);
      $this->Init();
   }

   public function next()
   {
      if ( ($this->TopX + $this->XSpace + $this->XLen) < 210)
      {
         $this->TopX += $this->XSpace;
      } else {
         $this->nextLine();
      }
   }

   public function nextLine()
   {
      if ( ($this->TopY + $this->YSpace + $this->DYLen)  < 290)
      {
         $this->TopX  = 10;
         $this->TopY += $this->YSpace;
      } else {
         $this->Reset();
      }
   }

   public function DrawOutline()
   {
      $this->SetLineWidth(0.1);
      $this->SetDrawColor(0,0,0);
      $this->PrintTop();
      $this->PrintMiddle();
      $this->PrintBottom();
//
      $this->PrintLeftTop();
      $this->PrintLeftBottom();
      $this->PrintRightTop();
      $this->PrintRightBottom();
//
//      $this->PrintDecimalPoint();
      $this->SetLineWidth(1.0);
      $this->SetDrawColor(0,0,255);
   }

   public function PrintTop()           { $this->Line($this->TopX,             $this->TopY,              $this->TopX+$this->XLen, $this->TopY); }
   public function PrintMiddle()        { $this->Line($this->TopX,             $this->TopY+$this->YLen,  $this->TopX+$this->XLen, $this->TopY+$this->YLen);  }
   public function PrintBottom()        { $this->Line($this->TopX,             $this->TopY+$this->DYLen, $this->TopX+$this->XLen, $this->TopY+$this->DYLen); }
   public function PrintLeftTop()       { $this->Line($this->TopX,             $this->TopY,              $this->TopX,             $this->TopY+$this->YLen);  }
   public function PrintLeftBottom()    { $this->Line($this->TopX,             $this->TopY+$this->YLen,  $this->TopX,             $this->TopY+$this->DYLen); }
   public function PrintRightTop()      { $this->Line($this->TopX+$this->XLen, $this->TopY,              $this->TopX+$this->XLen, $this->TopY+$this->YLen);  }
   public function PrintRightBottom()   { $this->Line($this->TopX+$this->XLen, $this->TopY+$this->YLen,  $this->TopX+$this->XLen, $this->TopY+$this->DYLen); }
   public function PrintDecimalPoint()  { $this->SetXY($this->TopX+$this->XLen, $this->TopY+$this->YDec) ; $this->Write(4, "."); }

   public function PrintPageTitle($Title)
   {
      $this->Write(4, $Title);
      $this->nextLine();
   }

   public function PrintString($Text)
   {
      $this->SetXY($this->TopX + (2*$this->XLen), $this->TopY) ;
      $this->Write(4, $Text);
   }

   public function PrintLineString($Line)
   {
      $this->DrawOutline();
      for ($x=0; $x < 8; $x++)
         if ( substr( $Line, $x, 1) == "1" )
            $this->PrintBar($x + 1);

      $this->PrintString($Line);
      $this->nextLine();
    }

   public function PrintCharacter($Line)
   {
      $this->DrawOutline();
      for ($x=0; $x < 8; $x++)
         if ( substr( $Line, $x, 1) == "1" )
            $this->PrintBar($x + 1);

      $this->next();
    }



   public function PrintBar($nos)
   {
          if ( $nos == 1 ) $this->PrintTop();
      elseif ( $nos == 2 ) $this->PrintMiddle();
      elseif ( $nos == 3 ) $this->PrintBottom();
      elseif ( $nos == 4 ) $this->PrintLeftTop();
      elseif ( $nos == 5 ) $this->PrintLeftBottom();
      elseif ( $nos == 6 ) $this->PrintRightTop();
      elseif ( $nos == 7 ) $this->PrintRightBottom();
      elseif ( $nos == 8 ) $this->PrintDecimalPoint();
   }

}
?>
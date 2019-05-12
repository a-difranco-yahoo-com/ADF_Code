<?php


require('E:\Php_Code\fpdf\fpdf.php');

class SEGMENT extends FPDF
{
    protected $TopX;
    protected $TopY;


   protected function Init()
   {
      $this->TopX=10;
      $this->TopY=10;
      $this->XLen=3;
      $this->YLen=5;
      $this->DXLen=(2 * $this->XLen);
      $this->DYLen=(2 * $this->YLen);
      $this->XSpace=$this->DXLen + 5;
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
      if ( ($this->TopX + $this->XSpace + $this->DXLen) < 210)
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
      $this->PrintTopLeft();     $this->PrintTopRight();
      $this->PrintRightTop();    $this->PrintRightBottom();
      $this->PrintBottomLeft();  $this->PrintBottomRight();
      $this->PrintLeftTop();     $this->PrintLeftBottom();

      $this->PrintMiddleLeft();       $this->PrintMiddleRight();
      $this->PrintMiddleTop();        $this->PrintMiddleBottom();
      $this->PrintTopLeftCentre();    $this->PrintTopRightCentre();
      $this->PrintBottomLeftCentre(); $this->PrintBottomRightCentre();
      $this->SetLineWidth(1.0);
      $this->SetDrawColor(0,0,255);
   }

   public function PrintTopLeft()           { $this->Line($this->TopX,             $this->TopY,              $this->TopX+$this->XLen,  $this->TopY); }
   public function PrintTopRight()          { $this->Line($this->TopX+$this->XLen, $this->TopY,              $this->TopX+$this->DXLen, $this->TopY); }
   public function PrintMiddleLeft()        { $this->Line($this->TopX,             $this->TopY+$this->YLen,  $this->TopX+$this->XLen,  $this->TopY+$this->YLen);  }
   public function PrintMiddleRight()       { $this->Line($this->TopX+$this->XLen, $this->TopY+$this->YLen,  $this->TopX+$this->DXLen, $this->TopY+$this->YLen);  }
   public function PrintBottomLeft()        { $this->Line($this->TopX,             $this->TopY+$this->DYLen, $this->TopX+$this->XLen,  $this->TopY+$this->DYLen); }
   public function PrintBottomRight()       { $this->Line($this->TopX+$this->XLen, $this->TopY+$this->DYLen, $this->TopX+$this->DXLen, $this->TopY+$this->DYLen); }

   public function PrintTopLeftCentre()     { $this->Line($this->TopX,              $this->TopY,              $this->TopX+$this->XLen, $this->TopY+$this->YLen); }
   public function PrintTopRightCentre()    { $this->Line($this->TopX+$this->DXLen, $this->TopY,              $this->TopX+$this->XLen, $this->TopY+$this->YLen); }
   public function PrintBottomLeftCentre()  { $this->Line($this->TopX,              $this->TopY+$this->DYLen, $this->TopX+$this->XLen, $this->TopY+$this->YLen); }
   public function PrintBottomRightCentre() { $this->Line($this->TopX+$this->DXLen, $this->TopY+$this->DYLen, $this->TopX+$this->XLen, $this->TopY+$this->YLen); }

   public function PrintLeftTop()           { $this->Line($this->TopX,              $this->TopY,              $this->TopX,              $this->TopY+$this->YLen);  }
   public function PrintLeftBottom()        { $this->Line($this->TopX,              $this->TopY+$this->YLen,  $this->TopX,              $this->TopY+$this->DYLen); }
   public function PrintMiddleTop()         { $this->Line($this->TopX+$this->XLen,  $this->TopY,              $this->TopX+$this->XLen,  $this->TopY+$this->YLen);  }
   public function PrintMiddleBottom()      { $this->Line($this->TopX+$this->XLen,  $this->TopY+$this->YLen,  $this->TopX+$this->XLen,  $this->TopY+$this->DYLen); }
   public function PrintRightTop()          { $this->Line($this->TopX+$this->DXLen, $this->TopY,              $this->TopX+$this->DXLen, $this->TopY+$this->YLen);  }
   public function PrintRightBottom()       { $this->Line($this->TopX+$this->DXLen, $this->TopY+$this->YLen,  $this->TopX+$this->DXLen, $this->TopY+$this->DYLen); }

   public function PrintPageTitle($Title)
   {
      $this->Write(4, $Title);
      $this->nextLine();
   }

   public function PrintString($Bit)
   {
      $this->SetXY($this->TopX + (2*$this->DXLen), $this->TopY) ;
      $this->Write(4, $Bit);
   }

   public function PrintLineString($Line)
   {
      $this->DrawOutline();
      for ($x=0; $x < 16; $x++)
         if ( substr( $Line, $x, 1) == "1" )
            $this->PrintBar($x + 1);

      $this->next();
    }

   public function PrintCharacter($Line)
   {
      $this->DrawOutline();
      for ($x=0; $x < 16; $x++)
         if ( substr( $Line, $x, 1) == "1" )
            $this->PrintBar($x + 1);

      $this->next();
    }



   public function PrintBar($nos)
   {
          if ( $nos ==  1 ) $this->PrintTopLeft();
      elseif ( $nos ==  2 ) $this->PrintTopRight();
      elseif ( $nos ==  3 ) $this->PrintMiddleLeft();
      elseif ( $nos ==  4 ) $this->PrintMiddleRight();
      elseif ( $nos ==  5 ) $this->PrintBottomLeft();
      elseif ( $nos ==  6 ) $this->PrintBottomRight();
      elseif ( $nos ==  7 ) $this->PrintTopLeftCentre();
      elseif ( $nos ==  8 ) $this->PrintTopRightCentre();
      elseif ( $nos ==  9 ) $this->PrintBottomLeftCentre();
      elseif ( $nos == 10 ) $this->PrintBottomRightCentre();
      elseif ( $nos == 11 ) $this->PrintLeftTop();
      elseif ( $nos == 12 ) $this->PrintLeftBottom();
      elseif ( $nos == 13 ) $this->PrintMiddleTop();
      elseif ( $nos == 14 ) $this->PrintMiddleBottom();
      elseif ( $nos == 15 ) $this->PrintRightTop();
      elseif ( $nos == 16 ) $this->PrintRightBottom();
   }

}
?>

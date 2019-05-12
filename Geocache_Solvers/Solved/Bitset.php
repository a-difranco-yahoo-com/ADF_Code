<?php

class Bitset
{
    protected $BitArray;

public function __construct()
{
   $this->BitArray = array();
}

public function Reset()
{
  for ($i=1; $i<=16; $i++)
      $this->BitArray[$i] = TRUE;
}

public function Clear()
{
  for ($i=1; $i<=16; $i++)
      $this->BitArray[$i] = FALSE;
}

public function Common($bit)
{
  $Common = 0;
  for ($i=1; $i<=16; $i++)
      if ( $this->GetBit($i) && $bit->GetBit($i) )
        $Common++;

  return $Common;
}

public function Count()
{
  $Count = 0;
  for ($i=1; $i<=16; $i++)
      if ( $this->GetBit($i) )
        $Count++;

  return $Count;
}

public function Extend($bit)
{
  for ($i=1; $i<=16; $i++)
      if ( $bit->GetBit($i) )
        $this->SetBit($i);
}

public function Exclude($bit)
{
  for ($i=1; $i<=16; $i++)
      if ( $bit->GetBit($i) )
        $this->UnsetBit($i);
}

public function ConvertToChar()
{
  $retStr = "";
  for ($i=1; $i<=16; $i++)
      if ( $this->GetBit($i) )
        $retStr .= "1";
      else
        $retStr .= "0";

   return  $retStr;
}

public function SetBit($nos)
{
  $this->BitArray[$nos] = TRUE;
}

public function UnsetBit($nos)
{
  $this->BitArray[$nos] = FALSE;
}

public function GetBit($nos)
{
  return $this->BitArray[$nos];
}


}
?>

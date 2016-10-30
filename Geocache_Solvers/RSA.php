<?php


class RSA
{
    var $alphabet;
    
   function RSA($power)
   {
      $this->alphabet="xABCDEFGHIJKLMNOPQRSTUVWXYZ";
      $this->power=$power;
      $this->mod=403;
   }
   
   function isPrime( $nos)
   {
      for ( $x=3; $x * $x <= $nos; $x += 2)
      {
         if ( $nos % $x  == 0 )
            return FALSE;
      }
      return TRUE;

   }

   function getNextPrime()
   {
      $this->power += 2;
      while ( ! $this->isPrime( $this->power) )
          $this->power += 2;
   }

   function decryptChar( $char)
   {
      $res=1;
      for ( $i=1; $i<=$this->power; $i++)
         $res = ($res * $char) % $this->mod;
      return $res;     
   }
   
   function decrypt($clue)
   {
       $outMessage="";
       for ($i = 0; $i < count($clue); $i++)
       {
         $outCode= $this->decryptChar($clue[$i]);
         $outMessage=$outMessage . substr($this->alphabet, $outCode, 1);
       }
       return $outMessage;  
   }
}

$rsa = new RSA(23);

$clue  = array(345,242,343,81,196,140,292,345,259,1,22,344,292,242,292,138,242,140,292,28,277,85);
$XClue = array(242,81,80,343,28,292,292,85,196,242,129,130,206,81,292,1,345);
$YClue = array(130,242,138,85,1,345,28,343,138,242,242,292,129,336,81,198,242,345,1);


for ($i=0; $i<=0; $i++)
{
   echo( $rsa->power . " " . $rsa->decrypt($clue)  . "\n");
   echo( $rsa->power . " " . $rsa->decrypt($XClue) . "\n");
   echo( $rsa->power . " " . $rsa->decrypt($YClue) . "\n");
   $rsa->getNextPrime();
}


?>
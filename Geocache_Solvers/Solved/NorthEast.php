<?php

/*
NORTH + EAST = CACHE

Each letter represents a different numeral from 0 to 9.
Neither N, E nor C is 0

*/


function addNumbers($x, $y, $carryOver)
{
  if ( $carryOver )
     return ($x + $y + 1) % 10;
  else
     return ($x + $y) % 10;
}

function getCarryOver($x, $y, $carryOver)
{
  if ( $carryOver )
     return ($x + $y + 1) > 9;
  else
     return ($x + $y) > 9;
}


function getCoords($A, $C, $E, $H, $N, $O, $R, $S, $T)
{
  $X = ( ($H * 10) + $C ) * ( (100 * $R) + (10 * $E) + $E);
  $Y = ( ($H * 10) + $H ) * ( (10 * $T) + $O);

  if ( $X > 999 && $X < 100000 && $Y > 8000 && $Y < 9000)
     printf("X = $X ; Y = $Y NORTH = $N $O $R $T $H ; EAST = $E $A $S $T ; CACHE = $C $A $C $H $E \n");
}
 
function get5thLetter($A, $C, $E, $H, $O, $R, $S, $T, $carryOver)
{
  for ( $N=1; $N<=9; $N++)
  {
     if ( ! in_array($N, array($A, $C, $E, $H, $O, $R, $S, $T), FALSE) )
     {
        if ( $C == addNumbers($N, 0, $carryOver) )
        {
           getCoords($A, $C, $E, $H, $N, $O, $R, $S, $T);
        }
     }
  }
}

function get4thLetter($A, $C, $E, $H, $R, $S, $T, $carryOver)
{
  for ( $O=0; $O<=9; $O++)
  {
     if ( ! in_array($O, array($A, $C, $E, $H, $R, $S, $T), FALSE) )
     {
        if ( $A == addNumbers($O, $E, $carryOver) )
        {
           $newCarryOver = getCarryOver($O, $E, $carryOver);
           get5thLetter($A, $C, $E, $H, $O, $R, $S, $T, $newCarryOver);
        }
     }
  }
}

function get3rdLetter($E, $H, $S, $T, $carryOver)
{
  for ( $R=0; $R<=9; $R++)
  {
     if ( ! in_array($R, array($E, $H, $S, $T), FALSE) )
     {
        for ( $A=0; $A<=9; $A++)
        {
           if ( ! in_array($A, array($E, $H, $R, $S, $T), FALSE) )
           {
              $C = addNumbers($R, $A, $carryOver);
              if ( ! in_array($C, array(0, $A, $E, $H, $R, $S, $T), FALSE) )
              {
                 $newCarryOver = getCarryOver($R, $A, $carryOver);
                 get4thLetter($A, $C, $E, $H, $R, $S, $T, $newCarryOver);
              }
           }
       }
     }
  }
}

function get2ndLetter($E, $H, $T, $carryOver)
{
  for ( $S=0; $S<=9; $S++)
  {
     if ( ! in_array($S, array($E, $H, $T), FALSE) )
     {
       if ( $H == addNumbers($T, $S, $carryOver) )
       {
          $newCarryOver = getCarryOver($T, $S, $carryOver);
          get3rdLetter($E, $H, $S, $T, $newCarryOver);
       }
     }
  }
}

function get1stLetter()
{
  for ( $H=0; $H<=9; $H++)
  {
     for ( $T=0; $T<=9; $T++)
     {
        if ( $H != $T )
        {
           $E = addNumbers($H, $T, FALSE);
           $newCarryOver = getCarryOver($H, $T, FALSE);
           if ( $E != $H && $E != $T )
           {
              get2ndLetter($E, $H, $T, $newCarryOver);
           }
        }
     }
  }
}

Get1stLetter();

?>
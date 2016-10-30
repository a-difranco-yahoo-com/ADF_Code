<?php

/*
NORTH + WEST = CACHE

Each letter represents a different numeral from 0 to 9.
Neither N, W nor C is 0

*/

 function addNumbers($x1, $x2, $carryOver)
 {
    if ( $carryOver )
       return ($x1 + $x2 + 1) % 10;
    else
       return ($x1 + $x2) % 10;
 }

 function getCarryOver($x1, $x2, $carryOver)
 {
    if ( $carryOver )
       return ($x1 + $x2 + 1) > 9;
    else
       return ($x1 + $x2) > 9;
 }


 function GetCoordinates($A, $C, $E, $H, $N, $O, $R, $S, $T, $W)
 {
    $X= $H * $E * ( (1000 * $O) + (100 * $S) + (10 * $T) + $W );
    $Y= $E * $S * ( (100 * $N) + (10 * $R) + $C );

    if ( $X > 999 && $X < 100000 && $Y > 999 && $Y < 100000)
        echo("X=$X, Y=$Y \n");
 }


     /* N + 1 = C  Must be carry over */
 function Get5thLetter($A, $C, $E, $H, $O, $R, $S, $T, $W, $carryOver)
 {
     if ($carryOver && $C > 1)
     {
        $N = $C - 1;
        if ( $N != $A && $N != $C && $N != $E
          && $N != $H && $N != $O && $N != $R
          && $N != $S && $N != $T && $N != $W)
        {
           GetCoordinates($A, $C, $E, $H, $N, $O, $R, $S, $T, $W);
        }
     }
 }

 function Get4thLetter($C, $E, $H, $R, $S, $T, $carryOver)
 {
     /* O + W = A  */
     for ($O=0; $O<=9; $O++)
     {
        if ( $O != $C && $O != $E && $O != $H
          && $O != $R && $O != $S && $O != $T)
        {
           for ($W=0; $W<=9; $W++)
           {
              if ( $W != $C && $W != $E && $W != $H && $W != $O
                && $W != $R && $W != $S && $W != $T )
              {
                 $A = addNumbers($O, $W, $carryOver);
                 $newCarryOver = getCarryOver($O, $W, $carryOver);

                 if ( $A != $C && $A != $E && $A != $H && $A != $O
                   && $A != $R && $A != $S && $A != $T && $A != $W)
                 {
                    Get5thLetter($A, $C, $E, $H, $O, $R, $S, $T, $W, $newCarryOver);
                 }
              }
           }
        }
     }
 }

 function Get3rdLetter($E, $H, $S, $T, $carryOver)
 {
     /* R + E = C */
     for ($R=0; $R<=9; $R++)
     {
        if ( $R != $E && $R != $H
          && $R != $S && $R != $T)
        {
           $C = addNumbers($R, $E, $carryOver);
           $newCarryOver = getCarryOver($R, $E, $carryOver);

           if ( $C != $E && $C != $H  && $C != $R
             && $C != $S && $C != $T)
           {
               Get4thLetter($C, $E, $H, $R, $S, $T, $newCarryOver);
           }
        }
     }
 }

 function Get2ndLetter($E, $H, $T, $carryOver)
 {
     /* T + S = H  */
     for ($S=0; $S<=9; $S++)
     {
        if ( $S != $E && $S != $H && $S != $T)
        {
           if ( $H == addNumbers($T, $S, $carryOver) )
           {
              $newCarryOver = getCarryOver($T, $S, $carryOver);
               Get3rdLetter($E, $H, $S, $T, $newCarryOver);
           }
        }
     }
 }

 function Get1stLetter()
 {
     /* H + T = E - no carry over */
     for ($H=0; $H<=9; $H++)
     {
        for ($T=0; $T<=9; $T++)
        {
           if ( $H != $T )
           {
		      $E = addNumbers($H, $T, FALSE);
		      $newCarryOver = getCarryOver($H, $T, FALSE);
              if ($E != $H && $E != $T )
                 Get2ndLetter($E, $H, $T, $newCarryOver);
           }
        }
     }
}

Get1stLetter();

?>
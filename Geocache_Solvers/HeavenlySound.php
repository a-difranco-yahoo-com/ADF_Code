<?php

/*
Found it? Use the letter-count in the name to set coordinates ABC
e.g. "W.H.Smith" = 1,1,5. So A=1, B=1, C=5.

Now calculate Stage 2's coordinates:
N51 30.(AxB)(C)(AxC) W000 0(B+C).(B+C)00
*/


 function GetABC()
 {
     for ($A=1; $A<=9; $A++)
       for ($B=1; $B<=9; $B++)
         for ($C=1; $C<=9; $C++)
         {
           if ( ($A * $B) < 10 )
           if ( ($A * $C) < 10 )
           if ( ($B + $C) < 10 )
           {
             $AB = ($A * $B);
             $AC = ($A * $C);
             $BC = ($B + $C);
             echo("A=$A, B=$B C=$C  N51 30.$AB$C$AC W000 0$BC.$BC" . "00 \n");
           }
        }
}

GetABC();

?>
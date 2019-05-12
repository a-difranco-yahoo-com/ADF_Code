<?php

/*
Col01 = FHINNT
Col02 = EFIIOSUZ
Col03 = BEHINNOUY
Col04 = EEFMNORU
Col05 = DELOOPT
Col06 = AEHNTWY
Col07 = ,HHIIOR
Col08 = EFNNNRY
Col09 = BEEEILORS
Col10 = EEEFILU
Col11 = ADSTTW
Col12 = 'CEEEEFNY
Col13 = KNOSSUV
Col14 = EJRRTTT
Col15 = .GHMNOTTW
Col16 = EHHIOOTY
Col17 = !EEIR
Col18 = .CERRTTT
Col19 = AHHHNO
Col20 = ACEEEPRT
Col21 = .AAFHN
Col22 = DFIINOP
Col23 = EFIORSZ
Col24 = BEFILRST
Col25 = ADEORSTXY
Col26 = !.ORT

*/

$Col01  = array("F", "H", "I", "N", "T");
$Col02  = array("E", "F", "I", "O", "S", "U", "Z");
$Col03  = array("B", "E", "H", "I", "N", "O", "U", "Y");
$Col04  = array("E", "F", "M", "N", "O", "R", "U");
$Col05  = array("D", "E", "L", "O", "P", "T");
$Col06  = array("A", "E", "H", "N", "T", "W", "Y");
$Col07  = array(",", "H", "I", "O", "R");
$Col08  = array("E", "F", "N", "R", "Y");
$Col09  = array("B", "E", "I", "L", "O", "R", "S");
$Col10  = array("E", "F", "I", "L", "U");
$Col11  = array("A", "D", "S", "T", "W");
$Col12  = array("'", "C", "E", "F", "N", "Y");
$Col13  = array("K", "N", "O", "S", "U", "V");
$Col14  = array("E", "J", "R", "T");
$Col15  = array(".", "G", "H", "M", "N", "O", "T", "W");
$Col16  = array("E", "H", "I", "O", "T", "Y");
$Col17  = array("!", "E", "I", "R");
$Col18  = array(".", "C", "E", "R", "T");
$Col19  = array("A", "H", "N", "O");
$Col20  = array("A", "C", "E", "P", "R", "T");
$Col21  = array(".", "A", "F", "H", "N");
$Col22  = array("D", "F", "I", "N", "O", "P");
$Col23  = array("E", "F", "I", "O", "R", "S", "Z");
$Col24  = array("B", "E", "F", "I", "L", "R", "S", "T");
$Col25  = array("A", "D", "E", "O", "R", "S", "T", "X", "Y");
$Col26  = array("!", ".", "O", "R", "T");


function Letters1($A1, $file)
{
   $fh = fopen($file, 'w') or die("can't open file");


   for ($i1=0; $i1< count($A1);  $i1++)
   {
      $Word=$A1[$i1];
      fwrite($fh, "[" . $Word . "]\n");
   }
   fclose($fh);
}

function Letters2($A1, $A2, $file)
{
   $fh = fopen($file, 'w') or die("can't open file");


   for ($i1=0; $i1< count($A1);  $i1++)
   for ($i2=0; $i2< count($A2);  $i2++)
   {
      $Word=$A1[$i1] . $A2[$i2];
      fwrite($fh, "[" . $Word . "]\n");
   }
   fclose($fh);
}

function Letters3($A1, $A2, $A3, $file)
{
   $fh = fopen($file, 'w') or die("can't open file");


   for ($i1=0; $i1< count($A1);  $i1++)
   for ($i2=0; $i2< count($A2);  $i2++)
   for ($i3=0; $i3< count($A3);  $i3++)
   {
      $Word=$A1[$i1] . $A2[$i2] . $A3[$i3];
      fwrite($fh, "[" . $Word . "]\n");
   }
   fclose($fh);
}

function Letters4($A1, $A2, $A3, $A4, $file)
{
   $fh = fopen($file, 'w') or die("can't open file");

   for ($i1=0; $i1< count($A1);  $i1++)
   for ($i2=0; $i2< count($A2);  $i2++)
   for ($i3=0; $i3< count($A3);  $i3++)
   for ($i4=0; $i4< count($A4);  $i4++)
   {
      $Word=$A1[$i1] . $A2[$i2] . $A3[$i3] . $A4[$i4];
      fwrite($fh, "[" . $Word . "]\n");
   }
   fclose($fh);
}

function Letters5($A1, $A2, $A3, $A4, $A5, $file)
{
   $fh = fopen($file, 'w') or die("can't open file");

   for ($i1=0; $i1< count($A1);  $i1++)
   for ($i2=0; $i2< count($A2);  $i2++)
   for ($i3=0; $i3< count($A3);  $i3++)
   for ($i4=0; $i4< count($A4);  $i4++)
   for ($i5=0; $i5< count($A5);  $i5++)
   {
      $Word=$A1[$i1] . $A2[$i2] . $A3[$i3] . $A4[$i4] . $A5[$i5];
      fwrite($fh, "[" . $Word . "]\n");
   }
   fclose($fh);
}

function Letters6($A1, $A2, $A3, $A4, $A5, $A6, $file)
{
   $fh = fopen($file, 'w') or die("can't open file");

   for ($i1=0; $i1< count($A1);  $i1++)
   for ($i2=0; $i2< count($A2);  $i2++)
   for ($i3=0; $i3< count($A3);  $i3++)
   for ($i4=0; $i4< count($A4);  $i4++)
   for ($i5=0; $i5< count($A5);  $i5++)
   for ($i6=0; $i6< count($A6);  $i6++)
   {
      $Word=$A1[$i1] . $A2[$i2] . $A3[$i3] . $A4[$i4] . $A5[$i5] . $A6[$i6];
      fwrite($fh, "[" . $Word . "]\n");
   }
   fclose($fh);
}

function Letters7($A1, $A2, $A3, $A4, $A5, $A6, $A7, $file)
{
   $fh = fopen($file, 'w') or die("can't open file");

   for ($i1=0; $i1< count($A1);  $i1++)
   for ($i2=0; $i2< count($A2);  $i2++)
   for ($i3=0; $i3< count($A3);  $i3++)
   for ($i4=0; $i4< count($A4);  $i4++)
   for ($i5=0; $i5< count($A5);  $i5++)
   for ($i6=0; $i6< count($A6);  $i6++)
   for ($i7=0; $i7< count($A7);  $i7++)
   {
      $Word=$A1[$i1] . $A2[$i2] . $A3[$i3] . $A4[$i4] . $A5[$i5] . $A6[$i6] . $A7[$i7];
      fwrite($fh, "[" . $Word . "]\n");
   }
   fclose($fh);
}

function Letters8($A1, $A2, $A3, $A4, $A5, $A6, $A7, $A8, $file)
{
   $fh = fopen($file, 'w') or die("can't open file");

   for ($i1=0; $i1< count($A1);  $i1++)
   for ($i2=0; $i2< count($A2);  $i2++)
   for ($i3=0; $i3< count($A3);  $i3++)
   for ($i4=0; $i4< count($A4);  $i4++)
   for ($i5=0; $i5< count($A5);  $i5++)
   for ($i6=0; $i6< count($A6);  $i6++)
   for ($i7=0; $i7< count($A7);  $i7++)
   for ($i8=0; $i8< count($A8);  $i8++)
   {
      $Word=$A1[$i1] . $A2[$i2] . $A3[$i3] . $A4[$i4] . $A5[$i5] . $A6[$i6] . $A7[$i7] . $A8[$i8] . " ";
      fwrite($fh, $Word);
   }
   fwrite($fh, "\n");
   fclose($fh);
}

function Letters9($A1, $A2, $A3, $A4, $A5, $A6, $A7, $A8, $A9, $file)
{
   $fh = fopen($file, 'w') or die("can't open file");
   fwrite($fh, "Word\n");

   for ($i1=0; $i1< count($A1);  $i1++)
   for ($i2=0; $i2< count($A2);  $i2++)
   for ($i3=0; $i3< count($A3);  $i3++)
   for ($i4=0; $i4< count($A4);  $i4++)
   for ($i5=0; $i5< count($A5);  $i5++)
   for ($i6=0; $i6< count($A6);  $i6++)
   for ($i7=0; $i7< count($A7);  $i7++)
   for ($i8=0; $i8< count($A8);  $i8++)
   for ($i9=0; $i9< count($A9);  $i9++)
   {
      $Word=$A1[$i1] . $A2[$i2] . $A3[$i3] . $A4[$i4] . $A5[$i5] . $A6[$i6] . $A7[$i7] . $A8[$i8] . $A9[$i9];
      fwrite($fh, "[" . $Word . "]\n");
   }
   fclose($fh);
}



/*
Letters3($Col01, $Col02, $Col03,                                 "SFA1_Col1to3.txt");
Letters4($Col01, $Col02, $Col03, $Col04,                         "SFA1_Col1to4.txt");
Letters5($Col01, $Col02, $Col03, $Col04, $Col05,                 "SFA1_Col1to5.txt");
Letters7($Col01, $Col02, $Col03, $Col04, $Col05, $Col06, $Col07, "SFA1_Col1to7.txt");

Letters3($Col01, $Col02, $Col03,                 "SFA1_Line1Word1.txt");
Letters3($Col05, $Col06, $Col07,                 "SFA1_Line1Word2.txt");
Letters5($Col09, $Col10, $Col11, $Col12, $Col13, "SFA1_Line1Word3.txt");
Letters3($Col15, $Col16, $Col17,                 "SFA1_Line1Word4.txt");
Letters4($Col19, $Col20, $Col21, $Col22,         "SFA1_Line1Word5.txt");
Letters3($Col24, $Col25, $Col26,                 "SFA1_Line1Word6.txt");

Letters4($Col01, $Col02, $Col03, $Col04,         "SFA1_Line3Word1.txt");
Letters5($Col06, $Col07, $Col08, $Col09, $Col10, "SFA1_Line3Word2.txt");
Letters5($Col12, $Col13, $Col14, $Col15, $Col16, "SFA1_Line3Word3.txt");
Letters4($Col18, $Col19, $Col20, $Col21,         "SFA1_Line3Word4.txt");
Letters4($Col23, $Col24, $Col25, $Col26,         "SFA1_Line3Word5.txt");

Letters9($Col02, $Col03, $Col04, $Col05, $Col06, $Col07, $Col08, $Col09, $Col10, "SFA1_Col2to10.txt");
Letters5($Col02, $Col03, $Col04, $Col05, $Col06, "SFA1_Col2to6.csv");
Letters4($Col02, $Col03, $Col04, $Col05, "SFA1_Col2to5.csv");
Letters4($Col03, $Col04, $Col05, $Col06, "SFA1_Col3to6.csv");
Letters3($Col05, $Col06, $Col07, "SFA1_Col5to7.csv");
Letters5($Col06, $Col07, $Col08, $Col09, $Col10, "SFA1_Col6to10.csv");
Letters4($Col06, $Col07, $Col08, $Col09, "SFA1_Col6to9.csv");
Letters3($Col07, $Col08, $Col09, "SFA1_Col7to9.csv");
Letters6($Col07, $Col08, $Col09,  $Col10,  $Col11,  $Col12, "SFA1_Col7to12.csv");
Letters9($Col11,  $Col12, $Col13,  $Col14, $Col15,  $Col16, $Col17,  $Col18, $Col19, "SFA1_Col11to19.csv");
Letters5($Col08, $Col09,  $Col10,  $Col11,  $Col12, "SFA1_Col8to12.csv");
Letters3($Col08, $Col09,  $Col10, "SFA1_Col8to10.csv");
Letters5($Col09,  $Col10,  $Col11,  $Col12, $Col13, "SFA1_Col9to13.csv");
Letters3($Col14, $Col15,  $Col16, "SFA1_Col14to16.csv");
Letters5($Col12, $Col13,  $Col14, $Col15,  $Col16, "SFA1_Col12to16.csv");
Letters5($Col11, $Col12, $Col13,  $Col14, $Col15,  "SFA1_Col11to15.csv");
Letters7($Col12, $Col13,  $Col14, $Col15,  $Col16, $Col17,  $Col18, "SFA1_Col12to18.csv");
Letters5($Col12, $Col13,  $Col14, $Col15,  $Col16, "SFA1_Col12to16.csv");
Letters7($Col20, $Col21,  $Col22, $Col23,  $Col24, $Col25,  $Col26, "SFA1_Col20to26.csv");
Letters3($Col15,  $Col16, $Col17, "SFA1_Col15to17.csv");
Letters6($Col15,  $Col16, $Col17,  $Col18,  $Col19,  $Col20, "SFA1_Col15to20.csv");
Letters2($Col17,  $Col18,  "SFA1_Col17to18.csv");
Letters3($Col18,  $Col19,  $Col20, "SFA1_Col18to20.csv");
Letters6($Col20, $Col21,  $Col22, $Col23,  $Col24, $Col25, "SFA1_Col20to25.csv");
Letters5($Col22, $Col23,  $Col24, $Col25, $Col26, "SFA1_Col22to26.csv");
Letters4($Col18, $Col19, $Col20, $Col21, "SFA1_Col18to21.csv");
Letters4($Col19, $Col20, $Col21, $Col22, "SFA1_Col19to22.csv");
Letters2($Col22, $Col23, "SFA1_Col22to23.csv");
Letters1($Col25,         "SFA1_Col25to25.csv");
Letters3($Col24, $Col25,  $Col26, "SFA1_Col24to26.csv");
Letters4($Col23, $Col24, $Col25,  $Col26, "SFA1_Col23to26.csv");
Letters3($Col23, $Col24, $Col25, "SFA1_Col23to25.csv");
*/

Letters3($Col20, $Col21, $Col22, "SFA1_Col20to22.csv");
Letters2($Col24, $Col25,         "SFA1_Col24to25.csv");

?>
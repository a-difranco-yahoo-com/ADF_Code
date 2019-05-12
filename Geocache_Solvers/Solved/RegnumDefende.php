<?php

/*
First   = RHYM
Second  = IME
Third   = CAE
Fourth  = TRA
Fifth   = SOV
Sixth   = IDE
Seventh = GROUND
Eigth   = TO

*/

$First   = array("R", "H", "Y", "M");
$Second  = array("I", "M", "E");
$Third   = array("C", "A", "E");
$Fourth  = array("T", "R", "A");
$Fifth   = array("S", "O", "V");
$Sixth   = array("I", "D", "E");
$Seventh = array("G", "R", "O", "U", "N", "D");
$Eigth   = array("T", "O");

for ($A1=0; $A1< count($First);   $A1++)
for ($A2=0; $A2< count($Second);  $A2++)
for ($A3=0; $A3< count($Third);   $A3++)
for ($A4=0; $A4< count($Fourth);  $A4++)
for ($A5=0; $A5< count($Fifth);   $A5++)
for ($A6=0; $A6< count($Sixth);   $A6++)
for ($A7=0; $A7< count($Seventh); $A7++)
for ($A8=0; $A8< count($Eigth);   $A8++)
{
 $Word=$First[$A1] . $Second[$A2] . $Third[$A3] . $Fourth[$A4] . $Fifth[$A5] . $Sixth[$A6] . $Seventh[$A7] . $Eigth[$A8] . " ";
 echo($Word);
}
echo(" \n");

?>
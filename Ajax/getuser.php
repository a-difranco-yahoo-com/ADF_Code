<?php
$q=$_GET["q"];

$Con = oci_connect("adf","adf","");

if (!$con)
{
    $e = oci_error();
    trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
}


echo "<table border='1'>
<tr>
<th>Firstname</th>
<th>Lastname</th>
<th>Age</th>
<th>Hometown</th>
<th>City</th>
</tr>";

  $sql = ociparse($Conn,"SELECT * FROM customer Where id = $q"); 
  ociexecute($sql,OCI_DEFAULT);
  while (ocifetch($sql))
  {
     echo "<tr>";
     echo "<td>" . ociresult($sql,"FIRSTNAME") . "</td>";
     echo "<td>" . ociresult($sql,"LASTNAME")  . "</td>";
     echo "<td>" . ociresult($sql,"AGE")       . "</td>";
     echo "<td>" . ociresult($sql,"ADDRESS")   . "</td>";
     echo "<td>" . ociresult($sql,"CITY")      . "</td>";
     echo "</tr>";
  }
echo "</table>";

oci_free_statement($sql); 

?> 
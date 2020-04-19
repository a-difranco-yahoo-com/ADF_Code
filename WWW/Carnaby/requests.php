<?php
require_once("HTTP.php");
require_once("D:\Php_Code\Smarty\libs\Smarty.class.php");

$err=error_reporting(E_ALL & ~E_NOTICE);

class Data {
var $from;
var $to;
var $type;
}

$login = array('Carnaby', 'Carnaby', '');
$conn = ocilogon($login[0], $login[1], $login[2]) or die("Problem with connection to database");

$data       = new Data;
$data->from = $_POST['calendarDate1'];
$data->to   = $_POST['calendarDate2'];
$data->type = ($_POST['type']) ? $_POST['type'] : "inv_req";
$smarty     = new Smarty;
$smarty->assignByRef('data',$data);

switch ($_POST['type']) {
case "inv_req":
	$sql = " SELECT DISTINCT C.Person_Id, "
	     . "        C.Title || ' ' || C.First_Name || ' ' || C.Last_Name INVESTOR_NAME, "
         . "        C.Address_1, C.Address_2, C.Address_3, C.Address_4, C.Address_5, C.Address_6, "
		 . "        C.Country,   C.Postcode,   C.Item_Code "
		 . " FROM   CONTACT      C "
         . " WHERE  C.Site_Source  = 'Investor Request' "
	     . " AND    C.Date_Requested BETWEEN "
	     . "           to_date('".$data->from . " 00:00:00','DD-MM-YY HH24:MI:SS') "
	     . "      AND  to_date('".$data->to   . " 23:59:59','DD-MM-YY HH24:MI:SS') ";

	$stmt = ociparse($conn,$sql);
	ociexecute($stmt);
	$oldid = -1;
	$row_no = 0;
	while (ocifetchinto($stmt, $row, OCI_RETURN_NULLS + OCI_ASSOC))
	{
		$id = array_shift($row);
		if ($id == $oldid) {
			$rows[$row_no-1]['ITEM_CODE'].="; ".$row['ITEM_CODE'];
		} else {
			$oldid=$id;
			$rows[]=$row;
			$row_no++;
		}
	}
	$show=array('INVESTOR_NAME','ADDRESS_1','COUNTRY','POSTCODE','ITEM_CODE');
	break;
	
case "enq_req":
	$sql = " SELECT DISTINCT C.Person_Id, "
	     . "        C.Title || ' ' || C.First_Name || ' ' || C.Last_Name INVESTOR_NAME, "
         . "        C.Address_1, C.Address_2, C.Address_3, C.Address_4, C.Address_5, C.Address_6, "
		 . "        C.Country,   C.Postcode,   C.Item_Code "
		 . " FROM   CONTACT      C "
         . " WHERE  C.Site_Source  = 'Enquirer Request' "
	     . " AND    C.Date_Requested BETWEEN "
	     . "           to_date('".$data->from . " 00:00:00','DD-MM-YY HH24:MI:SS') "
	     . "      AND  to_date('".$data->to   . " 23:59:59','DD-MM-YY HH24:MI:SS') ";

	$stmt = ociparse($conn,$sql);
	ociexecute($stmt);
	$oldid = -1;
	$row_no = 0;
	while (ocifetchinto($stmt, $row, OCI_RETURN_NULLS + OCI_ASSOC))
	{
		$id = array_shift($row);
		if ($id == $oldid) {
			$rows[$row_no-1]['ITEM_CODE'].="; ".$row['ITEM_CODE'];
		} else {
			$oldid=$id;
			$rows[]=$row;
			$row_no++;
		}
	}
	$show=array('TITLE','FIRST_NAME','LAST_NAME','ADDRESS_1','COUNTRY','POSTCODE','ITEM_CODE');
	break;
	
case "med_req":
	$sql = " SELECT DISTINCT C.Person_Id, "
	     . "        C.Title || ' ' || C.First_Name || ' ' || C.Last_Name INVESTOR_NAME, "
         . "        C.Address_1, C.Address_2, C.Address_3, C.Address_4, C.Address_5, C.Address_6, "
		 . "        C.Country,   C.Postcode,   C.Item_Code "
		 . " FROM   CONTACT      C "
         . " WHERE  C.Site_Source  = 'Media Request' "
	     . " AND    C.Date_Requested BETWEEN "
	     . "           to_date('".$data->from . " 00:00:00','DD-MM-YY HH24:MI:SS') "
	     . "      AND  to_date('".$data->to   . " 23:59:59','DD-MM-YY HH24:MI:SS') ";

	//echo $sql;
	$stmt = ociparse($conn,$sql);
	ociexecute($stmt);
	$oldid = -1;
	$row_no = 0;
	while (ocifetchinto($stmt, $row, OCI_RETURN_NULLS + OCI_ASSOC))
	{
		$id = array_shift($row);
		if ($id == $oldid) {
			$rows[$row_no-1]['ITEM_CODE'].="; ".$row['ITEM_CODE'];
		} else {
			$oldid=$id;
			$rows[]=$row;
			$row_no++;
		}
	}
	$show=array('TITLE','FIRST_NAME','LAST_NAME','ADDRESS_1','COUNTRY','POSTCODE','ITEM_CODE');
	break;
case "inv_ch":
	$sql = " SELECT DISTINCT C.Person_Id, "
	     . "        C.Title || ' ' || C.First_Name || ' ' || C.Last_Name INVESTOR_NAME, "
         . "        C.Address_1, C.Address_2, C.Address_3, C.Address_4, C.Address_5, C.Address_6, "
		 . "        C.Country,   C.Postcode,   C.Item_Code "
		 . " FROM   CONTACT      C "
         . " WHERE  C.Site_Source  = 'Investor Channel' "
	     . " AND    C.Date_Requested BETWEEN "
	     . "           to_date('".$data->from . " 00:00:00','DD-MM-YY HH24:MI:SS') "
	     . "      AND  to_date('".$data->to   . " 23:59:59','DD-MM-YY HH24:MI:SS') ";

	$stmt = ociparse($conn,$sql);
	ociexecute($stmt);
	$oldid = -1;
	$row_no = 0;
	while (ocifetchinto($stmt, $row, OCI_RETURN_NULLS + OCI_ASSOC))
	{
		$id = array_shift($row);
		if ($id == $oldid) {
			$rows[$row_no-1]['ITEM_CODE'].="; ".$row['ITEM_CODE'];
		} else {
			$oldid=$id;
			$rows[]=$row;
			$row_no++;
		}
	}
	$show=array('TITLE','FIRST_NAME','LAST_NAME','ADDRESS_1','COUNTRY','POSTCODE','ITEM_CODE');
	break;
default:
	$data->from = date('d-m-Y',time()-7*24*3600); //week ago
	$data->to = date('d-m-Y');
	break;
}

if ($_POST['enter']=='File') {
	//header('Content-Type: text/csv; charset=ISO-8859-1');
	header('Content-Type: application/vnd.ms-excel');
	header('Content-Disposition: attachment; filename="carnaby.csv"');
	if ($rows && sizeof($rows)) {
		echo join(',',array_keys($rows[0])) . "\n";
		foreach ($rows as $i=>$row) {
			echo join(',',$row);
			echo "\n";
		}
	}
	exit;
}

if ($rows) {
	$data->header = $show;
	foreach ($rows as $i=>$row)
		foreach ($show as $j=>$col) {
			$data->table[$i][]=$row[$col];
		}
	foreach ($data->table as $i=>$row)
		foreach ($row as $j=>$rec)
			if (!$rec)
				$data->table[$i][$j]="&nbsp;";
}
ocilogoff($conn);
$smarty->display('requests.tpl');

?>

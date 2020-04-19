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
	$sql = " SELECT DISTINCT i.Person_Id, "
	     . "        I.Title || ' ' || I.First_Name || ' ' || I.Last_Name INVESTOR_NAME, "
         . "        I.Address_1, I.Address_2, I.Address_3, I.Address_4, I.Address_5, I.Address_6, "
		 . "        I.Country,   I.Postcode,   R.Item_Code "
		 . " FROM   WEB_INVESTOR I "
         . "   JOIN WEB_REQUEST  R ON R.Investor_Id = I.Person_Id "
	     . " WHERE   R.Date_Requested BETWEEN "
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
	$sql = " SELECT E.*, NULL \"ITEM_CODE\" "
  	     . " FROM   WEB_ENQUIRER E "
         . " WHERE  nvl(lower(Site_Source),'x') != 'carnabymedia_subscribe' "
	     . " AND    E.Registered_On BETWEEN "
	     . "        to_date('" . $data->from . " 00:00:00','DD-MM-YY HH24:MI:SS') "
	     . " AND    to_date('" . $data->to   . " 23:59:59','DD-MM-YY HH24:MI:SS') ";


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
	$sql = " SELECT E.*, NULL \"ITEM_CODE\" "
	     . " FROM   WEB_ENQUIRER E "
	     . " WHERE  nvl(Site_Source,'x') = 'CarnabyMedia_subscribe' "
	     . " AND    E.Registered_On Between "
         . "        to_date('" . $data->from . " 00:00:00','DD-MM-YY HH24:MI:SS') "
         . " AND    to_date('" . $data->to   . " 23:59:59','DD-MM-YY HH24:MI:SS') ";

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
	$show=array('TITLE','FIRST_NAME','LAST_NAME','ADDRESS_1','COUNTRY','POSTCODE','PREF_DVD');
	break;
case "inv_ch":
	$sql = " SELECT I.Title || ' ' || I.First_Name || ' ' || I.Last_Name INVESTOR_NAME, H.* "
	     . " FROM   WEB_INVESTOR I"
		 . "   JOIN WEB_INVESTOR_HISTORY H ON H.Person_Id = H.Person_Id "
	     . " WHERE  H.Change_DT BETWEEN "
	     . "        to_date('" . $data->from . " 00:00:00','DD-MM-YY HH24:MI:SS') "
	     . "   AND  to_date('" . $data->to   . " 23:59:59','DD-MM-YY HH24:MI:SS') ";

	$stmt = ociparse($conn,$sql);
	ociexecute($stmt);
	while (ocifetchinto($stmt, $row, OCI_RETURN_NULLS + OCI_ASSOC)) {
		$rows[]=$row;
	}
	$show=array('CHANGE_DT','INVESTOR_NAME');
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

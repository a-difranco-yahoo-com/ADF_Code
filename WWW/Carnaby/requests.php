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

function List_Investors($conn, $data, $SiteSource)
{
	$sql = " SELECT C.Title, C.First_Name, C.Last_Name, C.Address_1, C.Country, C.Postcode, C.Item_Code "
		 . " FROM   CONTACT      C "
         . " WHERE  C.Site_Source  = '" . $SiteSource . "' "
	     . " AND    trunc(C.Date_Requested) BETWEEN "
	     . "        trunc( to_date('" . $data->from . "', 'DD-MM-YY') "
	     . "    AND trunc( to_date('" . $data->to   . "', 'DD-MM-YY') ";

	$stmt = ociparse($conn, $sql);
	ociexecute($stmt);
	oci_fetch_all($stmt, $rows, 0, 500, OCI_FETCHSTATEMENT_BY_ROW + OCI_RETURN_NULLS + OCI_NUM);
	return $rows;
}

switch ($_POST['type']) {
case "inv_req":
    $rows = List_Investors($conn, $data, 'Investor Request');
	break;	
case "enq_req":
    $rows = List_Investors($conn, $data, 'Enquirer Request');
	break;	
case "med_req":
    $rows = List_Investors($conn, $data, 'Media Request');
	break;
case "inv_ch":
    $rows = List_Investors($conn, $data, 'Investor Channel');
	break;
default:
	$data->from = date('d-m-Y',time()-7*24*3600); //week ago
	$data->to = date('d-m-Y');
	break;
}

if ($_POST['enter']=='File') {
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
	$data->header = array('TITLE','FIRST_NAME','LAST_NAME','ADDRESS_1','COUNTRY','POSTCODE','ITEM_CODE');
	$data->table  = $rows;
}
ocilogoff($conn);
$smarty = new Smarty;
$smarty->assign('data', $data);
$smarty->display('requests.tpl');

?>

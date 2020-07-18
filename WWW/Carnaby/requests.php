<?php
require_once("HTTP.php");
require_once("D:\Php_Code\Smarty\libs\Smarty.class.php");
include 'Comic_Oracle.php';
include 'Comic_Data.php';

$err=error_reporting(E_ALL & ~E_NOTICE);
$Connection = new Comic_Oracle("CARNABY");
$data       = new Comic_Data($_POST['calendarDate1'],  $_POST['calendarDate2'], $_POST['type']);

if ($data->Get_Investor_Type == 'Not Set') {
	$data->Set_Default_Dates();
} else {
	$rows = $Connection->Get_Investors($data);
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

$smarty = new Smarty;
$smarty->assign('data', $data);
$smarty->display('requests.tpl');

?>

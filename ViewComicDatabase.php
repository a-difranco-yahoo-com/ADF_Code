<?php
require_once("HTTP.php");
require_once("D:\Php_Code\Smarty\libs\Smarty.class.php");
include 'Comic_Oracle.php';

$err=error_reporting(E_ALL & ~E_NOTICE);
$Connection = new Comic_Oracle();
$Option     =$_POST['Option'];
$smarty     = new Smarty;

$Connection->Log_Post_Details('POST', $_POST);
$Connection->Log_Post_Details('GET',  $_GET);

  if ($Option == '')  $Option = 'ViewGaps';

  if ($Option == 'ViewGaps')  {
	$gaps = $Connection->Get_Run_Gaps();
    $smarty->assign('gaps', $gaps);
    $smarty->display('ViewGaps.tpl');
  }

?>


<?php
require_once("HTTP.php");
require_once("D:\Php_Code\Smarty\libs\Smarty.class.php");
include 'Comic_Oracle.php';

$err=error_reporting(E_ALL & ~E_NOTICE);
$Connection = new Comic_Oracle();
$Option     =$_POST['Option'];
$Search     =$_POST['Search'];
$Commit     =$_POST['Commit'];
$smarty     = new Smarty;

$Connection->Log_Post_Details('POST', $_POST);
$Connection->Log_Post_Details('GET',  $_GET);

  if ($Commit == 'AddWishList')  {
	  $Connection->Add_Wish_List($_POST);
    $Option = 'ViewGaps';
  }

  if ($Option == '')  $Option = 'ViewGaps';

  if ($Option == 'ViewGaps')  {
	  $gaps = $Connection->Get_Run_Gaps();
    $smarty->assign('gaps', $gaps);
    $smarty->display('ViewGaps.tpl');
  } elseif ($Option == 'ViewRuns')  {
	  $runs = $Connection->Get_Run_Details($Search);
	  $wish = $Connection->Get_Wish_Details($Search);
    $smarty->assign('runs', $runs);
    $smarty->assign('wish', $wish);
    $smarty->display('ViewRuns.tpl');
  }

?>


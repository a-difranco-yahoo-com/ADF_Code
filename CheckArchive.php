<?php
require_once("HTTP.php");
require_once("D:\Php_Code\Smarty\libs\Smarty.class.php");
include 'Comic_Oracle.php';

$err=error_reporting(E_ALL & ~E_NOTICE);
$Connection  = new Comic_Oracle();
$Option      =$_POST['Option'];
$SearchTitle =$_POST['SearchTitle'];
$SearchYear  =$_POST['SearchYear'];
$Commit      =$_POST['Commit'];
$Detail      =$_POST['ViewArchiveDetail'];
$smarty      = new Smarty;

$Connection->Log_Post_Details('POST', $_POST);
$Connection->Log_Post_Details('GET',  $_GET);

  if ($Detail != "") {
    $SearchTitle = $Detail;
    $SearchYear  = 0;
    $Option      = "ViewDetails";
  } elseif ($Option == '') {
    $Option = 'ViewSummary';
  }

  if ($Option == 'ViewSummary')  {
  	  $summary = $Connection->Get_Archive_Difference_Summary();
      $smarty->assign('summary', $summary);
      $smarty->display('ViewArchiveDifferenceSummary.tpl');
  } elseif ($Option == 'ViewDetails')  {
	    $detail = $Connection->Get_Archive_Detail($SearchTitle, $SearchYear);
      $smarty->assign('title',  $SearchTitle);
      $smarty->assign('year',   $SearchYear);
      $smarty->assign('detail', $detail);
      $smarty->display('ViewArchiveDetail.tpl');
  }

?>



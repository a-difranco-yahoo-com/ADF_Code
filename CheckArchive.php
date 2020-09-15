<?php
require_once("HTTP.php");
require_once("D:\Php_Code\Smarty\libs\Smarty.class.php");
include 'Comic_Oracle.php';

$err=error_reporting(E_ALL & ~E_NOTICE);
$Connection     = new Comic_Oracle();
$Option         =$_POST['Option'];
$SearchTitle    =$_POST['SearchTitle'];
$SearchStartYear=$_POST['SearchStartYear'];
$SearchEndYear  =$_POST['SearchEndYear'];
$Detail         =$_POST['ViewArchiveDetail'];
$DeleteTitle    =$_POST['TitleToDelete'];
$smarty         = new Smarty;

$Connection->Log_Post_Details('POST', $_POST);
$Connection->Log_Post_Details('GET',  $_GET);

  if ($DeleteTitle != "" ) {
    $Connection->Delete_Title($DeleteTitle);
    $Option = "ViewDetails";
  } elseif ($Detail != "" ) {
    $SearchTitle    = $Detail;
    $SearchStartYear= 1960;
    $SearchEndYear  = 2100;
    $Option      = "ViewDetails";
  } elseif ($Option == '') {
    $Option = 'ViewSummary';
  }

  if ($Option == 'ViewSummary')  {
  	  $summary = $Connection->Get_Archive_Difference_Summary();
      $smarty->assign('summary', $summary);
      $smarty->display('ViewArchiveDifferenceSummary.tpl');
  } elseif ($Option == 'ViewDetails')  {
	    $detail = $Connection->Get_Archive_Detail($SearchTitle, $SearchStartYear, $SearchEndYear);
      $smarty->assign('title',     $SearchTitle);
      $smarty->assign('startYear', $SearchStartYear);
      $smarty->assign('endYear',   $SearchEndYear);
      $smarty->assign('detail',    $detail);
      $smarty->display('ViewArchiveDetail.tpl');
  }

?>



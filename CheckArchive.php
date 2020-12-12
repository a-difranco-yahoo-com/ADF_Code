<?php
require_once("HTTP.php");
require_once("D:\Php_Code\Smarty\libs\Smarty.class.php");
include 'CheckArchive_Oracle.php';
include 'CheckArchive_Data.php';

$err=error_reporting(E_ALL & ~E_NOTICE);
$Connection = new CheckArchive_Oracle();
$Data       = new CheckArchive_Data();
$smarty     = new Smarty;

$Data->Set_Data($_POST);
$Connection->Log_Post_Details('POST', $_POST);
$Connection->Log_Post_Details('GET',  $_GET);


  if ( $Data->TitleToDelete != "" ) {
    $Connection->Delete_Title($Data->TitleToDelete);
    $Data->Option = "ViewDetails";
  }

  if ($Data->Option == 'ViewSummary')  {
      $smarty->assign('summary', $Connection->Get_Archive_Difference_Summary() );
      $smarty->display('ViewArchiveDifferenceSummary.tpl');
  } elseif ($Data->Option == 'ViewDetails')  {
      $smarty->assign('title',     $Data->SearchTitle);
      $smarty->assign('startYear', $Data->SearchStartYear);
      $smarty->assign('endYear',   $Data->SearchEndYear);
      $smarty->assign('detail',    $Connection->Get_Archive_Detail($Data->SearchTitle, $Data->SearchStartYear, $Data->SearchEndYear) );
      $smarty->display('ViewArchiveDetail.tpl');
  }

?>



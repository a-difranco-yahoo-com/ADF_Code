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


  switch ($Data->Action) {
  case "TitleToDelete" : $Connection->Delete_Title($Data->TitleId);
    break;
  }

  switch ($Data->Display) {
  case "ViewSummary" :
    $smarty->assign('summary', $Connection->Get_Archive_Difference_Summary() );
    $smarty->display('ViewArchiveDifferenceSummary.tpl');
    break;
  case "ViewDetails" :
    $smarty->assign('search',     $Data->Search);
    $smarty->assign('detail',    $Connection->Get_Archive_Detail($Data->Search) );
    $smarty->display('ViewArchiveDetail.tpl');
    break;
  }

?>



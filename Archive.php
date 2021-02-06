<?php
require_once("HTTP.php");
require_once("C:\My_Software\Smarty\libs\Smarty.class.php");
include 'Archive_Oracle.php';
include 'Archive_Data.php';

$err=error_reporting(E_ALL & ~E_NOTICE);
$Connection = new Archive_Oracle();
$Data       = new Archive_Data();
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
    $smarty->display('Archive_Summary.tpl');
    break;
  case "ViewDetails" :
    $smarty->assign('search',     $Data->Search);
    $smarty->assign('detail',    $Connection->Get_Archive_Detail($Data->Search) );
    $smarty->display('Archive_Detail.tpl');
    break;
  }

?>



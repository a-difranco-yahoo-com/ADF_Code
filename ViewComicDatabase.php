<?php
require_once("HTTP.php");
require_once("D:\Php_Code\Smarty\libs\Smarty.class.php");
include 'ViewComicDatabase_Oracle.php';
include 'ViewComicDatabase_Data.php';

$err=error_reporting(E_ALL & ~E_NOTICE);
$Connection  = new ViewComicDatabase_Oracle();
$Data        = new ViewComicDatabase_Data();
$smarty      = new Smarty;

$Data->Set_Data($_POST);
$Connection->Log_Post_Details('POST', $_POST);
$Connection->Log_Post_Details('GET',  $_GET);

  switch ($Data->Action) {
  case "AddWishList" : $Connection->Add_Wish_List($Data->TitleId);
    break;
  case "TitleToDelete" : $Connection->Delete_Title($Data->TitleId);
    break;
  case "AddSeriesRun" : $Connection->Add_Series_Run($Data->ComicDBTitleId, $Data->DigitalTitleId);
    break;
  case "AddCompleteRun" : $Connection->Add_Complete_Run($Data->TitleId, $Data->StartIssue, $Data->EndIssue);
    break;
  }

  switch ($Data->Display) {
  case 'ViewGaps' :
    $smarty->assign('gaps', $Connection->Get_Run_Gaps() );
    $smarty->display('ViewGaps.tpl');
    break;
  case 'ViewSplits' :
    $smarty->assign('split', $Connection->Get_Run_Splits() );
    $smarty->display('ViewSplits.tpl');
    break;
  case 'ViewDiffs' :
    $smarty->assign('diff', $Connection->Get_Run_Diffs() );
    $smarty->display('ViewDiffs.tpl');
    break;
  case 'ViewRuns' :
    $smarty->assign('title', $Data->Search);
    $smarty->assign('runs', $Connection->Get_Run_Details($Data->Search) );
    $smarty->assign('wish', $Connection->Get_Wish_Details($Data->Search) );
    $smarty->display('ViewRuns.tpl');
    break;
  }

?>


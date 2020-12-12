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

  if ( $Data->AddWishList != "" )  {
	  $Connection->Add_Wish_List($Data->AddWishList);
    $Data->Option = 'ViewGaps';
  } elseif ($Data->TitleToDelete != "") {
    $Connection->Delete_Title($Data->TitleToDelete);
    $Data->Option = "ViewSplits";
  } elseif ( $Data->AddSeriesRun != "")  {
	  $Connection->Add_Series_Run($this->ComicDBTitleId, $this->DigitalTitleId);
  } elseif ( $Data->AddCompleteRun != "")  {
	  $Connection->Add_Complete_Run($Data->TitleId, $Data->StartIssue, $Data->EndIssue);
    $Data->Option = $Data->Origin;
  }

  if ($Data->Option == 'ViewGaps')  {
    $smarty->assign('gaps', $Connection->Get_Run_Gaps() );
    $smarty->display('ViewGaps.tpl');
  } elseif ($Data->Option == 'ViewSplits')  {
    $smarty->assign('split', $Connection->Get_Run_Splits() );
    $smarty->display('ViewSplits.tpl');
  } elseif ($Data->Option == 'ViewDiffs')  {
    $smarty->assign('diff', $Connection->Get_Run_Diffs() );
    $smarty->display('ViewDiffs.tpl');
  } elseif ($Data->Option == 'ViewRuns')  {
    $smarty->assign('title', $Data->Search);
    $smarty->assign('runs', $Connection->Get_Run_Details($Data->Search) );
    $smarty->assign('wish', $Connection->Get_Wish_Details($Data->Search) );
    $smarty->display('ViewRuns.tpl');
  }

?>


<?php
require_once("HTTP.php");
require_once("D:\Php_Code\Smarty\libs\Smarty.class.php");
include 'Comic_Oracle.php';

$err=error_reporting(E_ALL & ~E_NOTICE);
$Connection  = new Comic_Oracle();
$Option      =$_POST['Option'];
$Origin      =$_POST['Origin'];
$Search      =$_POST['Search'];
$WishList    =$_POST['AddWishList'];
$AddSeries   =$_POST['AddSeriesRun'];
$AddComplete =$_POST['AddCompleteRun'];
$DeleteTitle =$_POST['TitleToDelete'];
$smarty      = new Smarty;

$Connection->Log_Post_Details('POST', $_POST);
$Connection->Log_Post_Details('GET',  $_GET);

  if ($WishList != '')  {
	  $Connection->Add_Wish_List($WishList);
    $Option = 'ViewGaps';
  } elseif ($DeleteTitle != "" ) {
    $Connection->Delete_Title($DeleteTitle);
    $Option = "ViewSplits";
  } elseif ($AddSeries != '')  {
    $Titles = explode(",", $AddSeries);
    $ComicDBTitleId = $Titles[0];
    $DigitalTitleId = $Titles[1];
	  $Connection->Add_Series_Run($ComicDBTitleId, $DigitalTitleId);
  } elseif ($AddComplete != '')  {
    $Details = explode(",", $AddComplete);
    $TitleId    = $Details[0];
    $StartIssue = $Details[1];
    $EndIssue   = $Details[2];
	  $Connection->Add_Complete_Run($TitleId, $StartIssue, $EndIssue);
    $Option = $Origin;
  }

  if ($Option == '')  $Option = 'ViewGaps';

  if ($Option == 'ViewGaps')  {
    $smarty->assign('gaps', $Connection->Get_Run_Gaps() );
    $smarty->display('ViewGaps.tpl');
  } elseif ($Option == 'ViewSplits')  {
    $smarty->assign('split', $Connection->Get_Run_Splits() );
    $smarty->display('ViewSplits.tpl');
  } elseif ($Option == 'ViewDiffs')  {
    $smarty->assign('diff', $Connection->Get_Run_Diffs() );
    $smarty->display('ViewDiffs.tpl');
  } elseif ($Option == 'ViewRuns')  {
    $smarty->assign('title', $Search);
    $smarty->assign('runs', $Connection->Get_Run_Details($Search) );
    $smarty->assign('wish', $Connection->Get_Wish_Details($Search) );
    $smarty->display('ViewRuns.tpl');
  }

?>


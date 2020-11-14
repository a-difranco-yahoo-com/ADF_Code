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
$smarty      = new Smarty;

$Connection->Log_Post_Details('POST', $_POST);
$Connection->Log_Post_Details('GET',  $_GET);

  if ($WishList != '')  {
	  $Connection->Add_Wish_List($WishList);
    $Option = 'ViewGaps';
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
	  $gaps = $Connection->Get_Run_Gaps();
    $smarty->assign('gaps', $gaps);
    $smarty->display('ViewGaps.tpl');
  } elseif ($Option == 'ViewSplits')  {
	  $split  = $Connection->Get_Run_Splits();
    $smarty->assign('split', $split);
    $smarty->display('ViewSplits.tpl');
  } elseif ($Option == 'ViewDiffs')  {
	  $diff  = $Connection->Get_Run_Diffs();
    $smarty->assign('diff', $diff);
    $smarty->display('ViewDiffs.tpl');
  } elseif ($Option == 'ViewRuns')  {
	  $runs = $Connection->Get_Run_Details($Search);
	  $wish = $Connection->Get_Wish_Details($Search);
    $smarty->assign('title', $Search);
    $smarty->assign('runs', $runs);
    $smarty->assign('wish', $wish);
    $smarty->display('ViewRuns.tpl');
  }

?>


<?php
require_once("HTTP.php");
require_once("D:\Php_Code\Smarty\libs\Smarty.class.php");
include 'Comic_Oracle.php';

$err=error_reporting(E_ALL & ~E_NOTICE);
$Connection  = new Comic_Oracle();
$smarty      = new Smarty;

$Connection->Log_Post_Details('POST', $_POST);
$Connection->Log_Post_Details('GET',  $_GET);

$Option = '';
$Search = '';
if ( isset($_POST['Option']) ) $Option = $_POST['Option'];
if ( isset($_POST['Search']) ) $Search = $_POST['Search'];

  if (  isset($_POST['AddWishList']) )  {
	  $Connection->Add_Wish_List($_POST['AddWishList']);
    $Option = 'ViewGaps';
  } elseif ( isset($_POST['TitleToDelete']) ) {
    $Connection->Delete_Title($_POST['TitleToDelete']);
    $Option = "ViewSplits";
  } elseif ( isset($_POST['AddSeriesRun']) )  {
    $Titles = explode(",", $_POST['AddSeriesRun']);
    $ComicDBTitleId = $Titles[0];
    $DigitalTitleId = $Titles[1];
	  $Connection->Add_Series_Run($ComicDBTitleId, $DigitalTitleId);
  } elseif ( isset($_POST['AddCompleteRun']) )  {
    $Details = explode(",", $_POST['AddCompleteRun']);
    $TitleId    = $Details[0];
    $StartIssue = $Details[1];
    $EndIssue   = $Details[2];
	  $Connection->Add_Complete_Run($TitleId, $StartIssue, $EndIssue);
    $Option = $_POST['Origin'];
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


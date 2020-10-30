<?php
require_once("HTTP.php");
require_once("D:\Php_Code\Smarty\libs\Smarty.class.php");
include 'Comic_Oracle.php';
include 'Comic_Data.php';

$err=error_reporting(E_ALL & ~E_NOTICE);
$Connection     = new Comic_Oracle();
$Data           = new Comic_Data();
$smarty         = new Smarty;

$Data->Set_MatchComicDB($_POST);
$Connection->Log_Post_Details('POST', $_POST);
$Connection->Log_Post_Details('GET',  $_GET);

  if ($Data->Compare != "") {
    $Data->Search["Title"]    = $Data->Compare;
    $Data->Search["StartYear"] = 1960;
    $Data->Search["EndYear"]  = 2012;
    $Data->Option         = "CompareComicDB";
  } elseif ($Data->DBMatch != '') {
    $Connection->Match_To_ComicDB($Data->DBMatch);
    $Data->Option = 'CompareComicDB';
  } elseif ($Data->TradeId != '') {
    $Data->Option = 'SplitTrade';
  } elseif ($Data->SplitIssue != '') {
    $Data->SplitTrade($Connection);
    $Data->Option = "CompareComicDB";
  } elseif ($Data->Option == '') {
    $Data->Option = 'ViewSummary';
  }

  if ($Data->Option == 'ViewSummary')  {
	  $summary = $Connection->Get_ComicDB_Summary();
    $smarty->assign('summary', $summary);
    $smarty->display('ViewComicDBSummary.tpl');
  } elseif ($Data->Option == 'SplitTrade')  {
	  $trades  = $Connection->Get_ComicDB_Trades($Data->TradeId);
    $smarty->assign('search',     $Data->Search);
    $smarty->assign('trades',     $trades);
    $smarty->display('SplitTrade.tpl');
  } elseif ($Data->Option == 'CompareComicDB')  {
    $Connection->Match_ComicDB($Data->Search);
	  $runs  = $Connection->Get_ComicDB_Compare($Data->Search);
    $match = $Connection->Get_Match_ComicDB();
    $smarty->assign('search',    $Data->Search);
    $smarty->assign('runs',      $runs);
    $smarty->assign('match',     $match);
    $smarty->display('CompareComicDB.tpl');
  }

?>
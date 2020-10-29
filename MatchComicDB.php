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
    $Data->SearchTitle    = $Data->Compare;
    $Data->SearchStartYear= 1960;
    $Data->SearchEndYear  = 2012;
    $Data->Option         = "CompareComicDB";
  } elseif ($Data->DBMatch != '') {
    $Connection->Match_To_ComicDB($Data->DBMatch);
    $Data->Option = 'CompareComicDB';
  } elseif ($Data->TradeId != '') {
    $Data->Option = 'SplitTrade';
  } elseif ($Data->SplitIssue != '') {
    $Data->Option = 'SplitIssue';
  } elseif ($Data->Option == '') {
    $Data->Option = 'ViewSummary';
  }

  if ($Data->Option == 'ViewSummary')  {
	  $summary = $Connection->Get_ComicDB_Summary();
    $smarty->assign('summary', $summary);
    $smarty->display('ViewComicDBSummary.tpl');
  } elseif ($Data->Option == 'SplitTrade')  {
	  $trades  = $Connection->Get_ComicDB_Trades($Data->TradeId);
    $smarty->assign('trades',     $trades);
    $smarty->display('SplitTrade.tpl');
  } elseif ($Data->Option == 'SplitIssue')  {
    $smarty->assign('startissue', $Data->Get_StartIssue() );
    $smarty->assign('endissue',   $Data->Get_EndIssue() );
    $smarty->assign('rowid',      $Data->Get_RowId() );
    $smarty->display('SplitIssue.tpl');
  } elseif ($Data->Option == 'CompareComicDB')  {
    $Connection->Match_ComicDB($Data->SearchTitle, $Data->SearchStartYear, $Data->SearchEndYear);
	  $runs  = $Connection->Get_ComicDB_Compare($Data->SearchTitle, $Data->SearchStartYear, $Data->SearchEndYear);
	  $match = $Connection->Get_Match_ComicDB();
    $smarty->assign('title',     $Data->SearchTitle);
    $smarty->assign('startYear', $Data->SearchStartYear);
    $smarty->assign('endYear',   $Data->SearchEndYear);
    $smarty->assign('runs',      $runs);
    $smarty->assign('match',     $match);
    $smarty->display('CompareComicDB.tpl');
  }

?>
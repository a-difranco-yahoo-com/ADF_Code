<?php
require_once("HTTP.php");
require_once("D:\Php_Code\Smarty\libs\Smarty.class.php");
include 'Comic_Oracle.php';

$err=error_reporting(E_ALL & ~E_NOTICE);
$Connection     = new Comic_Oracle();
$Option         =$_POST['Option'];
$Commit         =$_POST['Commit'];
$SearchTitle    =$_POST['SearchTitle'];
$SearchStartYear=$_POST['SearchStartYear'];
$SearchEndYear  =$_POST['SearchEndYear'];
$Compare        =$_POST['ViewComicDBCompare'];
$DBMatch        =$_POST['MatchComicDB'];
$TradeId        =$_POST['SplitTrade'];
$smarty         = new Smarty;

$Connection->Log_Post_Details('POST', $_POST);
$Connection->Log_Post_Details('GET',  $_GET);

  if ($Compare != "") {
    $SearchTitle    = $Compare;
    $SearchStartYear= 1960;
    $SearchEndYear  = 2012;
    $Option         = "CompareComicDB";
  } elseif ($DBMatch != '') {
    $Connection->Match_To_ComicDB($DBMatch);
    $Option = 'CompareComicDB';
  } elseif ($TradeId != '') {
    $Option = 'SplitTrade';
  } elseif ($Option == '') {
    $Option = 'ViewSummary';
  }

  if ($Option == 'ViewSummary')  {
	  $summary = $Connection->Get_ComicDB_Summary();
    $smarty->assign('summary', $summary);
    $smarty->display('ViewComicDBSummary.tpl');
  } elseif ($Option == 'SplitTrade')  {
	  $trades  = $Connection->Get_ComicDB_Trades($TradeId);
    $smarty->assign('trades',     $trades);
    $smarty->display('SplitTrade.tpl');
  } elseif ($Option == 'CompareComicDB')  {
    $Connection->Match_ComicDB($SearchTitle, $SearchStartYear, $SearchEndYear);
	  $runs  = $Connection->Get_ComicDB_Compare($SearchTitle, $SearchStartYear, $SearchEndYear);
	  $match = $Connection->Get_Match_ComicDB();
    $smarty->assign('title',     $SearchTitle);
    $smarty->assign('startYear', $SearchStartYear);
    $smarty->assign('endYear',   $SearchEndYear);
    $smarty->assign('runs',      $runs);
    $smarty->assign('match',     $match);
    $smarty->display('CompareComicDB.tpl');
  }

?>
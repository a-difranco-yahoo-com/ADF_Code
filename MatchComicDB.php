<?php
require_once("HTTP.php");
require_once("D:\Php_Code\Smarty\libs\Smarty.class.php");
include 'MatchComicDB_Oracle.php';
include 'MatchComicDB_Data.php';

$err=error_reporting(E_ALL & ~E_NOTICE);
$Connection     = new MatchComicDB_Oracle();
$Data           = new MatchComicDB_Data();
$smarty         = new Smarty;

$Data->Set_MatchComicDB($_POST);
$Connection->Log_Post_Details('POST', $_POST);
$Connection->Log_Post_Details('GET',  $_GET);

  if ($Data->Compare != "") {
    $Data->Search["Title"]    = $Data->Compare;
    $Data->Search["StartYear"] = 1960;
    $Data->Search["EndYear"]  = 2012;
    $Data->Display         = "CompareComicDB";
  } elseif ($Data->DBMatch != '') {
    $Connection->Match_To_ComicDB($Data->DBMatch);
    $Data->Display = 'CompareComicDB';
  } elseif ($Data->TradeId != '') {
    $Data->Display = 'SplitTrade';
  } elseif ($Data->SplitIssue != '') {
    $Data->SplitTrade($Connection);
    $Data->Display = "CompareComicDB";
  } elseif ($Data->Display == '') {
    $Data->Display = 'ViewSummary';
  }

  if ($Data->Display == 'ViewSummary')  {
    $smarty->assign('summary', $Connection->Get_ComicDB_Summary() );
    $smarty->display('ViewComicDBSummary.tpl');
  } elseif ($Data->Display == 'SplitTrade')  {
    $smarty->assign('search',  $Data->Search);
    $smarty->assign('trades',  $Connection->Get_ComicDB_Trades($Data->TradeId) );
    $smarty->display('SplitTrade.tpl');
  } elseif ($Data->Display == 'CompareComicDB')  {
    $Connection->Match_ComicDB($Data->Search);
    $smarty->assign('search',  $Data->Search);
    $smarty->assign('runs',    $Connection->Get_ComicDB_Compare($Data->Search) );
    $smarty->assign('match',   $Connection->Get_Match_ComicDB() );
    $smarty->display('CompareComicDB.tpl');
  }

?>
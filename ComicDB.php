<?php
require_once("HTTP.php");
require_once("D:\Php_Code\Smarty\libs\Smarty.class.php");
include 'ComicDB_Oracle.php';
include 'ComicDB_Data.php';

$err=error_reporting(E_ALL & ~E_NOTICE);
$Connection = new ComicDB_Oracle();
$Data       = new ComicDB_Data();
$smarty     = new Smarty;

$Data->Set_Data($_POST);
$Connection->Log_Post_Details('POST', $_POST);
$Connection->Log_Post_Details('GET',  $_GET);

  switch ($Data->Action) {
  case "DBMatch"   : $Connection->Match_To_ComicDB($Data->MatchId);
    break;
  case "SplitIssue" :
      foreach ($Data->RowId as $key => $rowid)
      {
         if ( isset($Data->StartIssue[$key]) && isset($Data->EndIssue[$key]) )
           if ( $Data->StartKey[$key] < $Data->EndIssue[$key] )
              $Connection->SplitTrade($rowid, $Data->StartIssue[$key], $Data->EndIssue[$key]);
      }
    break;
  }

  switch ($Data->Display) {
  case "ViewSummary" :
    $smarty->assign('summary', $Connection->Get_ComicDB_Summary() );
    $smarty->display('ComicDB_Summary.tpl');
    break;
  case "SplitTrade" :
    $smarty->assign('search',  $Data->Search);
    $smarty->assign('trades',  $Connection->Get_ComicDB_Trades($Data->TradeId) );
    $smarty->display('ComicDB_Split.tpl');
    break;
  case "CompareComicDB" :
    $Connection->Match_ComicDB($Data->Search);
    $smarty->assign('search',  $Data->Search);
    $smarty->assign('runs',    $Connection->Get_ComicDB_Compare($Data->Search) );
    $smarty->assign('match',   $Connection->Get_Match_ComicDB() );
    $smarty->display('ComicDB_Compare.tpl');
    break;
  }

?>
<?php
require_once("HTTP.php");
require_once("D:\Php_Code\Smarty\libs\Smarty.class.php");
include 'Comic_Oracle.php';

$err=error_reporting(E_ALL & ~E_NOTICE);
$Connection     = new Comic_Oracle();
$Option         =$_POST['Option'];
$Commit         =$_POST['Commit'];
$SearchTitle    =$_POST['SearchTitle'];
$Cutoff_Year    =$_POST['CutOffYear'];
$Sim            =$_POST['Sim'];
$IncludeMatches =$_POST['IncludeMatches'];
$smarty         = new Smarty;

$Connection->Log_Post_Details('POST', $_POST);
$Connection->Log_Post_Details('GET',  $_GET);

  if ($Option == '')  $Option = 'ViewSummary';

  if ($Option == 'ViewSummary')  {
	  $summary = $Connection->Get_ComicDB_Summary();
    $smarty->assign('summary', $summary);
    $smarty->display('ViewComicDBSummary.tpl');
  } elseif ($Option == 'CompareSummary')  {
	  $summary = $Connection->Get_ComicDB_Compare_Summary($SearchTitle);
    $smarty->assign('summary', $summary);
    $smarty->display('CompareComicDBSummary.tpl');
  } elseif ($Option == 'CompareDetail')  {
	  $detail = $Connection->Get_ComicDB_Compare_Detail($SearchTitle);
    $smarty->assign('detail', $detail);
    $smarty->display('CompareComicDBDetail.tpl');
  } elseif ($Option == 'MatchComicDB')  {
    $Connection->Match_ComicDB($SearchTitle, $Cutoff_Year, $Sim, $IncludeMatches);
	  $match = $Connection->Get_Match_ComicDB();
    $smarty->assign('title',   $SearchTitle);
    $smarty->assign('year',    $Cutoff_Year);
    $smarty->assign('sim',     $Sim);
    $smarty->assign('include', $IncludeMatches);
    $smarty->assign('match',   $match);

    $smarty->display('MatchComicDB.tpl');
  }

?>
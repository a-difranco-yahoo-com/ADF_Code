<?php
require_once("HTTP.php");
require_once("D:\Php_Code\Smarty\libs\Smarty.class.php");
include 'CheckArchive_Oracle.php';

$err=error_reporting(E_ALL & ~E_NOTICE);
$Connection     = new CheckArchive_Oracle();
$smarty         = new Smarty;

$Connection->Log_Post_Details('POST', $_POST);
$Connection->Log_Post_Details('GET',  $_GET);

$Option          = 'ViewSummary';
$SearchTitle     = '';
$SearchStartYear = 1960;
$SearchEndYear   = 2100;
if ( isset($_POST['Option'])          ) $Option          = $_POST['Option'];
if ( isset($_POST['SearchTitle'])     ) $SearchTitle     = $_POST['SearchTitle'];
if ( isset($_POST['SearchStartYear']) ) $SearchStartYear = $_POST['SearchStartYear'];
if ( isset($_POST['SearchEndYear'])   ) $SearchEndYear   = $_POST['SearchEndYear'];

  if ( isset($_POST['TitleToDelete']) ) {
    $Connection->Delete_Title($_POST['TitleToDelete']);
    $Option = "ViewDetails";
  } elseif ( isset($_POST['ViewArchiveDetail']) ) {
    $SearchTitle = $_POST['ViewArchiveDetail'];
    $Option      = "ViewDetails";
  }

  if ($Option == 'ViewSummary')  {
      $smarty->assign('summary', $Connection->Get_Archive_Difference_Summary() );
      $smarty->display('ViewArchiveDifferenceSummary.tpl');
  } elseif ($Option == 'ViewDetails')  {
      $smarty->assign('title',     $SearchTitle);
      $smarty->assign('startYear', $SearchStartYear);
      $smarty->assign('endYear',   $SearchEndYear);
      $smarty->assign('detail',    $Connection->Get_Archive_Detail($SearchTitle, $SearchStartYear, $SearchEndYear) );
      $smarty->display('ViewArchiveDetail.tpl');
  }

?>



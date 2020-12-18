<?php
require_once("HTTP.php");
require_once("D:\Php_Code\Smarty\libs\Smarty.class.php");
include 'NewComic_Oracle.php';
include 'NewComic_Data.php';

$err=error_reporting(E_ALL & ~E_NOTICE);
$Connection = new NewComic_Oracle();
$Data       = new NewComic_Data();
$smarty     = new Smarty;

$Data->Set_Data($_POST);
$Connection->Log_Post_Details('POST', $_POST);
$Connection->Log_Post_Details('GET',  $_GET);

  switch ($Data->Action) {
  case "MatchToPull"   : $Connection->Commit_Match_To_Pull_List($Data->MatchId);
    break;
  case "MatchToWish"   : $Connection->Commit_Match_To_Wish_List($Data->MatchId);
    break;
  case "MatchToExist"  : $Connection->Remove_Existing_Comic($Data->MatchId);
    break;
  case "NotOnPullList" : $Connection->Clear_New_Digital_Comic($Data->MatchId);
    break;
  case "DigitalPull"   : $Connection->Clear_Pull_List($Data->MatchId);
    break;
  }

  switch ($Data->Display) {
  case 'MatchPull' :
   	$Connection->Run_Match($Data->MatchLevel);
    $smarty->assign('pulls', $Connection->Get_Match_Pull_List() );
    $smarty->assign('level', $Data->MatchLevel);
    $smarty->display('NewComic_MatchPull.tpl');
    break;
  case 'MatchWish' :
   	$Connection->Run_Match($Data->MatchLevel);
    $smarty->assign('wishs', $Connection->Get_Match_Wish_List() );
	  $smarty->display('NewComic_MatchWish.tpl');
    break;
  case 'MatchExist' :
    $smarty->assign('exist', $Connection->Get_Match_Existing() );
	  $smarty->display('NewComic_MatchExist.tpl');
    break;
  case 'ViewNew' :
    $smarty->assign('new', $Connection->Get_New_Comics() );
	  $smarty->display('NewComic_ViewNew.tpl');
    break;
  case 'ViewPull' :
    $smarty->assign('pull', $Connection->Get_Pull_List() );
	  $smarty->display('NewComic_ViewPull.tpl');
    break;
  case 'ViewWish' :
    $smarty->assign('wish', $Connection->Get_Wish_List() );
	  $smarty->display('NewComic_ViewWish.tpl');
    break;
  }

?>
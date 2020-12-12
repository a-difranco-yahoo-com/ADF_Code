<?php
require_once("HTTP.php");
require_once("D:\Php_Code\Smarty\libs\Smarty.class.php");
include 'MatchNewComic_Oracle.php';
include 'MatchNewComic_Data.php';

$err=error_reporting(E_ALL & ~E_NOTICE);
$Connection = new MatchNewComic_Oracle();
$Data       = new MatchNewComic_Data();
$smarty     = new Smarty;

$Data->Set_MatchNewComic($_POST);
$Connection->Log_Post_Details('POST', $_POST);
$Connection->Log_Post_Details('GET',  $_GET);

  if ( $Data->MatchToPull != ""  ) {
	  $Connection->Commit_Match_To_Pull_List($Data->MatchToPull);
    $Data->Option = "MatchPull";
  } elseif ( $Data->MatchToWish != "" ) {
	  $Connection->Commit_Match_To_Wish_List($Data->MatchToWish);
    $Data->Option = "MatchWish";
  } elseif ( $Data->MatchToExist != "" ) {
	  $Connection->Remove_Existing_Comic($Data->MatchToExist);
    $Data->Option = "MatchExist";
  } elseif ( $Data->NotOnPullList != "" ) {
	  $Connection->Clear_New_Digital_Comic($Data->NotOnPullList);
    $Data->Option = 'ViewNew';
  } elseif ( $Data->DigitalPull != "" ) {
	  $Connection->Clear_Pull_List($Data->DigitalPull);
    $Data->Option = 'ViewPull';
  }

  if ($Data->Option == 'MatchPull')  {
   	$Connection->Run_Match($Data->MatchLevel);
    $smarty->assign('pulls', $Connection->Get_Match_Pull_List() );
    $smarty->assign('level', $Data->MatchLevel);
    $smarty->display('MatchPullList.tpl');
  } elseif ($Data->Option == 'MatchWish')  {
   	$Connection->Run_Match($Data->MatchLevel);
    $smarty->assign('wishs', $Connection->Get_Match_Wish_List() );
	  $smarty->display('MatchWishList.tpl');
  } elseif ($Data->Option == 'MatchExist')  {
    $smarty->assign('exist', $Connection->Get_Match_Existing() );
	  $smarty->display('MatchExisting.tpl');
  } elseif ($Data->Option == 'ViewNew')  {
    $smarty->assign('new', $Connection->Get_New_Comics() );
	  $smarty->display('ViewNewComics.tpl');
  } elseif ($Data->Option == 'ViewPull')  {
    $smarty->assign('pull', $Connection->Get_Pull_List() );
	  $smarty->display('ViewPullList.tpl');
  } elseif ($Data->Option == 'ViewWish')  {
    $smarty->assign('wish', $Connection->Get_Wish_List() );
	  $smarty->display('ViewWishList.tpl');
  }

?>
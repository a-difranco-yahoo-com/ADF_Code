<?php
require_once("HTTP.php");
require_once("D:\Php_Code\Smarty\libs\Smarty.class.php");
include 'Comic_Oracle.php';

$err=error_reporting(E_ALL & ~E_NOTICE);
$Connection = new Comic_Oracle();
$smarty     = new Smarty;

$Connection->Log_Post_Details('POST', $_POST);
$Connection->Log_Post_Details('GET',  $_GET);

  $MatchLevel = 80;
  $Option     = 'MatchPull';
  if ( isset($_POST['Option'])     ) $Option     =$_POST['Option'];
  if ( isset($_POST['MatchLevel']) ) $MatchLevel =$_POST['MatchLevel'];

  if ( isset($_POST['MatchToPull'] ) ) {
	  $Connection->Commit_Match_To_Pull_List($_POST['MatchToPull']);
    $Option = "MatchPull";
  } elseif ( isset($_POST['MatchToWish']) ) {
	  $Connection->Commit_Match_To_Wish_List($_POST['MatchToWish']);
    $Option = "MatchWish";
  } elseif ( isset($_POST['MatchToExist']) ) {
	  $Connection->Remove_Existing_Comic($_POST['MatchToExist']);
    $Option      = "MatchExist";
  } elseif ( isset( $_POST['NotOnPullList'] ) ) {
	  $Connection->Clear_New_Digital_Comic($_POST['NotOnPullList']);
    $Option = 'ViewNew';
  } elseif ( isset($_POST['DigitalPull']) ) {
	  $Connection->Clear_Pull_List($_POST['DigitalPull']);
    $Option = 'ViewPull';
  }

  if ($Option == 'MatchPull')  {
   	$Connection->Run_Match($MatchLevel);
    $smarty->assign('pulls', $Connection->Get_Match_Pull_List() );
    $smarty->assign('level', $MatchLevel);
    $smarty->display('MatchPullList.tpl');
  } elseif ($Option == 'MatchWish')  {
	  $Connection->Run_Match(80);
    $smarty->assign('wishs', $Connection->Get_Match_Wish_List() );
	  $smarty->display('MatchWishList.tpl');
  } elseif ($Option == 'MatchExist')  {
    $smarty->assign('exist', $Connection->Get_Match_Existing() );
	  $smarty->display('MatchExisting.tpl');
  } elseif ($Option == 'ViewNew')  {
    $smarty->assign('new', $Connection->Get_New_Comics() );
	  $smarty->display('ViewNewComics.tpl');
  } elseif ($Option == 'ViewPull')  {
    $smarty->assign('pull', $Connection->Get_Pull_List() );
	  $smarty->display('ViewPullList.tpl');
  } elseif ($Option == 'ViewWish')  {
    $smarty->assign('wish', $Connection->Get_Wish_List() );
	  $smarty->display('ViewWishList.tpl');
  }

?>
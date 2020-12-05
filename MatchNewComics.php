<?php
require_once("HTTP.php");
require_once("D:\Php_Code\Smarty\libs\Smarty.class.php");
include 'Comic_Oracle.php';

$err=error_reporting(E_ALL & ~E_NOTICE);
$Connection    = new Comic_Oracle();
$Option        =$_POST['Option'];
$PullMatch     =$_POST['MatchToPull'];
$WishMatch     =$_POST['MatchToWish'];
$ExistMatch    =$_POST['MatchToExist'];
$MatchLevel    =$_POST['MatchLevel'];
$NotOnPullList =$_POST['NotOnPullList'];
$DigitalPull   =$_POST['DigitalPull'];
$smarty        = new Smarty;

$Connection->Log_Post_Details('POST', $_POST);
$Connection->Log_Post_Details('GET',  $_GET);

  if ($PullMatch != "") {
	  $Connection->Commit_Match_To_Pull_List($PullMatch);
    $Option      = "MatchPull";
  } elseif ($WishMatch != '') {
	  $Connection->Commit_Match_To_Wish_List($WishMatch);
    $Option      = "MatchWish";
  } elseif ($ExistMatch != '') {
	  $Connection->Remove_Existing_Comic($ExistMatch);
    $Option      = "MatchExist";
  } elseif ($NotOnPullList != '') {
	  $Connection->Clear_New_Digital_Comic($NotOnPullList);
    $Option = 'ViewNew';
  } elseif ($DigitalPull != '') {
	  $Connection->Clear_Pull_List($DigitalPull);
    $Option = 'ViewPull';
  } elseif ($Option == '') {
    $Option = 'MatchPull';
  }

  if ($Option == 'MatchPull')  {
    if ( $MatchLevel == "") $MatchLevel = 80;
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

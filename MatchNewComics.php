<?php
require_once("HTTP.php");
require_once("D:\Php_Code\Smarty\libs\Smarty.class.php");
include 'Comic_Oracle.php';

$err=error_reporting(E_ALL & ~E_NOTICE);
$Connection    = new Comic_Oracle();
$Option        =$_POST['Option'];
$PullMatch     =$_POST['MatchToPull'];
$MatchLevel    =$_POST['MatchLevel'];
$WishMatch     =$_POST['MatchToWish'];
$DigitalSeries =$_POST['DigitalSeries'];
$OneShot       =$_POST['OneShot'];
$NewSeries     =$_POST['NewSeries'];
$BackIssue     =$_POST['BackIssue'];
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
  } elseif ($DigitalSeries != '') {
	  $Connection->Clear_New_Digital_Comic($DigitalSeries);
    $Option = 'ViewNew';
  } elseif ($OneShot != '') {
	  $Connection->Clear_New_Digital_Comic($OneShot);
    $Option = 'ViewNew';
  } elseif ($NewSeries != '') {
	  $Connection->Clear_New_Digital_Comic($NewSeries);
    $Option = 'ViewNew';
  } elseif ($BackIssue != '') {
	  $Connection->Clear_New_Digital_Comic($BackIssue);
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
	  $pulls = $Connection->Get_Match_Pull_List();
    $smarty->assign('pulls', $pulls);
    $smarty->assign('level', $MatchLevel);
    $smarty->display('MatchPullList.tpl');
  } elseif ($Option == 'MatchWish')  {
	  $Connection->Run_Match(80);
	  $wishs = $Connection->Get_Match_Wish_List();
    $smarty->assign('wishs', $wishs);
	  $smarty->display('MatchWishList.tpl');
  } elseif ($Option == 'ViewNew')  {
	  $new = $Connection->Get_New_Comics();
    $smarty->assign('new', $new);
	  $smarty->display('ViewNewComics.tpl');
  } elseif ($Option == 'ViewPull')  {
	  $pull = $Connection->Get_Pull_List();
    $smarty->assign('pull', $pull);
	  $smarty->display('ViewPullList.tpl');
  } elseif ($Option == 'ViewWish')  {
	  $wish = $Connection->Get_Wish_List();
    $smarty->assign('wish', $wish);
	  $smarty->display('ViewWishList.tpl');
  }

?>

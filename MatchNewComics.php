<?php
require_once("HTTP.php");
require_once("D:\Php_Code\Smarty\libs\Smarty.class.php");
include 'Comic_Oracle.php';
include 'Comic_Data.php';

$err=error_reporting(E_ALL & ~E_NOTICE);
$Connection = new Comic_Oracle();
$Option     =$_POST['Option'];
$Commit     =$_POST['Commit'];
$get        =$_GET;
$smarty     = new Smarty;

$Connection->Log_Post_Details('POST', $_POST);
$Connection->Log_Post_Details('GET',  $_GET);

  if ($Commit == 'CommitMatchPull')  {
	$Connection->Commit_Match_Pull_List($_POST);
    $Option = 'MatchPull';
  } elseif ($Commit == 'CommitMatchWish')  {
	$Connection->Commit_Match_Wish_List($_POST);
	$Option = 'MatchWish';
  } elseif ($Commit == 'CommitNew')  {
	$Connection->Commit_New_Comics($_POST);
	$Option = 'ViewNew';
  } elseif ($Commit == 'CommitPull')  {
	$Connection->Commit_Pull_List($_POST);
	$Option = 'ViewPull';
  }

  if ($Option == '')  $Option = 'MatchPull';

  if ($Option == 'MatchPull')  {
	$Connection->Run_Match(80);
	$pulls = $Connection->Get_Match_Pull_List();
    $smarty->assign('pulls', $pulls);
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

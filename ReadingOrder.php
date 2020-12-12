<?php
require_once("HTTP.php");
require_once("D:\Php_Code\Smarty\libs\Smarty.class.php");
include 'ReadingOrder_Oracle.php';
include 'ReadingOrder_Data.php';

$err=error_reporting(E_ALL & ~E_NOTICE);
$Connection = new ReadingOrder_Oracle();
$Data       = new ReadingOrder_Data();
$smarty     = new Smarty;

$Data->Set_Data($_POST);
$Connection->Log_Post_Details('POST', $_POST);
$Connection->Log_Post_Details('GET',  $_GET);

  if ($Data->Option == 'ViewListHierarchy')  {
    $smarty->assign('hier', $Connection->Get_List_Hierarchy() );
    $smarty->display('ROListHierarchy.tpl');
  } elseif ($Data->Option == 'ViewListSummary')  {
    $smarty->assign('summ', $Connection->Get_List_Summary() );
    $smarty->display('ROListSummary.tpl');
  } elseif ($Data->Option == 'ViewListTitleSummary')  {
    $smarty->assign('summ', $Connection->Get_List_Title_Summary() );
    $smarty->display('ROListTitleSummary.tpl');
  } elseif ($Data->Option == 'ViewListDetail')  {
    $smarty->assign('det', $Connection->Get_List_Detail() );
    $smarty->display('ROListDetail.tpl');
  }

?>


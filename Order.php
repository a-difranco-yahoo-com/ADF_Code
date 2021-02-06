<?php
require_once("HTTP.php");
require_once("C:\My_Software\Smarty\libs\Smarty.class.php");
include 'Order_Oracle.php';
include 'Order_Data.php';

$err=error_reporting(E_ALL & ~E_NOTICE);
$Connection = new Order_Oracle();
$Data       = new Order_Data();
$smarty     = new Smarty;

$Data->Set_Data($_POST);
$Connection->Log_Post_Details('POST', $_POST);
$Connection->Log_Post_Details('GET',  $_GET);

  switch ($Data->Display) {
  case 'ViewListHierarchy' :
    $smarty->assign('hier', $Connection->Get_List_Hierarchy() );
    $smarty->display('Order_Hierarchy.tpl');
    break;
  case 'ViewListSummary' :
    $smarty->assign('summ', $Connection->Get_List_Summary() );
    $smarty->display('Order_List.tpl');
    break;
  case 'ViewListTitleSummary' :
    $smarty->assign('summ', $Connection->Get_List_Title_Summary() );
    $smarty->display('Order_Title.tpl');
    break;
  case 'ViewListDetail' :
    $smarty->assign('det', $Connection->Get_List_Detail() );
    $smarty->display('Order_Detail.tpl');
    break;
  }

?>


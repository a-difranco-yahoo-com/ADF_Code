<?php
require_once("HTTP.php");
require_once("D:\Php_Code\Smarty\libs\Smarty.class.php");
include 'Comic_Oracle.php';

$err=error_reporting(E_ALL & ~E_NOTICE);
$Connection  = new Comic_Oracle();
$Option      =$_POST['Option'];
$smarty      = new Smarty;

$Connection->Log_Post_Details('POST', $_POST);
$Connection->Log_Post_Details('GET',  $_GET);

  if ($Option == '')  $Option = 'ViewListHierarchy';

  if ($Option == 'ViewListHierarchy')  {
    $smarty->assign('hier', $Connection->Get_List_Hierarchy() );
    $smarty->display('ROListHierarchy.tpl');
  } elseif ($Option == 'ViewListSummary')  {
    $smarty->assign('summ', $Connection->Get_List_Summary() );
    $smarty->display('ROListSummary.tpl');
  } elseif ($Option == 'ViewListTitleSummary')  {
    $smarty->assign('summ', $Connection->Get_List_Title_Summary() );
    $smarty->display('ROListTitleSummary.tpl');
  } elseif ($Option == 'ViewListDetail')  {
    $smarty->assign('det', $Connection->Get_List_Detail() );
    $smarty->display('ROListDetail.tpl');
  }

?>


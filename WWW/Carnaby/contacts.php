<?php

session_start();
require_once("HTTP.php");
require_once("D:\Php_Code\Smarty\libs\Smarty.class.php");
include("data.php");

$err=error_reporting(E_ALL & ~E_NOTICE);

class Data {
var $contacts;
var $names;
var $search;
var $form1;
var $form2;
var $form3;
var $curContact;
var $curPage;
var $errormsg;
}


include 'Comic_Oracle.php';
$Connection = new Comic_Oracle("CARNABY");

$data = new Data;
$data->curContact = ($_GET['contact']) ? $_GET['contact'] : 0;
$data->curPage    = ($_GET['page'])    ? $_GET['page']    : 'f0';

$data->form1 = $form1;
$data->form2 = $form2;
$data->form3 = $form3;
$data->search = $searchForm;

if ($_POST['query'] == 'search') {
  foreach ($data->search as $rec) {
    $_SESSION['carnaby_contacts_search'][$rec[1]] = trim($_POST[$rec[1]]);
  }
  $data->curPage = 'f1';
}
if ($_POST['query'] == 'save') {
  $parnum=0;
  $prms[":par$parnum"] = $_POST["id"];
  foreach (array("form1","form2","form3") as $frm) {
    foreach ($$frm as $rec) {
      $prms [":par".++$parnum]= $_POST[$rec[1]];
    }
  }
  $sql = "begin WebForm.ContactUpdate(".join(',',array_keys($prms))."); end;";
  $stmt = ociparse($conn,$sql);
  foreach ($prms as $p => $v) {
    ocibindbyname($stmt, $p, $prms[$p]);
  }
  if (! ociexecute($stmt)) {
    $msg="Something went wrong, It should never happen. Contact IT support";
  } else {
    $msg="Record updated successfully";
  };
  header("Location: contacts.php?page=${_POST['curPage']}&contact=${_POST['curContact']}&msg=$msg");
}

foreach ($data->search as $i => $rec) {
  $data->search[$i][]= $_SESSION['carnaby_contacts_search'][$rec[1]];
  if ($_SESSION['carnaby_contacts_search'][$rec[1]]) {
    $go = true;
  }
}

if ($go) {
    $rows = $Connection->Get_Contacts($_SESSION['carnaby_contacts_search']);
 
     $Rows=0;
     foreach($rows as $row) {
        $rec = array(array("PERSON_ID",$row["PERSON_ID"]));
        foreach ($form1 as $f)  $rec[] = array($f[1], $row[$f[1]]);
        foreach ($form2 as $f)  $rec[] = array($f[1], $row[$f[1]]);
        foreach ($form3 as $f)  $rec[] = array($f[1], $row[$f[1]]);
        $data->contacts[]=$rec;
        $Rows++;
    }

  if ( $Rows > 0)
    foreach ($data->contacts as $c) 
      $data->names[]=$c[4][1]." (".$c[1][1]." ".$c[2][1]." ".$c[3][1].")";
  if ($_GET['msg']) {
    $data->errormsg = $_GET['msg'];
  } elseif ( $Rows == 500) {
    $data->errormsg = "Output too large.\nOnly first 500 records are shown.\nBe more specific next time.";
  }
}

$smarty = new Smarty;
$smarty->assignByRef('data',$data);

//ocilogoff($conn);
$smarty->display('contacts.tpl');
?>

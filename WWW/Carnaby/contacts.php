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

$login = array('Carnaby', 'Carnaby', '');
if(!($conn = ocilogon($login[0], $login[1], $login[2]))) {
  $err = OCIError();
  print("Error connecting to oracle: ".$err["text"]);
  exit();
}

//or die("Problem with connection to database".OCIError().);

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
  $stmt = ociparse($conn,
    "begin WebForm.ContactSearch(:t,:f,:o,:l,:s,:a1,:a2,:a3,:a4,:a5,:a6,:c,:pc,:e,:ret); end;");
  $IFAs = ocinewcursor($conn);
  ocibindbyname($stmt, ":t",   $_SESSION['carnaby_contacts_search']['TITLE'],      40);
  ocibindbyname($stmt, ":f",   $_SESSION['carnaby_contacts_search']['FIRST_NAME'], 40);
  ocibindbyname($stmt, ":o",   $_SESSION['carnaby_contacts_search']['OTHER_NAME'], 40);
  ocibindbyname($stmt, ":l",   $_SESSION['carnaby_contacts_search']['LAST_NAME'],  40);
  ocibindbyname($stmt, ":s",   $_SESSION['carnaby_contacts_search']['SUFFIX'],     40);
  ocibindbyname($stmt, ":a1",  $_SESSION['carnaby_contacts_search']['ADDRESS_1'],  40);
  ocibindbyname($stmt, ":a2",  $_SESSION['carnaby_contacts_search']['ADDRESS_2'],  40);
  ocibindbyname($stmt, ":a3",  $_SESSION['carnaby_contacts_search']['ADDRESS_3'],  40);
  ocibindbyname($stmt, ":a4",  $_SESSION['carnaby_contacts_search']['ADDRESS_4'],  40);
  ocibindbyname($stmt, ":a5",  $_SESSION['carnaby_contacts_search']['ADDRESS_5'],  40);
  ocibindbyname($stmt, ":a6",  $_SESSION['carnaby_contacts_search']['ADDRESS_6'],  40);
  ocibindbyname($stmt, ":c",   $_SESSION['carnaby_contacts_search']['COUNTRY'],    8);
  ocibindbyname($stmt, ":pc",  $_SESSION['carnaby_contacts_search']['POSTCODE'],   40);
  ocibindbyname($stmt, ":e",   $_SESSION['carnaby_contacts_search']['E_MAIL'],     80);
  ocibindbyname($stmt, ":ret", $IFAs, -1, OCI_B_CURSOR);
  ociexecute($stmt);
  ociexecute($IFAs);
  while (ocifetchinto($IFAs, $row, OCI_ASSOC)) {
    $rec = array(array("PERSON_ID",$row["PERSON_ID"]));
    foreach ($form1 as $f)  $rec[] = array($f[1], $row[$f[1]]);
    foreach ($form2 as $f)  $rec[] = array($f[1], $row[$f[1]]);
    foreach ($form3 as $f)  $rec[] = array($f[1], $row[$f[1]]);
    $data->contacts[]=$rec;
  }
  if (sizeof($data->contacts))
    foreach ($data->contacts as $c) 
      $data->names[]=$c[4][1]." (".$c[1][1]." ".$c[2][1]." ".$c[3][1].")";
  if ($_GET['msg']) {
    $data->errormsg = $_GET['msg'];
  } elseif (sizeof($data->contacts) == 500) {
    $data->errormsg = "Output too large.\nOnly first 500 records are shown.\nBe more specific next time.";
  }
}

$smarty = new Smarty;
$smarty->assignByRef('data',$data);

ocilogoff($conn);
$smarty->display('contacts.tpl');
?>

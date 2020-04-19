<?php
//validation strings
$date  = array("\\\\d\\\\d-(JAN|FEB|MAR|APR|MAY|JUN|JUL|AUG|SEP|OCT|NOV|DEC)-\\\\d\\\\d\\\\d\\\\d","Not a valid DATE string (try 01-JAN-2005)");
$pcode = array("((\\\\w......\\\\w)|())","Not a valid POST CODE (must be padded two 8 characters)");

$searchForm = array(
  array("Title",     "TITLE",      40), //fieldName, dbField, length/array of values
  array("Firstname", "FIRST_NAME", 40),
  array("Othername", "OTHER_NAME", 40),
  array("Lastname",  "LAST_NAME",  40),
  array("Suffix",    "SUFFIX",     40),
  array("Address 1", "ADDRESS_1",  60),
  array("Address 2", "ADDRESS_2",  40),
  array("Address 3", "ADDRESS_3",  40),
  array("Address 4", "ADDRESS_4",  40),
  array("Address 5", "ADDRESS_5",  40),
  array("Address 6", "ADDRESS_6",  40),
  array("Country",   "COUNTRY",    40),
  array("Post code", "POSTCODE",   8),
  array("E-mail",    "E_MAIL",     80),
);

$form1 = array(
  array("Title",     "TITLE",      40), //fieldName, dbField, length/array of values
  array("Firstname", "FIRST_NAME", 40),
  array("Othername", "OTHER_NAME", 40),
  array("Lastname",  "LAST_NAME",  40),
  array("Suffix",    "SUFFIX",     40),
  array("Address 1", "ADDRESS_1",  60),
  array("Address 2", "ADDRESS_2",  40),
  array("Address 3", "ADDRESS_3",  40),
  array("Address 4", "ADDRESS_4",  40),
  array("Address 5", "ADDRESS_5",  40),
  array("Address 6", "ADDRESS_6",  40),
  array("Country",   "COUNTRY",    40),
  array("Post code", "POSTCODE",   8, $pcode),
);


$form2 = array(
  array("Email",                   "E_MAIL",                 80),
  array("Telephone Daytime",       "TELEPHONE_DAYTIME",      40),
  array("Telephone Evening",       "TELEPHONE_EVENING",      40),
  array("Telephone Mobile",        "TELEPHONE_MOBILE",       40),
  array("Status",                  "STATUS",                 "radio",  array('A'=>'A','D'=>'D','S'=>'S','L'=>'L')),
  array("MPS",                     "DO_NOT_MAIL",            "radio",  array('Y'=>'yes','N'=>'no')),
  array("TPS",                     "DO_NOT_TELEPHONE",       "radio",  array('Y'=>'yes','N'=>'no')),
  array("Do not email",            "DO_NOT_EMAIL",           "radio",  array('Y'=>'yes','N'=>'no')),
  array("Sales Status",            "SALES_STATUS",           "select", array(""=>"", "Allocated"=>"Allocated", "Existing"=>"Existing","Investor"=>"Investor","KOL"=>"KOL","New"=>"New","Qualified"=>"Qualified")),
  array("Created by",              "CREATED_BY",              20),
  array("Created",                 "CREATED",                 11, $date),
  array("Last changed",            "LAST_CHANGED",            11, $date),
  array("Last changed by",         "LAST_CHANGED_BY",         20),
  array("Geodemographic Category", "GEODEMOGRAPHIC_CATEGORY", 40),
  array("Segmentation Category",   "SEGMANTATION_CATEGORY",   40),
  array("Age Band",                "AGE_BAND",                40),
  array("MID Identifier",          "MID_IDENTIFIER",          5)
);

$form3 = array(
  array("GM Account No", "GM_ACCOUNTNO",  30),
  array("Salesman",      "SALESMAN",      20),
  array("Pref Comedy",   "PREF_COMEDY",   "radio", array('Y'=>'yes','N'=>'no')),
  array("Pref Drama",    "PREF_DRAMA",    "radio", array('Y'=>'yes','N'=>'no')),
  array("Pref Horror",   "PREF_HORROR",   "radio", array('Y'=>'yes','N'=>'no')),
  array("Pref Romance",  "PREF_ROMANCE",  "radio", array('Y'=>'yes','N'=>'no')),
  array("Pref SciFi",    "PREF_SCIFI",    "radio", array('Y'=>'yes','N'=>'no')),
  array("Pref Thriller", "PREF_THRILLER", "radio", array('Y'=>'yes','N'=>'no')),
  array("Pref Other",    "PREF_OTHER",    500),
  array("From Kahoona",  "FROM_KAHOONA",  "radio", array('Y'=>'yes','N'=>'no')),
);
?>

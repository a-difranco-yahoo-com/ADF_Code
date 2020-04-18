<?php


function Load_XML_File() {
   $xml = simplexml_load_file("D:/Geocache_Pics/MyFinds/MyFinds.gpx")
          or die ('Cannot open myfinds');

   return $xml;
}

function Rebuild_DB($db, $xml)
{
   $log_types = array("Webcam Photo Taken", "Found it", "Attended");

   foreach($xml->children() as $cache) {
      $kids = $cache->children("http://www.groundspeak.com/cache/1/0/1");
      $namespaces = $kids->getNameSpaces(true);
      if ( isset ( $namespaces['groundspeak'] ) ) {  
         $gs = $kids->children($namespaces['groundspeak']);
         foreach($gs->logs->log as $log) {
			 if (in_array( strVal($log->type), $log_types)) {
				 $db->AddGeoCache(strVal($gs->name),      strVal($cache->time),    strVal($gs->type),
		                          strVal($gs->container), strVal($gs->difficulty), strVal($gs->terrain), 
             					  strVal($gs->country),   strVal($gs->state),      strVal($log->date) );
			 }
		 }
       } 
    }
}

include 'Geocache_Oracle.php';
$xml = Load_XML_File();

$db = new Geocache_Oracle();
$db->ClearCaches();

Rebuild_DB($db, $xml);

$db->Commit();
$db->CloseConnection();

?> 


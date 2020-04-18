<?php


function Load_XML_File() {
   $xml = simplexml_load_file("D:/Geocache_Pics/MyFinds/MyFinds.gpx")
          or die ('Cannot open myfinds');

   return $xml;
}

function Parse_XML_File($xml)
{
//$namespaces = $xml->getNamespaces(true);
//var_dump($namespaces);

// print_r($xml);
  
echo "Name     : " . $xml->name . "\n";
echo "Desc     : " . $xml->desc . "\n";
echo "Author   : " . $xml->author . "\n";
echo "Email    : " . $xml->email . "\n";
echo "Time     : " . $xml->time . "\n";
echo "Keywords : " . $xml->keywords . "\n";
echo "Bounds   : " . $xml->bounds . "\n";
echo "Min Lat  : " . $xml->bounds['minlat'] . "\n";
echo "Max Lat  : " . $xml->bounds['maxlat'] . "\n";
echo "Min Lon  : " . $xml->bounds['minlon'] . "\n";
echo "Max Lon  : " . $xml->bounds['maxlon'] . "\n";

foreach($xml->children() as $cache) {
   echo "Cache : Time    :  " . $cache->time . " \n";
   echo "Cache : Name    :  " . $cache->name . " \n";
   echo "Cache : Desc    :  " . $cache->desc . " \n";
   echo "Cache : URL     :  " . $cache->url . " \n";
   echo "Cache : URLName :  " . $cache->urlname . " \n";
   echo "Cache : Sym     :  " . $cache->sym . " \n";
   echo "Cache : Type    :  " . $cache->type . " \n";

   $kids = $cache->children("http://www.groundspeak.com/cache/1/0/1");
   $namespaces = $kids->getNameSpaces(true);
   $gs = $kids->children($namespaces['groundspeak']);  
   
   echo "GS Cache : Name       :  " . $gs->name       . " \n";
   echo "GS Cache : Placed By  :  " . $gs->placed_by  . " \n";
   echo "GS Cache : Owner      :  " . $gs->owner      . " \n";
   echo "GS Cache : Type       :  " . $gs->type       . " \n";
   echo "GS Cache : Container  :  " . $gs->container  . " \n";
   echo "GS Cache : difficulty :  " . $gs->difficulty . " \n";
   echo "GS Cache : terrain    :  " . $gs->terrain    . " \n";
   echo "GS Cache : country    :  " . $gs->country    . " \n";
   echo "GS Cache : state      :  " . $gs->state      . " \n";

   foreach($gs->logs->log as $log) { 
      echo "Log Cache : date   :  " . $log->date      . " \n";
      echo "Log Cache : type   :  " . $log->type      . " \n";
      echo "Log Cache : finder :  " . $log->finder    . " \n";
      echo "Log Cache : text   :  " . $log->text      . " \n";
   }
} 
}

$xml = Load_XML_File();
Parse_XML_File($xml);

?> 


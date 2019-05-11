<?php

$TextEncoding = 'UTF-8';

require_once('getid3/getid3.php');
require_once('getid3/write.php');

// Initialize getID3 engine
$getID3 = new getID3;
$getID3->setOption(array('encoding'=>$TextEncoding));

// Initialize getID3 tag-writing module
$tagwriter = new getid3_writetags;

$DirectoryToScan = 'D:\DarkerProjects\Subscribed\TheByronChronicles_UPTODATE\Byron Specials';
$dir = opendir($DirectoryToScan);
$Track=0;
while (($file = readdir($dir)) !== false) {
	$FullFileName = realpath($DirectoryToScan.'/'.$file);
	if ((substr($file, 0, 1) != '.') && is_file($FullFileName)) 
	{
	   $tagwriter->filename = $FullFileName;
       $tagwriter->tagformats = array('id3v2.3');

       // set various options (optional)
       $tagwriter->overwrite_tags    = true;  // if true will erase existing tag data and write only passed data; if false will merge passed data with existing tag data (experimental)
       $tagwriter->remove_other_tags = false; // if true removes other tag formats (e.g. ID3v1, ID3v2, APE, Lyrics3, etc) that may be present in the file and only write the specified tag format(s). If false leaves any unspecified tag formats as-is.
       $tagwriter->tag_encoding      = $TextEncoding;

       // populate data array
	   $Track++;
       $TagData = array(
   	   'artist'                 => array('DarkerProjects.com'),
	   'album'                  => array('Byron Chronicles : Specials'),
	   'track'                  => array($Track),
      );
      $tagwriter->tag_data = $TagData;

      // write tags
      if ($tagwriter->WriteTags()) {
	      echo 'Successfully wrote tags' . "\n";
	      if (!empty($tagwriter->warnings)) {
	   	      echo 'There were some warnings:' . "\n" . implode("\n", $tagwriter->warnings);
	      }
      } else {
	      echo 'Failed to write tags!' . "\n" . implode("\n", $tagwriter->errors);
      }
   }
}
?>
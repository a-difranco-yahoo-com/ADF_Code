<?php

// include getID3() library (can be in a different directory if full path is specified)
require_once('D:\Php_Code\GetId3\getid3\getid3.php');

// Initialize getID3 engine
$getID3 = new getID3;

$DirectoryToScan = 'D:\DarkerProjects\Subscribed\TheByronChronicles_UPTODATE\Byron Season 1'; // change to whatever directory you want to scan
$dir = opendir($DirectoryToScan);

echo '<table border="1" cellspacing="0" cellpadding="3">';
//echo '<tr><th>Filename</th><th>Artist</th><th>Title</th><th>Album</th><th>Track</th><th>Bitrate</th><th>Playtime</th></tr>';
echo '<tr><th>Filename</th><th>Artist</th><th>Title</th><th>Album</th><th>Track</th></tr>';
while (($file = readdir($dir)) !== false) {
	$FullFileName = realpath($DirectoryToScan.'/'.$file);
	if ((substr($file, 0, 1) != '.') && is_file($FullFileName)) {
		set_time_limit(30);

		$ThisFileInfo = $getID3->analyze($FullFileName);

		getid3_lib::CopyTagsToComments($ThisFileInfo);

		// output desired information in whatever format you want
		echo '<tr>' . "\n";
		echo '<td>'.htmlentities($FullFileName).'</td>' . "\n";
		echo '<td>'              .htmlentities(!empty($ThisFileInfo['comments_html']['artist']) ? implode('<br>', $ThisFileInfo['comments_html']['artist'])         : chr(160)).'</td>' . "\n";
		echo '<td>'              .htmlentities(!empty($ThisFileInfo['comments_html']['title'])  ? implode('<br>', $ThisFileInfo['comments_html']['title'])          : chr(160)).'</td>' . "\n";
		echo '<td>'              .htmlentities(!empty($ThisFileInfo['comments_html']['album'])  ? implode('<br>', $ThisFileInfo['comments_html']['album'])          : chr(160)).'</td>' . "\n";
		echo '<td>'              .htmlentities(!empty($ThisFileInfo['comments_html']['track'])  ? implode('<br>', $ThisFileInfo['comments_html']['track'])          : chr(160)).'</td>' . "\n";
//		echo '<td align="right">'.htmlentities(!empty($ThisFileInfo['audio']['bitrate'])        ?           round($ThisFileInfo['audio']['bitrate'] / 1000).' kbps' : chr(160)).'</td>' . "\n";
//		echo '<td align="right">'.htmlentities(!empty($ThisFileInfo['playtime_string'])         ?                 $ThisFileInfo['playtime_string']                  : chr(160)).'</td>' . "\n";
		echo '</tr>' . "\n";
	}
}
echo '</table>' . "\n";

echo '</body></html>';

?>

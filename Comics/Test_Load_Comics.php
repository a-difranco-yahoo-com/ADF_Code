<?php

include 'Comic.php';
include 'Comic_Oracle.php';



/* List dir to find Comic files */
function find_comics($db, $dir)
{
  $files = scandir("$dir/");
  foreach ( $files as $file )
  {
     if ( !is_dir("$dir/$file") && $file != "." && $file != ".." && $file != "Thumbs.db" )
     {
         $comic = new Comic($file);
         $comic->ParseFilename();
         $comic->PrintDetails();

//		          $db->AddNewComic($comic->GetTitle(), $comic->GetVolume(),   $comic->GetYear(),
//                          $comic->GetIssue(), $comic->GetSubIssue(), 
         printf("Series Run = %s \n", $comic->GetSeriesRun() );

		 }
  }
}

$db = new Comic_Oracle();

find_comics($db, "E:/Comics/3 To Trim");

$db->CloseConnection();
?>
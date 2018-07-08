<?php

include 'Comic.php';
include 'Comic_Oracle.php';

/* List dir to find comics to move into title specific sub-dirs  */
function find_comics($db, $dir)
{
  $files = scandir("$dir/");
  foreach ( $files as $file )
  {
     if ( !is_dir("$dir/$file") && $file != "." && $file != ".." && $file != "Thumbs.db" )
     {
         $comic = new Comic($file);
         $comic->ParseFilename();

         $db->AddNewComic($comic->GetTitle(), $comic->GetVolume(),   $comic->GetYear(),
                          $comic->GetIssue(), $comic->GetSubIssue(), $comic->GetSeriesRun() );
     }
  }
}


$db = new Comic_Oracle();

find_comics($db, "D:/Comics/3 To Trim");

$db->Commit();
$db->CloseConnection();

?>

<?php

include 'Comic.php';

find_comics("D:/Comics/Move_To_IDrive");

/* List dir to find comics to move into title specific sub-dirs  */
function find_comics($dir)
{
  $files = scandir("$dir/");
  foreach ( $files as $file )
  {
     if ( !is_dir("$dir/$file") && $file != "." && $file != ".." && $file != "Thumbs.db" )
     {
         check_comic($dir, $file);
     }
  }
}


function check_comic($dir, $file)
{
   $comic = new Comic($file);
   $comic->SetBaseDirectory($dir);
   $comic->ParseFilename();
   $comic->ParseDirectory();
   $comic->MoveToTarget();
}

?>

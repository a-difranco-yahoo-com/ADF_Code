<?php

include 'Comic.php';

find_letter_dir("E:/Comics/Move_To_IDrive");
find_letter_dir("E:/Comics/View");

/* List dir to find Letter sub-dirs  */
function find_letter_dir($basedir)
{
  $files = scandir("$basedir/");
  foreach ( $files as $letterdir )
  {
     if ( is_dir("$basedir/$letterdir") && $letterdir != "unk"   && $letterdir != "." && $letterdir != ".." && $letterdir != "Thumbs.db" )
     {
         find_title_dir($basedir, $letterdir);
     }
  }
}

/* List dir to find Title sub-dirs  */
function find_title_dir($basedir, $letterdir)
{
  $files = scandir("$basedir/$letterdir");
  foreach ( $files as $titledir )
  {
     if ( is_dir("$basedir/$letterdir/$titledir")&& $titledir != "." && $titledir != ".." && $titledir != "Thumbs.db" )
     {
         find_comics($basedir, $letterdir, $titledir);
     }
  }
}

/* List dir to find Comic files */
function find_comics($basedir, $letterdir, $titledir)
{
  $files = scandir("$basedir/$letterdir/$titledir");
  foreach ( $files as $file )
  {
     if ( is_file("$basedir/$letterdir/$titledir/$file") && $file != "." && $file != ".." && $file != "Thumbs.db" )
     {
         $comic = new Comic($file);
         $comic->ParseFilename();
         $comic->SetBaseDirectory($basedir);
         $comic->SetLetterDirectory($letterdir);
         $comic->SetTitleDirectory($titledir);
         $comic->CheckDirectory();
     }
  }
}

?>
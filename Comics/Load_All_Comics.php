<?php

include 'Comic.php';
include 'Comic_Oracle.php';


/* List dir to find Letter sub-dirs  */
function find_letter_dir($db, $basedir)
{
  $files = scandir("$basedir/");
  foreach ( $files as $letterdir )
  {
     if ( is_dir("$basedir/$letterdir") && $letterdir != "unk"   && $letterdir != "." && $letterdir != ".." && $letterdir != "Thumbs.db" )
     {
         find_title_dir($db, $basedir, $letterdir);
     }
  }
}

/* List dir to find Title sub-dirs  */
function find_title_dir($db, $basedir, $letterdir)
{
  $files = scandir("$basedir/$letterdir");
  foreach ( $files as $titledir )
  {
     if ( is_dir("$basedir/$letterdir/$titledir")&& $titledir != "." && $titledir != ".." && $titledir != "Thumbs.db" )
     {
         find_comics($db, $basedir, $letterdir, $titledir);
     }
  }
}

/* List dir to find Comic files */
function find_comics($db, $basedir, $letterdir, $titledir)
{
  $files = scandir("$basedir/$letterdir/$titledir");
  foreach ( $files as $file )
  {
     if ( is_file("$basedir/$letterdir/$titledir/$file") && $file != "." && $file != ".." && $file != "Thumbs.db" )
     {
         $comic = new Comic($file);
         $comic->ParseFilename();
		 if ( $comic->FilenameParsed() )
		 {
            $comic->SetBaseDirectory($basedir);
            $comic->SetLetterDirectory($letterdir);
            $comic->SetTitleDirectory($titledir);
            $comic->CheckDirectory();

            $db->AddComic($comic->GetTitle(), $comic->GetVolume(),   $comic->GetYear(),
                          $comic->GetIssue(), $comic->GetSubIssue(), $comic->GetSeriesRun() );
		 }
     }
  }
}

$db = new Comic_Oracle();
$db->ClearComics();

find_letter_dir($db, Comic::Drive . "Comics/Move_To_IDrive");
find_letter_dir($db, Comic::Drive . "Comics/View");

$db->PostLoadRebuilds();
$db->Commit();
$db->CloseConnection();
?>

<?php

function get_year_month($line)
{
  $monyear  = str_replace("</title>", "",  str_replace("ICv2 - Top 300 Comics--", "", $line));
  $monyear  = trim($monyear) . ".html";

  return $monyear;
}



/* Processing fns */
function Read_File($infile, $tgt_dir)
{
   $lines = file($infile);
   foreach($lines as $line)
      if ( stristr($line, "ICv2 - Top 300 Comics--") == TRUE)
      {
         $tgt_file = $tgt_dir . get_year_month($line);
         rename($infile, $tgt_file);
      }
}

/* List Html files found in dir  */
function Find_Files($src_dir, $tgt_dir)
{
   chdir("$src_dir");

   $files = scandir("$src_dir/");
   foreach ( $files as $file )
   {
      if ( $file != "." && $file != ".." && $file != "Thumbs.db" )
      {
          $fullfile = $src_dir . $file;
          Read_File($fullfile, $tgt_dir);
      }
   }
}


$src_dir="F:/Comics/icv2_V2/";
$tgt_dir="F:/Comics/icv2_V2/";

Find_Files($src_dir, $tgt_dir);


?>

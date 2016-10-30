
<?php

function Convert_File($infile, $outfile)
{
   $OnRow   = 0;

   $lines = file($infile);
   $file = fopen($outfile, 'w');
   foreach($lines as $line)
   {
      fwrite($file, '"' . trim($line) . '",');
      $OnRow++;
      if ( $OnRow == 6)
      {
         fwrite($file, "\r\n");
         $OnRow = 0;
      }
   }
   fclose($file);
}

/* List Html files found in dir  */
function Find_Files($src_dir)
{
   chdir("$src_dir");

   $files = scandir("$src_dir/");
   foreach ( $files as $file )
   {
      if ( $file != "." && $file != ".." && $file != "Thumbs.db" )
      {
          $srcfile = $src_dir . $file;
          $tgtfile = str_replace(".txt", ".csv",  $srcfile);
          Convert_File($srcfile, $tgtfile);
      }
   }
}


$src_dir="F:/Comics/icv2_V2/";

Find_Files($src_dir);


?>

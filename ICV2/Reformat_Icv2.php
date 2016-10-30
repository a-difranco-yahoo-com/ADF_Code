<?php

/*  Utility Fns */
function skip_to_table($line)
{
  $text = $line;
  $pos = strpos($line, "<table class");
  if ($pos !== FALSE)
      $text = substr($line, $pos);

  return str_replace("&nbsp;", "", $text);
}


function remove_leading_comment($line)
{
  $text = $line;
  if (substr($line, 0, 4) == "<!--")
  {
     $pos = strpos($line, "<", 4);
     if ($pos !== FALSE)
        $text = substr($line, $pos + 4);
     else
        $text = "";
  }
  return $text;
}

function get_leading_tag($line)
{
  $tag = "";
  if (substr($line, 0, 1) == "<")
  {
     $pos = strpos($line, ">");
     if ($pos !== FALSE)
        $tag = substr($line, 0, $pos + 1);
     else
        $tag = $line;
  }
  return $tag;
}

function get_leading_text($line)
{
  $text = "";
  if (substr($line, 0, 1) != "<")
  {
     $pos = strpos($line, "<");
     if ($pos !== FALSE)
        $text = substr($line, 0, $pos);
     else
        $text = $line;
  }
  return $text;
}

function get_next_text($line)
{
  $text = "";
  if (substr($line, 0, 1) == "<")
  {
     $pos = strpos($line, ">");
     if ($pos !== FALSE)
        $text = substr($line, $pos + 1);
     else
        $text = "";
  } else {
     $pos = strpos($line, "<");
     if ($pos !== FALSE)
        $text = substr($line, $pos);
     else
        $text = "";
  }
  return trim($text);
}

/* Processing fns */
function Generate_Table($outfile, $line, $monyear)
{
   $InTable = FALSE;
   $InRow   = FALSE;
   $InCell  = FALSE;
   $OnRow   = 0;

   $file = fopen($outfile, 'w');
   $line = skip_to_table($line);
   while ($line != "" )
   {
      $tag  = get_leading_tag($line);
      $text = get_leading_text($line);
      $line = get_next_text($line);

          if ( $InTable && stristr($tag, "</table>")     == TRUE ) $InTable = FALSE;
      elseif ( $InRow   && stristr($tag, "</tr>")        == TRUE )
      {
         $InRow   = FALSE;
         if ( $OnRow > 1) fwrite($file, "\n");
      }
      elseif ( $InCell  && stristr($tag, "</td>")        == TRUE )$InCell  = FALSE;
      elseif (!$InTable && stristr($tag, "<table class") == TRUE) $InTable = TRUE;
      elseif ( $InTable && stristr($tag, "<tr")          == TRUE)
      {
         $InRow   = TRUE;
         $OnRow++;
      }
      elseif ( $InRow   && stristr($tag, "<td")          == TRUE) $InCell  = TRUE;
      elseif ( $InCell  && $OnRow > 1 && $text           != "" ) fwrite($file, '"' . $text . '",');
   }
   fclose($file);
}

function Read_File($infile, $outfile, $monyear)
{
   $lines = file($infile);
   foreach($lines as $line)
      if ( stristr($line, "<table class") == TRUE)
         Generate_Table($outfile, trim($line), $monyear );
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
          $monyear  = str_replace(".html", "",  str_replace("ICv2 - Top 300 Comics Actual--", "", $file));
          $csvfile  = $tgt_dir . $monyear . ".csv";
          Read_File($fullfile, $csvfile, $monyear);
      }
   }
}


$src_dir="F:/Comics/icv2_V2/";
$tgt_dir="F:/Comics/icv2_csv/";

Find_Files($src_dir, $tgt_dir);


?>

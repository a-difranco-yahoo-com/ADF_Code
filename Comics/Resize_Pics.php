<?php

include('SimpleImage.php');
include('Comic.php');
$base_dir=Comic::Drive . "Downloads/Pictures/Unsorted";

Find_Pics($base_dir);

/* List Issue dir to find pages to resize + zip */
function Find_Pics($dir)
{
   chdir("$dir/");

   $pics = scandir("$dir/");
   foreach ( $pics as $pic )
   {
      if ( $pic != "." && $pic != ".." && $pic != "Thumbs.db" )
      {
          $image = new SimpleImage();
          $image->load($pic);
          $image->scale(50);
          $image->save($pic);
      }

   }
}

?>

<?php

function rename_images($subdir)
{
  $dir = "D:/Downloads/Themes/DesktopBackground/$subdir/";
  $nos = 0;
  $files = scandir($dir);
  foreach ( $files as $file )
  {
     if ( !is_dir("$dir/$file") && $file != '.' && $file != '..' && $file != 'Thumbs.db' )
     {
		 $nos++;
		 $extension = pathinfo($file, PATHINFO_EXTENSION);
printf("$dir/$file => \n");
printf("$dir/$subdir$nos" . "." . $extension . "\n\n");
         rename("$dir/$file", "$dir/$subdir$nos" . "." . $extension);
     }
  }
}

  $dir = "E:/Downloads/Themes/DesktopBackground/";
  $dirs = scandir($dir);
  foreach ( $dirs as $my_dir )
  {
     if ( is_dir("$dir/$my_dir") && $my_dir != '.' && $my_dir != '..' && $file != 'Thumbs.db' )
     {
         rename_images($my_dir);
     }
  }


?>

<?php

function rename_image($FromFile, $ToFile)
{
printf("$FromFile => $ToFile \n");
         rename("$FromFile", "$ToFile");
}

  $dir =  Comic::Drive . "Comics/Download/judge dredd megazine 402";
  
  for ($Nos=1; $Nos < 10;   $Nos++)
	  rename_image($dir . "/0" . $Nos . ".jpg", $dir . "/00" . $Nos . ".jpg");

  for ($Nos=10; $Nos < 100;   $Nos++)
	  rename_image($dir . "/" . $Nos . ".jpg", $dir . "/0" . $Nos . ".jpg");

?>

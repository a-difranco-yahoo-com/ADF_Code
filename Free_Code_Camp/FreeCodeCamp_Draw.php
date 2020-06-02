<?php

require('D:\Php_Code\GitHub_Local\ADF_Code\Free_Code_Camp\FreeCodeCamp_PDF.php');
include 'D:\Php_Code\GitHub_Local\ADF_Code\Free_Code_Camp\Draw_HTML_Section.php';
include 'D:\Php_Code\GitHub_Local\ADF_Code\Free_Code_Camp\Draw_CSS_Section.php';


   $pdf = new FREECODECAMP_PDF();
   GenerateHTMLManual($pdf);
   GenerateCSSManual($pdf);
   $pdf->Output("Free_Code_Camp.pdf", "F");

?>

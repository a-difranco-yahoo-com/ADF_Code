<?php

require('D:\Php_Code\fpdf\fpdf.php');
require('D:\Php_Code\fpdi\fpdi.php');

function include_pdf($pdf, $PDFfile)
{
    $pageCount = $pdf->setSourceFile("D:\My Dropbox\Dropbox\MyBackup\\" . $PDFfile);
    $pdf->AddPage();
    $tplIdx = $pdf->importPage(1);
    $pdf->useTemplate($tplIdx, 0, 0, 210);
}

ini_set('memory_limit', '-1');
$pdf = new FPDI();

include_pdf($pdf, "Payslip 2016-12-31.pdf");
include_pdf($pdf, "Payslip 2017-01-31.pdf");
include_pdf($pdf, "Payslip 2017-02-28.pdf");
include_pdf($pdf, "Payslip 2017-03-30.pdf");
include_pdf($pdf, "Payslip 2017-04-30.pdf");
include_pdf($pdf, "Payslip 2017-05-31.pdf");
include_pdf($pdf, "Payslip 2017-06-30.pdf");
include_pdf($pdf, "Payslip 2017-07-31.pdf");
include_pdf($pdf, "Payslip 2017-08-31.pdf");
include_pdf($pdf, "Payslip 2017-09-30.pdf");
include_pdf($pdf, "Payslip 2017-10-31.pdf");
include_pdf($pdf, "Payslip 2017-11-30.pdf");
include_pdf($pdf, "Payslip 2017-12-31.pdf");
include_pdf($pdf, "Payslip 2018-01-31.pdf");
include_pdf($pdf, "Payslip 2018-02-28.pdf");
include_pdf($pdf, "Payslip 2018-03-31.pdf");
include_pdf($pdf, "Payslip 2018-04-30.pdf");
include_pdf($pdf, "Payslip 2018-05-31.pdf");
include_pdf($pdf, "Payslip 2018-06-30.pdf");
include_pdf($pdf, "Payslip 2018-07-31.pdf");
include_pdf($pdf, "Payslip 2018-08-31.pdf");
include_pdf($pdf, "Payslip 2018-09-30.pdf");
include_pdf($pdf, "Payslip 2018-10-31.pdf");
include_pdf($pdf, "Payslip 2018-11-30.pdf");
include_pdf($pdf, "Payslip 2018-12-31.pdf");
include_pdf($pdf, "Payslip 2019-01-31.pdf");
include_pdf($pdf, "Payslip 2019-02-28.pdf");
include_pdf($pdf, "Payslip 2019-03-31.pdf");
include_pdf($pdf, "Payslip 2019-04-30.pdf");
include_pdf($pdf, "Payslip 2019-05-31.pdf");
include_pdf($pdf, "Payslip 2019-06-30.pdf");
include_pdf($pdf, "Payslip 2019-07-31.pdf");
include_pdf($pdf, "Payslip 2019-08-31.pdf");
include_pdf($pdf, "Payslip 2019-09-30.pdf");
include_pdf($pdf, "Payslip 2019-10-31.pdf");
include_pdf($pdf, "Payslip 2019-11-30.pdf");
include_pdf($pdf, "Payslip 2019-12-31.pdf");
include_pdf($pdf, "Payslip 2020-01-31.pdf");
include_pdf($pdf, "Payslip 2020-02-29.pdf");

$pdf->Output("D:\My Dropbox\Dropbox\MyBackup\Full_Payslip.pdf", "F");

?>
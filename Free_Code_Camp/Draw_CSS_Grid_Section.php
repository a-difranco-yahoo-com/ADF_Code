<?php

   function GenerateGrLesson1($pdf) {
       $pdf->AddLessonTitle("Create Your First CSS Grid");
	   $pdf->AddLessonText("Turn any HTML element into a grid container by setting its display property to grid. This gives you the ability to use all the other properties associated with CSS Grid.");
	   $pdf->AddLessonText("Note: In CSS Grid, the parent element is referred to as the container and its children are called items.");
	   $pdf->AddLessonText("Change the display of the div with the container class to grid.");

	   $pdf->DrawCodeArea("22");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  .d1{background:LightSkyBlue;}");
	   $pdf->AddLessonCode("  .d2{background:LightSalmon;}");
	   $pdf->AddLessonCode("  .d3{background:PaleTurquoise;}");
	   $pdf->AddLessonCode("  .d4{background:LightPink;}");
	   $pdf->AddLessonCode("  .d5{background:PaleGreen;}");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("  .container {");
	   $pdf->AddLessonCode("    font-size: 40px;");
	   $pdf->AddLessonCode("    width: 100%;");
	   $pdf->AddLessonCode("    background: LightGray;");
	   $pdf->AddLessonCode("    display: grid;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("<div class='container'>");
	   $pdf->AddLessonCode("  <div class='d1'>1</div>");
	   $pdf->AddLessonCode("  <div class='d2'>2</div>");
	   $pdf->AddLessonCode("  <div class='d3'>3</div>");
	   $pdf->AddLessonCode("  <div class='d4'>4</div>");
	   $pdf->AddLessonCode("  <div class='d5'>5</div>");
	   $pdf->AddLessonCode("</div>");
   }
 
   function GenerateGrLesson2($pdf) {
       $pdf->AddLessonTitle("Add Columns with grid-template-columns");
	   $pdf->AddLessonText("Simply creating a grid element doesn't get you very far. You need to define the structure of the grid as well. To add some columns to the grid, use the grid-template-columns property on a grid container as demonstrated below:");

	   $pdf->DrawCodeArea("4");
	   $pdf->AddLessonCode(".container {");
	   $pdf->AddLessonCode("  display: grid;");
	   $pdf->AddLessonCode("  grid-template-columns: 50px 50px;");
	   $pdf->AddLessonCode("}");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("This will give your grid two columns that are each 50px wide. The number of parameters given to the grid-template-columns property indicates the number of columns in the grid, and the value of each parameter indicates the width of each column.");
	   $pdf->AddLessonText("Give the grid container three columns that are each 100px wide.");


	   $pdf->DrawCodeArea("23");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  .d1{background:LightSkyBlue;}");
	   $pdf->AddLessonCode("  .d2{background:LightSalmon;}");
	   $pdf->AddLessonCode("  .d3{background:PaleTurquoise;}");
	   $pdf->AddLessonCode("  .d4{background:LightPink;}");
	   $pdf->AddLessonCode("  .d5{background:PaleGreen;}");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("  .container {");
	   $pdf->AddLessonCode("    font-size: 40px;");
	   $pdf->AddLessonCode("    width: 100%;");
	   $pdf->AddLessonCode("    background: LightGray;");
	   $pdf->AddLessonCode("    display: grid;");
	   $pdf->AddLessonCode("    grid-template-columns: 100px 100px 100px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("<div class='container'>");
	   $pdf->AddLessonCode("  <div class='d1'>1</div>");
	   $pdf->AddLessonCode("  <div class='d2'>2</div>");
	   $pdf->AddLessonCode("  <div class='d3'>3</div>");
	   $pdf->AddLessonCode("  <div class='d4'>4</div>");
	   $pdf->AddLessonCode("  <div class='d5'>5</div>");
	   $pdf->AddLessonCode("</div>");
   }
 


 function GenerateCSSGridManual($pdf) {
	   $pdf->AddSubject("Introduction to the CSS Grid Challenges");
	   GenerateGrLesson1($pdf);
	   GenerateGrLesson2($pdf);
   }

?>
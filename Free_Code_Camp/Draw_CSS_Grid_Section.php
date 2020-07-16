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
 
   function GenerateGrLesson3($pdf) {
       $pdf->AddLessonTitle("Add Rows with grid-template-rows");
	   $pdf->AddLessonText("The grid you created in the last challenge will set the number of rows automatically. To adjust the rows manually, use the grid-template-rows property in the same way you used grid-template-columns in previous challenge.");
	   $pdf->AddLessonText("Add two rows to the grid that are 50px tall each.");

	   $pdf->DrawCodeArea("24");
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
	   $pdf->AddLessonCode("    grid-template-rows:    50px  50px;");
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
 
   function GenerateGrLesson4($pdf) {
       $pdf->AddLessonTitle("Use CSS Grid units to Change the Size of Columns and Rows");
	   $pdf->AddLessonText("You can use absolute and relative units like px and em in CSS Grid to define the size of rows and columns. You can use these as well:");
	   $pdf->AddLessonText("fr: sets the column or row to a fraction of the available space,");
	   $pdf->AddLessonText("auto: sets the column or row to the width or height of its content automatically,");
	   $pdf->AddLessonText("%: adjusts the column or row to the percent width of its container.");
	   $pdf->AddLessonText("Here's the code that generates the output in the preview:");

	   $pdf->DrawCodeArea("1");
	   $pdf->AddLessonCode("grid-template-columns: auto 50px 10% 2fr 1fr;");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("This snippet creates five columns. The first column is as wide as its content, the second column is 50px, the third column is 10% of its container, and for the last two columns; the remaining space is divided into three sections, two are allocated for the fourth column, and one for the fifth.");
	   $pdf->AddLessonText("Make a grid with three columns whose widths are as follows: 1fr, 100px, and 2fr.");

	   $pdf->DrawCodeArea("24");
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
	   $pdf->AddLessonCode("    grid-template-columns: 1fr 100px 2fr;");
	   $pdf->AddLessonCode("    grid-template-rows:    50px  50px;");
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
 
   function GenerateGrLesson5($pdf) {
       $pdf->AddLessonTitle("Create a Column Gap Using grid-column-gap");
	   $pdf->AddLessonText("So far in the grids you have created, the columns have all been tight up against each other. Sometimes you want a gap in between the columns. To add a gap between the columns, use the grid-column-gap property like this:");

	   $pdf->DrawCodeArea("1");
	   $pdf->AddLessonCode("grid-column-gap: 10px;");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("This creates 10px of empty space between all of our columns.");
	   $pdf->AddLessonText("Give the columns in the grid a 20px gap.");

	   $pdf->DrawCodeArea("26");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  .d1{background:LightSkyBlue;}");
	   $pdf->AddLessonCode("  .d2{background:LightSalmon;}");
	   $pdf->AddLessonCode("  .d3{background:PaleTurquoise;}");
	   $pdf->AddLessonCode("  .d4{background:LightPink;}");
	   $pdf->AddLessonCode("  .d5{background:PaleGreen;}");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("  .container {");
	   $pdf->AddLessonCode("    font-size: 40px;");
	   $pdf->AddLessonCode("    min-height: 300px;");
	   $pdf->AddLessonCode("    width: 100%;");
	   $pdf->AddLessonCode("    background: LightGray;");
	   $pdf->AddLessonCode("    display: grid;");
	   $pdf->AddLessonCode("    grid-template-columns: 1fr 1fr 1fr;");
	   $pdf->AddLessonCode("    grid-template-rows:    1fr 1fr 1fr;");
	   $pdf->AddLessonCode("    grid-column-gap:       20px;");
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
 
   function GenerateGrLesson6($pdf) {
       $pdf->AddLessonTitle("Create a Row Gap using grid-row-gap");
	   $pdf->AddLessonText("You can add a gap in between the rows of a grid using grid-row-gap in the same way that you added a gap in between columns in the previous challenge.");
	   $pdf->AddLessonText("Create a gap for the rows that is 5px tall.");

	   $pdf->DrawCodeArea("26");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  .d1{background:LightSkyBlue;}");
	   $pdf->AddLessonCode("  .d2{background:LightSalmon;}");
	   $pdf->AddLessonCode("  .d3{background:PaleTurquoise;}");
	   $pdf->AddLessonCode("  .d4{background:LightPink;}");
	   $pdf->AddLessonCode("  .d5{background:PaleGreen;}");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("  .container {");
	   $pdf->AddLessonCode("    font-size: 40px;");
	   $pdf->AddLessonCode("    min-height: 300px;");
	   $pdf->AddLessonCode("    width: 100%;");
	   $pdf->AddLessonCode("    background: LightGray;");
	   $pdf->AddLessonCode("    display: grid;");
	   $pdf->AddLessonCode("    grid-template-columns: 1fr 1fr 1fr;");
	   $pdf->AddLessonCode("    grid-template-rows:    1fr 1fr 1fr;");
	   $pdf->AddLessonCode("    grid-row-gap:          5px;");
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
	   GenerateGrLesson3($pdf);
	   GenerateGrLesson4($pdf);
	   GenerateGrLesson5($pdf);
	   GenerateGrLesson6($pdf);
   }

?>
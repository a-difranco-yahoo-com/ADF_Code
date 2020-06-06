<?php

   function GenerateAVDLesson1($pdf) {
       $pdf->AddLessonTitle("Create Visual Balance Using the text-align Property");
	   $pdf->AddLessonText("This section of the curriculum focuses on Applied Visual Design. The first group of challenges build on the given card layout to show a number of core principles.");
	   $pdf->AddLessonText("Text is often a large part of web content. CSS has several options for how to align it with the text-align property.");
	   $pdf->AddLessonText("text-align: justify; causes all lines of text except the last line to meet the left and right edges of the line box.");
	   $pdf->AddLessonText("text-align: center; centers the text");
	   $pdf->AddLessonText("text-align: right; right-aligns the text");
	   $pdf->AddLessonText("And text-align: left; (the default) left-aligns the text.");
	   $pdf->AddLessonText("Align the h4 tag's text, which says 'Google', to the center. Then justify the paragraph tag which contains information about how Google was founded.");

	   $pdf->DrawCodeArea("36");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  h4 {");
	   $pdf->AddLessonCode("    text-align: center; ");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  p {");
	   $pdf->AddLessonCode("    text-align: justify;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  .links {");
	   $pdf->AddLessonCode("    margin-right: 20px;");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  .fullCard {");
	   $pdf->AddLessonCode("    border: 1px solid #ccc;");
	   $pdf->AddLessonCode("    border-radius: 5px;");
	   $pdf->AddLessonCode("    margin: 10px 5px;");
	   $pdf->AddLessonCode("    padding: 4px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  .cardContent {");
	   $pdf->AddLessonCode("    padding: 10px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("<div class='fullCard'>");
	   $pdf->AddLessonCode("  <div class='cardContent'>");
	   $pdf->AddLessonCode("    <div class='cardText'>");
	   $pdf->AddLessonCode("      <h4>Google</h4>");
	   $pdf->AddLessonCode("      <p>Google was founded by Larry Page and Sergey Brin while they were Ph.D. students at Stanford University.</p>");
	   $pdf->AddLessonCode("    </div>");
	   $pdf->AddLessonCode("    <div class='cardLinks'>");
	   $pdf->AddLessonCode("      <a href='https://en.wikipedia.org/wiki/Larry_Page' target='_blank' class='links'>Larry Page</a>");
	   $pdf->AddLessonCode("      <a href='https://en.wikipedia.org/wiki/Sergey_Brin' target='_blank' class='links'>Sergey Brin</a>");
	   $pdf->AddLessonCode("    </div>");
	   $pdf->AddLessonCode("  </div>");
	   $pdf->AddLessonCode("</div>");
   }
   

   function GenerateVisualDesignManual($pdf) {
	   $pdf->AddSubject("Introduction to the Applied Visual Design Challenges");
	   GenerateAVDLesson1($pdf);
   }

?>
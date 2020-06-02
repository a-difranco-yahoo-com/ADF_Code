<?php

   function GenerateCSSLesson1($pdf) {
       $pdf->AddLessonTitle("Change the Color of Text");
	   $pdf->AddLessonText("Now let's change the color of some of our text.");
	   $pdf->AddLessonText("We can do this by changing the style of your h2 element.");
	   $pdf->AddLessonText("The property that is responsible for the color of an element's text is the color style property.");
	   $pdf->AddLessonText("Here's how you would set your h2 element's text color to blue:");

	   $pdf->DrawCodeArea("1");
	   $pdf->AddLessonCode("<h2 style='color: blue;'>CatPhotoApp</h2>");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Note that it is a good practice to end inline style declarations with a ; .");
	   $pdf->AddLessonText("Change your h2 element's style so that its text color is red.");

	   $pdf->DrawCodeArea("35");
	   $pdf->AddLessonCode("<h2 style='color: red;'>CatPhotoApp</h2>");
	   $pdf->AddLessonCode("<main>");
	   $pdf->AddLessonCode("  <p>Click here to view more <a href='#'>cat photos</a>.</p>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("  <a href='#'><img src='https://bit.ly/fcc-relaxing-cat' alt='A cute orange cat lying on its back.'></a>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("  <div>");
	   $pdf->AddLessonCode("    <p>Things cats love:</p>");
	   $pdf->AddLessonCode("    <ul>");
	   $pdf->AddLessonCode("      <li>cat nip</li>");
	   $pdf->AddLessonCode("      <li>laser pointers</li>");
	   $pdf->AddLessonCode("      <li>lasagna</li>");
	   $pdf->AddLessonCode("    </ul>");
	   $pdf->AddLessonCode("    <p>Top 3 things cats hate:</p>");
	   $pdf->AddLessonCode("    <ol>");
	   $pdf->AddLessonCode("      <li>flea treatment</li>");
	   $pdf->AddLessonCode("      <li>thunder</li>");
	   $pdf->AddLessonCode("      <li>other cats</li>");
	   $pdf->AddLessonCode("    </ol>");
	   $pdf->AddLessonCode("  </div>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("  <form action='/submit-cat-photo'>");
	   $pdf->AddLessonCode("    <label><input type='radio' name='indoor-outdoor' checked> Indoor</label>");
	   $pdf->AddLessonCode("    <label><input type='radio' name='indoor-outdoor'> Outdoor</label><br>");
	   $pdf->AddLessonCode("    <label><input type='checkbox' name='personality' checked> Loving</label>");
	   $pdf->AddLessonCode("    <label><input type='checkbox' name='personality'> Lazy</label>");
	   $pdf->AddLessonCode("    <label><input type='checkbox' name='personality'> Energetic</label><br>");
	   $pdf->AddLessonCode("    <input type='text' placeholder='cat photo URL' required>");
	   $pdf->AddLessonCode("    <button type='submit'>Submit</button>");
	   $pdf->AddLessonCode("  </form>");
	   $pdf->AddLessonCode("</main>");
   }
   
   function GenerateCSSLesson2($pdf) {
       $pdf->AddLessonTitle("Use CSS Selectors to Style Elements");
	   $pdf->AddLessonText("With CSS, there are hundreds of CSS properties that you can use to change the way an element looks on your page.");
	   $pdf->AddLessonText("When you entered <h2 style='color: red;'>CatPhotoApp</h2>, you were styling that individual h2 element with inline CSS, which stands for Cascading Style Sheets.");
	   $pdf->AddLessonText("That's one way to specify the style of an element, but there's a better way to apply CSS.");
	   $pdf->AddLessonText("At the top of your code, create a style block like this:");

	   $pdf->DrawCodeArea("2");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("</style>");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Inside that style block, you can create a CSS selector for all h2 elements. For example, if you wanted all h2 elements to be red, you would add a style rule that looks like this:");

	   $pdf->DrawCodeArea("5");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  h2 {");
	   $pdf->AddLessonCode("    color: red;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("</style>");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Note that it's important to have both opening and closing curly braces ({ and }) around each element's style rule(s). You also need to make sure that your element's style definition is between the opening and closing style tags. Finally, be sure to add a semicolon to the end of each of your element's style rules.");
	   $pdf->AddLessonText("Delete your h2 element's style attribute, and instead create a CSS style block. Add the necessary CSS to turn all h2 elements blue.");

       $pdf->AddLessonTitle("Use CSS Selectors to Style Elements (Cont'd)");
	   $pdf->DrawCodeArea("42");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  h2 {");
	   $pdf->AddLessonCode("    color: blue;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("<h2>CatPhotoApp</h2>");
	   $pdf->AddLessonCode("<main>");
	   $pdf->AddLessonCode("  <p>Click here to view more <a href='#'>cat photos</a>.</p>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("  <a href='#'><img src='https://bit.ly/fcc-relaxing-cat' alt='A cute orange cat lying on its back.'></a>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("  <div>");
	   $pdf->AddLessonCode("    <p>Things cats love:</p>");
	   $pdf->AddLessonCode("    <ul>");
	   $pdf->AddLessonCode("      <li>cat nip</li>");
	   $pdf->AddLessonCode("      <li>laser pointers</li>");
	   $pdf->AddLessonCode("      <li>lasagna</li>");
	   $pdf->AddLessonCode("    </ul>");
	   $pdf->AddLessonCode("    <p>Top 3 things cats hate:</p>");
	   $pdf->AddLessonCode("    <ol>");
	   $pdf->AddLessonCode("      <li>flea treatment</li>");
	   $pdf->AddLessonCode("      <li>thunder</li>");
	   $pdf->AddLessonCode("      <li>other cats</li>");
	   $pdf->AddLessonCode("    </ol>");
	   $pdf->AddLessonCode("  </div>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("  <form action='/submit-cat-photo'>");
	   $pdf->AddLessonCode("    <label><input type='radio' name='indoor-outdoor' checked> Indoor</label>");
	   $pdf->AddLessonCode("    <label><input type='radio' name='indoor-outdoor'> Outdoor</label><br>");
	   $pdf->AddLessonCode("    <label><input type='checkbox' name='personality' checked> Loving</label>");
	   $pdf->AddLessonCode("    <label><input type='checkbox' name='personality'> Lazy</label>");
	   $pdf->AddLessonCode("    <label><input type='checkbox' name='personality'> Energetic</label><br>");
	   $pdf->AddLessonCode("    <input type='text' placeholder='cat photo URL' required>");
	   $pdf->AddLessonCode("    <button type='submit'>Submit</button>");
	   $pdf->AddLessonCode("  </form>");
	   $pdf->AddLessonCode("</main>");
   }
	   


   function GenerateCSSManual($pdf) {
	   $pdf->AddSubject("Introduction to Basic CSS");
	   GenerateCSSLesson1($pdf);
	   GenerateCSSLesson2($pdf);
   }

?>
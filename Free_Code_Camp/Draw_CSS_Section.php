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
	   
   function GenerateCSSLesson3($pdf) {
       $pdf->AddLessonTitle("Use a CSS Class to Style an Element");
	   $pdf->AddLessonText("Classes are reusable styles that can be added to HTML elements.");
	   $pdf->AddLessonText("Here's an example CSS class declaration:");

	   $pdf->DrawCodeArea("5");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  .blue-text {");
	   $pdf->AddLessonCode("    color: blue;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("</style>");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("You can see that we've created a CSS class called blue-text within the <style> tag. You can apply a class to an HTML element like this: <h2 class='blue-text'>CatPhotoApp</h2> Note that in your CSS style element, class names start with a period. In your HTML elements' class attribute, the class name does not include the period.");
	   $pdf->AddLessonText("Inside your style element, change the h2 selector to .red-text and update the color's value from blue to red.");
	   $pdf->AddLessonText("Give your h2 element the class attribute with a value of 'red-text'.");

       $pdf->AddLessonTitle("Use a CSS Class to Style an Element (Cont'd)");
	   $pdf->DrawCodeArea("42");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  .red-text {");
	   $pdf->AddLessonCode("    color: red;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("<h2 class='red-text'>CatPhotoApp</h2>");
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

   function GenerateCSSLesson4($pdf) {
       $pdf->AddLessonTitle("Style Multiple Elements with a CSS Class");
	   $pdf->AddLessonText("Classes allow you to use the same CSS styles on multiple HTML elements. You can see this by applying your red-text class to the first p element.");

	   $pdf->DrawCodeArea("42");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  .red-text {");
	   $pdf->AddLessonCode("    color: red;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("<h2 class='red-text'>CatPhotoApp</h2>");
	   $pdf->AddLessonCode("<main>");
	   $pdf->AddLessonCode("  <p class='red-text'>Click here to view more <a href='#'>cat photos</a>.</p>");
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

   function GenerateCSSLesson5($pdf) {
       $pdf->AddLessonTitle("Change the Font Size of an Element");
	   $pdf->AddLessonText("Font size is controlled by the font-size CSS property, like this:");

	   $pdf->DrawCodeArea("3");
	   $pdf->AddLessonCode("h1 {");
	   $pdf->AddLessonCode("  font-size: 30px;");
	   $pdf->AddLessonCode("}");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Inside the same <style> tag that contains your red-text class, create an entry for p elements and set the font-size to 16 pixels (16px).");

	   $pdf->DrawCodeArea("45");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  .red-text {");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  p {");
	   $pdf->AddLessonCode("    font-size: 16px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("<h2 class='red-text'>CatPhotoApp</h2>");
	   $pdf->AddLessonCode("<main>");
	   $pdf->AddLessonCode("  <p class='red-text'>Click here to view more <a href='#'>cat photos</a>.</p>");
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

   function GenerateCSSLesson6($pdf) {
       $pdf->AddLessonTitle("Set the Font Family of an Element");
	   $pdf->AddLessonText("You can set which font an element should use, by using the font-family property.");
	   $pdf->AddLessonText("For example, if you wanted to set your h2 element's font to sans-serif, you would use the following CSS:");

	   $pdf->DrawCodeArea("3");
	   $pdf->AddLessonCode("h2 {");
	   $pdf->AddLessonCode("  font-family: sans-serif;");
	   $pdf->AddLessonCode("}");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Make all of your p elements use the monospace font.");

	   $pdf->DrawCodeArea("46");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  .red-text {");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  p {");
	   $pdf->AddLessonCode("    font-size: 16px;");
	   $pdf->AddLessonCode("    font-family: monospace;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("<h2 class='red-text'>CatPhotoApp</h2>");
	   $pdf->AddLessonCode("<main>");
	   $pdf->AddLessonCode("  <p class='red-text'>Click here to view more <a href='#'>cat photos</a>.</p>");
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

   function GenerateCSSLesson7($pdf) {
       $pdf->AddLessonTitle("Import a Google Font");
	   $pdf->AddLessonText("In addition to specifying common fonts that are found on most operating systems, we can also specify non-standard, custom web fonts for use on our website. There are many sources for web fonts on the Internet. For this example we will focus on the Google Fonts library.");
	   $pdf->AddLessonText("Google Fonts is a free library of web fonts that you can use in your CSS by referencing the font's URL.");
	   $pdf->AddLessonText("So, let's go ahead and import and apply a Google font (note that if Google is blocked in your country, you will need to skip this challenge).");
	   $pdf->AddLessonText("To import a Google Font, you can copy the font(s) URL from the Google Fonts library and then paste it in your HTML. For this challenge, we'll import the Lobster font. To do this, copy the following code snippet and paste it into the top of your code editor (before the opening style element):");

	   $pdf->DrawCodeArea("1");
	   $pdf->AddLessonCode("<link href='https://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css'>");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Now you can use the Lobster font in your CSS by using Lobster as the FAMILY_NAME as in the following example:");

	   $pdf->DrawCodeArea("1");
	   $pdf->AddLessonCode("font-family: FAMILY_NAME, GENERIC_NAME;.");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("The GENERIC_NAME is optional, and is a fallback font in case the other specified font is not available. This is covered in the next challenge.");
	   $pdf->AddLessonText("Family names are case-sensitive and need to be wrapped in quotes if there is a space in the name. For example, you need quotes to use the 'Open Sans' font, but not to use the Lobster font.");
	   $pdf->AddLessonText("Create a font-family CSS rule that uses the Lobster font, and ensure that it will be applied to your h2 element.");

       $pdf->AddLessonTitle("Import a Google Font (Cont'd)");
	   $pdf->DrawCodeArea("51");
	   $pdf->AddLessonCode("<link href='https://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css'>");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  .red-text {");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  p {");
	   $pdf->AddLessonCode("    font-size: 16px;");
	   $pdf->AddLessonCode("    font-family: monospace;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  h2 {");
	   $pdf->AddLessonCode("    font-family: Lobster;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("<h2 class='red-text'>CatPhotoApp</h2>");
	   $pdf->AddLessonCode("<main>");
	   $pdf->AddLessonCode("  <p class='red-text'>Click here to view more <a href='#'>cat photos</a>.</p>");
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

   function GenerateCSSLesson8($pdf) {
       $pdf->AddLessonTitle("Specify How Fonts Should Degrade");
	   $pdf->AddLessonText("There are several default fonts that are available in all browsers. These generic font families include monospace, serif and sans-serif");
	   $pdf->AddLessonText("When one font isn't available, you can tell the browser to 'degrade' to another font.");
	   $pdf->AddLessonText("For example, if you wanted an element to use the Helvetica font, but degrade to the sans-serif font when Helvetica isn't available, you will specify it as follows:");

	   $pdf->DrawCodeArea("3");
	   $pdf->AddLessonCode("p {");
	   $pdf->AddLessonCode("  font-family: Helvetica, sans-serif;");
	   $pdf->AddLessonCode("}");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Generic font family names are not case-sensitive. Also, they do not need quotes because they are CSS keywords.");
	   $pdf->AddLessonText("To begin, apply the monospace font to the h2 element, so that it now has two fonts - Lobster and monospace.");
	   $pdf->AddLessonText("In the last challenge, you imported the Lobster font using the link tag. Now comment out that import of the Lobster font (using the HTML comments you learned before) from Google Fonts so that it isn't available anymore. Notice how your h2 element degrades to the monospace font.");
	   $pdf->AddLessonText("Note: If you have the Lobster font installed on your computer, you won't see the degradation because your browser is able to find the font.");

       $pdf->AddLessonTitle("Specify How Fonts Should Degrade (Cont'd)");
	   $pdf->DrawCodeArea("51");
	   $pdf->AddLessonCode("<!-- <link href='https://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css'> -->");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  .red-text {");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  p {");
	   $pdf->AddLessonCode("    font-size: 16px;");
	   $pdf->AddLessonCode("    font-family: monospace;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  h2 {");
	   $pdf->AddLessonCode("    font-family: Lobster, monospace;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("<h2 class='red-text'>CatPhotoApp</h2>");
	   $pdf->AddLessonCode("<main>");
	   $pdf->AddLessonCode("  <p class='red-text'>Click here to view more <a href='#'>cat photos</a>.</p>");
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

   function GenerateCSSLesson9($pdf) {
       $pdf->AddLessonTitle("Size Your Images");
	   $pdf->AddLessonText("CSS has a property called width that controls an element's width. Just like with fonts, we'll use px (pixels) to specify the image's width.");
	   $pdf->AddLessonText("For example, if we wanted to create a CSS class called larger-image that gave HTML elements a width of 500 pixels, we'd use:");

	   $pdf->DrawCodeArea("5");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  .larger-image {");
	   $pdf->AddLessonCode("    width: 500px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("</style>");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Create a class called smaller-image and use it to resize the image so that it's only 100 pixels wide.");
	   $pdf->AddLessonText("Note: Due to browser implementation differences, you may need to be at 100% zoom to pass the tests on this challenge.");

       $pdf->AddLessonTitle("Size Your Images (Cont'd)");
	   $pdf->DrawCodeArea("55");
	   $pdf->AddLessonCode("<link href='https://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css'>");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  .red-text {");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  p {");
	   $pdf->AddLessonCode("    font-size: 16px;");
	   $pdf->AddLessonCode("    font-family: monospace;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  .smaller-image {");
	   $pdf->AddLessonCode("    width: 100px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  h2 {");
	   $pdf->AddLessonCode("    font-family: Lobster, monospace;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("<h2 class='red-text'>CatPhotoApp</h2>");
	   $pdf->AddLessonCode("<main>");
	   $pdf->AddLessonCode("  <p class='red-text'>Click here to view more <a href='#'>cat photos</a>.</p>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("  <a href='#'><img class='smaller-image' src='https://bit.ly/fcc-relaxing-cat' alt='A cute orange cat lying on its back.'></a>");
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

   function GenerateCSSLesson10($pdf) {
       $pdf->AddLessonTitle("Add Borders Around Your Elements");
	   $pdf->AddLessonText("CSS borders have properties like style, color and width.");
	   $pdf->AddLessonText("For example, if we wanted to create a red, 5 pixel border around an HTML element, we could use this class:");


	   $pdf->DrawCodeArea("7");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  .thin-red-border {");
	   $pdf->AddLessonCode("    border-color: red;");
	   $pdf->AddLessonCode("    border-width: 5px;");
	   $pdf->AddLessonCode("    border-style: solid;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("</style>");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Create a class called thick-green-border. This class should add a 10px, solid, green border around an HTML element. Apply the class to your cat photo.");
	   $pdf->AddLessonText("Remember that you can apply multiple classes to an element using its class attribute, by separating each class name with a space. For example:");

	   $pdf->DrawCodeArea("1");
	   $pdf->AddLessonCode("<img class='class1 class'>");

       $pdf->AddLessonTitle("Add Borders Around Your Elements (Cont'd)");
	   $pdf->DrawCodeArea("61");
	   $pdf->AddLessonCode("<link href='https://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css'>");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  .red-text {");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  p {");
	   $pdf->AddLessonCode("    font-size: 16px;");
	   $pdf->AddLessonCode("    font-family: monospace;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  .smaller-image {");
	   $pdf->AddLessonCode("    width: 100px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  h2 {");
	   $pdf->AddLessonCode("    font-family: Lobster, monospace;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  .thick-green-border {");
	   $pdf->AddLessonCode("    border-color: green;");
	   $pdf->AddLessonCode("    border-width: 10px;");
	   $pdf->AddLessonCode("    border-style: solid;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("<h2 class='red-text'>CatPhotoApp</h2>");
	   $pdf->AddLessonCode("<main>");
	   $pdf->AddLessonCode("  <p class='red-text'>Click here to view more <a href='#'>cat photos</a>.</p>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("  <a href='#'><img class='smaller-image thick-green-border' src='https://bit.ly/fcc-relaxing-cat' alt='A cute orange cat lying on its back.'></a>");
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

   function GenerateCSSLesson11($pdf) {
       $pdf->AddLessonTitle("Add Rounded Corners with border-radius");
	   $pdf->AddLessonText("Your cat photo currently has sharp corners. We can round out those corners with a CSS property called border-radius.");
	   $pdf->AddLessonText("You can specify a border-radius with pixels. Give your cat photo a border-radius of 10px.");
	   $pdf->AddLessonText("Note: This challenge allows for multiple possible solutions. For example, you may add border-radius to either the .thick-green-border class or the .smaller-image class.");

       $pdf->AddLessonTitle("Add Rounded Corners with border-radius (Cont'd)");
	   $pdf->DrawCodeArea("61");
	   $pdf->AddLessonCode("<link href='https://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css'>");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  .red-text {");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  p {");
	   $pdf->AddLessonCode("    font-size: 16px;");
	   $pdf->AddLessonCode("    font-family: monospace;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  .smaller-image {");
	   $pdf->AddLessonCode("    width: 100px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  h2 {");
	   $pdf->AddLessonCode("    font-family: Lobster, monospace;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  .thick-green-border {");
	   $pdf->AddLessonCode("    border-color: green;");
	   $pdf->AddLessonCode("    border-width: 10px;");
	   $pdf->AddLessonCode("    border-radius: 10px;");
	   $pdf->AddLessonCode("    border-style: solid;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("<h2 class='red-text'>CatPhotoApp</h2>");
	   $pdf->AddLessonCode("<main>");
	   $pdf->AddLessonCode("  <p class='red-text'>Click here to view more <a href='#'>cat photos</a>.</p>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("  <a href='#'><img class='smaller-image thick-green-border' src='https://bit.ly/fcc-relaxing-cat' alt='A cute orange cat lying on its back.'></a>");
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

   function GenerateCSSLesson12($pdf) {
       $pdf->AddLessonTitle("Make Circular Images with a border-radius");
	   $pdf->AddLessonText("In addition to pixels, you can also specify the border-radius using a percentage.");
	   $pdf->AddLessonText("Give your cat photo a border-radius of 50%.");

       $pdf->AddLessonTitle("Make Circular Images with a border-radius (Cont'd)");
	   $pdf->DrawCodeArea("61");
	   $pdf->AddLessonCode("<link href='https://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css'>");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  .red-text {");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  p {");
	   $pdf->AddLessonCode("    font-size: 16px;");
	   $pdf->AddLessonCode("    font-family: monospace;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  .smaller-image {");
	   $pdf->AddLessonCode("    width: 100px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  h2 {");
	   $pdf->AddLessonCode("    font-family: Lobster, monospace;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  .thick-green-border {");
	   $pdf->AddLessonCode("    border-color: green;");
	   $pdf->AddLessonCode("    border-width: 10px;");
	   $pdf->AddLessonCode("    border-radius: 50%;");
	   $pdf->AddLessonCode("    border-style: solid;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("<h2 class='red-text'>CatPhotoApp</h2>");
	   $pdf->AddLessonCode("<main>");
	   $pdf->AddLessonCode("  <p class='red-text'>Click here to view more <a href='#'>cat photos</a>.</p>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("  <a href='#'><img class='smaller-image thick-green-border' src='https://bit.ly/fcc-relaxing-cat' alt='A cute orange cat lying on its back.'></a>");
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
	   GenerateCSSLesson3($pdf);
	   GenerateCSSLesson4($pdf);
	   GenerateCSSLesson5($pdf);
	   GenerateCSSLesson6($pdf);
	   GenerateCSSLesson7($pdf);
	   GenerateCSSLesson8($pdf);
	   GenerateCSSLesson9($pdf);
	   GenerateCSSLesson10($pdf);
	   GenerateCSSLesson11($pdf);
	   GenerateCSSLesson12($pdf);
   }

?>
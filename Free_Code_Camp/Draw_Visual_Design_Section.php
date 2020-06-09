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
   
   function GenerateAVDLesson2($pdf) {
       $pdf->AddLessonTitle("Adjust the Width of an Element Using the width Property");
	   $pdf->AddLessonText("You can specify the width of an element using the width property in CSS. Values can be given in relative length units (such as em), absolute length units (such as px), or as a percentage of its containing parent element. Here's an example that changes the width of an image to 220px:");

	   $pdf->DrawCodeArea("3");
	   $pdf->AddLessonCode("img {");
	   $pdf->AddLessonCode("  width: 220px;");
	   $pdf->AddLessonCode("}");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Add a width property to the entire card and set it to an absolute value of 245px. Use the fullCard class to select the element.");

	   $pdf->DrawCodeArea("38");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  h4 {");
	   $pdf->AddLessonCode("    text-align: center; ");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  p {");
	   $pdf->AddLessonCode("    text-align: justify;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  .links {");
	   $pdf->AddLessonCode("    margin-right: 20px;");
	   $pdf->AddLessonCode("    text-align: left; ");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  .fullCard {");
	   $pdf->AddLessonCode("    border: 1px solid #ccc;");
	   $pdf->AddLessonCode("    border-radius: 5px;");
	   $pdf->AddLessonCode("    margin: 10px 5px;");
	   $pdf->AddLessonCode("    padding: 4px;");
	   $pdf->AddLessonCode("    width: 245px;");
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

   function GenerateAVDLesson3($pdf) {
       $pdf->AddLessonTitle("Adjust the Height of an Element Using the height Property");
	   $pdf->AddLessonText("You can specify the height of an element using the height property in CSS, similar to the width property. Here's an example that changes the height of an image to 20px:");

	   $pdf->DrawCodeArea("3");
	   $pdf->AddLessonCode("img {");
	   $pdf->AddLessonCode("  height: 20px;");
	   $pdf->AddLessonCode("}");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Add a height property to the h4 tag and set it to 25px.");
	   $pdf->AddLessonText("Note: You may need to be at 100% zoom to pass the test on this challenge.");

	   $pdf->DrawCodeArea("39");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  h4 {");
	   $pdf->AddLessonCode("    text-align: center; ");
	   $pdf->AddLessonCode("    height: 25px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  p {");
	   $pdf->AddLessonCode("    text-align: justify;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  .links {");
	   $pdf->AddLessonCode("    margin-right: 20px;");
	   $pdf->AddLessonCode("    text-align: left; ");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  .fullCard {");
	   $pdf->AddLessonCode("    border: 1px solid #ccc;");
	   $pdf->AddLessonCode("    border-radius: 5px;");
	   $pdf->AddLessonCode("    margin: 10px 5px;");
	   $pdf->AddLessonCode("    padding: 4px;");
	   $pdf->AddLessonCode("    width: 245px;");
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

   function GenerateAVDLesson4($pdf) {
       $pdf->AddLessonTitle("Use the strong Tag to Make Text Bold");
	   $pdf->AddLessonText("To make text bold, you can use the strong tag. This is often used to draw attention to text and symbolize that it is important. With the strong tag, the browser applies the CSS of font-weight: bold; to the element.");
	   $pdf->AddLessonText("Wrap a strong tag around 'Stanford University' inside the p tag (do not include the period).");

	   $pdf->DrawCodeArea("39");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  h4 {");
	   $pdf->AddLessonCode("    text-align: center; ");
	   $pdf->AddLessonCode("    height: 25px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  p {");
	   $pdf->AddLessonCode("    text-align: justify;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  .links {");
	   $pdf->AddLessonCode("    text-align: left; ");
	   $pdf->AddLessonCode("    color: black;");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  .fullCard {");
	   $pdf->AddLessonCode("    width: 245px;");
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
	   $pdf->AddLessonCode("      <p>Google was founded by Larry Page and Sergey Brin while they were Ph.D. students at <strong>Stanford University</strong>.</p>");
	   $pdf->AddLessonCode("    </div>");
	   $pdf->AddLessonCode("    <div class='cardLinks'>");
	   $pdf->AddLessonCode("      <a href='https://en.wikipedia.org/wiki/Larry_Page' target='_blank' class='links'>Larry Page</a>");
	   $pdf->AddLessonCode("      <a href='https://en.wikipedia.org/wiki/Sergey_Brin' target='_blank' class='links'>Sergey Brin</a>");
	   $pdf->AddLessonCode("    </div>");
	   $pdf->AddLessonCode("  </div>");
	   $pdf->AddLessonCode("</div>");
   }

   function GenerateAVDLesson5($pdf) {
       $pdf->AddLessonTitle("Use the u Tag to Underline Text");
	   $pdf->AddLessonText("To underline text, you can use the u tag. This is often used to signify that a section of text is important, or something to remember. With the u tag, the browser applies the CSS of text-decoration: underline; to the element.");
	   $pdf->AddLessonText("Wrap the u tag only around the text 'Ph.D. students'.");
	   $pdf->AddLessonText("Note: Try to avoid using the u tag when it could be confused for a link. Anchor tags also have a default underlined formatting.");


	   $pdf->DrawCodeArea("42");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  h4 {");
	   $pdf->AddLessonCode("    text-align: center; ");
	   $pdf->AddLessonCode("    height: 25px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  p {");
	   $pdf->AddLessonCode("    text-align: justify;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  .links {");
	   $pdf->AddLessonCode("    text-align: left; ");
	   $pdf->AddLessonCode("    color: black;");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  .fullCard {");
	   $pdf->AddLessonCode("    width: 245px;");
	   $pdf->AddLessonCode("    border: 1px solid #ccc;");
	   $pdf->AddLessonCode("    border-radius: 5px;");
	   $pdf->AddLessonCode("    margin: 10px 5px;");
	   $pdf->AddLessonCode("    padding: 4px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  .cardContent {");
	   $pdf->AddLessonCode("    padding: 10px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  .cardText {");
	   $pdf->AddLessonCode("    margin-bottom: 30px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("<div class='fullCard'>");
	   $pdf->AddLessonCode("  <div class='cardContent'>");
	   $pdf->AddLessonCode("    <div class='cardText'>");
	   $pdf->AddLessonCode("      <h4>Google</h4>");
	   $pdf->AddLessonCode("      <p>Google was founded by Larry Page and Sergey Brin while they were <u>Ph.D. students</u> at <strong>Stanford University</strong>.</p>");
	   $pdf->AddLessonCode("    </div>");
	   $pdf->AddLessonCode("    <div class='cardLinks'>");
	   $pdf->AddLessonCode("      <a href='https://en.wikipedia.org/wiki/Larry_Page' target='_blank' class='links'>Larry Page</a>");
	   $pdf->AddLessonCode("      <a href='https://en.wikipedia.org/wiki/Sergey_Brin' target='_blank' class='links'>Sergey Brin</a>");
	   $pdf->AddLessonCode("    </div>");
	   $pdf->AddLessonCode("  </div>");
	   $pdf->AddLessonCode("</div>");
   }

   function GenerateAVDLesson6($pdf) {
       $pdf->AddLessonTitle("Use the em Tag to Italicize Text");
	   $pdf->AddLessonText("To emphasize text, you can use the em tag. This displays text as italicized, as the browser applies the CSS of font-style: italic; to the element.");
	   $pdf->AddLessonText("Wrap an em tag around the contents of the paragraph tag to give it emphasis.");


	   $pdf->DrawCodeArea("43");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  h4 {");
	   $pdf->AddLessonCode("    text-align: center; ");
	   $pdf->AddLessonCode("    height: 25px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  p {");
	   $pdf->AddLessonCode("    text-align: justify;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  .links {");
	   $pdf->AddLessonCode("    text-align: left; ");
	   $pdf->AddLessonCode("    color: black;");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  .fullCard {");
	   $pdf->AddLessonCode("    width: 245px;");
	   $pdf->AddLessonCode("    border: 1px solid #ccc;");
	   $pdf->AddLessonCode("    border-radius: 5px;");
	   $pdf->AddLessonCode("    margin: 10px 5px;");
	   $pdf->AddLessonCode("    padding: 4px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  .cardContent {");
	   $pdf->AddLessonCode("    padding: 10px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  .cardText {");
	   $pdf->AddLessonCode("    margin-bottom: 30px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("<div class='fullCard'>");
	   $pdf->AddLessonCode("  <div class='cardContent'>");
	   $pdf->AddLessonCode("    <div class='cardText'>");
	   $pdf->AddLessonCode("      <h4>Google</h4>");
	   $pdf->AddLessonCode("      <p><em>Google was founded by Larry Page and Sergey Brin while they were <u>Ph.D. students</u> at <strong>Stanford University</strong>.</em></p>");
	   $pdf->AddLessonCode("    </div>");
	   $pdf->AddLessonCode("    <div class='cardLinks'>");
	   $pdf->AddLessonCode("      <a href='https://en.wikipedia.org/wiki/Larry_Page' target='_blank' class='links'>Larry Page</a>");
	   $pdf->AddLessonCode("      <a href='https://en.wikipedia.org/wiki/Sergey_Brin' target='_blank' class='links'>Sergey Brin</a>");
	   $pdf->AddLessonCode("    </div>");
	   $pdf->AddLessonCode("  </div>");
	   $pdf->AddLessonCode("</div>");
   }

   function GenerateAVDLesson7($pdf) {
       $pdf->AddLessonTitle("Use the s Tag to Strikethrough Text");
	   $pdf->AddLessonText("To strikethrough text, which is when a horizontal line cuts across the characters, you can use the s tag. It shows that a section of text is no longer valid. With the s tag, the browser applies the CSS of text-decoration: line-through; to the element.");
	   $pdf->AddLessonText("Wrap the s tag around 'Google' inside the h4 tag and then add the word Alphabet beside it, which should not have the strikethrough formatting.");


	   $pdf->DrawCodeArea("43");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  h4 {");
	   $pdf->AddLessonCode("    text-align: center; ");
	   $pdf->AddLessonCode("    height: 25px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  p {");
	   $pdf->AddLessonCode("    text-align: justify;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  .links {");
	   $pdf->AddLessonCode("    text-align: left; ");
	   $pdf->AddLessonCode("    color: black;");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  .fullCard {");
	   $pdf->AddLessonCode("    width: 245px;");
	   $pdf->AddLessonCode("    border: 1px solid #ccc;");
	   $pdf->AddLessonCode("    border-radius: 5px;");
	   $pdf->AddLessonCode("    margin: 10px 5px;");
	   $pdf->AddLessonCode("    padding: 4px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  .cardContent {");
	   $pdf->AddLessonCode("    padding: 10px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  .cardText {");
	   $pdf->AddLessonCode("    margin-bottom: 30px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("<div class='fullCard'>");
	   $pdf->AddLessonCode("  <div class='cardContent'>");
	   $pdf->AddLessonCode("    <div class='cardText'>");
	   $pdf->AddLessonCode("      <h4><s>Google</s>Alphabet</h4>");
	   $pdf->AddLessonCode("      <p><em>Google was founded by Larry Page and Sergey Brin while they were <u>Ph.D. students</u> at <strong>Stanford University</strong>.</em></p>");
	   $pdf->AddLessonCode("    </div>");
	   $pdf->AddLessonCode("    <div class='cardLinks'>");
	   $pdf->AddLessonCode("      <a href='https://en.wikipedia.org/wiki/Larry_Page' target='_blank' class='links'>Larry Page</a>");
	   $pdf->AddLessonCode("      <a href='https://en.wikipedia.org/wiki/Sergey_Brin' target='_blank' class='links'>Sergey Brin</a>");
	   $pdf->AddLessonCode("    </div>");
	   $pdf->AddLessonCode("  </div>");
	   $pdf->AddLessonCode("</div>");
   }

   function GenerateAVDLesson8($pdf) {
       $pdf->AddLessonTitle("Create a Horizontal Line Using the hr Element");
	   $pdf->AddLessonText("You can use the hr tag to add a horizontal line across the width of its containing element. This can be used to define a change in topic or to visually separate groups of content.");
	   $pdf->AddLessonText("Add an hr tag underneath the h4 which contains the card title.");
	   $pdf->AddLessonText("Note: In HTML, hr is a self-closing tag, and therefore doesn't need a separate closing tag.");

	   $pdf->DrawCodeArea("44");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  h4 {");
	   $pdf->AddLessonCode("    text-align: center; ");
	   $pdf->AddLessonCode("    height: 25px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  p {");
	   $pdf->AddLessonCode("    text-align: justify;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  .links {");
	   $pdf->AddLessonCode("    text-align: left; ");
	   $pdf->AddLessonCode("    color: black;");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  .fullCard {");
	   $pdf->AddLessonCode("    width: 245px;");
	   $pdf->AddLessonCode("    border: 1px solid #ccc;");
	   $pdf->AddLessonCode("    border-radius: 5px;");
	   $pdf->AddLessonCode("    margin: 10px 5px;");
	   $pdf->AddLessonCode("    padding: 4px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  .cardContent {");
	   $pdf->AddLessonCode("    padding: 10px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  .cardText {");
	   $pdf->AddLessonCode("    margin-bottom: 30px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("<div class='fullCard'>");
	   $pdf->AddLessonCode("  <div class='cardContent'>");
	   $pdf->AddLessonCode("    <div class='cardText'>");
	   $pdf->AddLessonCode("      <h4><s>Google</s>Alphabet</h4>");
	   $pdf->AddLessonCode("      <hr>");
	   $pdf->AddLessonCode("      <p><em>Google was founded by Larry Page and Sergey Brin while they were <u>Ph.D. students</u> at <strong>Stanford University</strong>.</em></p>");
	   $pdf->AddLessonCode("    </div>");
	   $pdf->AddLessonCode("    <div class='cardLinks'>");
	   $pdf->AddLessonCode("      <a href='https://en.wikipedia.org/wiki/Larry_Page' target='_blank' class='links'>Larry Page</a>");
	   $pdf->AddLessonCode("      <a href='https://en.wikipedia.org/wiki/Sergey_Brin' target='_blank' class='links'>Sergey Brin</a>");
	   $pdf->AddLessonCode("    </div>");
	   $pdf->AddLessonCode("  </div>");
	   $pdf->AddLessonCode("</div>");
   }

   function GenerateAVDLesson9($pdf) {
       $pdf->AddLessonTitle("Adjust the background-color Property of Text");
	   $pdf->AddLessonText("Instead of adjusting your overall background or the color of the text to make the foreground easily readable, you can add a background-color to the element holding the text you want to emphasize. This challenge uses rgba() instead of hex codes or normal rgb().");

	   $pdf->DrawCodeArea("5");
	   $pdf->AddLessonCode("rgba stands for:");
	   $pdf->AddLessonCode("  r = red");
	   $pdf->AddLessonCode("  g = green");
	   $pdf->AddLessonCode("  b = blue");
	   $pdf->AddLessonCode("  a = alpha/level of opacity");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("The RGB values can range from 0 to 255. The alpha value can range from 1, which is fully opaque or a solid color, to 0, which is fully transparent or clear. rgba() is great to use in this case, as it allows you to adjust the opacity. This means you don't have to completely block out the background.");
	   $pdf->AddLessonText("You'll use background-color: rgba(45, 45, 45, 0.1) for this challenge. It produces a dark gray color that is nearly transparent given the low opacity value of 0.1.");
	   $pdf->AddLessonText("To make the text stand out more, adjust the background-color of the h4 element to the given rgba() value.");
	   $pdf->AddLessonText("Also for the h4, remove the height property and add padding of 10px.");

	   $pdf->DrawCodeArea("27");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  h4 {");
	   $pdf->AddLessonCode("    text-align: center; ");
	   $pdf->AddLessonCode("    background-color: rgba(45, 45, 45, 0.1);");
	   $pdf->AddLessonCode("    padding: 10px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  p {");
	   $pdf->AddLessonCode("    text-align: justify;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  .links {");
	   $pdf->AddLessonCode("    text-align: left; ");
	   $pdf->AddLessonCode("    color: black;");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  .fullCard {");
	   $pdf->AddLessonCode("    width: 245px;");
	   $pdf->AddLessonCode("    border: 1px solid #ccc;");
	   $pdf->AddLessonCode("    border-radius: 5px;");
	   $pdf->AddLessonCode("    margin: 10px 5px;");
	   $pdf->AddLessonCode("    padding: 4px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  .cardContent {");
	   $pdf->AddLessonCode("    padding: 10px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  .cardText {");
	   $pdf->AddLessonCode("    margin-bottom: 30px;");
	   $pdf->AddLessonCode("  }");
	   
       $pdf->AddLessonTitle("Adjust the background-color Property of Text (Cont'd)");
	   $pdf->DrawCodeArea("19");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("<div class='fullCard'>");
	   $pdf->AddLessonCode("  <div class='cardContent'>");
	   $pdf->AddLessonCode("    <div class='cardText'>");
	   $pdf->AddLessonCode("      <h4><s>Google</s>Alphabet</h4>");
	   $pdf->AddLessonCode("      <hr>");
	   $pdf->AddLessonCode("      <p><em>Google was founded by Larry Page and Sergey Brin while they were <u>Ph.D. students</u> at <strong>Stanford University</strong>.</em></p>");
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
	   GenerateAVDLesson2($pdf);
	   GenerateAVDLesson3($pdf);
	   GenerateAVDLesson4($pdf);
	   GenerateAVDLesson5($pdf);
	   GenerateAVDLesson6($pdf);
	   GenerateAVDLesson7($pdf);
	   GenerateAVDLesson8($pdf);
	   GenerateAVDLesson9($pdf);
   }

?>
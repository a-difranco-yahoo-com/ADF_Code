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

   function GenerateAVDLesson10($pdf) {
       $pdf->AddLessonTitle("Adjust the Size of a Header Versus a Paragraph Tag");
	   $pdf->AddLessonText("The font size of header tags (h1 through h6) should generally be larger than the font size of paragraph tags. This makes it easier for the user to visually understand the layout and level of importance of everything on the page. You use the font-size property to adjust the size of the text in an element.");
	   $pdf->AddLessonText("To make the heading significantly larger than the paragraph, change the font-size of the h4 tag to 27 pixels.");

	   $pdf->DrawCodeArea("28");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  h4 {");
	   $pdf->AddLessonCode("    text-align: center; ");
	   $pdf->AddLessonCode("    background-color: rgba(45, 45, 45, 0.1);");
	   $pdf->AddLessonCode("    padding: 10px;");
	   $pdf->AddLessonCode("    font-size: 27px;");
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

   function GenerateAVDLesson11($pdf) {
       $pdf->AddLessonTitle("Add a box-shadow to a Card-like Element");
	   $pdf->AddLessonText("The box-shadow property applies one or more shadows to an element.");
	   $pdf->AddLessonText("The box-shadow property takes values for");
	   $pdf->AddLessonBullet("offset-x (how far to push the shadow horizontally from the element),");
	   $pdf->AddLessonBullet("offset-y (how far to push the shadow vertically from the element),");
	   $pdf->AddLessonBullet("blur-radius,");
	   $pdf->AddLessonBullet("spread-radius and");
	   $pdf->AddLessonBullet("color, in that order.");
	   $pdf->AddLessonText("The blur-radius and spread-radius values are optional.");
	   $pdf->AddLessonText("Multiple box-shadows can be created by using commas to separate properties of each box-shadow element.");
	   $pdf->AddLessonText("Here's an example of the CSS to create multiple shadows with some blur, at mostly-transparent black colors:");

	   $pdf->DrawCodeArea("1");
	   $pdf->AddLessonCode("box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("The element now has an id of thumbnail. With this selector, use the example CSS values above to place a box-shadow on the card.");

	   $pdf->DrawCodeArea("31");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  h4 {");
	   $pdf->AddLessonCode("    text-align: center; ");
	   $pdf->AddLessonCode("    background-color: rgba(45, 45, 45, 0.1);");
	   $pdf->AddLessonCode("    padding: 10px;");
	   $pdf->AddLessonCode("    font-size: 27px;");
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
	   $pdf->AddLessonCode("  #thumbnail {");
	   $pdf->AddLessonCode("    box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);");
	   $pdf->AddLessonCode("  }");
	   
       $pdf->AddLessonTitle("Add a box-shadow to a Card-like Element (Cont'd)");
	   $pdf->DrawCodeArea("19");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("<div class='fullCard' id='thumbnail'>");
	   $pdf->AddLessonCode("  <div class='cardContent'>");
	   $pdf->AddLessonCode("    <div class='cardText'>");
	   $pdf->AddLessonCode("      <h4><Alphabet</h4>");
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

   function GenerateAVDLesson12($pdf) {
       $pdf->AddLessonTitle("Decrease the Opacity of an Element");
	   $pdf->AddLessonText("The opacity property in CSS is used to adjust the opacity, or conversely, the transparency for an item.");

	   $pdf->DrawCodeArea("3");
	   $pdf->AddLessonCode("A value of 1 is opaque, which isn't transparent at all.");
	   $pdf->AddLessonCode("A value of 0.5 is half see-through.");
	   $pdf->AddLessonCode("A value of 0 is completely transparent.");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("The value given will apply to the entire element, whether that's an image with some transparency, or the foreground and background colors for a block of text.");
	   $pdf->AddLessonText("Set the opacity of the anchor tags to 0.7 using links class to select them.");

	   $pdf->DrawCodeArea("31");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  h4 {");
	   $pdf->AddLessonCode("    text-align: center; ");
	   $pdf->AddLessonCode("    background-color: rgba(45, 45, 45, 0.1);");
	   $pdf->AddLessonCode("    padding: 10px;");
	   $pdf->AddLessonCode("    font-size: 27px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  p {");
	   $pdf->AddLessonCode("    text-align: justify;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  .links {");
	   $pdf->AddLessonCode("    text-align: left; ");
	   $pdf->AddLessonCode("    color: black;");
	   $pdf->AddLessonCode("    opacity: 0.7;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  #thumbnail {");
	   $pdf->AddLessonCode("    box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);");
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
	   
       $pdf->AddLessonTitle("Decrease the Opacity of an Element (Cont'd)");
	   $pdf->DrawCodeArea("19");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("<div class='fullCard' id='thumbnail'>");
	   $pdf->AddLessonCode("  <div class='cardContent'>");
	   $pdf->AddLessonCode("    <div class='cardText'>");
	   $pdf->AddLessonCode("      <h4><Alphabet</h4>");
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

   function GenerateAVDLesson13($pdf) {
       $pdf->AddLessonTitle("Use the text-transform Property to Make Text Uppercase");
	   $pdf->AddLessonText("The text-transform property in CSS is used to change the appearance of text. It's a convenient way to make sure text on a webpage appears consistently, without having to change the text content of the actual HTML elements.");
	   $pdf->AddLessonText("The following table shows how the different text-transformvalues change the example text 'Transform me'.");

	   $pdf->DrawCodeArea("7");
	   $pdf->AddLessonCode("Value       Result");
	   $pdf->AddLessonCode("lowercase   'transform me'");
	   $pdf->AddLessonCode("uppercase   'TRANSFORM ME'");
	   $pdf->AddLessonCode("capitalize  'Transform Me'");
	   $pdf->AddLessonCode("initial     Use the default value");
	   $pdf->AddLessonCode("inherit     Use the text-transform value from the parent element");
	   $pdf->AddLessonCode("none        Default: Use the original text");


	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Transform the text of the h4 to be uppercase using the text-transform property.");

	   $pdf->DrawCodeArea("32");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  h4 {");
	   $pdf->AddLessonCode("    text-align: center; ");
	   $pdf->AddLessonCode("    background-color: rgba(45, 45, 45, 0.1);");
	   $pdf->AddLessonCode("    padding: 10px;");
	   $pdf->AddLessonCode("    font-size: 27px;");
	   $pdf->AddLessonCode("    text-transform: uppercase;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  p {");
	   $pdf->AddLessonCode("    text-align: justify;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  .links {");
	   $pdf->AddLessonCode("    text-align: left; ");
	   $pdf->AddLessonCode("    color: black;");
	   $pdf->AddLessonCode("    opacity: 0.7;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  #thumbnail {");
	   $pdf->AddLessonCode("    box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);");
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
	   
       $pdf->AddLessonTitle("Use the text-transform Property to Make Text Uppercase (Cont'd)");
	   $pdf->DrawCodeArea("19");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("<div class='fullCard' id='thumbnail'>");
	   $pdf->AddLessonCode("  <div class='cardContent'>");
	   $pdf->AddLessonCode("    <div class='cardText'>");
	   $pdf->AddLessonCode("      <h4><Alphabet</h4>");
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

   function GenerateAVDLesson14($pdf) {
       $pdf->AddLessonTitle("Set the font-size for Multiple Heading Elements");
	   $pdf->AddLessonText("The font-size property is used to specify how large the text is in a given element. This rule can be used for multiple elements to create visual consistency of text on a page. In this challenge, you'll set the values for all h1 through h6 tags to balance the heading sizes.");

	   $pdf->AddLessonBullet("Set the font-size of the h1 tag to 68px.");
	   $pdf->AddLessonBullet("Set the font-size of the h2 tag to 52px.");
	   $pdf->AddLessonBullet("Set the font-size of the h3 tag to 40px.");
	   $pdf->AddLessonBullet("Set the font-size of the h4 tag to 32px.");
	   $pdf->AddLessonBullet("Set the font-size of the h5 tag to 21px.");
	   $pdf->AddLessonBullet("Set the font-size of the h6 tag to 14px.");
	   $pdf->AddLessonText("");

	   $pdf->DrawCodeArea("14");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  h1 { font-size: 68px;}");
	   $pdf->AddLessonCode("  h2 { font-size: 52px;}");
	   $pdf->AddLessonCode("  h3 { font-size: 40px;}");
	   $pdf->AddLessonCode("  h4 { font-size: 32px;}");
	   $pdf->AddLessonCode("  h5 { font-size: 21px;}");
	   $pdf->AddLessonCode("  h6 { font-size: 14px;}");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("<h1>This is h1 text</h1>");
	   $pdf->AddLessonCode("<h2>This is h2 text</h2>");
	   $pdf->AddLessonCode("<h3>This is h3 text</h3>");
	   $pdf->AddLessonCode("<h4>This is h4 text</h4>");
	   $pdf->AddLessonCode("<h5>This is h5 text</h5>");
	   $pdf->AddLessonCode("<h6>This is h6 text</h6>");
   }

   function GenerateAVDLesson15($pdf) {
       $pdf->AddLessonTitle("Set the font-weight for Multiple Heading Elements");
	   $pdf->AddLessonText("You set the font-size of each heading tag in the last challenge, here you'll adjust the font-weight.");
	   $pdf->AddLessonText("The font-weight property sets how thick or thin characters are in a section of text.");

	   $pdf->AddLessonBullet("Set the font-weight of the h1 tag to 800.");
	   $pdf->AddLessonBullet("Set the font-weight of the h2 tag to 600.");
	   $pdf->AddLessonBullet("Set the font-weight of the h3 tag to 500.");
	   $pdf->AddLessonBullet("Set the font-weight of the h4 tag to 400.");
	   $pdf->AddLessonBullet("Set the font-weight of the h5 tag to 300.");
	   $pdf->AddLessonBullet("Set the font-weight of the h6 tag to 200.");
	   $pdf->AddLessonText("");

	   $pdf->DrawCodeArea("32");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  h1 {");
	   $pdf->AddLessonCode("     font-size:   68px;}");
	   $pdf->AddLessonCode("     font-weight: 800;}");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  h2 {");
	   $pdf->AddLessonCode("     font-size:   52px;}");
	   $pdf->AddLessonCode("     font-weight: 600;}");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  h3 {");
	   $pdf->AddLessonCode("     font-size:   40px;}");
	   $pdf->AddLessonCode("     font-weight: 500;}");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  h4 {");
	   $pdf->AddLessonCode("     font-size:   32px;}");
	   $pdf->AddLessonCode("     font-weight: 400;}");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  h5 {");
	   $pdf->AddLessonCode("     font-size:   21px;}");
	   $pdf->AddLessonCode("     font-weight: 300;}");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  h6 {");
	   $pdf->AddLessonCode("     font-size:   14px;}");
	   $pdf->AddLessonCode("     font-weight: 200;}");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("<h1>This is h1 text</h1>");
	   $pdf->AddLessonCode("<h2>This is h2 text</h2>");
	   $pdf->AddLessonCode("<h3>This is h3 text</h3>");
	   $pdf->AddLessonCode("<h4>This is h4 text</h4>");
	   $pdf->AddLessonCode("<h5>This is h5 text</h5>");
	   $pdf->AddLessonCode("<h6>This is h6 text</h6>");
   }

   function GenerateAVDLesson16($pdf) {
       $pdf->AddLessonTitle("Set the font-size of Paragraph Text");
	   $pdf->AddLessonText("The font-size property in CSS is not limited to headings, it can be applied to any element containing text.");
	   $pdf->AddLessonText("Change the value of the font-size property for the paragraph to 16px to make it more visible.");

	   $pdf->DrawCodeArea("12");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  p {");
	   $pdf->AddLessonCode("    font-size: 16px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("<p>");
	   $pdf->AddLessonCode("  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.");
	   $pdf->AddLessonCode("</p>");
   }

   function GenerateAVDLesson17($pdf) {
       $pdf->AddLessonTitle("Set the line-height of Paragraphs");
	   $pdf->AddLessonText("CSS offers the line-height property to change the height of each line in a block of text. As the name suggests, it changes the amount of vertical space that each line of text gets.");
	   $pdf->AddLessonText("Add a line-height property to the p tag and set it to 25px.");

	   $pdf->DrawCodeArea("13");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  p {");
	   $pdf->AddLessonCode("    font-size: 16px;");
	   $pdf->AddLessonCode("    line-height: 25px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("<p>");
	   $pdf->AddLessonCode("  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.");
	   $pdf->AddLessonCode("</p>");
   }

   function GenerateAVDLesson18($pdf) {
       $pdf->AddLessonTitle("Adjust the Hover State of an Anchor Tag");
	   $pdf->AddLessonText("This challenge will touch on the usage of pseudo-classes. A pseudo-class is a keyword that can be added to selectors, in order to select a specific state of the element.");
	   $pdf->AddLessonText("For example, the styling of an anchor tag can be changed for its hover state using the :hover pseudo-class selector. Here's the CSS to change the color of the anchor tag to red during its hover state:");

	   $pdf->DrawCodeArea("3");
	   $pdf->AddLessonCode("a:hover {");
	   $pdf->AddLessonCode("  color: red;");
	   $pdf->AddLessonCode("}");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("The code editor has a CSS rule to style all a tags black. Add a rule so that when the user hovers over the a tag, the color is blue.");

	   $pdf->DrawCodeArea("10");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  a {");
	   $pdf->AddLessonCode("    color: #000;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("a:hover {");
	   $pdf->AddLessonCode("  color: blue;");
	   $pdf->AddLessonCode("}");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("<a href='http://freecatphotoapp.com/' target='_blank'>CatPhotoApp</a>");
   }

   function GenerateAVDLesson19($pdf) {
       $pdf->AddLessonTitle("Change an Element's Relative Position");
	   $pdf->AddLessonText("CSS treats each HTML element as its own box, which is usually referred to as the CSS Box Model. Block-level items automatically start on a new line (think headings, paragraphs, and divs) while inline items sit within surrounding content (like images or spans). The default layout of elements in this way is called the normal flow of a document, but CSS offers the position property to override it.");
	   $pdf->AddLessonText("When the position of an element is set to relative, it allows you to specify how CSS should move it relative to its current position in the normal flow of the page. It pairs with the CSS offset properties of left or right, and top or bottom. These say how many pixels, percentages, or ems to move the item away from where it is normally positioned. The following example moves the paragraph 10 pixels away from the bottom:");

	   $pdf->DrawCodeArea("4");
	   $pdf->AddLessonCode("p {");
	   $pdf->AddLessonCode("  position: relative;");
	   $pdf->AddLessonCode("  bottom: 10px;");
	   $pdf->AddLessonCode("}");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Changing an element's position to relative does not remove it from the normal flow - other elements around it still behave as if that item were in its default position. Note: Positioning gives you a lot of flexibility and power over the visual layout of a page. It's good to remember that no matter the position of elements, the underlying HTML markup should be organized and make sense when read from top to bottom. This is how users with visual impairments (who rely on assistive devices like screen readers) access your content.");
	   $pdf->AddLessonText("Change the position of the h2 to relative, and use a CSS offset to move it 15 pixels away from the top of where it sits in the normal flow. Notice there is no impact on the positions of the surrounding h1 and p elements.");

	   $pdf->DrawCodeArea("11");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  h2 {");
	   $pdf->AddLessonCode("  position: relative;");
	   $pdf->AddLessonCode("  top: 15px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("<body>");
	   $pdf->AddLessonCode("  <h1>On Being Well-Positioned</h1>");
	   $pdf->AddLessonCode("  <h2>Move me!</h2>");
	   $pdf->AddLessonCode("  <p>I still think the h2 is where it normally sits.</p>");
	   $pdf->AddLessonCode("</body>");
}

   function GenerateAVDLesson20($pdf) {
       $pdf->AddLessonTitle("Move a Relatively Positioned Element with CSS Offsets");
	   $pdf->AddLessonText("The CSS offsets of top or bottom, and left or right tell the browser how far to offset an item relative to where it would sit in the normal flow of the document. You're offsetting an element away from a given spot, which moves the element away from the referenced side (effectively, the opposite direction). As you saw in the last challenge, using the top offset moved the h2 downwards. Likewise, using a left offset moves an item to the right.");
	   $pdf->AddLessonText("Use CSS offsets to move the h2 15 pixels to the right and 10 pixels up.");


	   $pdf->DrawCodeArea("12");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  h2 {");
	   $pdf->AddLessonCode("    position: relative;");
	   $pdf->AddLessonCode("    left:     15px;");
	   $pdf->AddLessonCode("    bottom:   10px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("<body>");
	   $pdf->AddLessonCode("  <h1>On Being Well-Positioned</h1>");
	   $pdf->AddLessonCode("  <h2>Move me!</h2>");
	   $pdf->AddLessonCode("  <p>I still think the h2 is where it normally sits.</p>");
	   $pdf->AddLessonCode("</body>");
}

   function GenerateAVDLesson21($pdf) {
       $pdf->AddLessonTitle("Lock an Element to its Parent with Absolute Positioning");
	   $pdf->AddLessonText("The next option for the CSS position property is absolute, which locks the element in place relative to its parent container. Unlike the relative position, this removes the element from the normal flow of the document, so surrounding items ignore it. The CSS offset properties (top or bottom and left or right) are used to adjust the position.");
	   $pdf->AddLessonText("One nuance with absolute positioning is that it will be locked relative to its closest positioned ancestor. If you forget to add a position rule to the parent item, (this is typically done using position: relative;), the browser will keep looking up the chain and ultimately default to the body tag.");
	   $pdf->AddLessonText("Lock the #searchbar element to the top-right of its section parent by declaring its position as absolute. Give it top and right offsets of 50 pixels each.");

	   $pdf->DrawCodeArea("20");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  #searchbar {");
	   $pdf->AddLessonCode("    position: absolute;");
	   $pdf->AddLessonCode("    top:      50px;");
	   $pdf->AddLessonCode("    right:    50px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  section {");
	   $pdf->AddLessonCode("    position: relative;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("<body>");
	   $pdf->AddLessonCode("  <h1>Welcome!</h1>");
	   $pdf->AddLessonCode("  <section>");
	   $pdf->AddLessonCode("    <form id='searchbar'>");
	   $pdf->AddLessonCode("      <label for='search'>Search:</label>");
	   $pdf->AddLessonCode("      <input type='search' id='search' name='search'>");
	   $pdf->AddLessonCode("      <input type='submit' name='submit' value='Go!'>");
	   $pdf->AddLessonCode("    </form>");
	   $pdf->AddLessonCode("  </section>");
	   $pdf->AddLessonCode("</body>");
}

    function GenerateAVDLesson22($pdf) {
       $pdf->AddLessonTitle("Lock an Element to the Browser Window with Fixed Positioning");
	   $pdf->AddLessonText("The next layout scheme that CSS offers is the fixed position, which is a type of absolute positioning that locks an element relative to the browser window. Similar to absolute positioning, it's used with the CSS offset properties and also removes the element from the normal flow of the document. Other items no longer 'realize' where it is positioned, which may require some layout adjustments elsewhere.");
	   $pdf->AddLessonText("One key difference between the fixed and absolute positions is that an element with a fixed position won't move when the user scrolls.");
	   $pdf->AddLessonText("The navigation bar in the code is labeled with an id of navbar. Change its position to fixed, and offset it 0 pixels from the top and 0 pixels from the left. After you have added the code, scroll the preview window to see how the navigation stays in place.");

 	   $pdf->DrawCodeArea("35");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  body {");
	   $pdf->AddLessonCode("    min-height: 150vh;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  #navbar {");
	   $pdf->AddLessonCode("    position: fixed;");
	   $pdf->AddLessonCode("    top: 0px;");
	   $pdf->AddLessonCode("     left: 0px;");
	   $pdf->AddLessonCode("    width: 100%;");
	   $pdf->AddLessonCode("    background-color: #767676;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  nav ul {");
	   $pdf->AddLessonCode("    margin: 0px;");
	   $pdf->AddLessonCode("    padding: 5px 0px 5px 30px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  nav li {");
	   $pdf->AddLessonCode("    display: inline;");
	   $pdf->AddLessonCode("    margin-right: 20px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  a {");
	   $pdf->AddLessonCode("    text-decoration: none;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("<body>");
	   $pdf->AddLessonCode("  <header>");
	   $pdf->AddLessonCode("    <h1>Welcome!</h1>");
	   $pdf->AddLessonCode("    <nav id='navbar'>");
	   $pdf->AddLessonCode("      <ul>");
	   $pdf->AddLessonCode("        <li><a href=''>Home</a></li>");
	   $pdf->AddLessonCode("        <li><a href=''>Contact</a></li>");
	   $pdf->AddLessonCode("      </ul>");
	   $pdf->AddLessonCode("    </nav>");
	   $pdf->AddLessonCode("  </header>");
	   $pdf->AddLessonCode("  <p>I shift up when the #navbar is fixed to the browser window.</p>");
	   $pdf->AddLessonCode("</body>");
}

    function GenerateAVDLesson23($pdf) {
       $pdf->AddLessonTitle("Push Elements Left or Right with the float Property");
	   $pdf->AddLessonText("The next positioning tool does not actually use position, but sets the float property of an element. Floating elements are removed from the normal flow of a document and pushed to either the left or right of their containing parent element. It's commonly used with the width property to specify how much horizontal space the floated element requires.");
	   $pdf->AddLessonText("The given markup would work well as a two-column layout, with the section and aside elements next to each other. Give the #left item a float of left and the #right item a float of right.");

 	   $pdf->DrawCodeArea("29");
	   $pdf->AddLessonCode("<head>");
	   $pdf->AddLessonCode("  <style>");
	   $pdf->AddLessonCode("    #left {");
	   $pdf->AddLessonCode("      float: left;");
	   $pdf->AddLessonCode("      width: 50%;");
	   $pdf->AddLessonCode("    }");
	   $pdf->AddLessonCode("    #right {");
	   $pdf->AddLessonCode("      float: right;");
	   $pdf->AddLessonCode("      width: 40%;");
	   $pdf->AddLessonCode("    }");
	   $pdf->AddLessonCode("    aside, section {");
	   $pdf->AddLessonCode("      padding: 2px;");
	   $pdf->AddLessonCode("      background-color: #ccc;");
	   $pdf->AddLessonCode("    }");
	   $pdf->AddLessonCode("  </style>");
	   $pdf->AddLessonCode("</head>");
	   $pdf->AddLessonCode("<body>");
	   $pdf->AddLessonCode("  <header>");
	   $pdf->AddLessonCode("    <h1>Welcome!</h1>");
	   $pdf->AddLessonCode("  </header>");
	   $pdf->AddLessonCode("  <section id='left'>");
	   $pdf->AddLessonCode("    <h2>Content</h2>");
	   $pdf->AddLessonCode("    <p>Good stuff</p>");
	   $pdf->AddLessonCode("  </section>");
	   $pdf->AddLessonCode("  <aside id='right'>");
	   $pdf->AddLessonCode("    <h2>Sidebar</h2>");
	   $pdf->AddLessonCode("    <p>Links</p>");
	   $pdf->AddLessonCode("  </aside>");
	   $pdf->AddLessonCode("</body>");
}

    function GenerateAVDLesson24($pdf) {
       $pdf->AddLessonTitle("Change the Position of Overlapping Elements with the z-index Property");
	   $pdf->AddLessonText("When elements are positioned to overlap (i.e. using position: absolute | relative | fixed | sticky), the element coming later in the HTML markup will, by default, appear on the top of the other elements. However, the z-index property can specify the order of how elements are stacked on top of one another. It must be an integer (i.e. a whole number and not a decimal), and higher values for the z-index property of an element move it higher in the stack than those with lower values.");
	   $pdf->AddLessonText("Add a z-index property to the element with the class name of first (the red rectangle) and set it to a value of 2 so it covers the other element (blue rectangle).");

 	   $pdf->DrawCodeArea("21");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  div {");
	   $pdf->AddLessonCode("    width: 60%;");
	   $pdf->AddLessonCode("    height: 200px;");
	   $pdf->AddLessonCode("    margin-top: 20px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  .first {");
	   $pdf->AddLessonCode("    background-color: red;");
	   $pdf->AddLessonCode("    position: absolute;");
	   $pdf->AddLessonCode("    z-index: 2;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  .second {");
	   $pdf->AddLessonCode("    background-color: blue;");
	   $pdf->AddLessonCode("    position: absolute;");
	   $pdf->AddLessonCode("    left: 40px;");
	   $pdf->AddLessonCode("    top: 50px;");
	   $pdf->AddLessonCode("    z-index: 1;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("<div class='first'></div>");
	   $pdf->AddLessonCode("<div class='second'></div>");
}

    function GenerateAVDLesson25($pdf) {
       $pdf->AddLessonTitle("Center an Element Horizontally Using the margin Property");
	   $pdf->AddLessonText("Another positioning technique is to center a block element horizontally. One way to do this is to set its margin to a value of auto.");
	   $pdf->AddLessonText("This method works for images, too. Images are inline elements by default, but can be changed to block elements when you set the display property to block.");
	   $pdf->AddLessonText("Center the div on the page by adding a margin property with a value of auto.");

 	   $pdf->DrawCodeArea("9");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  div {");
	   $pdf->AddLessonCode("    background-color: blue;");
	   $pdf->AddLessonCode("    height: 100px;");
	   $pdf->AddLessonCode("    width: 100px;");
	   $pdf->AddLessonCode("    margin: auto;");    
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("<div></div>");
}

    function GenerateAVDLesson26($pdf) {
       $pdf->AddLessonTitle("Learn about Complementary Colors");
	   $pdf->AddLessonText("Color theory and its impact on design is a deep topic and only the basics are covered in the following challenges. On a website, color can draw attention to content, evoke emotions, or create visual harmony. Using different combinations of colors can really change the look of a website, and a lot of thought can go into picking a color palette that works with your content.");
	   $pdf->AddLessonText("The color wheel is a useful tool to visualize how colors relate to each other - it's a circle where similar hues are neighbors and different hues are farther apart. When two colors are opposite each other on the wheel, they are called complementary colors. They have the characteristic that if they are combined, they 'cancel' each other out and create a gray color. However, when placed side-by-side, these colors appear more vibrant and produce a strong visual contrast.");
	   $pdf->AddLessonText("Some examples of complementary colors with their hex codes are:");

 	   $pdf->DrawCodeArea("3");
	   $pdf->AddLessonCode("red (#FF0000) and cyan (#00FFFF)");
	   $pdf->AddLessonCode("green (#00FF00) and magenta (#FF00FF)");
	   $pdf->AddLessonCode("blue (#0000FF) and yellow (#FFFF00)");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("This is different than the outdated RYB color model that many of us were taught in school, which has different primary and complementary colors. Modern color theory uses the additive RGB model (like on a computer screen) and the subtractive CMY(K) model (like in printing). Read here for more information on this complex subject.");
	   $pdf->AddLessonText("There are many color picking tools available online that have an option to find the complement of a color.");
	   $pdf->AddLessonText("Note: For all color challenges: Using color can be a powerful way to add visual interest to a page. However, color alone should not be used as the only way to convey important information because users with visual impairments may not understand that content. This issue will be covered in more detail in the Applied Accessibility challenges.");
	   $pdf->AddLessonText("Change the background-color property of the blue and yellow classes to their respective colors. Notice how the colors look different next to each other than they do compared against the white background.");

 	   $pdf->DrawCodeArea("18");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  body {");
	   $pdf->AddLessonCode("    background-color: #FFFFFF;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  .blue {");
	   $pdf->AddLessonCode("    background-color: #0000FF;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  .yellow {");
	   $pdf->AddLessonCode("    background-color: #FFFF00;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  div {");
	   $pdf->AddLessonCode("    display: inline-block;");
	   $pdf->AddLessonCode("    height: 100px;");
	   $pdf->AddLessonCode("    width: 100px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("<div class='blue'></div>");
	   $pdf->AddLessonCode("<div class='yellow'></div>");
}

    function GenerateAVDLesson27($pdf) {
       $pdf->AddLessonTitle("Learn about Tertiary Colors");
	   $pdf->AddLessonText("Computer monitors and device screens create different colors by combining amounts of red, green, and blue light. This is known as the RGB additive color model in modern color theory. Red (R), green (G), and blue (B) are called primary colors. Mixing two primary colors creates the secondary colors cyan (G + B), magenta (R + B) and yellow (R + G). You saw these colors in the Complementary Colors challenge. These secondary colors happen to be the complement to the primary color not used in their creation, and are opposite to that primary color on the color wheel. For example, magenta is made with red and blue, and is the complement to green.");
	   $pdf->AddLessonText("Tertiary colors are the result of combining a primary color with one of its secondary color neighbors. For example, within the RGB color model, red (primary) and yellow (secondary) make orange (tertiary). This adds six more colors to a simple color wheel for a total of twelve.");
	   $pdf->AddLessonText("There are various methods of selecting different colors that result in a harmonious combination in design. One example that can use tertiary colors is called the split-complementary color scheme. This scheme starts with a base color, then pairs it with the two colors that are adjacent to its complement. The three colors provide strong visual contrast in a design, but are more subtle than using two complementary colors.");
	   $pdf->AddLessonText("Here are three colors created using the split-complement scheme:");

 	   $pdf->DrawCodeArea("4");
	   $pdf->AddLessonCode("Color     Hex Code");
	   $pdf->AddLessonCode("orange    #FF7F00");
	   $pdf->AddLessonCode("cyan      #00FFFF");
	   $pdf->AddLessonCode("raspberry #FF007F");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Change the background-color property of the orange, cyan, and raspberry classes to their respective colors. Make sure to use the hex codes and not the color names.");

 	   $pdf->DrawCodeArea("23");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  body {");
	   $pdf->AddLessonCode("    background-color: #FFFFFF;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  .orange {");
	   $pdf->AddLessonCode("    background-color: #FF7F00;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  .cyan {");
	   $pdf->AddLessonCode("    background-color: #00FFFF;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  .raspberry {");
	   $pdf->AddLessonCode("    background-color: #FF007F;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  div {");
	   $pdf->AddLessonCode("    height: 100px;");
	   $pdf->AddLessonCode("    width: 100px;");
	   $pdf->AddLessonCode("    margin-bottom: 5px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("<div class='orange'></div>");
	   $pdf->AddLessonCode("<div class='cyan'></div>");
	   $pdf->AddLessonCode("<div class='raspberry'></div>");
}

    function GenerateAVDLesson28($pdf) {
       $pdf->AddLessonTitle("Adjust the Color of Various Elements to Complementary Colors");
	   $pdf->AddLessonText("The Complementary Colors challenge showed that opposite colors on the color wheel can make each other appear more vibrant when placed side-by-side. However, the strong visual contrast can be jarring if it's overused on a website, and can sometimes make text harder to read if it's placed on a complementary-colored background. In practice, one of the colors is usually dominant and the complement is used to bring visual attention to certain content on the page.");
	   $pdf->AddLessonText("This page will use a shade of teal (#09A7A1) as the dominant color, and its orange (#FF790E) complement to visually highlight the sign-up buttons. Change the background-color of both the header and footer from black to the teal color. Then change the h2 text color to teal as well. Finally, change the background-color of the button to the orange color.");

 	   $pdf->DrawCodeArea("46");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  body {");
	   $pdf->AddLessonCode("    background-color: white;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  header {");
	   $pdf->AddLessonCode("    background-color: #09A7A1;");
	   $pdf->AddLessonCode("    color: white;");
	   $pdf->AddLessonCode("    padding: 0.25em;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  h2 {");
	   $pdf->AddLessonCode("    color: #09A7A1;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  button {");
	   $pdf->AddLessonCode("    background-color: #FF790E;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  footer {");
	   $pdf->AddLessonCode("    background-color: #09A7A1;");
	   $pdf->AddLessonCode("    color: white;");
	   $pdf->AddLessonCode("    padding: 0.5em;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("<header>");
	   $pdf->AddLessonCode("  <h1>Cooking with FCC!</h1>");
	   $pdf->AddLessonCode("</header>");
	   $pdf->AddLessonCode("<main>");
	   $pdf->AddLessonCode("  <article>");
	   $pdf->AddLessonCode("    <h2>Machine Learning in the Kitchen</h2>");
	   $pdf->AddLessonCode("    <p>Join this two day workshop that walks through how to implement cutting-edge snack-getting algorithms with a command line interface. Coding usually involves writing exact instructions, but sometimes you need your computer to execute flexible commands, like <code>fetch Pringles</code>.</p>");
	   $pdf->AddLessonCode("    <button>Sign Up</button>");
	   $pdf->AddLessonCode("  </article>");
	   $pdf->AddLessonCode("  <article>");
	   $pdf->AddLessonCode("    <h2>Bisection Vegetable Chopping</h2>");
	   $pdf->AddLessonCode("    <p>This week-long retreat will level-up your coding ninja skills to actual ninja skills. No longer is the humble bisection search limited to sorted arrays or coding interview questions, applying its concepts in the kitchen will have you chopping carrots in O(log n) time before you know it.</p>");
	   $pdf->AddLessonCode("    <button>Sign Up</button>");
	   $pdf->AddLessonCode("  </article>");
	   $pdf->AddLessonCode("</main>");
	   $pdf->AddLessonCode("<br>");
	   $pdf->AddLessonCode("<footer>&copy; 2018 FCC Kitchen</footer>");
}

    function GenerateAVDLesson29($pdf) {
       $pdf->AddLessonTitle("Adjust the Hue of a Color");
	   $pdf->AddLessonText("Colors have several characteristics including hue, saturation, and lightness. CSS3 introduced the hsl() property as an alternative way to pick a color by directly stating these characteristics.");
	   $pdf->AddLessonText("Hue is what people generally think of as 'color'. If you picture a spectrum of colors starting with red on the left, moving through green in the middle, and blue on right, the hue is where a color fits along this line. In hsl(), hue uses a color wheel concept instead of the spectrum, where the angle of the color on the circle is given as a value between 0 and 360.");
	   $pdf->AddLessonText("Saturation is the amount of gray in a color. A fully saturated color has no gray in it, and a minimally saturated color is almost completely gray. This is given as a percentage with 100% being fully saturated.");
	   $pdf->AddLessonText("Lightness is the amount of white or black in a color. A percentage is given ranging from 0% (black) to 100% (white), where 50% is the normal color.");
	   $pdf->AddLessonText("Here are a few examples of using hsl() with fully-saturated, normal lightness colors:");

 	   $pdf->DrawCodeArea("7");
	   $pdf->AddLessonCode("Color   HSL");
	   $pdf->AddLessonCode("red     hsl(0,   100%, 50%)");
	   $pdf->AddLessonCode("yellow  hsl(60,  100%, 50%)");
	   $pdf->AddLessonCode("green   hsl(120, 100%, 50%)");
	   $pdf->AddLessonCode("cyan    hsl(180, 100%, 50%)");
	   $pdf->AddLessonCode("blue    hsl(240, 100%, 50%)");
	   $pdf->AddLessonCode("magenta hsl(300, 100%, 50%)");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Change the background-color of each div element based on the class names (green, cyan, or blue) using hsl(). All three should have full saturation and normal lightness.");

 	   $pdf->DrawCodeArea("23");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  body {");
	   $pdf->AddLessonCode("    background-color: #FFFFFF;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  .green {");
	   $pdf->AddLessonCode("    background-color: hsl(120, 100%, 50%);");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  .cyan {");
	   $pdf->AddLessonCode("    background-color: hsl(180, 100%, 50%);");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  .blue {");
	   $pdf->AddLessonCode("    background-color: hsl(240, 100%, 50%);");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  div {");
	   $pdf->AddLessonCode("    display: inline-block;");
	   $pdf->AddLessonCode("    height: 100px;");
	   $pdf->AddLessonCode("    width: 100px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("<div class='green'></div>");
	   $pdf->AddLessonCode("<div class='cyan'></div>");
	   $pdf->AddLessonCode("<div class='blue'></div>");
}

    function GenerateAVDLesson30($pdf) {
       $pdf->AddLessonTitle("Adjust the Tone of a Color");
	   $pdf->AddLessonText("The hsl() option in CSS also makes it easy to adjust the tone of a color. Mixing white with a pure hue creates a tint of that color, and adding black will make a shade. Alternatively, a tone is produced by adding gray or by both tinting and shading. Recall that the 's' and 'l' of hsl() stand for saturation and lightness, respectively. The saturation percent changes the amount of gray and the lightness percent determines how much white or black is in the color. This is useful when you have a base hue you like, but need different variations of it.");
	   $pdf->AddLessonText("All elements have a default background-color of transparent. Our nav element currently appears to have a cyan background, because the element behind it has a background-color set to cyan. Add a background-color to the nav element so it uses the same cyan hue, but has 80% saturation and 25% lightness values to change its tone and shade.");

 	   $pdf->DrawCodeArea("36");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  header {");
	   $pdf->AddLessonCode("    background-color: hsl(180, 90%, 35%);");
	   $pdf->AddLessonCode("    color: #FFFFFF;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  nav {");
	   $pdf->AddLessonCode("    background-color: hsl(180, 80%, 25%);");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  h1 {");
	   $pdf->AddLessonCode("    text-indent: 10px;");
	   $pdf->AddLessonCode("    padding-top: 10px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  nav ul {");
	   $pdf->AddLessonCode("    margin: 0px;");
	   $pdf->AddLessonCode("    padding: 5px 0px 5px 30px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  nav li {");
	   $pdf->AddLessonCode("    display: inline;");
	   $pdf->AddLessonCode("    margin-right: 20px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  a {");
	   $pdf->AddLessonCode("    text-decoration: none;");
	   $pdf->AddLessonCode("    color: inherit;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("<header>");
	   $pdf->AddLessonCode("  <h1>Cooking with FCC!</h1>");
	   $pdf->AddLessonCode("  <nav>");
	   $pdf->AddLessonCode("    <ul>");
	   $pdf->AddLessonCode("      <li><a href='#'>Home</a></li>");
	   $pdf->AddLessonCode("      <li><a href='#'>Classes</a></li>");
	   $pdf->AddLessonCode("      <li><a href='#'>Contact</a></li>");
	   $pdf->AddLessonCode("    </ul>");
	   $pdf->AddLessonCode("  </nav>");
	   $pdf->AddLessonCode("</header>");	   
}

    function GenerateAVDLesson31($pdf) {
       $pdf->AddLessonTitle("Create a Gradual CSS Linear Gradient");
	   $pdf->AddLessonText("Applying a color on HTML elements is not limited to one flat hue. CSS provides the ability to use color transitions, otherwise known as gradients, on elements. This is accessed through the background property's linear-gradient() function. Here is the general syntax:");

 	   $pdf->DrawCodeArea("1");
	   $pdf->AddLessonCode("background: linear-gradient(gradient_direction, color 1, color 2, color 3, ...);");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("The first argument specifies the direction from which color transition starts - it can be stated as a degree, where 90deg makes a vertical gradient and 45deg is angled like a backslash. The following arguments specify the order of colors used in the gradient.");
	   $pdf->AddLessonText("Example:");

 	   $pdf->DrawCodeArea("1");
	   $pdf->AddLessonCode("background: linear-gradient(90deg, red, yellow, rgb(204, 204, 255));");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Use a linear-gradient() for the div element's background, and set it from a direction of 35 degrees to change the color from #CCFFFF to #FFCCCC.");

 	   $pdf->DrawCodeArea("11");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  div {");
	   $pdf->AddLessonCode("    border-radius: 20px;");
	   $pdf->AddLessonCode("    width: 70%;");
	   $pdf->AddLessonCode("    height: 400px;");
	   $pdf->AddLessonCode("    margin: 50px auto;");
	   $pdf->AddLessonCode("    background: linear-gradient(35deg, #CCFFFF,#FFCCCC);");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("<div></div>");
}
 
    function GenerateAVDLesson32($pdf) {
       $pdf->AddLessonTitle("Use a CSS Linear Gradient to Create a Striped Element");
	   $pdf->AddLessonText("The repeating-linear-gradient() function is very similar to linear-gradient() with the major difference that it repeats the specified gradient pattern. repeating-linear-gradient() accepts a variety of values, but for simplicity, you'll work with an angle value and color stop values in this challenge.");
	   $pdf->AddLessonText("The angle value is the direction of the gradient. Color stops are like width values that mark where a transition takes place, and are given with a percentage or a number of pixels.");
	   $pdf->AddLessonText("In the example demonstrated in the code editor, the gradient starts with the color yellow at 0 pixels which blends into the second color blue at 40 pixels away from the start. Since the next color stop is also at 40 pixels, the gradient immediately changes to the third color green, which itself blends into the fourth color value red as that is 80 pixels away from the beginning of the gradient.");
	   $pdf->AddLessonText("For this example, it helps to think about the color stops as pairs where every two colors blend together.");

 	   $pdf->DrawCodeArea("1");
	   $pdf->AddLessonCode("0px [yellow -- blend -- blue] 40px [green -- blend -- red] 80px");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("If every two color stop values are the same color, the blending isn't noticeable because it's between the same color, followed by a hard transition to the next color, so you end up with stripes.");
	   $pdf->AddLessonText("Make stripes by changing the repeating-linear-gradient() to use a gradient angle of 45deg, then set the first two color stops to yellow, and finally the second two color stops to black.");

 	   $pdf->DrawCodeArea("17");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  div{");
	   $pdf->AddLessonCode("    border-radius: 20px;");
	   $pdf->AddLessonCode("    width: 70%;");
	   $pdf->AddLessonCode("    height: 400px;");
	   $pdf->AddLessonCode("    margin:  50 auto;");
	   $pdf->AddLessonCode("    background: repeating-linear-gradient(");
	   $pdf->AddLessonCode("      45deg,");
	   $pdf->AddLessonCode("      yellow 0px,");
	   $pdf->AddLessonCode("      yellow 40px,");
	   $pdf->AddLessonCode("      black 40px,");
	   $pdf->AddLessonCode("      black 80px");
	   $pdf->AddLessonCode("    );");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("<div></div>");

}
 
    function GenerateAVDLesson33($pdf) {
       $pdf->AddLessonTitle("Create Texture by Adding a Subtle Pattern as a Background Image");
	   $pdf->AddLessonText("One way to add texture and interest to a background and have it stand out more is to add a subtle pattern. The key is balance, as you don't want the background to stand out too much, and take away from the foreground. The background property supports the url() function in order to link to an image of the chosen texture or pattern. The link address is wrapped in quotes inside the parentheses.");
	   $pdf->AddLessonText("Using the url of https://cdn-media-1.freecodecamp.org/imgr/MJAkxbh.png, set the background of the whole page with the body selector.");

 	   $pdf->DrawCodeArea("5");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  body {");
	   $pdf->AddLessonCode("background: url(https://cdn-media-1.freecodecamp.org/imgr/MJAkxbh.png);");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("</style>");
}
 
    function GenerateAVDLesson34($pdf) {
       $pdf->AddLessonTitle("Use the CSS Transform scale Property to Change the Size of an Element");
	   $pdf->AddLessonText("To change the scale of an element, CSS has the transform property, along with its scale() function. The following code example doubles the size of all the paragraph elements on the page:");

 	   $pdf->DrawCodeArea("3");
	   $pdf->AddLessonCode("p {");
	   $pdf->AddLessonCode("  transform: scale(2);");
	   $pdf->AddLessonCode("}");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Increase the size of the element with the id of ball2 to 1.5 times its original size.");

 	   $pdf->DrawCodeArea("25");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  .ball {");
	   $pdf->AddLessonCode("    width: 40px;");
	   $pdf->AddLessonCode("    height: 40px;");
	   $pdf->AddLessonCode("    margin: 50 auto;");
	   $pdf->AddLessonCode("    position: fixed;");
	   $pdf->AddLessonCode("    background: linear-gradient(");
	   $pdf->AddLessonCode("      35deg,");
	   $pdf->AddLessonCode("      #ccffff,");
	   $pdf->AddLessonCode("      #ffcccc");
	   $pdf->AddLessonCode("    );");
	   $pdf->AddLessonCode("    border-radius: 50%;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  #ball1 {");
	   $pdf->AddLessonCode("    left: 20%;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  #ball2 {");
	   $pdf->AddLessonCode("    left: 65%;");
	   $pdf->AddLessonCode("    transform: scale(1.5);");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("<div class='ball' id= 'ball1'></div>");
	   $pdf->AddLessonCode("<div class='ball' id= 'ball2'></div>");
	   $pdf->AddLessonCode("");
}
 
    function GenerateAVDLesson35($pdf) {
       $pdf->AddLessonTitle("Use the CSS Transform scale Property to Scale an Element on Hover");
	   $pdf->AddLessonText("The transform property has a variety of functions that let you scale, move, rotate, skew, etc., your elements. When used with pseudo-classes such as :hover that specify a certain state of an element, the transform property can easily add interactivity to your elements.");
	   $pdf->AddLessonText("Here's an example to scale the paragraph elements to 2.1 times their original size when a user hovers over them:");

 	   $pdf->DrawCodeArea("3");
	   $pdf->AddLessonCode("p:hover {");
	   $pdf->AddLessonCode("  transform: scale(2.1);");
	   $pdf->AddLessonCode("}");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Note: Applying a transform to a div element will also affect any child elements contained in the div.");

	   $pdf->AddLessonText("Add a CSS rule for the hover state of the div and use the transform property to scale the div element to 1.1 times its original size when a user hovers over it.");

 	   $pdf->DrawCodeArea("17");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  div {");
	   $pdf->AddLessonCode("    width: 70%;");
	   $pdf->AddLessonCode("    height: 100px;");
	   $pdf->AddLessonCode("    margin:  50px auto;");
	   $pdf->AddLessonCode("    background: linear-gradient(");
	   $pdf->AddLessonCode("      53deg,");
	   $pdf->AddLessonCode("      #ccfffc,");
	   $pdf->AddLessonCode("      #ffcccf");
	   $pdf->AddLessonCode("    );");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("div:hover {");
	   $pdf->AddLessonCode("  transform: scale(1.1);");
	   $pdf->AddLessonCode("}");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("<div></div>");
}
 
    function GenerateAVDLesson36($pdf) {
       $pdf->AddLessonTitle("Use the CSS Transform Property skewX to Skew an Element Along the X-Axis");
	   $pdf->AddLessonText("The next function of the transform property is skewX(), which skews the selected element along its X (horizontal) axis by a given degree.");
	   $pdf->AddLessonText("The following code skews the paragraph element by -32 degrees along the X-axis.");

 	   $pdf->DrawCodeArea("3");
	   $pdf->AddLessonCode("p:hover {");
	   $pdf->AddLessonCode("  transform: skewX(-32deg);");
	   $pdf->AddLessonCode("}");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Skew the element with the id of bottom by 24 degrees along the X-axis by using the transform property.");

 	   $pdf->DrawCodeArea("17");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  div {");
	   $pdf->AddLessonCode("    width: 70%;");
	   $pdf->AddLessonCode("    height: 100px;");
	   $pdf->AddLessonCode("    margin:  50px auto;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  #top {");
	   $pdf->AddLessonCode("    background-color: red;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  #bottom {");
	   $pdf->AddLessonCode("    background-color: blue;");
	   $pdf->AddLessonCode("    transform: skewX(24deg);");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("<div id='top'></div>");
	   $pdf->AddLessonCode("<div id='bottom'></div>");
}
 
    function GenerateAVDLesson37($pdf) {
       $pdf->AddLessonTitle("Use the CSS Transform Property skewY to Skew an Element Along the Y-Axis");
	   $pdf->AddLessonText("Given that the skewX() function skews the selected element along the X-axis by a given degree, it is no surprise that the skewY() property skews an element along the Y (vertical) axis.");
	   $pdf->AddLessonText("Skew the element with the id of top -10 degrees along the Y-axis by using the transform property.");

 	   $pdf->DrawCodeArea("18");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  div {");
	   $pdf->AddLessonCode("    width: 70%;");
	   $pdf->AddLessonCode("    height: 100px;");
	   $pdf->AddLessonCode("    margin:  50px auto;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  #top {");
	   $pdf->AddLessonCode("    background-color: red;");
	   $pdf->AddLessonCode("    transform: skewY(-10deg);");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  #bottom {");
	   $pdf->AddLessonCode("    background-color: blue;");
	   $pdf->AddLessonCode("    transform: skewX(24deg);");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("<div id='top'></div>");
	   $pdf->AddLessonCode("<div id='bottom'></div>");
}
 
    function GenerateAVDLesson38($pdf) {
       $pdf->AddLessonTitle("Create a Graphic Using CSS");
	   $pdf->AddLessonText("By manipulating different selectors and properties, you can make interesting shapes. One of the easier ones to try is a crescent moon shape. For this challenge you need to work with the box-shadow property that sets the shadow of an element, along with the border-radius property that controls the roundness of the element's corners.");
	   $pdf->AddLessonText("You will create a round, transparent object with a crisp shadow that is slightly offset to the side - the shadow is actually going to be the moon shape you see.");
	   $pdf->AddLessonText("In order to create a round object, the border-radius property should be set to a value of 50%.");
	   $pdf->AddLessonText("You may recall from an earlier challenge that the box-shadow property takes values for offset-x, offset-y, blur-radius, spread-radius and a color value in that order. The blur-radius and spread-radius values are optional.");
	   $pdf->AddLessonText("Manipulate the square element in the editor to create the moon shape. First, change the background-color to transparent, then set the border-radius property to 50% to make the circular shape. Finally, change the box-shadow property to set the offset-x to 25px, the offset-y to 10px, blur-radius to 0, spread-radius to 0, and color to blue.");

 	   $pdf->DrawCodeArea("16");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  .center {");
	   $pdf->AddLessonCode("    position: absolute;");
	   $pdf->AddLessonCode("    margin: auto;");
	   $pdf->AddLessonCode("    top: 0;");
	   $pdf->AddLessonCode("    right: 0;");
	   $pdf->AddLessonCode("    bottom: 0;");
	   $pdf->AddLessonCode("    left: 0;");
	   $pdf->AddLessonCode("    width: 100px;");
	   $pdf->AddLessonCode("    height: 100px;");
	   $pdf->AddLessonCode("    background-color: transparent;");
	   $pdf->AddLessonCode("    border-radius: 50%;");
	   $pdf->AddLessonCode("    box-shadow: 25px 10px 0px 0px blue;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("<div class='center'></div>");
}
 
    function GenerateAVDLesson39($pdf) {
       $pdf->AddLessonTitle("Create a More Complex Shape Using CSS and HTML");
	   $pdf->AddLessonText("One of the most popular shapes in the world is the heart shape, and in this challenge you'll create one using pure CSS. But first, you need to understand the ::before and ::after pseudo-elements. These pseudo-elements are used to add something before or after a selected element. In the following example, a ::before pseudo-element is used to add a rectangle to an element with the class heart:");

 	   $pdf->DrawCodeArea("10");
	   $pdf->AddLessonCode(".heart::before {");
	   $pdf->AddLessonCode("  content: '';");
	   $pdf->AddLessonCode("  background-color: yellow;");
	   $pdf->AddLessonCode("  border-radius: 25%;");
	   $pdf->AddLessonCode("  position: absolute;");
	   $pdf->AddLessonCode("  height: 50px;");
	   $pdf->AddLessonCode("  width: 70px;");
	   $pdf->AddLessonCode("  top: -50px;");
	   $pdf->AddLessonCode("  left: 5px;");
	   $pdf->AddLessonCode("}");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("For the ::before and ::after pseudo-elements to function properly, they must have a defined content property. This property is usually used to add things like a photo or text to the selected element. When the ::before and ::after pseudo-elements are used to make shapes, the content property is still required, but it's set to an empty string. In the above example, the element with the class of heart has a ::before pseudo-element that produces a yellow rectangle with height and width of 50px and 70px, respectively. This rectangle has round corners due to its 25% border radius and is positioned absolutely at 5px from the left and 50px above the top of the element.");
	   $pdf->AddLessonText("Transform the element on the screen to a heart. In the heart::after selector, change the background-color to pink and the border-radius to 50%.");
	   $pdf->AddLessonText("Next, target the element with the class heart (just heart) and fill in the transform property. Use the rotate() function with -45 degrees.");
	   $pdf->AddLessonText("Finally, in the heart::before selector, set its content property to an empty string.");

       $pdf->AddLessonTitle("Create a More Complex Shape Using CSS and HTML (Cont'd)");
 	   $pdf->DrawCodeArea("36");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  .heart {");
	   $pdf->AddLessonCode("    position: absolute;");
	   $pdf->AddLessonCode("    margin: auto;");
	   $pdf->AddLessonCode("    top: 0;");
	   $pdf->AddLessonCode("    right: 0;");
	   $pdf->AddLessonCode("    bottom: 0;");
	   $pdf->AddLessonCode("    left: 0;");
	   $pdf->AddLessonCode("    background-color: pink;");
	   $pdf->AddLessonCode("    height: 50px;");
	   $pdf->AddLessonCode("    width: 50px;");
	   $pdf->AddLessonCode("    transform: rotate(-45deg);");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  .heart::after {");
	   $pdf->AddLessonCode("    background-color: pink;");
	   $pdf->AddLessonCode("    content: '';");
	   $pdf->AddLessonCode("    border-radius: 50%;");
	   $pdf->AddLessonCode("    position: absolute;");
	   $pdf->AddLessonCode("    width: 50px;");
	   $pdf->AddLessonCode("    height: 50px;");
	   $pdf->AddLessonCode("    top: 0px;");
	   $pdf->AddLessonCode("    left: 25px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  .heart::before {");
	   $pdf->AddLessonCode("    content: '';");
	   $pdf->AddLessonCode("    background-color: pink;");
	   $pdf->AddLessonCode("    border-radius: 50%;");
	   $pdf->AddLessonCode("    position: absolute;");
	   $pdf->AddLessonCode("    width: 50px;");
	   $pdf->AddLessonCode("    height: 50px;");
	   $pdf->AddLessonCode("    top: -25px;");
	   $pdf->AddLessonCode("    left: 0px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("<div class='heart'></div>");
}
 
    function GenerateAVDLesson40($pdf) {
       $pdf->AddLessonTitle("Learn How the CSS @keyframes and animation Properties Work");
	   $pdf->AddLessonText("To animate an element, you need to know about the animation properties and the @keyframes rule. The animation properties control how the animation should behave and the @keyframes rule controls what happens during that animation. There are eight animation properties in total. This challenge will keep it simple and cover the two most important ones first:");
	   $pdf->AddLessonText("animation-name sets the name of the animation, which is later used by @keyframes to tell CSS which rules go with which animations.");
	   $pdf->AddLessonText("animation-duration sets the length of time for the animation.");
	   $pdf->AddLessonText("@keyframes is how to specify exactly what happens within the animation over the duration. This is done by giving CSS properties for specific 'frames' during the animation, with percentages ranging from 0% to 100%. If you compare this to a movie, the CSS properties for 0% is how the element displays in the opening scene. The CSS properties for 100% is how the element appears at the end, right before the credits roll. Then CSS applies the magic to transition the element over the given duration to act out the scene. Here's an example to illustrate the usage of @keyframes and the animation properties:");

 	   $pdf->DrawCodeArea("12");
	   $pdf->AddLessonCode("#anim {");
	   $pdf->AddLessonCode("  animation-name: colorful;");
	   $pdf->AddLessonCode("  animation-duration: 3s;");
	   $pdf->AddLessonCode("}");
	   $pdf->AddLessonCode("@keyframes colorful {");
	   $pdf->AddLessonCode("  0% {");
	   $pdf->AddLessonCode("    background-color: blue;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  100% {");
	   $pdf->AddLessonCode("    background-color: yellow;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("}");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("For the element with the anim id, the code snippet above sets the animation-name to colorful and sets the animation-duration to 3 seconds. Then the @keyframes rule links to the animation properties with the name colorful. It sets the color to blue at the beginning of the animation (0%) which will transition to yellow by the end of the animation (100%). You aren't limited to only beginning-end transitions, you can set properties for the element for any percentage between 0% and 100%.");
	   $pdf->AddLessonText("Create an animation for the element with the id rect, by setting the animation-name to rainbow and the animation-duration to 4 seconds. Next, declare a @keyframes rule, and set the background-color at the beginning of the animation (0%) to blue, the middle of the animation (50%) to green, and the end of the animation (100%) to yellow.");

       $pdf->AddLessonTitle("Learn How the CSS @keyframes and animation Properties Work (Cont'd)");
 	   $pdf->DrawCodeArea("26");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  div {");
	   $pdf->AddLessonCode("    height: 40px;");
	   $pdf->AddLessonCode("    width: 70%;");
	   $pdf->AddLessonCode("    background: black;");
	   $pdf->AddLessonCode("    margin: 50px auto;");
	   $pdf->AddLessonCode("    border-radius: 5px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  #rect {");
	   $pdf->AddLessonCode("  animation-name: rainbow;");
	   $pdf->AddLessonCode("  animation-duration: 4s;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("@keyframes rainbow {");
	   $pdf->AddLessonCode("  0% {");
	   $pdf->AddLessonCode("    background-color: blue;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  50% {");
	   $pdf->AddLessonCode("    background-color: green;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  100% {");
	   $pdf->AddLessonCode("    background-color: yellow;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("}");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("<div id='rect'></div>");   
}
 
    function GenerateAVDLesson41($pdf) {
       $pdf->AddLessonTitle("Use CSS Animation to Change the Hover State of a Button");
	   $pdf->AddLessonText("You can use CSS @keyframes to change the color of a button in its hover state.");
	   $pdf->AddLessonText("Here's an example of changing the width of an image on hover:");

 	   $pdf->DrawCodeArea("12");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  img:hover {");
	   $pdf->AddLessonCode("    animation-name: width;");
	   $pdf->AddLessonCode("    animation-duration: 500ms;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  @keyframes width {");
	   $pdf->AddLessonCode("    100% {");
	   $pdf->AddLessonCode("      width: 40px;");
	   $pdf->AddLessonCode("    }");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("<img src='https://bit.ly/smallgooglelogo' alt='Google''s Logo' />");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Note that ms stands for milliseconds, where 1000ms is equal to 1s.");
	   $pdf->AddLessonText("Use CSS @keyframes to change the background-color of the button element so it becomes #4791d0 when a user hovers over it. The @keyframes rule should only have an entry for 100%.");

 	   $pdf->DrawCodeArea("18");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  button {");
	   $pdf->AddLessonCode("    border-radius: 5px;");
	   $pdf->AddLessonCode("    color: white;");
	   $pdf->AddLessonCode("    background-color: #0F5897;");
	   $pdf->AddLessonCode("    padding: 5px 10px 8px 10px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("  button:hover {");
	   $pdf->AddLessonCode("    animation-name: background-color;");
	   $pdf->AddLessonCode("    animation-duration: 500ms;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  @keyframes background-color {");
	   $pdf->AddLessonCode("    100% {");
	   $pdf->AddLessonCode("    background-color: #4791d0;");
	   $pdf->AddLessonCode("    }");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("<button>Register</button>");
}
 
    function GenerateAVDLesson42($pdf) {
       $pdf->AddLessonTitle("Modify Fill Mode of an Animation");
	   $pdf->AddLessonText("That's great, but it doesn't work right yet. Notice how the animation resets after 500ms has passed, causing the button to revert back to the original color. You want the button to stay highlighted.");
	   $pdf->AddLessonText("This can be done by setting the animation-fill-mode property to forwards. The animation-fill-mode specifies the style applied to an element when the animation has finished. You can set it like so:");

 	   $pdf->DrawCodeArea("1");
	   $pdf->AddLessonCode("animation-fill-mode: forwards;");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Set the animation-fill-mode property of button:hover to forwards so the button stays highlighted when a user hovers over it.");

 	   $pdf->DrawCodeArea("19");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  button {");
	   $pdf->AddLessonCode("    border-radius: 5px;");
	   $pdf->AddLessonCode("    color: white;");
	   $pdf->AddLessonCode("    background-color: #0F5897;");
	   $pdf->AddLessonCode("    padding: 5px 10px 8px 10px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("  button:hover {");
	   $pdf->AddLessonCode("    animation-name: background-color;");
	   $pdf->AddLessonCode("    animation-duration: 500ms;");
	   $pdf->AddLessonCode("    animation-fill-mode: forwards;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  @keyframes background-color {");
	   $pdf->AddLessonCode("    100% {");
	   $pdf->AddLessonCode("    background-color: #4791d0;");
	   $pdf->AddLessonCode("    }");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("<button>Register</button>");
}
 
    function GenerateAVDLesson43($pdf) {
       $pdf->AddLessonTitle("Create Movement Using CSS Animation");
	   $pdf->AddLessonText("When elements have a specified position, such as fixed or relative, the CSS offset properties right, left, top, and bottom can be used in animation rules to create movement.");
	   $pdf->AddLessonText("As shown in the example below, you can push the item downwards then upwards by setting the top property of the 50% keyframe to 50px, but having it set to 0px for the first (0%) and the last (100%) keyframe.");

 	   $pdf->DrawCodeArea("14");
	   $pdf->AddLessonCode("@keyframes rainbow {");
	   $pdf->AddLessonCode("  0% {");
	   $pdf->AddLessonCode("    background-color: blue;");
	   $pdf->AddLessonCode("    top: 0px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  50% {");
	   $pdf->AddLessonCode("    background-color: green;");
	   $pdf->AddLessonCode("    top: 50px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  100% {");
	   $pdf->AddLessonCode("    background-color: yellow;");
	   $pdf->AddLessonCode("    top: 0px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("}");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Add a horizontal motion to the div animation. Using the left offset property, add to the @keyframes rule so rainbow starts at 0 pixels at 0%, moves to 25 pixels at 50%, and ends at -25 pixels at 100%. Don't replace the top property in the editor - the animation should have both vertical and horizontal motion.");

       $pdf->AddLessonTitle("Create Movement Using CSS Animation (Cont'd)");
 	   $pdf->DrawCodeArea("35");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  div {");
	   $pdf->AddLessonCode("    height: 40px;");
	   $pdf->AddLessonCode("    width: 70%;");
	   $pdf->AddLessonCode("    background: black;");
	   $pdf->AddLessonCode("    margin: 50px auto;");
	   $pdf->AddLessonCode("    border-radius: 5px;");
	   $pdf->AddLessonCode("    position: relative;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("  #rect {");
	   $pdf->AddLessonCode("    animation-name: rainbow;");
	   $pdf->AddLessonCode("    animation-duration: 4s;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("  @keyframes rainbow {");
	   $pdf->AddLessonCode("    0% {");
	   $pdf->AddLessonCode("      background-color: blue;");
	   $pdf->AddLessonCode("      top: 0px;");
	   $pdf->AddLessonCode("      left: 0px;");
	   $pdf->AddLessonCode("    }");
	   $pdf->AddLessonCode("    50% {");
	   $pdf->AddLessonCode("      background-color: green;");
	   $pdf->AddLessonCode("      top: 50px;");
	   $pdf->AddLessonCode("      left: 25px;");
	   $pdf->AddLessonCode("    }");
	   $pdf->AddLessonCode("    100% {");
	   $pdf->AddLessonCode("      background-color: yellow;");
	   $pdf->AddLessonCode("      top: 0px;");
	   $pdf->AddLessonCode("      left: -25px;");
	   $pdf->AddLessonCode("    }");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("<div id='rect'></div>");
	}
 
    function GenerateAVDLesson44($pdf) {
       $pdf->AddLessonTitle("Create Visual Direction by Fading an Element from Left to Right");
	   $pdf->AddLessonText("For this challenge, you'll change the opacity of an animated element so it gradually fades as it reaches the right side of the screen.");
	   $pdf->AddLessonText("In the displayed animation, the round element with the gradient background moves to the right by the 50% mark of the animation per the @keyframes rule.");
	   $pdf->AddLessonText("Target the element with the id of ball and add the opacity property set to 0.1 at 50%, so the element fades as it moves to the right.");

 	   $pdf->DrawCodeArea("25");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  #ball {");
	   $pdf->AddLessonCode("    width: 70px;");
	   $pdf->AddLessonCode("    height: 70px;");
	   $pdf->AddLessonCode("    margin: 50px auto;");
	   $pdf->AddLessonCode("    position: fixed;");
	   $pdf->AddLessonCode("    left: 20%;");
	   $pdf->AddLessonCode("    border-radius: 50%;");
	   $pdf->AddLessonCode("    background: linear-gradient(");
	   $pdf->AddLessonCode("      35deg,");
	   $pdf->AddLessonCode("      #ccffff,");
	   $pdf->AddLessonCode("      #ffcccc");
	   $pdf->AddLessonCode("    );");
	   $pdf->AddLessonCode("    animation-name: fade;");
	   $pdf->AddLessonCode("    animation-duration: 3s;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  @keyframes fade {");
	   $pdf->AddLessonCode("    50% {");
	   $pdf->AddLessonCode("      left: 60%;");
	   $pdf->AddLessonCode("      opacity: 0.1;");
	   $pdf->AddLessonCode("    }");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("<div id='ball'></div>");
	}
 
    function GenerateAVDLesson45($pdf) {
       $pdf->AddLessonTitle("Animate Elements Continually Using an Infinite Animation Count");
	   $pdf->AddLessonText("The previous challenges covered how to use some of the animation properties and the @keyframes rule. Another animation property is the animation-iteration-count, which allows you to control how many times you would like to loop through the animation. Here's an example:");

 	   $pdf->DrawCodeArea("1");
	   $pdf->AddLessonCode("animation-iteration-count: 3;");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("In this case the animation will stop after running 3 times, but it's possible to make the animation run continuously by setting that value to infinite.");
	   $pdf->AddLessonText("To keep the ball bouncing on the right on a continuous loop, change the animation-iteration-count property to infinite.");

 	   $pdf->DrawCodeArea("31");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  #ball {");
	   $pdf->AddLessonCode("    width: 100px;");
	   $pdf->AddLessonCode("    height: 100px;");
	   $pdf->AddLessonCode("    margin: 50px auto;");
	   $pdf->AddLessonCode("    position: relative;");
	   $pdf->AddLessonCode("    border-radius: 50%;");
	   $pdf->AddLessonCode("    background: linear-gradient(");
	   $pdf->AddLessonCode("      35deg,");
	   $pdf->AddLessonCode("      #ccffff,");
	   $pdf->AddLessonCode("      #ffcccc");
	   $pdf->AddLessonCode("    );");
	   $pdf->AddLessonCode("    animation-name: bounce;");
	   $pdf->AddLessonCode("    animation-duration: 1s;");
	   $pdf->AddLessonCode("    animation-iteration-count: infinite;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  @keyframes bounce{");
	   $pdf->AddLessonCode("    0% {");
	   $pdf->AddLessonCode("      top: 0px;");
	   $pdf->AddLessonCode("    }");
	   $pdf->AddLessonCode("    50% {");
	   $pdf->AddLessonCode("      top: 249px;");
	   $pdf->AddLessonCode("      width: 130px;");
	   $pdf->AddLessonCode("      height: 70px;");
	   $pdf->AddLessonCode("    }");
	   $pdf->AddLessonCode("    100% {");
	   $pdf->AddLessonCode("      top: 0px;");
	   $pdf->AddLessonCode("    }");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("<div id='ball'></div>");
	}
 
    function GenerateAVDLesson46($pdf) {
       $pdf->AddLessonTitle("Make a CSS Heartbeat using an Infinite Animation Count");
	   $pdf->AddLessonText("Here's one more continuous animation example with the animation-iteration-count property that uses the heart you designed in a previous challenge.");
	   $pdf->AddLessonText("The one-second long heartbeat animation consists of two animated pieces. The heart elements (including the :before and :after pieces) are animated to change size using the transform property, and the background div is animated to change its color using the background property.");
	   $pdf->AddLessonText("Keep the heart beating by adding the animation-iteration-count property for both the back class and the heart class and setting the value to infinite. The heart:before and heart:after selectors do not need any animation properties.");

 	   $pdf->DrawCodeArea("40");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  .back {");
	   $pdf->AddLessonCode("    position: fixed;");
	   $pdf->AddLessonCode("    padding: 0;");
	   $pdf->AddLessonCode("    margin: 0;");
	   $pdf->AddLessonCode("    top: 0;");
	   $pdf->AddLessonCode("    left: 0;");
	   $pdf->AddLessonCode("    width: 100%;");
	   $pdf->AddLessonCode("    height: 100%;");
	   $pdf->AddLessonCode("    background: white;");
	   $pdf->AddLessonCode("    animation-name: backdiv;");
	   $pdf->AddLessonCode("    animation-duration: 1s;");
	   $pdf->AddLessonCode("    animation-iteration-count: infinite;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("  .heart {");
	   $pdf->AddLessonCode("    position: absolute;");
	   $pdf->AddLessonCode("    margin: auto;");
	   $pdf->AddLessonCode("    top: 0;");
	   $pdf->AddLessonCode("    right: 0;");
	   $pdf->AddLessonCode("    bottom: 0;");
	   $pdf->AddLessonCode("    left: 0;");
	   $pdf->AddLessonCode("    background-color: pink;");
	   $pdf->AddLessonCode("    height: 50px;");
	   $pdf->AddLessonCode("    width: 50px;");
	   $pdf->AddLessonCode("    transform: rotate(-45deg);");
	   $pdf->AddLessonCode("    animation-name: beat;");
	   $pdf->AddLessonCode("    animation-duration: 1s;");
	   $pdf->AddLessonCode("    animation-iteration-count: infinite;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  .heart:after {");
	   $pdf->AddLessonCode("    background-color: pink;");
	   $pdf->AddLessonCode("    content: '';");
	   $pdf->AddLessonCode("    border-radius: 50%;");
	   $pdf->AddLessonCode("    position: absolute;");
	   $pdf->AddLessonCode("    width: 50px;");
	   $pdf->AddLessonCode("    height: 50px;");
	   $pdf->AddLessonCode("    top: 0px;");
	   $pdf->AddLessonCode("    left: 25px;");
	   $pdf->AddLessonCode("  }");

       $pdf->AddLessonTitle("Make a CSS Heartbeat using an Infinite Animation Count (Cont'd)");
 	   $pdf->DrawCodeArea("30");
	   $pdf->AddLessonCode("  .heart:before {");
	   $pdf->AddLessonCode("    background-color: pink;");
	   $pdf->AddLessonCode("    content: '';");
	   $pdf->AddLessonCode("    border-radius: 50%;");
	   $pdf->AddLessonCode("    position: absolute;");
	   $pdf->AddLessonCode("    width: 50px;");
	   $pdf->AddLessonCode("    height: 50px;");
	   $pdf->AddLessonCode("    top: -25px;");
	   $pdf->AddLessonCode("    left: 0px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("  @keyframes backdiv {");
	   $pdf->AddLessonCode("    50% {");
	   $pdf->AddLessonCode("      background: #ffe6f2;");
	   $pdf->AddLessonCode("    }");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("  @keyframes beat {");
	   $pdf->AddLessonCode("    0% {");
	   $pdf->AddLessonCode("      transform: scale(1) rotate(-45deg);");
	   $pdf->AddLessonCode("    }");
	   $pdf->AddLessonCode("    50% {");
	   $pdf->AddLessonCode("      transform: scale(0.6) rotate(-45deg);");
	   $pdf->AddLessonCode("    }");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("<div class='back'></div>");
	   $pdf->AddLessonCode("<div class='heart'></div>");
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
	   GenerateAVDLesson10($pdf);
	   GenerateAVDLesson11($pdf);
	   GenerateAVDLesson12($pdf);
	   GenerateAVDLesson13($pdf);
	   GenerateAVDLesson14($pdf);
	   GenerateAVDLesson15($pdf);
	   GenerateAVDLesson16($pdf);
	   GenerateAVDLesson17($pdf);
	   GenerateAVDLesson18($pdf);
	   GenerateAVDLesson19($pdf);
	   GenerateAVDLesson20($pdf);
	   GenerateAVDLesson21($pdf);
	   GenerateAVDLesson22($pdf);
	   GenerateAVDLesson23($pdf);
	   GenerateAVDLesson24($pdf);
	   GenerateAVDLesson25($pdf);
	   GenerateAVDLesson26($pdf);
	   GenerateAVDLesson27($pdf);
	   GenerateAVDLesson28($pdf);
	   GenerateAVDLesson29($pdf);
	   GenerateAVDLesson30($pdf);
	   GenerateAVDLesson31($pdf);
	   GenerateAVDLesson32($pdf);
	   GenerateAVDLesson33($pdf);
	   GenerateAVDLesson34($pdf);
	   GenerateAVDLesson35($pdf);
	   GenerateAVDLesson36($pdf);
	   GenerateAVDLesson37($pdf);
	   GenerateAVDLesson38($pdf);
	   GenerateAVDLesson39($pdf);
	   GenerateAVDLesson40($pdf);
	   GenerateAVDLesson41($pdf);
	   GenerateAVDLesson42($pdf);
	   GenerateAVDLesson43($pdf);
	   GenerateAVDLesson44($pdf);
	   GenerateAVDLesson45($pdf);
	   GenerateAVDLesson46($pdf);
   }

?>
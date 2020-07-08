<?php

   function GenerateRDLesson1($pdf) {
       $pdf->AddLessonTitle("Create a Media Query");
	   $pdf->AddLessonText("Media Queries are a new technique introduced in CSS3 that change the presentation of content based on different viewport sizes. The viewport is a user's visible area of a web page, and is different depending on the device used to access the site.");
	   $pdf->AddLessonText("Media Queries consist of a media type, and if that media type matches the type of device the document is displayed on, the styles are applied. You can have as many selectors and styles inside your media query as you want.");
	   $pdf->AddLessonText("Here's an example of a media query that returns the content when the device's width is less than or equal to 100px:");

	   $pdf->DrawCodeArea("1");
	   $pdf->AddLessonCode("@media (max-width: 100px) { /* CSS Rules */ }");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("and the following media query returns the content when the device's height is more than or equal to 350px:");

	   $pdf->DrawCodeArea("1");
	   $pdf->AddLessonCode("@media (min-height: 350px) { /* CSS Rules */ }");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Remember, the CSS inside the media query is applied only if the media type matches that of the device being used.");
	   $pdf->AddLessonText("Add a media query, so that the p tag has a font-size of 10px when the device's height is less than or equal to 800px.");

	   $pdf->DrawCodeArea("17");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  p {");
	   $pdf->AddLessonCode("    font-size: 20px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("@media (max-height: 800px) { ");
	   $pdf->AddLessonCode("     p {");
	   $pdf->AddLessonCode("       font-size: 10px;");
	   $pdf->AddLessonCode("     }");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus quis tempus massa. Aenean erat nisl, gravida vel vestibulum cursus, interdum sit amet lectus. Sed sit amet quam nibh. Suspendisse quis tincidunt nulla. In hac habitasse platea dictumst. Ut sit amet pretium nisl. Vivamus vel mi sem. Aenean sit amet consectetur sem. Suspendisse pretium, purus et gravida consequat, nunc ligula ultricies diam, at aliquet velit libero a dui.</p>");
   }
 
   function GenerateRDLesson2($pdf) {
       $pdf->AddLessonTitle("Make an Image Responsive");
	   $pdf->AddLessonText("Making images responsive with CSS is actually very simple. You just need to add these properties to an image:");

	   $pdf->DrawCodeArea("4");
	   $pdf->AddLessonCode("img {");
	   $pdf->AddLessonCode("  max-width: 100%;");
	   $pdf->AddLessonCode("  height: auto;");
	   $pdf->AddLessonCode("}");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("The max-width of 100% will make sure the image is never wider than the container it is in, and the height of auto will make the image keep its original aspect ratio.");
	   $pdf->AddLessonText("Add the style rules to the responsive-img class to make it responsive. It should never be wider than its container (in this case, it's the preview window) and it should keep its original aspect ratio. After you have added your code, resize the preview to see how your images behave.");

	   $pdf->DrawCodeArea("16");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode(".responsive-img {");
	   $pdf->AddLessonCode("  max-width: 100%;");
	   $pdf->AddLessonCode("  height: auto;");
	   $pdf->AddLessonCode("}");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("img {");
	   $pdf->AddLessonCode("  width: 600px;");
	   $pdf->AddLessonCode("}");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("<img class='responsive-img' src='https://s3.amazonaws.com/freecodecamp/FCCStickerPack.jpg' alt='freeCodeCamp stickers set'>");
	   $pdf->AddLessonCode("<img src='https://s3.amazonaws.com/freecodecamp/FCCStickerPack.jpg' alt='freeCodeCamp stickers set'>");
   }
 
      function GenerateRDLesson3($pdf) {
       $pdf->AddLessonTitle("Use a Retina Image for Higher Resolution Displays");
	   $pdf->AddLessonText("With the increase of internet connected devices, their sizes and specifications vary, and the displays they use could be different externally and internally. Pixel density is an aspect that could be different on one device from others and this density is known as Pixel Per Inch(PPI) or Dots Per Inch(DPI). The most famous such display is the one known as a 'Retina Display' on the latest Apple MacBook Pro notebooks, and recently iMac computers. Due to the difference in pixel density between a 'Retina' and 'Non-Retina' displays, some images that have not been made with a High-Resolution Display in mind could look 'pixelated' when rendered on a High-Resolution display.");
	   $pdf->AddLessonText("The simplest way to make your images properly appear on High-Resolution Displays, such as the MacBook Pros 'retina display' is to define their width and height values as only half of what the original file is. Here is an example of an image that is only using half of the original height and width:");

	   $pdf->DrawCodeArea("4");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  img { height: 250px; width: 250px; }");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("<img src='coolPic500x500' alt='A most excellent picture'>");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Set the width and height of the img tag to half of their original values. In this case, both the original height and the original width are 200px.");

	   $pdf->DrawCodeArea("7");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  img { height: 100px; width: 100px; }");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("<img src='https://s3.amazonaws.com/freecodecamp/FCCStickers-CamperBot200x200.jpg' alt='freeCodeCamp sticker that says 'Because CamperBot Cares''>");
   }
 
function GenerateRDLesson4($pdf) {
       $pdf->AddLessonTitle("Make Typography Responsive");
	   $pdf->AddLessonText("Instead of using em or px to size text, you can use viewport units for responsive typography. Viewport units, like percentages, are relative units, but they are based off different items. Viewport units are relative to the viewport dimensions (width or height) of a device, and percentages are relative to the size of the parent container element.");
	   $pdf->AddLessonText("The four different viewport units are:");

	   $pdf->DrawCodeArea("6");
	   $pdf->AddLessonCode("vw (viewport width): 10vw would be 10% of the viewport's width.");
	   $pdf->AddLessonCode("vh (viewport height): 3vh would be 3% of the viewport's height.");
	   $pdf->AddLessonCode("vmin (viewport minimum): 70vmin would be 70% of the viewport's smaller dimension (height or width).");
	   $pdf->AddLessonCode("vmax (viewport maximum): 100vmax would be 100% of the viewport's bigger dimension (height or width).");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Here is an example that sets a body tag to 30% of the viewport's width.");

	   $pdf->DrawCodeArea("1");
	   $pdf->AddLessonCode("body { width: 30vw; }");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Set the width of the h2 tag to 80% of the viewport's width and the width of the paragraph as 75% of the viewport's smaller dimension.");

	   $pdf->DrawCodeArea("13");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("h2 { width: 80vw; }");
	   $pdf->AddLessonCode("p  { width: 75vmin; }");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("<h2>Importantus Ipsum</h2>");
	   $pdf->AddLessonCode("<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus quis tempus massa. Aenean erat nisl, gravida vel vestibulum cursus, interdum sit amet lectus. Sed sit amet quam nibh. Suspendisse quis tincidunt nulla. In hac habitasse platea dictumst. Ut sit amet pretium nisl. Vivamus vel mi sem. Aenean sit amet consectetur sem. Suspendisse pretium, purus et gravida consequat, nunc ligula ultricies diam, at aliquet velit libero a dui.</p>");
	   
   }
 

 function GenerateResponsiveDesignManual($pdf) {
	   $pdf->AddSubject("Introduction to the Responsive Web Design Challenges");
	   GenerateRDLesson1($pdf);
	   GenerateRDLesson2($pdf);
	   GenerateRDLesson3($pdf);
	   GenerateRDLesson4($pdf);
   }

?>
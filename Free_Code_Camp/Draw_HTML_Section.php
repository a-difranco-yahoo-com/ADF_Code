<?php

   function GenerateHTMLLesson1($pdf) {
       $pdf->AddLessonTitle("Say Hello to HTML");
	   $pdf->AddLessonText("Welcome to freeCodeCamp's HTML coding challenges. These will walk you through web development step-by-step.");
	   $pdf->AddLessonText("First, you'll start by building a simple web page using HTML. You can edit code in your code editor, which is embedded into this web page.");
	   $pdf->AddLessonText("Do you see the code in your code editor that says <h1>Hello</h1>? That's an HTML element.");
	   $pdf->AddLessonText("Most HTML elements have an opening tag and a closing tag.");
	   $pdf->AddLessonText("Opening tags look like this:");
	   $pdf->AddLessonText("<h1>Closing tags look like this:</h1>");
	   $pdf->AddLessonText("The only difference between opening and closing tags is the forward slash after the opening bracket of a closing tag.");
	   $pdf->AddLessonText("Each challenge has tests you can run at any time by clicking the 'Run tests' button. When you pass all tests, you'll be prompted to submit your solution and go to the next coding challenge.");
	   $pdf->AddLessonText("To pass the test on this challenge, change your h1 element's text to say 'Hello World'.");
	   $pdf->DrawCodeArea("1");
	   $pdf->AddLessonCode("<h1>Hello World</h1>");
   }
	   
   function GenerateHTMLLesson2($pdf) {
       $pdf->AddLessonTitle("Headline with the h2 Element");
	   $pdf->AddLessonText("Over the next few lessons, we'll build an HTML5 cat photo web app piece-by-piece.");
	   $pdf->AddLessonText("The h2 element you will be adding in this step will add a level two heading to the web page.");
	   $pdf->AddLessonText("This element tells the browser about the structure of your website. h1 elements are often used for main headings, while h2 elements are generally used for subheadings. There are also h3, h4, h5 and h6 elements to indicate different levels of subheadings.");
       $pdf->AddLessonText("Add an h2 tag that says 'CatPhotoApp' to create a second HTML element below your 'Hello World' h1 element.");
	   $pdf->DrawCodeArea("2");
	   $pdf->AddLessonCode("<h1>Hello World</h1>");
	   $pdf->AddLessonCode("<h2>CatPhotoApp</h2>");
   }
	   
   function GenerateHTMLLesson3($pdf) {
       $pdf->AddLessonTitle("Basic HTML and HTML5: Inform with the Paragraph");
	   $pdf->AddLessonText("p elements are the preferred element for paragraph text on websites. p is short for 'paragraph'.");
	   $pdf->AddLessonText("You can create a paragraph element like this:");
	   $pdf->AddLessonText("<p>I'm a p tag!</p>");
	   $pdf->AddLessonText("Create a p element below your h2 element, and give it the text 'Hello Paragraph'.");
	   $pdf->AddLessonText("Note: As a convention, all HTML tags are written in lowercase, for example <p></p> and not <P></P>.");
	   $pdf->DrawCodeArea("3");
       $pdf->AddLessonCode("<h1>Hello World</h1>");
	   $pdf->AddLessonCode("<h2>CatPhotoApp</h2>");
	   $pdf->AddLessonCode("<p>Hello Paragraph</p>");
   }
	   
   function GenerateHTMLLesson4($pdf) {
       $pdf->AddLessonTitle("Fill in the Blank with Placeholder Text");
	   $pdf->AddLessonText("Web developers traditionally use lorem ipsum text as placeholder text. The lorem ipsum text is randomly scraped from a famous passage by Cicero of Ancient Rome.");
	   $pdf->AddLessonText("Lorem ipsum text has been used as placeholder text by typesetters since the 16th century, and this tradition continues on the web.");
	   $pdf->AddLessonText("Well, 5 centuries is long enough. Since we're building a CatPhotoApp, let's use something called 'kitty ipsum text'.");
	   $pdf->AddLessonText("Replace the text inside your p element with the first few words of this kitty ipsum text: Kitty ipsum dolor sit amet, shed everywhere shed everywhere stretching attack your ankles chase the red dot, hairball run catnip eat the grass sniff");
	   $pdf->DrawCodeArea("3");
       $pdf->AddLessonCode("<h1>Hello World</h1>");
       $pdf->AddLessonCode("<h2>CatPhotoApp</h2>");
       $pdf->AddLessonCode("<p>Kitty ipsum dolor sit amet</p>");
   }
	   
   function GenerateHTMLLesson5($pdf) {
       $pdf->AddLessonTitle("Uncomment HTML");
	   $pdf->AddLessonText("Commenting is a way that you can leave comments for other developers within your code without affecting the resulting output that is displayed to the end user.");
	   $pdf->AddLessonText("Commenting is also a convenient way to make code inactive without having to delete it entirely.");
	   $pdf->AddLessonText("Comments in HTML start with <!-- and end with a -->");
	   $pdf->AddLessonText("Uncomment your h1, h2 and p elements.");
	   $pdf->DrawCodeArea(7);
       $pdf->AddLessonCode("<h1>Hello World</h1>");
       $pdf->AddLessonCode("");
       $pdf->AddLessonCode("<h2>CatPhotoApp</h2>");
       $pdf->AddLessonCode("");
       $pdf->AddLessonCode("<p>Kitty ipsum dolor sit amet, shed everywhere shed everywhere stretching attack your ankles chase the red dot, hairball run catnip eat the grass sniff.</p>");
   }
	   
   function GenerateHTMLLesson6($pdf) {
       $pdf->AddLessonTitle("Comment out HTML");
	   $pdf->AddLessonText("Remember that in order to start a comment, you need to use <!-- and to end a comment, you need to use -->");
	   $pdf->AddLessonText("Here you'll need to end the comment before your h2 element begins.");
	   $pdf->AddLessonText("Comment out your h1 element and your p element, but not your h2 element.");
	   $pdf->DrawCodeArea(9);
       $pdf->AddLessonCode("<!--");
       $pdf->AddLessonCode("<h1>Hello World</h1>");
       $pdf->AddLessonCode("-->");
       $pdf->AddLessonCode("<h2>CatPhotoApp</h2>");
       $pdf->AddLessonCode("<!--");
       $pdf->AddLessonCode("<p>Kitty ipsum dolor sit amet, shed everywhere shed everywhere stretching attack your ankles chase the red dot, hairball run catnip eat the grass sniff.</p>");
       $pdf->AddLessonCode("-->");
   }
	   
   function GenerateHTMLLesson7($pdf) {
       $pdf->AddLessonTitle("Delete HTML Elements");
	   $pdf->AddLessonText("Our phone doesn't have much vertical space.");
	   $pdf->AddLessonText("Let's remove the unnecessary elements so we can start building our CatPhotoApp.");
	   $pdf->AddLessonText("Delete your h1 element so we can simplify our view.");
	   $pdf->DrawCodeArea(6);
       $pdf->AddLessonCode("<h2>CatPhotoApp</h2>");
       $pdf->AddLessonCode("");
       $pdf->AddLessonCode("<p>Kitty ipsum dolor sit amet, shed everywhere shed everywhere stretching attack your ankles chase the red dot, hairball run catnip eat the grass sniff.</p>");
   }
	   
   function GenerateHTMLLesson8($pdf) {
       $pdf->AddLessonTitle("Introduction to HTML5 Elements");
	   $pdf->AddLessonText("HTML5 introduces more descriptive HTML tags. These include main, header, footer, nav, video, article, section and others.");
	   $pdf->AddLessonText("These tags give a descriptive structure to your HTML, make your HTML easier to read, and help with Search Engine Optimization (SEO) and accessibility. The main HTML5 tag helps search engines and other developers find the main content of your page.");
	   $pdf->AddLessonText("Example usage, a main element with two child elements nested inside it:");

	   $pdf->DrawCodeArea(4);
       $pdf->AddLessonCode("<main>");
       $pdf->AddLessonCode("  <h1>Hello World</h1>");
       $pdf->AddLessonCode("  <p>Hello Paragraph</p>");
       $pdf->AddLessonCode("</main>");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Note: Many of the new HTML5 tags and their benefits are covered in the Applied Accessibility section.");
	   $pdf->AddLessonText("Create a second p element after the existing p element with the following kitty ipsum text: Purr jump eat the grass rip the couch scratched sunbathe, shed everywhere rip the couch sleep in the sink fluffy fur catnip scratched.");
	   $pdf->AddLessonText("Then, create a main element and nest the two p elements inside the main element.");

	   $pdf->DrawCodeArea(10);
       $pdf->AddLessonCode("<h2>CatPhotoApp</h2>");
       $pdf->AddLessonCode("<main>");
       $pdf->AddLessonCode("<p>Kitty ipsum dolor sit amet, shed everywhere shed everywhere stretching attack your ankles chase the red dot, hairball run catnip eat the grass sniff.</p>");
       $pdf->AddLessonCode("");
       $pdf->AddLessonCode("<p>Purr jump eat the grass rip the couch scratched sunbathe, shed everywhere rip the couch sleep in the sink fluffy fur catnip scratched.</p>");
       $pdf->AddLessonCode("</main>");
   }
	   
   function GenerateHTMLLesson9($pdf) {
       $pdf->AddLessonTitle("Add Images to Your Website");
	   $pdf->AddLessonText("You can add images to your website by using the img element, and point to a specific image's URL using the src attribute.");
	   $pdf->AddLessonText("An example of this would be:");

	   $pdf->DrawCodeArea(1);
       $pdf->AddLessonCode("<img src='https://www.your-image-source.com/your-image.jpg'>");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Note that img elements are self-closing.");
	   $pdf->AddLessonText("All img elements must have an alt attribute. The text inside an alt attribute is used for screen readers to improve accessibility and is displayed if the image fails to load.");
	   $pdf->AddLessonText("Note: If the image is purely decorative, using an empty alt attribute is a best practice.");
	   $pdf->AddLessonText("Ideally the alt attribute should not contain special characters unless needed.");
	   $pdf->AddLessonText("Let's add an alt attribute to our img example above:");

	   $pdf->DrawCodeArea(2);
       $pdf->AddLessonCode("<img src='https://www.your-image-source.com/your-image.jpg' alt='Author standing on a beach with two thumbs up.'>");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Let's try to add an image to our website:");
	   $pdf->AddLessonText("Within the existing main element, insert an img element before the existing p elements.");
	   $pdf->AddLessonText("Now set the src attribute so that it points to this url:");

	   $pdf->DrawCodeArea(1);
       $pdf->AddLessonCode("https://bit.ly/fcc-relaxing-cat");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Finally, don't forget to give your img element an alt attribute with applicable text.");

	   $pdf->DrawCodeArea(12);
       $pdf->AddLessonCode("<h2>CatPhotoApp</h2>");
       $pdf->AddLessonCode("<main>");
       $pdf->AddLessonCode("");
       $pdf->AddLessonCode("<img src='https://bit.ly/fcc-relaxing-cat' alt='cat'>");
       $pdf->AddLessonCode("");
       $pdf->AddLessonCode("<p>Kitty ipsum dolor sit amet, shed everywhere shed everywhere stretching attack your ankles chase the red dot, hairball run catnip eat the grass sniff.</p>");
       $pdf->AddLessonCode("<p>Purr jump eat the grass rip the couch scratched sunbathe, shed everywhere rip the couch sleep in the sink fluffy fur catnip scratched.</p>");
       $pdf->AddLessonCode("</main>");
   }
	   
   function GenerateHTMLLesson10($pdf) {
       $pdf->AddLessonTitle("Link to External Pages with Anchor Elements");
	   $pdf->AddLessonText("You can use a (anchor) elements to link to content outside of your web page.");
	   $pdf->AddLessonText("a elements need a destination web address called an href attribute. They also need anchor text. Here's an example:");

	   $pdf->DrawCodeArea(1);
       $pdf->AddLessonCode("<a href='https://freecodecamp.org'>this links to freecodecamp.org</a>");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Then your browser will display the text 'this links to freecodecamp.org' as a link you can click. And that link will take you to the web address https://www.freecodecamp.org.");
	   $pdf->AddLessonText("Create an a element that links to http://freecatphotoapp.com and has 'cat photos' as its anchor text.");
	
	   $pdf->DrawCodeArea(14);
       $pdf->AddLessonCode("<h2>CatPhotoApp</h2>");
       $pdf->AddLessonCode("<main>");
       $pdf->AddLessonCode("");
       $pdf->AddLessonCode("<img src='https://bit.ly/fcc-relaxing-cat' alt='A cute orange cat lying on its back.'>");
       $pdf->AddLessonCode("<a href='http://freecatphotoapp.com'>cat photos</a>");
       $pdf->AddLessonCode("");
       $pdf->AddLessonCode("<p>Kitty ipsum dolor sit amet, shed everywhere shed everywhere stretching attack your ankles chase the red dot, hairball run catnip eat the grass sniff.</p>");
       $pdf->AddLessonCode("<p>Purr jump eat the grass rip the couch scratched sunbathe, shed everywhere rip the couch sleep in the sink fluffy fur catnip scratched.</p>");
       $pdf->AddLessonCode("</main>");
   }
	   
   function GenerateHTMLLesson11($pdf) {
       $pdf->AddLessonTitle("Link to Internal Sections of a Page with Anchor Elements");
	   $pdf->AddLessonText("a (anchor) elements can also be used to create internal links to jump to different sections within a webpage.");
	   $pdf->AddLessonText("To create an internal link, you assign a link's href attribute to a hash symbol # plus the value of the id attribute for the element that you want to internally link to, usually further down the page. You then need to add the same id attribute to the element you are linking to. An id is an attribute that uniquely describes an element.");
	   $pdf->AddLessonText("Below is an example of an internal anchor link and its target element:");

	   $pdf->DrawCodeArea(3);
       $pdf->AddLessonCode("<a href='#contacts-header'>Contacts</a>");
       $pdf->AddLessonCode("...");
       $pdf->AddLessonCode("<h2 id='contacts-header'>Contacts</h2>");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("When users click the Contacts link, they'll be taken to the section of the webpage with the Contacts header element.");
	   $pdf->AddLessonText("Change your external link to an internal link by changing the href attribute to '#footer' and the text from 'cat photos' to 'Jump to Bottom'.");
	   $pdf->AddLessonText("Remove the target='_blank' attribute from the anchor tag since this causes the linked document to open in a new window tab.");
	   $pdf->AddLessonText("Then add an id attribute with a value of 'footer' to the <footer> element at the bottom of the page.");

       $pdf->AddLessonTitle("Link to Internal Sections of a Page with Anchor Elements (Cont'd)");
	   $pdf->DrawCodeArea(38);
       $pdf->AddLessonCode("<h2>CatPhotoApp</h2>");
       $pdf->AddLessonCode("<main>");
       $pdf->AddLessonCode("");
       $pdf->AddLessonCode("<a href='#footer'>Jump to Bottom</a>");
       $pdf->AddLessonCode("");
       $pdf->AddLessonCode("<img src='https://bit.ly/fcc-relaxing-cat' alt='A cute orange cat lying on its back.'>");
       $pdf->AddLessonCode("");
       $pdf->AddLessonCode("<p>Kitty ipsum dolor sit amet, shed everywhere shed everywhere stretching attack your ankles chase the red dot, hairball run catnip eat the grass sniff. Purr jump eat the grass rip the couch scratched sunbathe, shed everywhere rip the couch sleep in the sink fluffy fur catnip scratched. Kitty ipsum dolor sit amet, shed everywhere shed everywhere stretching attack your ankles chase the red dot, hairball run catnip eat the grass sniff.</p>");
       $pdf->AddLessonCode("<p>Purr jump eat the grass rip the couch scratched sunbathe, shed everywhere rip the couch sleep in the sink fluffy fur catnip scratched. Kitty ipsum dolor sit amet, shed everywhere shed everywhere stretching attack your ankles chase the red dot, hairball run catnip eat the grass sniff. Purr jump eat the grass rip the couch scratched sunbathe, shed everywhere rip the couch sleep in the sink fluffy fur catnip scratched.</p>");
       $pdf->AddLessonCode("<p>Meowwww loved it, hated it, loved it, hated it yet spill litter box, scratch at owner, destroy all furniture, especially couch or lay on arms while you're using the keyboard. Missing until dinner time toy mouse squeak roll over. With tail in the air lounge in doorway. Man running from cops stops to pet cats, goes to jail.</p>");
       $pdf->AddLessonCode("<p>Intently stare at the same spot poop in the plant pot but kitten is playing with dead mouse. Get video posted to internet for chasing red dot leave fur on owners clothes meow to be let out and mesmerizing birds leave fur on owners clothes or favor packaging over toy so purr for no reason. Meow to be let out play time intently sniff hand run outside as soon as door open yet destroy couch.</p>");
       $pdf->AddLessonCode("");
       $pdf->AddLessonCode("</main>");
       $pdf->AddLessonCode("");
       $pdf->AddLessonCode("<footer id='footer'>Copyright Cat Photo App</footer>");
   }
	   
   function GenerateHTMLLesson12($pdf) {
       $pdf->AddLessonTitle("Nest an Anchor Element within a Paragraph");
	   $pdf->AddLessonText("You can nest links within other text elements.");
	   $pdf->DrawCodeArea(4);
       $pdf->AddLessonCode("<p>");
       $pdf->AddLessonCode("  Here's a <a target='_blank' href='http://freecodecamp.org'> link to freecodecamp.org</a> for you to follow.");
       $pdf->AddLessonCode("</p>");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Let's break down the example: Normal text is wrapped in the p element:");
	   $pdf->AddLessonText("<p> Here's a ... for you to follow. </p> Next is the anchor element <a> (which requires a closing tag </a>):");
	   $pdf->AddLessonText("<a> ... </a> target is an anchor tag attribute that specifies where to open the link and the value '_blank' specifies to open the link in a new tab href is an anchor tag attribute that contains the URL address of the link:");
	   $pdf->AddLessonText("<a href='http://freecodecamp.org'> ... </a> The text, 'link to freecodecamp.org', within the a element called anchor text, will display a link to click:");
	   $pdf->AddLessonText("<a href=' ... '>link to freecodecamp.org</a> The final output of the example will look like this:");
	   $pdf->AddLessonText("Here's a link to freecodecamp.org for you to follow.");
	   $pdf->AddLessonText("Now nest the existing a element within a new p element (just after the existing main element). The new paragraph should have text that says 'View more cat photos', where 'cat photos' is a link, and the rest of the text is plain text.");

	   $pdf->DrawCodeArea(16);
       $pdf->AddLessonCode("<h2>CatPhotoApp</h2>");
       $pdf->AddLessonCode("<main>");
       $pdf->AddLessonCode("");
       $pdf->AddLessonCode("  <p> View more <a href='http://freecatphotoapp.com' target='_blank'>cat photos</a></p>");
       $pdf->AddLessonCode("");
       $pdf->AddLessonCode("  <img src='https://bit.ly/fcc-relaxing-cat' alt='A cute orange cat lying on its back.'>");
       $pdf->AddLessonCode("");
       $pdf->AddLessonCode("  <p>Kitty ipsum dolor sit amet, shed everywhere shed everywhere stretching attack your ankles chase the red dot, hairball run catnip eat the grass sniff.</p>");
       $pdf->AddLessonCode("  <p>Purr jump eat the grass rip the couch scratched sunbathe, shed everywhere rip the couch sleep in the sink fluffy fur catnip scratched.</p>");
       $pdf->AddLessonCode("</main>");
   }
	   
   function GenerateHTMLLesson13($pdf) {
       $pdf->AddLessonTitle("Make Dead Links Using the Hash Symbol");
	   $pdf->AddLessonText("Sometimes you want to add a elements to your website before you know where they will link.");
	   $pdf->AddLessonText("This is also handy when you're changing the behavior of a link using JavaScript, which we'll learn about later.");
	   $pdf->AddLessonText("The current value of the href attribute is a link that points to 'http://freecatphotoapp.com'. Replace the href attribute value with a #, also known as a hash symbol, to create a dead link.");
	   $pdf->AddLessonText("For example: href='#'");

	   $pdf->DrawCodeArea(15);
       $pdf->AddLessonCode("<h2>CatPhotoApp</h2>");
       $pdf->AddLessonCode("<main>");
       $pdf->AddLessonCode("  <p>Click here to view more <a href='#' target='_blank'>cat photos</a>.</p>");
       $pdf->AddLessonCode("");
       $pdf->AddLessonCode("  <img src='https://bit.ly/fcc-relaxing-cat' alt='A cute orange cat lying on its back.'>");
       $pdf->AddLessonCode("");
       $pdf->AddLessonCode("  <p>Kitty ipsum dolor sit amet, shed everywhere shed everywhere stretching attack your ankles chase the red dot, hairball run catnip eat the grass sniff.</p>");
       $pdf->AddLessonCode("  <p>Purr jump eat the grass rip the couch scratched sunbathe, shed everywhere rip the couch sleep in the sink fluffy fur catnip scratched.</p>");
       $pdf->AddLessonCode("</main>");
   }
	   
   function GenerateHTMLLesson14($pdf) {
       $pdf->AddLessonTitle("Turn an Image into a Link");
	   $pdf->AddLessonText("You can make elements into links by nesting them within an a element.");
	   $pdf->AddLessonText("Nest your image within an a element. Here's an example:");
	   
	   $pdf->DrawCodeArea(2);
       $pdf->AddLessonCode("<a href='#'><img src='https://bit.ly/fcc-running-cats' alt='Three kittens running towards the camera.'></a>");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Remember to use # as your a element's href property in order to turn it into a dead link.");
	   $pdf->AddLessonText("Place the existing image element within an a (anchor) element.");

	   $pdf->AddLessonText("Once you've done this, hover over your image with your cursor. Your cursor's normal pointer should become the link clicking pointer. The photo is now a link.");


	   $pdf->AddLessonText("Sometimes you want to add a elements to your website before you know where they will link.");
	   $pdf->AddLessonText("This is also handy when you're changing the behavior of a link using JavaScript, which we'll learn about later.");
	   $pdf->AddLessonText("The current value of the href attribute is a link that points to 'http://freecatphotoapp.com'. Replace the href attribute value with a #, also known as a hash symbol, to create a dead link.");
	   $pdf->AddLessonText("");

	   $pdf->DrawCodeArea(13);
       $pdf->AddLessonCode("<h2>CatPhotoApp</h2>");
       $pdf->AddLessonCode("<main>");
       $pdf->AddLessonCode("  <p>Click here to view more <a href='#'><img src='https://bit.ly/fcc-relaxing-cat' alt='A cute orange cat lying on its back.'>cat photos</a>.</p>");
       $pdf->AddLessonCode("");
       $pdf->AddLessonCode("  <p>Kitty ipsum dolor sit amet, shed everywhere shed everywhere stretching attack your ankles chase the red dot, hairball run catnip eat the grass sniff.</p>");
       $pdf->AddLessonCode("  <p>Purr jump eat the grass rip the couch scratched sunbathe, shed everywhere rip the couch sleep in the sink fluffy fur catnip scratched.</p>");
       $pdf->AddLessonCode("</main>");
   }
	   
   function GenerateHTMLLesson15($pdf) {
       $pdf->AddLessonTitle("Create a Bulleted Unordered List");
	   $pdf->AddLessonText("HTML has a special element for creating unordered lists, or bullet point style lists.");	   
	   $pdf->AddLessonText("Unordered lists start with an opening <ul> element, followed by any number of <li> elements. Finally, unordered lists close with a </ul>");	   
	   $pdf->AddLessonText("For example:");	   

	   $pdf->DrawCodeArea(4);
       $pdf->AddLessonCode("<ul>");
       $pdf->AddLessonCode("  <li>milk</li>");
       $pdf->AddLessonCode("  <li>cheese</li>");
       $pdf->AddLessonCode("</ul>");

	   $pdf->AddLessonText("");	   
	   $pdf->AddLessonText("would create a bullet point style list of 'milk' and 'cheese'.");	   
	   $pdf->AddLessonText("Remove the last two p elements and create an unordered list of three things that cats love at the bottom of the page.");	   

	   $pdf->DrawCodeArea(13);
       $pdf->AddLessonCode("<h2>CatPhotoApp</h2>");
       $pdf->AddLessonCode("<main>");
       $pdf->AddLessonCode("  <p>Click here to view more <a href='#'>cat photos</a>.</p>");
       $pdf->AddLessonCode("");
       $pdf->AddLessonCode("  <a href='#'><img src='https://bit.ly/fcc-relaxing-cat' alt='A cute orange cat lying on its back.'></a>");
       $pdf->AddLessonCode("");
       $pdf->AddLessonCode("<ul>");
       $pdf->AddLessonCode("  <li>Playing</li>");
       $pdf->AddLessonCode("  <li>Eating</li>");
       $pdf->AddLessonCode("  <li>Sleeping</li>");
       $pdf->AddLessonCode("</ul>");
       $pdf->AddLessonCode("</main>");
   }
	   
   function GenerateHTMLLesson16($pdf) {
       $pdf->AddLessonTitle("Create a Bulleted Ordered List");
	   $pdf->AddLessonText("HTML has another special element for creating ordered lists, or numbered lists.");	   
	   $pdf->AddLessonText("Ordered lists start with an opening <ol> element, followed by any number of <li> elements. Finally, ordered lists are closed with the </ol> tag.");	   
	   $pdf->AddLessonText("For example:");	   

	   $pdf->DrawCodeArea(4);
       $pdf->AddLessonCode("<ol>");
       $pdf->AddLessonCode("  <li>Garfield</li>");
       $pdf->AddLessonCode("  <li>Sylvester</li>");
       $pdf->AddLessonCode("</ol>");

	   $pdf->AddLessonText("");	   
	   $pdf->AddLessonText("would create a numbered list of 'Garfield' and 'Sylvester'.");	   
	   $pdf->AddLessonText("Create an ordered list of the top 3 things cats hate the most.");

	   $pdf->DrawCodeArea(21);
       $pdf->AddLessonCode("<h2>CatPhotoApp</h2>");
       $pdf->AddLessonCode("<main>");
       $pdf->AddLessonCode("  <p>Click here to view more <a href='#'>cat photos</a>.</p>");
       $pdf->AddLessonCode("");
       $pdf->AddLessonCode("  <a href='#'><img src='https://bit.ly/fcc-relaxing-cat' alt='A cute orange cat lying on its back.'></a>");
       $pdf->AddLessonCode("");
       $pdf->AddLessonCode("  <p>Things cats love:</p>");
       $pdf->AddLessonCode("  <ul>");
       $pdf->AddLessonCode("    <li>cat nip</li>");
       $pdf->AddLessonCode("    <li>laser pointers</li>");
       $pdf->AddLessonCode("    <li>lasagna</li>");
       $pdf->AddLessonCode("  </ul>");
       $pdf->AddLessonCode("  <p>Top 3 things cats hate:</p>");
       $pdf->AddLessonCode("  <ol>");
       $pdf->AddLessonCode("    <li>dogs</li>");
       $pdf->AddLessonCode("    <li>loud noises</li>");
       $pdf->AddLessonCode("    <li>other cats</li>");
       $pdf->AddLessonCode("  </ol>");
       $pdf->AddLessonCode("");
       $pdf->AddLessonCode("</main>");
   }

   function GenerateHTMLLesson17($pdf) {
       $pdf->AddLessonTitle("Create a Text Field");
	   $pdf->AddLessonText("Now let's create a web form.");
	   $pdf->AddLessonText("input elements are a convenient way to get input from your user.");
	   $pdf->AddLessonText("You can create a text input like this:");
	   
	   $pdf->DrawCodeArea(1);
       $pdf->AddLessonCode("<input type='text'>");

	   $pdf->AddLessonText("");	   
	   $pdf->AddLessonText("Note that input elements are self-closing.");
	   $pdf->AddLessonText("Create an input element of type text below your lists.");	   

	   $pdf->DrawCodeArea(22);
       $pdf->AddLessonCode("<h2>CatPhotoApp</h2>");
       $pdf->AddLessonCode("<main>");
       $pdf->AddLessonCode("  <p>Click here to view more <a href='#'>cat photos</a>.</p>");
       $pdf->AddLessonCode("");
       $pdf->AddLessonCode("  <a href='#'><img src='https://bit.ly/fcc-relaxing-cat' alt='A cute orange cat lying on its back.'></a>");
       $pdf->AddLessonCode("");
       $pdf->AddLessonCode("  <p>Things cats love:</p>");
       $pdf->AddLessonCode("  <ul>");
       $pdf->AddLessonCode("    <li>cat nip</li>");
       $pdf->AddLessonCode("    <li>laser pointers</li>");
       $pdf->AddLessonCode("    <li>lasagna</li>");
       $pdf->AddLessonCode("  </ul>");
       $pdf->AddLessonCode("  <p>Top 3 things cats hate:</p>");
       $pdf->AddLessonCode("  <ol>");
       $pdf->AddLessonCode("    <li>flea treatment</li>");
       $pdf->AddLessonCode("    <li>thunder</li>");
       $pdf->AddLessonCode("    <li>other cats</li>");
       $pdf->AddLessonCode("  </ol>");
       $pdf->AddLessonCode("<input type='text'>");
       $pdf->AddLessonCode("");
       $pdf->AddLessonCode("</main>");
   }

   function GenerateHTMLLesson18($pdf) {
       $pdf->AddLessonTitle("Add Placeholder Text to a Text Field");
	   $pdf->AddLessonText("Placeholder text is what is displayed in your input element before your user has inputted anything.");
	   $pdf->AddLessonText("You can create placeholder text like so:");

	   $pdf->DrawCodeArea(1);
       $pdf->AddLessonCode("<input type='text' placeholder='this is placeholder text'>");

	   $pdf->AddLessonText("");	   
	   $pdf->AddLessonText("Set the placeholder value of your text input to 'cat photo URL'.");	   

	   $pdf->DrawCodeArea(22);
       $pdf->AddLessonCode("<h2>CatPhotoApp</h2>");
       $pdf->AddLessonCode("<main>");
       $pdf->AddLessonCode("  <p>Click here to view more <a href='#'>cat photos</a>.</p>");
       $pdf->AddLessonCode("");
       $pdf->AddLessonCode("  <a href='#'><img src='https://bit.ly/fcc-relaxing-cat' alt='A cute orange cat lying on its back.'></a>");
       $pdf->AddLessonCode("");
       $pdf->AddLessonCode("  <p>Things cats love:</p>");
       $pdf->AddLessonCode("  <ul>");
       $pdf->AddLessonCode("    <li>cat nip</li>");
       $pdf->AddLessonCode("    <li>laser pointers</li>");
       $pdf->AddLessonCode("    <li>lasagna</li>");
       $pdf->AddLessonCode("  </ul>");
       $pdf->AddLessonCode("  <p>Top 3 things cats hate:</p>");
       $pdf->AddLessonCode("  <ol>");
       $pdf->AddLessonCode("    <li>flea treatment</li>");
       $pdf->AddLessonCode("    <li>thunder</li>");
       $pdf->AddLessonCode("    <li>other cats</li>");
       $pdf->AddLessonCode("  </ol>");
       $pdf->AddLessonCode("<input type='text' placeholder='cat photo URL'>");
       $pdf->AddLessonCode("");
       $pdf->AddLessonCode("</main>");
   }

   function GenerateHTMLLesson19($pdf) {
       $pdf->AddLessonTitle("Create a Form Element");
	   $pdf->AddLessonText("You can build web forms that actually submit data to a server using nothing more than pure HTML. You can do this by specifying an action on your form element.");
	   $pdf->AddLessonText("For example:");

	   $pdf->DrawCodeArea(1);
       $pdf->AddLessonCode("<form action='/url-where-you-want-to-submit-form-data'></form>");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Nest your text field inside a form element, and add the action='/submit-cat-photo' attribute to the form element.");


	   $pdf->DrawCodeArea(24);
       $pdf->AddLessonCode("<h2>CatPhotoApp</h2>");
       $pdf->AddLessonCode("<main>");
       $pdf->AddLessonCode("  <p>Click here to view more <a href='#'>cat photos</a>.</p>");
       $pdf->AddLessonCode("");
       $pdf->AddLessonCode("  <a href='#'><img src='https://bit.ly/fcc-relaxing-cat' alt='A cute orange cat lying on its back.'></a>");
       $pdf->AddLessonCode("");
       $pdf->AddLessonCode("  <p>Things cats love:</p>");
       $pdf->AddLessonCode("  <ul>");
       $pdf->AddLessonCode("    <li>cat nip</li>");
       $pdf->AddLessonCode("    <li>laser pointers</li>");
       $pdf->AddLessonCode("    <li>lasagna</li>");
       $pdf->AddLessonCode("  </ul>");
       $pdf->AddLessonCode("  <p>Top 3 things cats hate:</p>");
       $pdf->AddLessonCode("  <ol>");
       $pdf->AddLessonCode("    <li>flea treatment</li>");
       $pdf->AddLessonCode("    <li>thunder</li>");
       $pdf->AddLessonCode("    <li>other cats</li>");
       $pdf->AddLessonCode("  </ol>");
       $pdf->AddLessonCode("<form action='/submit-cat-photo'>");
       $pdf->AddLessonCode("<input type='text' placeholder='cat photo URL'>");
       $pdf->AddLessonCode("</form>");
       $pdf->AddLessonCode("");
       $pdf->AddLessonCode("</main>");
   }

   function GenerateHTMLLesson20($pdf) {
       $pdf->AddLessonTitle("Add a Submit Button to a Form");
	   $pdf->AddLessonText("Let's add a submit button to your form. Clicking this button will send the data from your form to the URL you specified with your form's action attribute.");
	   $pdf->AddLessonText("Here's an example submit button:");

	   $pdf->DrawCodeArea(1);
       $pdf->AddLessonCode("<button type='submit'>this button submits the form</button>");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Add a button as the last element of your form element with a type of submit, and 'Submit' as its text.");

	   $pdf->DrawCodeArea(25);
       $pdf->AddLessonCode("<h2>CatPhotoApp</h2>");
       $pdf->AddLessonCode("<main>");
       $pdf->AddLessonCode("  <p>Click here to view more <a href='#'>cat photos</a>.</p>");
       $pdf->AddLessonCode("");
       $pdf->AddLessonCode("  <a href='#'><img src='https://bit.ly/fcc-relaxing-cat' alt='A cute orange cat lying on its back.'></a>");
       $pdf->AddLessonCode("");
       $pdf->AddLessonCode("  <p>Things cats love:</p>");
       $pdf->AddLessonCode("  <ul>");
       $pdf->AddLessonCode("    <li>cat nip</li>");
       $pdf->AddLessonCode("    <li>laser pointers</li>");
       $pdf->AddLessonCode("    <li>lasagna</li>");
       $pdf->AddLessonCode("  </ul>");
       $pdf->AddLessonCode("  <p>Top 3 things cats hate:</p>");
       $pdf->AddLessonCode("  <ol>");
       $pdf->AddLessonCode("    <li>flea treatment</li>");
       $pdf->AddLessonCode("    <li>thunder</li>");
       $pdf->AddLessonCode("    <li>other cats</li>");
       $pdf->AddLessonCode("  </ol>");
       $pdf->AddLessonCode("  <form action='/submit-cat-photo'>");
       $pdf->AddLessonCode("    <input type='text' placeholder='cat photo URL'>");
       $pdf->AddLessonCode("    <button type='submit'>Submit</button>");
       $pdf->AddLessonCode("  </form>");
       $pdf->AddLessonCode("");
       $pdf->AddLessonCode("</main>");
   }

   function GenerateHTMLLesson21($pdf) {
       $pdf->AddLessonTitle("Use HTML5 to Require a Field");
	   $pdf->AddLessonText("You can require specific form fields so that your user will not be able to submit your form until he or she has filled them out.");
	   $pdf->AddLessonText("For example, if you wanted to make a text input field required, you can just add the attribute required within your input element, like this:");

	   $pdf->DrawCodeArea(1);
       $pdf->AddLessonCode("<input type='text' required>");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Make your text input a required field, so that your user can't submit the form without completing this field.");
	   $pdf->AddLessonText("Then try to submit the form without inputting any text. See how your HTML5 form notifies you that the field is required?");

	   $pdf->DrawCodeArea(25);
       $pdf->AddLessonCode("<h2>CatPhotoApp</h2>");
       $pdf->AddLessonCode("<main>");
       $pdf->AddLessonCode("  <p>Click here to view more <a href='#'>cat photos</a>.</p>");
       $pdf->AddLessonCode("");
       $pdf->AddLessonCode("  <a href='#'><img src='https://bit.ly/fcc-relaxing-cat' alt='A cute orange cat lying on its back.'></a>");
       $pdf->AddLessonCode("");
       $pdf->AddLessonCode("  <p>Things cats love:</p>");
       $pdf->AddLessonCode("  <ul>");
       $pdf->AddLessonCode("    <li>cat nip</li>");
       $pdf->AddLessonCode("    <li>laser pointers</li>");
       $pdf->AddLessonCode("    <li>lasagna</li>");
       $pdf->AddLessonCode("  </ul>");
       $pdf->AddLessonCode("  <p>Top 3 things cats hate:</p>");
       $pdf->AddLessonCode("  <ol>");
       $pdf->AddLessonCode("    <li>flea treatment</li>");
       $pdf->AddLessonCode("    <li>thunder</li>");
       $pdf->AddLessonCode("    <li>other cats</li>");
       $pdf->AddLessonCode("  </ol>");
       $pdf->AddLessonCode("  <form action='/submit-cat-photo'>");
       $pdf->AddLessonCode("    <input type='text' placeholder='cat photo URL' required>");
       $pdf->AddLessonCode("    <button type='submit'>Submit</button>");
       $pdf->AddLessonCode("  </form>");
       $pdf->AddLessonCode("");
       $pdf->AddLessonCode("</main>");
   }

   function GenerateHTMLLesson22($pdf) {
       $pdf->AddLessonTitle("Create a Set of Radio Buttons");
	   $pdf->AddLessonText("You can use radio buttons for questions where you want the user to only give you one answer out of multiple options.");
	   $pdf->AddLessonText("Radio buttons are a type of input.");
	   $pdf->AddLessonText("Each of your radio buttons can be nested within its own label element. By wrapping an input element inside of a label element it will automatically associate the radio button input with the label element surrounding it.");
	   $pdf->AddLessonText("All related radio buttons should have the same name attribute to create a radio button group. By creating a radio group, selecting any single radio button will automatically deselect the other buttons within the same group ensuring only one answer is provided by the user.");
	   $pdf->AddLessonText("Here's an example of a radio button:");

	   $pdf->DrawCodeArea(3);
       $pdf->AddLessonCode("<label>");
       $pdf->AddLessonCode("  <input type='radio' name='indoor-outdoor'>Indoor");
       $pdf->AddLessonCode("</label>");
 
	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("It is considered best practice to set a for attribute on the label element, with a value that matches the value of the id attribute of the input element. This allows assistive technologies to create a linked relationship between the label and the child input element. For example:");

	   $pdf->DrawCodeArea(3);
       $pdf->AddLessonCode("<label for='indoor'>");
       $pdf->AddLessonCode("  <input id='indoor' type='radio' name='indoor-outdoor'>Indoor");
       $pdf->AddLessonCode("</label>");
 
	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Add a pair of radio buttons to your form, each nested in its own label element. One should have the option of indoor and the other should have the option of outdoor. Both should share the name attribute of indoor-outdoor to create a radio group.");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Make your text input a required field, so that your user can't submit the form without completing this field.");
	   $pdf->AddLessonText("Then try to submit the form without inputting any text. See how your HTML5 form notifies you that the field is required?");

       $pdf->AddLessonTitle("Create a Set of Radio Buttons");
	   $pdf->DrawCodeArea(32);
       $pdf->AddLessonCode("<h2>CatPhotoApp</h2>");
       $pdf->AddLessonCode("<main>");
       $pdf->AddLessonCode("  <p>Click here to view more <a href='#'>cat photos</a>.</p>");
       $pdf->AddLessonCode("");
       $pdf->AddLessonCode("  <a href='#'><img src='https://bit.ly/fcc-relaxing-cat' alt='A cute orange cat lying on its back.'></a>");
       $pdf->AddLessonCode("");
       $pdf->AddLessonCode("  <p>Things cats love:</p>");
       $pdf->AddLessonCode("  <ul>");
       $pdf->AddLessonCode("    <li>cat nip</li>");
       $pdf->AddLessonCode("    <li>laser pointers</li>");
       $pdf->AddLessonCode("    <li>lasagna</li>");
       $pdf->AddLessonCode("  </ul>");
       $pdf->AddLessonCode("  <p>Top 3 things cats hate:</p>");
       $pdf->AddLessonCode("  <ol>");
       $pdf->AddLessonCode("    <li>flea treatment</li>");
       $pdf->AddLessonCode("    <li>thunder</li>");
       $pdf->AddLessonCode("    <li>other cats</li>");
       $pdf->AddLessonCode("  </ol>");
       $pdf->AddLessonCode("  <form action='/submit-cat-photo'>");
       $pdf->AddLessonCode("    <label for='indoor'>"); 
       $pdf->AddLessonCode("      <input id='indoor' type='radio' name='indoor-outdoor'>Indoor");
       $pdf->AddLessonCode("    </label>");
       $pdf->AddLessonCode("    <label for='outdoor'>"); 
       $pdf->AddLessonCode("      <input id='outdoor' type='radio' name='indoor-outdoor'>Outdoor");
       $pdf->AddLessonCode("    </label>");
       $pdf->AddLessonCode("    <br>");
       $pdf->AddLessonCode("    <input type='text' placeholder='cat photo URL' required>");
       $pdf->AddLessonCode("    <button type='submit'>Submit</button>");
       $pdf->AddLessonCode("  </form>");
       $pdf->AddLessonCode("");
       $pdf->AddLessonCode("</main>");
   }

   function GenerateHTMLLesson23($pdf) {
       $pdf->AddLessonTitle("Create a Set of Checkboxes");
	   $pdf->AddLessonText("Forms commonly use checkboxes for questions that may have more than one answer.");
	   $pdf->AddLessonText("Checkboxes are a type of input.");
	   $pdf->AddLessonText("Each of your checkboxes can be nested within its own label element. By wrapping an input element inside of a label element it will automatically associate the checkbox input with the label element surrounding it.");
	   $pdf->AddLessonText("All related checkbox inputs should have the same name attribute.");
	   $pdf->AddLessonText("It is considered best practice to explicitly define the relationship between a checkbox input and its corresponding label by setting the for attribute on the label element to match the id attribute of the associated input element.");
	   $pdf->AddLessonText("Here's an example of a checkbox:");

	   $pdf->DrawCodeArea(3);
       $pdf->AddLessonCode("<label for='loving'>");
       $pdf->AddLessonCode("  <input id='loving' type='checkbox' name='personality'> Loving");
       $pdf->AddLessonCode("</label>");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Add to your form a set of three checkboxes. Each checkbox should be nested within its own label element. All three should share the name attribute of personality.");

       $pdf->AddLessonTitle("Create a Set of Checkboxes (cont'd)");
	   $pdf->DrawCodeArea(41);
       $pdf->AddLessonCode("<h2>CatPhotoApp</h2>");
       $pdf->AddLessonCode("<main>");
       $pdf->AddLessonCode("  <p>Click here to view more <a href='#'>cat photos</a>.</p>");
       $pdf->AddLessonCode("");
       $pdf->AddLessonCode("  <a href='#'><img src='https://bit.ly/fcc-relaxing-cat' alt='A cute orange cat lying on its back.'></a>");
       $pdf->AddLessonCode("");
       $pdf->AddLessonCode("  <p>Things cats love:</p>");
       $pdf->AddLessonCode("  <ul>");
       $pdf->AddLessonCode("    <li>cat nip</li>");
       $pdf->AddLessonCode("    <li>laser pointers</li>");
       $pdf->AddLessonCode("    <li>lasagna</li>");
       $pdf->AddLessonCode("  </ul>");
       $pdf->AddLessonCode("  <p>Top 3 things cats hate:</p>");
       $pdf->AddLessonCode("  <ol>");
       $pdf->AddLessonCode("    <li>flea treatment</li>");
       $pdf->AddLessonCode("    <li>thunder</li>");
       $pdf->AddLessonCode("    <li>other cats</li>");
       $pdf->AddLessonCode("  </ol>");
       $pdf->AddLessonCode("  <form action='/submit-cat-photo'>");
       $pdf->AddLessonCode("    <label for='indoor'>");
       $pdf->AddLessonCode("      <input id='indoor'  type='radio' name='indoor-outdoor'>Indoor");
       $pdf->AddLessonCode("    </label>");
       $pdf->AddLessonCode("    <label for='outdoor'>");
       $pdf->AddLessonCode("      <input id='outdoor' type='radio' name='indoor-outdoor'>Outdoor");
       $pdf->AddLessonCode("    </label>");
       $pdf->AddLessonCode("    <label for='loving'>");
       $pdf->AddLessonCode("      <input id='loving' type='checkbox' name='personality'> Loving");
       $pdf->AddLessonCode("    </label>");
       $pdf->AddLessonCode("    <label for='purrey'>");
       $pdf->AddLessonCode("      <input id='purrey' type='checkbox' name='personality'> Purrey");
       $pdf->AddLessonCode("    </label>");
       $pdf->AddLessonCode("    <label for='happy'>");
       $pdf->AddLessonCode("    <input id='happy'  type='checkbox' name='personality'> Happy");
       $pdf->AddLessonCode("    </label><br>");
       $pdf->AddLessonCode("    <input type='text' placeholder='cat photo URL' required>");
       $pdf->AddLessonCode("    <button type='submit'>Submit</button>");
       $pdf->AddLessonCode("  </form>");
       $pdf->AddLessonCode("");
       $pdf->AddLessonCode("</main>");
   }

   function GenerateHTMLLesson24($pdf) {
       $pdf->AddLessonTitle("Use the value attribute with Radio Buttons and Checkboxes");
	   $pdf->AddLessonText("When a form gets submitted, the data is sent to the server and includes entries for the options selected. Inputs of type radio and checkbox report their values from the value attribute.");
	   $pdf->AddLessonText("For example:");

	   $pdf->DrawCodeArea(8);
       $pdf->AddLessonCode("<label for='indoor'>");
       $pdf->AddLessonCode("  <input id='indoor' value='indoor' type='radio' name='indoor-outdoor'>Indoor");
       $pdf->AddLessonCode("</label>");
       $pdf->AddLessonCode("<label for='outdoor'>");
       $pdf->AddLessonCode("  <input id='outdoor' value='outdoor' type='radio' name='indoor-outdoor'>Outdoor ");
       $pdf->AddLessonCode("</label>");
 
	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Here, you have two radio inputs. When the user submits the form with the indoor option selected, the form data will include the line: indoor-outdoor=indoor. This is from the name and value attributes of the 'indoor' input.");
	   $pdf->AddLessonText("If you omit the value attribute, the submitted form data uses the default value, which is on. In this scenario, if the user clicked the 'indoor' option and submitted the form, the resulting form data would be indoor-outdoor=on, which is not useful. So the value attribute needs to be set to something to identify the option.");
	   $pdf->AddLessonText("Give each of the radio and checkbox inputs the value attribute. Use the input label text, in lowercase, as the value for the attribute.");

       $pdf->AddLessonTitle("Create a Set of Checkboxes (cont'd)");
	   $pdf->DrawCodeArea(45);
       $pdf->AddLessonCode("<h2>CatPhotoApp</h2>");
       $pdf->AddLessonCode("<main>");
       $pdf->AddLessonCode("  <p>Click here to view more <a href='#'>cat photos</a>.</p>");
       $pdf->AddLessonCode("");
       $pdf->AddLessonCode("  <a href='#'><img src='https://bit.ly/fcc-relaxing-cat' alt='A cute orange cat lying on its back.'></a>");
       $pdf->AddLessonCode("");
       $pdf->AddLessonCode("  <p>Things cats love:</p>");
       $pdf->AddLessonCode("  <ul>");
       $pdf->AddLessonCode("    <li>cat nip</li>");
       $pdf->AddLessonCode("    <li>laser pointers</li>");
       $pdf->AddLessonCode("    <li>lasagna</li>");
       $pdf->AddLessonCode("  </ul>");
       $pdf->AddLessonCode("  <p>Top 3 things cats hate:</p>");
       $pdf->AddLessonCode("  <ol>");
       $pdf->AddLessonCode("    <li>flea treatment</li>");
       $pdf->AddLessonCode("    <li>thunder</li>");
       $pdf->AddLessonCode("    <li>other cats</li>");
       $pdf->AddLessonCode("  </ol>");
       $pdf->AddLessonCode("  <form action='/submit-cat-photo'>");
       $pdf->AddLessonCode("    <label for='indoor'");
       $pdf->AddLessonCode("      <input id='indoor' type='radio' name='indoor-outdoor' value='indoor'> Indoor");
       $pdf->AddLessonCode("    </label>");
       $pdf->AddLessonCode("    <label for='outdoor'>");
       $pdf->AddLessonCode("      <input id='outdoor' type='radio' name='indoor-outdoor' value='outdoor'> Outdoor");
       $pdf->AddLessonCode("    </label><br>");
       $pdf->AddLessonCode("    <label for='loving'>");
       $pdf->AddLessonCode("      <input id='loving' type='checkbox' name='personality' value='loving'> Loving");
       $pdf->AddLessonCode("    </label>");
       $pdf->AddLessonCode("    <label for='lazy'>");
       $pdf->AddLessonCode("      <input id='lazy' type='checkbox' name='personality' value='lazy'> Lazy");
       $pdf->AddLessonCode("    </label>");
       $pdf->AddLessonCode("    <label for='energetic'>");
       $pdf->AddLessonCode("      <input id='energetic' type='checkbox' name='personality' value='energetic'> Energetic");
       $pdf->AddLessonCode("    </label><br>");
       $pdf->AddLessonCode("    <input type='text' placeholder='cat photo URL' required>");
       $pdf->AddLessonCode("    <button type='submit'>Submit</button>");
       $pdf->AddLessonCode("  </form>");
       $pdf->AddLessonCode("</main>");
   }

   function GenerateHTMLLesson25($pdf) {
       $pdf->AddLessonTitle("Check Radio Buttons and Checkboxes by Default");
	   $pdf->AddLessonText("You can set a checkbox or radio button to be checked by default using the checked attribute.");
	   $pdf->AddLessonText("To do this, just add the word 'checked' to the inside of an input element. For example:");

	   $pdf->DrawCodeArea(1);
       $pdf->AddLessonCode("<input type='radio' name='test-name' checked>");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Set the first of your radio buttons and the first of your checkboxes to both be checked by default.");

	   $pdf->DrawCodeArea(44);
       $pdf->AddLessonCode("<h2>CatPhotoApp</h2>");
       $pdf->AddLessonCode("<main>");
       $pdf->AddLessonCode("  <p>Click here to view more <a href='#'>cat photos</a>.</p>");
       $pdf->AddLessonCode("");
       $pdf->AddLessonCode("  <a href='#'><img src='https://bit.ly/fcc-relaxing-cat' alt='A cute orange cat lying on its back.'></a>");
       $pdf->AddLessonCode("");
       $pdf->AddLessonCode("  <p>Things cats love:</p>");
       $pdf->AddLessonCode("  <ul>");
       $pdf->AddLessonCode("    <li>cat nip</li>");
       $pdf->AddLessonCode("    <li>laser pointers</li>");
       $pdf->AddLessonCode("    <li>lasagna</li>");
       $pdf->AddLessonCode("  </ul>");
       $pdf->AddLessonCode("  <p>Top 3 things cats hate:</p>");
       $pdf->AddLessonCode("  <ol>");
       $pdf->AddLessonCode("    <li>flea treatment</li>");
       $pdf->AddLessonCode("    <li>thunder</li>");
       $pdf->AddLessonCode("    <li>other cats</li>");
       $pdf->AddLessonCode("  </ol>");
       $pdf->AddLessonCode("  <form action='/submit-cat-photo'>");
       $pdf->AddLessonCode("    <label for='indoor'");
       $pdf->AddLessonCode("      <input id='indoor' type='radio' name='indoor-outdoor' value='indoor' checked> Indoor");
       $pdf->AddLessonCode("    </label>");
       $pdf->AddLessonCode("    <label for='outdoor'>");
       $pdf->AddLessonCode("      <input id='outdoor' type='radio' name='indoor-outdoor' value='outdoor'> Outdoor");
       $pdf->AddLessonCode("    </label><br>");
       $pdf->AddLessonCode("    <label for='loving'>");
       $pdf->AddLessonCode("      <input id='loving' type='checkbox' name='personality' value='loving'> Loving");
       $pdf->AddLessonCode("    </label>");
       $pdf->AddLessonCode("    <label for='lazy'>");
       $pdf->AddLessonCode("      <input id='lazy' type='checkbox' name='personality' value='lazy' checked> Lazy");
       $pdf->AddLessonCode("    </label>");
       $pdf->AddLessonCode("    <label for='energetic'>");
       $pdf->AddLessonCode("      <input id='energetic' type='checkbox' name='personality' value='energetic'> Energetic");
       $pdf->AddLessonCode("    </label><br>");
       $pdf->AddLessonCode("    <input type='text' placeholder='cat photo URL' required>");
       $pdf->AddLessonCode("    <button type='submit'>Submit</button>");
       $pdf->AddLessonCode("  </form>");
       $pdf->AddLessonCode("</main>");
   }

   function GenerateHTMLLesson26($pdf) {
       $pdf->AddLessonTitle("Nest Many Elements within a Single div Element");
	   $pdf->AddLessonText("The div element, also known as a division element, is a general purpose container for other elements.");
	   $pdf->AddLessonText("The div element is probably the most commonly used HTML element of all.");
	   $pdf->AddLessonText("Just like any other non-self-closing element, you can open a div element with <div> and close it on another line with </div>.");
	   $pdf->AddLessonText("Nest your 'Things cats love' and 'Things cats hate' lists all within a single div element.");
	   $pdf->AddLessonText("Hint: Try putting your opening div tag above your 'Things cats love' p element and your closing div tag after your closing ol tag so that both of your lists are within one div.  ");

	   $pdf->DrawCodeArea(45);
       $pdf->AddLessonCode("<h2>CatPhotoApp</h2>");
       $pdf->AddLessonCode("<main>");
       $pdf->AddLessonCode("  <p>Click here to view more <a href='#'>cat photos</a>.</p>");
       $pdf->AddLessonCode("");
       $pdf->AddLessonCode("  <a href='#'><img src='https://bit.ly/fcc-relaxing-cat' alt='A cute orange cat lying on its back.'></a>");
       $pdf->AddLessonCode("<div>");
       $pdf->AddLessonCode("  <p>Things cats love:</p>");
       $pdf->AddLessonCode("  <ul>");
       $pdf->AddLessonCode("    <li>cat nip</li>");
       $pdf->AddLessonCode("    <li>laser pointers</li>");
       $pdf->AddLessonCode("    <li>lasagna</li>");
       $pdf->AddLessonCode("  </ul>");
       $pdf->AddLessonCode("  <p>Top 3 things cats hate:</p>");
       $pdf->AddLessonCode("  <ol>");
       $pdf->AddLessonCode("    <li>flea treatment</li>");
       $pdf->AddLessonCode("    <li>thunder</li>");
       $pdf->AddLessonCode("    <li>other cats</li>");
       $pdf->AddLessonCode("  </ol>");
       $pdf->AddLessonCode("</div>");
       $pdf->AddLessonCode("  <form action='/submit-cat-photo'>");
       $pdf->AddLessonCode("    <label for='indoor'");
       $pdf->AddLessonCode("      <input id='indoor' type='radio' name='indoor-outdoor' value='indoor' checked> Indoor");
       $pdf->AddLessonCode("    </label>");
       $pdf->AddLessonCode("    <label for='outdoor'>");
       $pdf->AddLessonCode("      <input id='outdoor' type='radio' name='indoor-outdoor' value='outdoor'> Outdoor");
       $pdf->AddLessonCode("    </label><br>");
       $pdf->AddLessonCode("    <label for='loving'>");
       $pdf->AddLessonCode("      <input id='loving' type='checkbox' name='personality' value='loving'> Loving");
       $pdf->AddLessonCode("    </label>");
       $pdf->AddLessonCode("    <label for='lazy'>");
       $pdf->AddLessonCode("      <input id='lazy' type='checkbox' name='personality' value='lazy' checked> Lazy");
       $pdf->AddLessonCode("    </label>");
       $pdf->AddLessonCode("    <label for='energetic'>");
       $pdf->AddLessonCode("      <input id='energetic' type='checkbox' name='personality' value='energetic'> Energetic");
       $pdf->AddLessonCode("    </label><br>");
       $pdf->AddLessonCode("    <input type='text' placeholder='cat photo URL' required>");
       $pdf->AddLessonCode("    <button type='submit'>Submit</button>");
       $pdf->AddLessonCode("  </form>");
       $pdf->AddLessonCode("</main>");
   }

   function GenerateHTMLLesson27($pdf) {
       $pdf->AddLessonTitle("Declare the Doctype of an HTML Document");
	   $pdf->AddLessonText("The challenges so far have covered specific HTML elements and their uses. However, there are a few elements that give overall structure to your page, and should be included in every HTML document.");
	   $pdf->AddLessonText("At the top of your document, you need to tell the browser which version of HTML your page is using. HTML is an evolving language, and is updated regularly. Most major browsers support the latest specification, which is HTML5. However, older web pages may use previous versions of the language.");
	   $pdf->AddLessonText("You tell the browser this information by adding the <!DOCTYPE ...> tag on the first line, where the ... part is the version of HTML. For HTML5, you use <!DOCTYPE html>.");
	   $pdf->AddLessonText("The ! and uppercase DOCTYPE is important, especially for older browsers. The html is not case sensitive.");
	   $pdf->AddLessonText("Next, the rest of your HTML code needs to be wrapped in html tags. The opening <html> goes directly below the <!DOCTYPE html> line, and the closing </html> goes at the end of the page.");
	   $pdf->AddLessonText("Here's an example of the page structure:");

	   $pdf->DrawCodeArea(4);
       $pdf->AddLessonCode("<!DOCTYPE html>");
       $pdf->AddLessonCode("<html>");
       $pdf->AddLessonCode("  <!-- Your HTML code goes here -->");
       $pdf->AddLessonCode("</html>");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Add a DOCTYPE tag for HTML5 to the top of the blank HTML document in the code editor. Under it, add opening and closing html tags, which wrap around an h1 element. The heading can include any text.");
	   
	   $pdf->DrawCodeArea(4);
       $pdf->AddLessonCode("<!DOCTYPE html>");
       $pdf->AddLessonCode("<html>");
       $pdf->AddLessonCode("  <h1>DOCTYPE Example</h1>");
       $pdf->AddLessonCode("</html>");
   }

   function GenerateHTMLLesson28($pdf) {
       $pdf->AddLessonTitle("Define the Head and Body of an HTML Document");
	   $pdf->AddLessonText("You can add another level of organization in your HTML document within the html tags with the head and body elements. Any markup with information about your page would go into the head tag. Then any markup with the content of the page (what displays for a user) would go into the body tag.");
	   $pdf->AddLessonText("Metadata elements, such as link, meta, title, and style, typically go inside the head element.");
	   $pdf->AddLessonText("Here's an example of a page's layout:");


	   $pdf->DrawCodeArea(9);
       $pdf->AddLessonCode("<!DOCTYPE html>");
       $pdf->AddLessonCode("<html>");
       $pdf->AddLessonCode("  <head>");
       $pdf->AddLessonCode("    <!-- metadata elements -->");
       $pdf->AddLessonCode("  </head>");
       $pdf->AddLessonCode("  <body>");
       $pdf->AddLessonCode("    <!-- page contents -->");
       $pdf->AddLessonCode("  </body>");
       $pdf->AddLessonCode("</html>");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Edit the markup so there's a head and a body. The head element should only include the title, and the body element should only include the h1 and p.");

	   $pdf->DrawCodeArea(22);
       $pdf->AddLessonCode("<!DOCTYPE html>");
       $pdf->AddLessonCode("<html>");
       $pdf->AddLessonCode("<head>");
       $pdf->AddLessonCode("  <title>The best page ever</title>");
       $pdf->AddLessonCode("</head>");
       $pdf->AddLessonCode("<body>");
       $pdf->AddLessonCode("  <h1>The best page ever</h1>");
       $pdf->AddLessonCode("  <p>Cat ipsum dolor sit amet, jump launch to pounce upon little yarn mouse, bare fangs at toy run hide in litter box until treats are fed. Go into a room to decide you didn't want to be in there anyway. I like big cats and i can not lie kitty ipsum dolor sit amet, shed everywhere shed everywhere stretching attack your ankles chase the red dot, hairball run catnip eat the grass sniff. Meow i could pee on this if i had the energy for slap owner's face at 5am until human fills food dish yet scamper. Knock dish off table head butt cant eat out of my own dish scratch the furniture. Make meme, make cute face. Sleep in the bathroom sink chase laser but pee in the shoe. Paw at your fat belly licks your face and eat grass, throw it back up kitty ipsum dolor sit amet, shed everywhere shed everywhere stretching attack your ankles chase the red dot, hairball run catnip eat the grass sniff.</p>");
       $pdf->AddLessonCode("</body>");
       $pdf->AddLessonCode("</html>");
   }

   function GenerateHTMLManual($pdf) {
	   $pdf->AddSubject("Basic HTML and HTML 5");
	   GenerateHTMLLesson1($pdf);
	   GenerateHTMLLesson2($pdf);
	   GenerateHTMLLesson3($pdf);
	   GenerateHTMLLesson4($pdf);
	   GenerateHTMLLesson5($pdf);
	   GenerateHTMLLesson6($pdf);
	   GenerateHTMLLesson7($pdf);
	   GenerateHTMLLesson8($pdf);
	   GenerateHTMLLesson9($pdf);
	   GenerateHTMLLesson10($pdf);
	   GenerateHTMLLesson11($pdf);
	   GenerateHTMLLesson12($pdf);
	   GenerateHTMLLesson13($pdf);
	   GenerateHTMLLesson14($pdf);
	   GenerateHTMLLesson15($pdf);
	   GenerateHTMLLesson16($pdf);
	   GenerateHTMLLesson17($pdf);
	   GenerateHTMLLesson18($pdf);
	   GenerateHTMLLesson19($pdf);
	   GenerateHTMLLesson20($pdf);
	   GenerateHTMLLesson21($pdf);
	   GenerateHTMLLesson22($pdf);
	   GenerateHTMLLesson23($pdf);
	   GenerateHTMLLesson24($pdf);
	   GenerateHTMLLesson25($pdf);
	   GenerateHTMLLesson26($pdf);
	   GenerateHTMLLesson27($pdf);
	   GenerateHTMLLesson28($pdf);
   }

?>
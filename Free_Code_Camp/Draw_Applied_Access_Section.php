<?php

   function GenerateAALesson1($pdf) {
       $pdf->AddLessonTitle("Add a Text Alternative to Images for Visually Impaired Accessibility");
	   $pdf->AddLessonText("It's likely that you've seen an alt attribute on an img tag in other challenges. Alt text describes the content of the image and provides a text-alternative for it. This helps in cases where the image fails to load or can't be seen by a user. It's also used by search engines to understand what an image contains to include it in search results. Here's an example:");

	   $pdf->DrawCodeArea("1");
	   $pdf->AddLessonCode("<img src='importantLogo.jpeg' alt='Company logo'>");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("People with visual impairments rely on screen readers to convert web content to an audio interface. They won't get information if it's only presented visually. For images, screen readers can access the alt attribute and read its contents to deliver key information.");
	   $pdf->AddLessonText("Good alt text provides the reader a brief description of the image. You should always include an alt attribute on your image. Per HTML5 specification, this is now considered mandatory.");
	   $pdf->AddLessonText("Camper Cat happens to be both a coding ninja and an actual ninja, who is building a website to share his knowledge. The profile picture he wants to use shows his skills and should be appreciated by all site visitors. Add an alt attribute in the img tag, that explains Camper Cat is doing karate. (The image src doesn't link to an actual file, so you should see the alt text in the display.)");

	   $pdf->DrawCodeArea("1");
	   $pdf->AddLessonCode("<img src='doingKarateWow.jpeg' alt='Camper Cat doing KARATE!!!'>");
   }
 
   function GenerateAALesson2($pdf) {
       $pdf->AddLessonTitle("Know When Alt Text Should be Left Blank");
	   $pdf->AddLessonText("In the last challenge, you learned that including an alt attribute when using img tags is mandatory. However, sometimes images are grouped with a caption already describing them, or are used for decoration only. In these cases alt text may seem redundant or unnecessary.");
	   $pdf->AddLessonText("In situations when an image is already explained with text content, or does not add meaning to a page, the img still needs an alt attribute, but it can be set to an empty string. Here's an example:");

	   $pdf->DrawCodeArea("1");
	   $pdf->AddLessonCode("<img src='visualDecoration.jpeg' alt=''>");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Background images usually fall under the 'decorative' label as well. However, they are typically applied with CSS rules, and therefore not part of the markup screen readers process.");
	   $pdf->AddLessonText("Note: For images with a caption, you may still want to include alt text, since it helps search engines catalog the content of the image.");
	   $pdf->AddLessonText("Camper Cat has coded a skeleton page for the blog part of his website. He's planning to add a visual break between his two articles with a decorative image of a samurai sword. Add an alt attribute to the img tag and set it to an empty string. (Note that the image src doesn't link to an actual file - don't worry that there are no swords showing in the display.)");

	   $pdf->DrawCodeArea("12");
	   $pdf->AddLessonCode("<h1>Deep Thoughts with Master Camper Cat</h1>");
	   $pdf->AddLessonCode("<article>");
	   $pdf->AddLessonCode("  <h2>Defeating your Foe: the Red Dot is Ours!</h2>");
	   $pdf->AddLessonCode("  <p>To Come...</p>");
	   $pdf->AddLessonCode("</article>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("<img src='samuraiSwords.jpeg' alt=''>");
	   $pdf->AddLessonCode("");
       $pdf->AddLessonCode("<article>");
	   $pdf->AddLessonCode("  <h2>Is Chuck Norris a Cat Person?</h2>");
	   $pdf->AddLessonCode("  <p>To Come...</p>");
	   $pdf->AddLessonCode("</article>");
   }
 
   function GenerateAALesson3($pdf) {
       $pdf->AddLessonTitle("Use Headings to Show Hierarchical Relationships of Content");
	   $pdf->AddLessonText("Headings (h1 through h6 elements) are workhorse tags that help provide structure and labeling to your content. Screen readers can be set to read only the headings on a page so the user gets a summary. This means it is important for the heading tags in your markup to have semantic meaning and relate to each other, not be picked merely for their size values.");
	   $pdf->AddLessonText("Semantic meaning means that the tag you use around content indicates the type of information it contains.");
	   $pdf->AddLessonText("If you were writing a paper with an introduction, a body, and a conclusion, it wouldn't make much sense to put the conclusion as a subsection of the body in your outline. It should be its own section. Similarly, the heading tags in a webpage need to go in order and indicate the hierarchical relationships of your content.");
	   $pdf->AddLessonText("Headings with equal (or higher) rank start new implied sections, headings with lower rank start subsections of the previous one.");
	   $pdf->AddLessonText("As an example, a page with an h2 element followed by several subsections labeled with h4 tags would confuse a screen reader user. With six choices, it's tempting to use a tag because it looks better in a browser, but you can use CSS to edit the relative sizing.");
	   $pdf->AddLessonText("One final point, each page should always have one (and only one) h1 element, which is the main subject of your content. This and the other headings are used in part by search engines to understand the topic of the page.");
	   $pdf->AddLessonText("Camper Cat wants a page on his site dedicated to becoming a ninja. Help him fix the headings so his markup gives semantic meaning to the content, and shows the proper parent-child relationships of his sections. Change all the h5 tags to the proper heading level to indicate they are subsections of the h2 ones. Use h3 tags for the purpose.");

	   $pdf->DrawCodeArea("14");
	   $pdf->AddLessonCode("<h1>How to Become a Ninja</h1>");
	   $pdf->AddLessonCode("<main>");
	   $pdf->AddLessonCode("  <h2>Learn the Art of Moving Stealthily</h2>");
	   $pdf->AddLessonCode("  <h3>How to Hide in Plain Sight</h3>");
	   $pdf->AddLessonCode("  <h3>How to Climb a Wall</h3>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("  <h2>Learn the Art of Battle</h2>");
	   $pdf->AddLessonCode("  <h3>How to Strengthen your Body</h3>");
	   $pdf->AddLessonCode("  <h3>How to Fight like a Ninja</h3>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("  <h2>Learn the Art of Living with Honor</h2>");
	   $pdf->AddLessonCode("  <h3>How to Breathe Properly</h3>");
	   $pdf->AddLessonCode("  <h3>How to Simplify your Life</h3>");
	   $pdf->AddLessonCode("</main>");
   }
 
   function GenerateAALesson4($pdf) {
       $pdf->AddLessonTitle("Jump Straight to the Content Using the main Element");
	   $pdf->AddLessonText("HTML5 introduced a number of new elements that give developers more options while also incorporating accessibility features. These tags include main, header, footer, nav, article, and section, among others.");
	   $pdf->AddLessonText("By default, a browser renders these elements similarly to the humble div. However, using them where appropriate gives additional meaning in your markup. The tag name alone can indicate the type of information it contains, which adds semantic meaning to that content. Assistive technologies can access this information to provide better page summary or navigation options to their users.");
	   $pdf->AddLessonText("The main element is used to wrap (you guessed it) the main content, and there should be only one per page. It's meant to surround the information that's related to the central topic of your page. It's not meant to include items that repeat across pages, like navigation links or banners.");
	   $pdf->AddLessonText("The main tag also has an embedded landmark feature that assistive technology can use to quickly navigate to the main content. If you've ever seen a 'Jump to Main Content' link at the top of a page, using a main tag automatically gives assistive devices that functionality.");
	   $pdf->AddLessonText("Camper Cat has some big ideas for his ninja weapons page. Help him set up his markup by adding opening and closing main tags between the header and footer (covered in other challenges). Keep the main tags empty for now.");

	   $pdf->DrawCodeArea("6");
	   $pdf->AddLessonCode("<header>");
	   $pdf->AddLessonCode("  <h1>Weapons of the Ninja</h1>");
	   $pdf->AddLessonCode("</header>");
	   $pdf->AddLessonCode("<main>");
	   $pdf->AddLessonCode("</main>");
	   $pdf->AddLessonCode("<footer></footer>");
   }
 
   function GenerateAALesson5($pdf) {
       $pdf->AddLessonTitle("Wrap Content in the article Element");
	   $pdf->AddLessonText("article is another one of the new HTML5 elements that adds semantic meaning to your markup. article is a sectioning element, and is used to wrap independent, self-contained content. The tag works well with blog entries, forum posts, or news articles.");
	   $pdf->AddLessonText("Determining whether content can stand alone is usually a judgement call, but there are a couple simple tests you can use. Ask yourself if you removed all surrounding context, would that content still make sense? Similarly for text, would the content hold up if it were in an RSS feed?");
	   $pdf->AddLessonText("Remember that folks using assistive technologies rely on organized, semantically meaningful markup to better understand your work.");
	   $pdf->AddLessonText("Note about section and div");
	   $pdf->AddLessonText("The section element is also new with HTML5, and has a slightly different semantic meaning than article. An article is for standalone content, and a section is for grouping thematically related content. They can be used within each other, as needed. For example, if a book is the article, then each chapter is a section. When there's no relationship between groups of content, then use a div.");

	   $pdf->DrawCodeArea("3");
	   $pdf->AddLessonCode("<div> - groups content");
	   $pdf->AddLessonCode("<section> - groups related content");
	   $pdf->AddLessonCode("<article> - groups independent, self-contained content");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Camper Cat used article tags to wrap the posts on his blog page, but he forgot to use them around the top one. Change the div tag to use an article tag instead.");

	   $pdf->DrawCodeArea(21);
	   $pdf->AddLessonCode("<h1>Deep Thoughts with Master Camper Cat</h1>");
	   $pdf->AddLessonCode("<main>");
	   $pdf->AddLessonCode("  <article>");
	   $pdf->AddLessonCode("    <h2>The Garfield Files: Lasagna as Training Fuel?</h2>");
	   $pdf->AddLessonCode("    <p>The internet is littered with varying opinions on nutritional paradigms, from catnip paleo to hairball cleanses. But let's turn our attention to an often overlooked fitness fuel, and examine the protein-carb-NOM trifecta that is lasagna...</p>");
	   $pdf->AddLessonCode("  </article>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("  <img src='samuraiSwords.jpeg' alt=''>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("  <article>");
	   $pdf->AddLessonCode("    <h2>Defeating your Foe: the Red Dot is Ours!</h2>");
	   $pdf->AddLessonCode("    <p>Felines the world over have been waging war on the most persistent of foes. This red nemesis combines both cunning stealth and lightening speed. But chin up, fellow fighters, our time for victory may soon be near...</p>");
	   $pdf->AddLessonCode("  </article>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("  <img src='samuraiSwords.jpeg' alt=''>");

       $pdf->AddLessonTitle("Wrap Content in the article Element (Cont'd)");
	   $pdf->DrawCodeArea(9);
	   $pdf->AddLessonCode("  <article>");
	   $pdf->AddLessonCode("    <h2>Is Chuck Norris a Cat Person?</h2>");
	   $pdf->AddLessonCode("    <p>Chuck Norris is widely regarded as the premier martial artist on the planet, and it's a complete coincidence anyone who disagrees with this fact mysteriously disappears soon after. But the real question is, is he a cat person?...</p>");
	   $pdf->AddLessonCode("  </article>");
	   $pdf->AddLessonCode("</main>");
   }
 
   function GenerateAALesson6($pdf) {
       $pdf->AddLessonTitle("Make Screen Reader Navigation Easier with the header Landmark");
	   $pdf->AddLessonText("The next HTML5 element that adds semantic meaning and improves accessibility is the header tag. It's used to wrap introductory information or navigation links for its parent tag and works well around content that's repeated at the top on multiple pages.");
	   $pdf->AddLessonText("header shares the embedded landmark feature you saw with main, allowing assistive technologies to quickly navigate to that content.");
	   $pdf->AddLessonText("Note: The header is meant for use in the body tag of your HTML document. This is different than the head element, which contains the page's title, meta information, etc.");
	   $pdf->AddLessonText("Camper Cat is writing some great articles about ninja training, and wants to add a page for them to his site. Change the top div that currently contains the h1 to a header tag instead.");

	   $pdf->DrawCodeArea(31);
	   $pdf->AddLessonCode("<body>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("  <header>");
	   $pdf->AddLessonCode("    <h1>Training with Camper Cat</h1>");
	   $pdf->AddLessonCode("  </header>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("  <main>");
	   $pdf->AddLessonCode("    <section id='stealth'>");
	   $pdf->AddLessonCode("      <h2>Stealth &amp; Agility Training</h2>");
	   $pdf->AddLessonCode("      <article><h3>Climb foliage quickly using a minimum spanning tree approach</h3></article>");
	   $pdf->AddLessonCode("      <article><h3>No training is NP-complete without parkour</h3></article>");
	   $pdf->AddLessonCode("    </section>");
	   $pdf->AddLessonCode("    <section id='combat'>");
	   $pdf->AddLessonCode("      <h2>Combat Training</h2>");
	   $pdf->AddLessonCode("      <article><h3>Dispatch multiple enemies with multithreaded tactics</h3></article>");
	   $pdf->AddLessonCode("      <article><h3>Goodbye world: 5 proven ways to knock out an opponent</h3></article>");
	   $pdf->AddLessonCode("    </section>");
	   $pdf->AddLessonCode("    <section id='weapons'>");
	   $pdf->AddLessonCode("      <h2>Weapons Training</h2>");
	   $pdf->AddLessonCode("      <article><h3>Swords: the best tool to literally divide and conquer</h3></article>");
	   $pdf->AddLessonCode("      <article><h3>Breadth-first or depth-first in multi-weapon training?</h3></article>");
	   $pdf->AddLessonCode("    </section>");
	   $pdf->AddLessonCode("  </main>");
	   $pdf->AddLessonCode("</body>");
	   $pdf->AddLessonCode("");
   }
 
   function GenerateAALesson7($pdf) {
       $pdf->AddLessonTitle("Make Screen Reader Navigation Easier with the nav Landmark");
	   $pdf->AddLessonText("The nav element is another HTML5 item with the embedded landmark feature for easy screen reader navigation. This tag is meant to wrap around the main navigation links in your page.");
	   $pdf->AddLessonText("If there are repeated site links at the bottom of the page, it isn't necessary to markup those with a nav tag as well. Using a footer (covered in the next challenge) is sufficient.");
	   $pdf->AddLessonText("Camper Cat included navigation links at the top of his training page, but wrapped them in a div. Change the div to a nav tag to improve the accessibility on his page.");

	   $pdf->DrawCodeArea(37);
	   $pdf->AddLessonCode("<body>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("  <header>");
	   $pdf->AddLessonCode("    <h1>Training with Camper Cat</h1>");
	   $pdf->AddLessonCode("    <nav>");
	   $pdf->AddLessonCode("      <ul>");
	   $pdf->AddLessonCode("        <li><a href='#stealth'>Stealth &amp; Agility</a></li>");
	   $pdf->AddLessonCode("        <li><a href='#combat'>Combat</a></li>");
	   $pdf->AddLessonCode("        <li><a href='#weapons'>Weapons</a></li>");
	   $pdf->AddLessonCode("      </ul>");
	   $pdf->AddLessonCode("    </nav>");
	   $pdf->AddLessonCode("  </header>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("  <main>");
	   $pdf->AddLessonCode("    <section id='stealth'>");
	   $pdf->AddLessonCode("      <h2>Stealth &amp; Agility Training</h2>");
	   $pdf->AddLessonCode("      <article><h3>Climb foliage quickly using a minimum spanning tree approach</h3></article>");
	   $pdf->AddLessonCode("      <article><h3>No training is NP-complete without parkour</h3></article>");
	   $pdf->AddLessonCode("    </section>");
	   $pdf->AddLessonCode("    <section id='combat'>");
	   $pdf->AddLessonCode("      <h2>Combat Training</h2>");
	   $pdf->AddLessonCode("      <article><h3>Dispatch multiple enemies with multithreaded tactics</h3></article>");
	   $pdf->AddLessonCode("      <article><h3>Goodbye world: 5 proven ways to knock out an opponent</h3></article>");
	   $pdf->AddLessonCode("    </section>");
	   $pdf->AddLessonCode("    <section id='weapons'>");
	   $pdf->AddLessonCode("      <h2>Weapons Training</h2>");
	   $pdf->AddLessonCode("      <article><h3>Swords: the best tool to literally divide and conquer</h3></article>");
	   $pdf->AddLessonCode("      <article><h3>Breadth-first or depth-first in multi-weapon training?</h3></article>");
	   $pdf->AddLessonCode("    </section>");
	   $pdf->AddLessonCode("  </main>");
       $pdf->AddLessonCode("</body>");
   }
 
   function GenerateAALesson8($pdf) {
       $pdf->AddLessonTitle("Make Screen Reader Navigation Easier with the footer Landmark");
	   $pdf->AddLessonText("Similar to header and nav, the footer element has a built-in landmark feature that allows assistive devices to quickly navigate to it. It's primarily used to contain copyright information or links to related documents that usually sit at the bottom of a page.");
	   $pdf->AddLessonText("Camper Cat's training page is making good progress. Change the div he used to wrap his copyright information at the bottom of the page to a footer element.");

	   $pdf->DrawCodeArea(38);
	   $pdf->AddLessonCode("<body>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("  <header>");
	   $pdf->AddLessonCode("    <h1>Training with Camper Cat</h1>");
	   $pdf->AddLessonCode("    <nav>");
	   $pdf->AddLessonCode("      <ul>");
	   $pdf->AddLessonCode("        <li><a href='#stealth'>Stealth &amp; Agility</a></li>");
	   $pdf->AddLessonCode("        <li><a href='#combat'>Combat</a></li>");
	   $pdf->AddLessonCode("        <li><a href='#weapons'>Weapons</a></li>");
	   $pdf->AddLessonCode("      </ul>");
	   $pdf->AddLessonCode("    </nav>");
	   $pdf->AddLessonCode("  </header>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("  <main>");
	   $pdf->AddLessonCode("    <section id='stealth'>");
	   $pdf->AddLessonCode("      <h2>Stealth &amp; Agility Training</h2>");
	   $pdf->AddLessonCode("      <article><h3>Climb foliage quickly using a minimum spanning tree approach</h3></article>");
	   $pdf->AddLessonCode("      <article><h3>No training is NP-complete without parkour</h3></article>");
	   $pdf->AddLessonCode("    </section>");
	   $pdf->AddLessonCode("    <section id='combat'>");
	   $pdf->AddLessonCode("      <h2>Combat Training</h2>");
	   $pdf->AddLessonCode("      <article><h3>Dispatch multiple enemies with multithreaded tactics</h3></article>");
	   $pdf->AddLessonCode("      <article><h3>Goodbye world: 5 proven ways to knock out an opponent</h3></article>");
	   $pdf->AddLessonCode("    </section>");
	   $pdf->AddLessonCode("    <section id='weapons'>");
	   $pdf->AddLessonCode("      <h2>Weapons Training</h2>");
	   $pdf->AddLessonCode("      <article><h3>Swords: the best tool to literally divide and conquer</h3></article>");
	   $pdf->AddLessonCode("      <article><h3>Breadth-first or depth-first in multi-weapon training?</h3></article>");
	   $pdf->AddLessonCode("    </section>");
	   $pdf->AddLessonCode("  </main>");
	   $pdf->AddLessonCode("  <footer>&copy; 2018 Camper Cat</footer>");
       $pdf->AddLessonCode("</body>");
   }
 
   function GenerateAALesson9($pdf) {
       $pdf->AddLessonTitle("Improve Accessibility of Audio Content with the audio Element");
	   $pdf->AddLessonText("HTML5's audio element gives semantic meaning when it wraps sound or audio stream content in your markup. Audio content also needs a text alternative to be accessible to people who are deaf or hard of hearing. This can be done with nearby text on the page or a link to a transcript.");
	   $pdf->AddLessonText("The audio tag supports the controls attribute. This shows the browser default play, pause, and other controls, and supports keyboard functionality. This is a boolean attribute, meaning it doesn't need a value, its presence on the tag turns the setting on.");
	   $pdf->AddLessonText("Here's an example:");

	   $pdf->DrawCodeArea(4);
	   $pdf->AddLessonCode("<audio id='meowClip' controls>");
	   $pdf->AddLessonCode("  <source src='audio/meow.mp3' type='audio/mpeg' />");
	   $pdf->AddLessonCode("  <source src='audio/meow.ogg' type='audio/ogg' />");
	   $pdf->AddLessonCode("</audio>");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Note: Multimedia content usually has both visual and auditory components. It needs synchronized captions and a transcript so users with visual and/or auditory impairments can access it. Generally, a web developer is not responsible for creating the captions or transcript, but needs to know to include them.");
	   $pdf->AddLessonText("Time to take a break from Camper Cat and meet fellow camper Zersiax (@zersiax), a champion of accessibility and a screen reader user. To hear a clip of his screen reader in action, add an audio element after the p. Include the controls attribute. Then place a source tag inside the audio tags with the src attribute set to 'https://s3.amazonaws.com/freecodecamp/screen-reader.mp3' and type attribute set to 'audio/mpeg'.");
	   $pdf->AddLessonText("Note: The audio clip may sound fast and be difficult to understand, but that is a normal speed for screen reader users.");

	   $pdf->DrawCodeArea(12);
	   $pdf->AddLessonCode("<body>");
	   $pdf->AddLessonCode("  <header>");
	   $pdf->AddLessonCode("    <h1>Real Coding Ninjas</h1>");
	   $pdf->AddLessonCode("  </header>");
	   $pdf->AddLessonCode("  <main>");
	   $pdf->AddLessonCode("    <p>A sound clip of Zersiax's screen reader in action.</p>");
	   $pdf->AddLessonCode("<audio id='meowClip' controls>");
	   $pdf->AddLessonCode("  <source src='https://s3.amazonaws.com/freecodecamp/screen-reader.mp3' type='audio/mpeg' />");
	   $pdf->AddLessonCode("</audio>");
	   $pdf->AddLessonCode("  </main>");
	   $pdf->AddLessonCode("</body>");
   }
 
   function GenerateAALesson10($pdf) {
       $pdf->AddLessonTitle("Improve Chart Accessibility with the figure Element");
	   $pdf->AddLessonText("HTML5 introduced the figure element, along with the related figcaption. Used together, these items wrap a visual representation (like an image, diagram, or chart) along with its caption. This gives a two-fold accessibility boost by both semantically grouping related content, and providing a text alternative that explains the figure.");
	   $pdf->AddLessonText("For data visualizations like charts, the caption can be used to briefly note the trends or conclusions for users with visual impairments. Another challenge covers how to move a table version of the chart's data off-screen (using CSS) for screen reader users.");
	   $pdf->AddLessonText("Here's an example - note that the figcaption goes inside the figure tags and can be combined with other elements:");

	   $pdf->DrawCodeArea(8);
	   $pdf->AddLessonCode("<figure>");
	   $pdf->AddLessonCode("  <img src='roundhouseDestruction.jpeg' alt='Photo of Camper Cat executing a roundhouse kick'>");
	   $pdf->AddLessonCode("  <br>");
	   $pdf->AddLessonCode("  <figcaption>");
	   $pdf->AddLessonCode("    Master Camper Cat demonstrates proper form of a roundhouse kick.");
	   $pdf->AddLessonCode("  </figcaption>");
	   $pdf->AddLessonCode("</figure>");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Camper Cat is hard at work creating a stacked bar chart showing the amount of time per week to spend training in stealth, combat, and weapons. Help him structure his page better by changing the div tag he used to a figure tag, and the p tag that surrounds the caption to a figcaption tag.");

	   $pdf->DrawCodeArea(28);
	   $pdf->AddLessonCode("<body>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("  <header>");
	   $pdf->AddLessonCode("    <h1>Training with Camper Cat</h1>");
	   $pdf->AddLessonCode("    <nav>");
	   $pdf->AddLessonCode("      <ul>");
	   $pdf->AddLessonCode("        <li><a href='#stealth'>Stealth &amp; Agility</a></li>");
	   $pdf->AddLessonCode("        <li><a href='#combat'>Combat</a></li>");
	   $pdf->AddLessonCode("        <li><a href='#weapons'>Weapons</a></li>");
	   $pdf->AddLessonCode("      </ul>");
	   $pdf->AddLessonCode("    </nav>");
	   $pdf->AddLessonCode("  </header>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("  <main>");
	   $pdf->AddLessonCode("    <section>");
	   $pdf->AddLessonCode("      <figure>");
	   $pdf->AddLessonCode("        <br>");
	   $pdf->AddLessonCode("        <figcaption>Breakdown per week of time to spend training in stealth, combat, and weapons.</figcaption>");
	   $pdf->AddLessonCode("      </figure>");
	   $pdf->AddLessonCode("    </section>");
	   $pdf->AddLessonCode("    <section id='stealth'>");
	   $pdf->AddLessonCode("      <h2>Stealth &amp; Agility Training</h2>");
	   $pdf->AddLessonCode("      <article><h3>Climb foliage quickly using a minimum spanning tree approach</h3></article>");
	   $pdf->AddLessonCode("      <article><h3>No training is NP-complete without parkour</h3></article>");
	   $pdf->AddLessonCode("    </section>");

       $pdf->AddLessonTitle("Improve Chart Accessibility with the figure Element");
	   $pdf->DrawCodeArea(18);
	   $pdf->AddLessonCode("    <section id='combat'>");
	   $pdf->AddLessonCode("      <h2>Combat Training</h2>");
	   $pdf->AddLessonCode("      <article><h3>Dispatch multiple enemies with multithreaded tactics</h3></article>");
	   $pdf->AddLessonCode("      <article><h3>Goodbye world: 5 proven ways to knock out an opponent</h3></article>");
	   $pdf->AddLessonCode("    </section>");
	   $pdf->AddLessonCode("    <section id='weapons'>");
	   $pdf->AddLessonCode("      <h2>Weapons Training</h2>");
	   $pdf->AddLessonCode("      <article><h3>Swords: the best tool to literally divide and conquer</h3></article>");
	   $pdf->AddLessonCode("      <article><h3>Breadth-first or depth-first in multi-weapon training?</h3></article>");
	   $pdf->AddLessonCode("    </section>");
	   $pdf->AddLessonCode("  </main>");
	   $pdf->AddLessonCode("  <footer>&copy; 2018 Camper Cat</footer>");
       $pdf->AddLessonCode("</body>");
   }
 
   function GenerateAALesson11($pdf) {
       $pdf->AddLessonTitle("Improve Form Field Accessibility with the label Element");
	   $pdf->AddLessonText("Improving accessibility with semantic HTML markup applies to using both appropriate tag names as well as attributes. The next several challenges cover some important scenarios using attributes in forms.");
	   $pdf->AddLessonText("The label tag wraps the text for a specific form control item, usually the name or label for a choice. This ties meaning to the item and makes the form more readable. The for attribute on a label tag explicitly associates that label with the form control and is used by screen readers.");
	   $pdf->AddLessonText("You learned about radio buttons and their labels in a lesson in the Basic HTML section. In that lesson, we wrapped the radio button input element inside a label element along with the label text in order to make the text clickable. Another way to achieve this is by using the for attribute as explained in this lesson.");
	   $pdf->AddLessonText("The value of the for attribute must be the same as the value of the id attribute of the form control. Here's an example:");

	   $pdf->DrawCodeArea(4);
	   $pdf->AddLessonCode("<form>");
	   $pdf->AddLessonCode("  <label for='name'>Name:</label>");
	   $pdf->AddLessonCode("  <input type='text' id='name' name='name'>");
	   $pdf->AddLessonCode("</form>");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Camper Cat expects a lot of interest in his thoughtful blog posts and wants to include an email sign up form. Add a for attribute on the email label that matches the id on its input field.");

	   $pdf->DrawCodeArea(32);
	   $pdf->AddLessonCode("<body>");
	   $pdf->AddLessonCode("  <header>");
	   $pdf->AddLessonCode("    <h1>Deep Thoughts with Master Camper Cat</h1>");
	   $pdf->AddLessonCode("  </header>");
	   $pdf->AddLessonCode("  <section>");
	   $pdf->AddLessonCode("    <form>");
	   $pdf->AddLessonCode("      <p>Sign up to receive Camper Cat's blog posts by email here!</p>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("      <label for='email'>Email:</label>");
	   $pdf->AddLessonCode("      <input type='text' id='email' name='email'>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("      <input type='submit' name='submit' value='Submit'>");
	   $pdf->AddLessonCode("    </form>");
	   $pdf->AddLessonCode("  </section>");
	   $pdf->AddLessonCode("  <article>");
	   $pdf->AddLessonCode("    <h2>The Garfield Files: Lasagna as Training Fuel?</h2>");
	   $pdf->AddLessonCode("    <p>The internet is littered with varying opinions on nutritional paradigms, from catnip paleo to hairball cleanses. But let's turn our attention to an often overlooked fitness fuel, and examine the protein-carb-NOM trifecta that is lasagna...</p>");
	   $pdf->AddLessonCode("  </article>");
	   $pdf->AddLessonCode("  <img src='samuraiSwords.jpeg' alt=''>");
	   $pdf->AddLessonCode("  <article>");
	   $pdf->AddLessonCode("    <h2>Defeating your Foe: the Red Dot is Ours!</h2>");
	   $pdf->AddLessonCode("    <p>Felines the world over have been waging war on the most persistent of foes. This red nemesis combines both cunning stealth and lightning speed. But chin up, fellow fighters, our time for victory may soon be near...</p>");
	   $pdf->AddLessonCode("  </article>");
	   $pdf->AddLessonCode("  <img src='samuraiSwords.jpeg' alt=''>");

       $pdf->AddLessonTitle("Improve Form Field Accessibility with the label Element");
	   $pdf->DrawCodeArea(10);
	   $pdf->AddLessonCode("  <article>");
	   $pdf->AddLessonCode("    <h2>Is Chuck Norris a Cat Person?</h2>");
	   $pdf->AddLessonCode("    <p>Chuck Norris is widely regarded as the premier martial artist on the planet, and it's a complete coincidence anyone who disagrees with this fact mysteriously disappears soon after. But the real question is, is he a cat person?...</p>");
	   $pdf->AddLessonCode("  </article>");
	   $pdf->AddLessonCode("  <footer>&copy; 2018 Camper Cat</footer>");
	   $pdf->AddLessonCode("</body>");
   }
 
   function GenerateAALesson12($pdf) {
       $pdf->AddLessonTitle("Wrap Radio Buttons in a fieldset Element for Better Accessibility");
	   $pdf->AddLessonText("The next form topic covers accessibility of radio buttons. Each choice is given a label with a for attribute tying to the id of the corresponding item as covered in the last challenge. Since radio buttons often come in a group where the user must choose one, there's a way to semantically show the choices are part of a set.");
	   $pdf->AddLessonText("The fieldset tag surrounds the entire grouping of radio buttons to achieve this. It often uses a legend tag to provide a description for the grouping, which is read by screen readers for each choice in the fieldset element.");
	   $pdf->AddLessonText("The fieldset wrapper and legend tag are not necessary when the choices are self-explanatory, like a gender selection. Using a label with the for attribute for each radio button is sufficient.");
	   $pdf->AddLessonText("Here's an example:");

	   $pdf->DrawCodeArea(11);
	   $pdf->AddLessonCode("<form>");
	   $pdf->AddLessonCode("  <fieldset>");
	   $pdf->AddLessonCode("    <legend>Choose one of these three items:</legend>");
	   $pdf->AddLessonCode("    <input id='one' type='radio' name='items' value='one'>");
	   $pdf->AddLessonCode("    <label for='one'>Choice One</label><br>");
	   $pdf->AddLessonCode("    <input id='two' type='radio' name='items' value='two'>");
	   $pdf->AddLessonCode("    <label for='two'>Choice Two</label><br>");
	   $pdf->AddLessonCode("    <input id='three' type='radio' name='items' value='three'>");
	   $pdf->AddLessonCode("    <label for='three'>Choice Three</label>");
	   $pdf->AddLessonCode("  </fieldset>");
	   $pdf->AddLessonCode("</form>");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Camper Cat wants information about the ninja level of his users when they sign up for his email list. He's added a set of radio buttons and learned from our last lesson to use label tags with for attributes for each choice. Go Camper Cat! However, his code still needs some help. Change the div tag surrounding the radio buttons to a fieldset tag, and change the p tag inside it to a legend.");

	   $pdf->DrawCodeArea(23);
	   $pdf->AddLessonCode("<body>");
	   $pdf->AddLessonCode("  <header>");
	   $pdf->AddLessonCode("    <h1>Deep Thoughts with Master Camper Cat</h1>");
	   $pdf->AddLessonCode("  </header>");
	   $pdf->AddLessonCode("  <section>");
	   $pdf->AddLessonCode("    <form>");
	   $pdf->AddLessonCode("      <p>Sign up to receive Camper Cat's blog posts by email here!</p>");
	   $pdf->AddLessonCode("      <label for='email'>Email:</label>");
	   $pdf->AddLessonCode("      <input type='text' id='email' name='email'>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("      <fieldset>");
	   $pdf->AddLessonCode("        <legend>What level ninja are you?</legend>");
	   $pdf->AddLessonCode("        <input id='newbie' type='radio' name='levels' value='newbie'>");
	   $pdf->AddLessonCode("        <label for='newbie'>Newbie Kitten</label><br>");
	   $pdf->AddLessonCode("        <input id='intermediate' type='radio' name='levels' value='intermediate'>");
	   $pdf->AddLessonCode("        <label for='intermediate'>Developing Student</label><br>");
	   $pdf->AddLessonCode("        <input id='master' type='radio' name='levels' value='master'>");
	   $pdf->AddLessonCode("        <label for='master'>Master</label>");
	   $pdf->AddLessonCode("      </fieldset>");
	   $pdf->AddLessonCode("      <input type='submit' name='submit' value='Submit'>");
	   $pdf->AddLessonCode("    </form>");
	   $pdf->AddLessonCode("  </section>");

       $pdf->AddLessonTitle("Wrap Radio Buttons in a fieldset Element for Better Accessibility (cont'd)");
	   $pdf->DrawCodeArea(26);
	   $pdf->AddLessonCode("  <article>");
	   $pdf->AddLessonCode("    <h2>The Garfield Files: Lasagna as Training Fuel?</h2>");
	   $pdf->AddLessonCode("    <p>The internet is littered with varying opinions on nutritional paradigms, from catnip paleo to hairball cleanses. But let's turn our attention to an often overlooked fitness fuel, and examine the protein-carb-NOM trifecta that is lasagna...</p>");
	   $pdf->AddLessonCode("  </article>");
	   $pdf->AddLessonCode("  <img src='samuraiSwords.jpeg' alt=''>");
	   $pdf->AddLessonCode("  <article>");
	   $pdf->AddLessonCode("    <h2>Defeating your Foe: the Red Dot is Ours!</h2>");
	   $pdf->AddLessonCode("    <p>Felines the world over have been waging war on the most persistent of foes. This red nemesis combines both cunning stealth and lightning speed. But chin up, fellow fighters, our time for victory may soon be near...</p>");
	   $pdf->AddLessonCode("  </article>");
	   $pdf->AddLessonCode("  <img src='samuraiSwords.jpeg' alt=''>");
	   $pdf->AddLessonCode("  <article>");
	   $pdf->AddLessonCode("    <h2>Is Chuck Norris a Cat Person?</h2>");
	   $pdf->AddLessonCode("    <p>Chuck Norris is widely regarded as the premier martial artist on the planet, and it's a complete coincidence anyone who disagrees with this fact mysteriously disappears soon after. But the real question is, is he a cat person?...</p>");
	   $pdf->AddLessonCode("  </article>");
	   $pdf->AddLessonCode("  <footer>&copy; 2018 Camper Cat</footer>");
	   $pdf->AddLessonCode("</body>");
   }
 
   function GenerateAALesson13($pdf) {
       $pdf->AddLessonTitle("Add an Accessible Date Picker");
	   $pdf->AddLessonText("Forms often include the input field, which can be used to create several different form controls. The type attribute on this element indicates what kind of input will be created.");
	   $pdf->AddLessonText("You may have noticed the text and submit input types in prior challenges, and HTML5 introduced an option to specify a date field. Depending on browser support, a date picker shows up in the input field when it's in focus, which makes filling in a form easier for all users.");
	   $pdf->AddLessonText("For older browsers, the type will default to text, so it helps to show users the expected date format in the label or as placeholder text just in case.");
	   $pdf->AddLessonText("Here's an example:");

	   $pdf->DrawCodeArea(2);
	   $pdf->AddLessonCode("<label for='input1'>Enter a date:</label>");
	   $pdf->AddLessonCode("<input type='date' id='input1' name='input1'>");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Camper Cat is setting up a Mortal Kombat tournament and wants to ask his competitors to see what date works best. Add an input tag with a type attribute of 'date', an id attribute of 'pickdate', and a name attribute of 'date'.");

	   $pdf->DrawCodeArea(17);
	   $pdf->AddLessonCode("<body>");
	   $pdf->AddLessonCode("  <header>");
	   $pdf->AddLessonCode("    <h1>Tournaments</h1>");
	   $pdf->AddLessonCode("  </header>");
	   $pdf->AddLessonCode("  <main>");
	   $pdf->AddLessonCode("    <section>");
	   $pdf->AddLessonCode("      <h2>Mortal Kombat Tournament Survey</h2>");
	   $pdf->AddLessonCode("      <form>");
	   $pdf->AddLessonCode("        <p>Tell us the best date for the competition</p>");
	   $pdf->AddLessonCode("        <label for='pickdate'>Preferred Date:</label>");
	   $pdf->AddLessonCode("        <input type='date' id='pickdate' name='date'>");
	   $pdf->AddLessonCode("        <input type='submit' name='submit' value='Submit'>");
	   $pdf->AddLessonCode("      </form>");
	   $pdf->AddLessonCode("    </section>");
	   $pdf->AddLessonCode("  </main>");
	   $pdf->AddLessonCode("  <footer>&copy; 2018 Camper Cat</footer>");
	   $pdf->AddLessonCode("</body>:%s/'");
   }
 
   function GenerateAALesson14($pdf) {
       $pdf->AddLessonTitle("Standardize Times with the HTML5 datetime Attribute");
	   $pdf->AddLessonText("Continuing with the date theme, HTML5 also introduced the time element along with a datetime attribute to standardize times. This is an inline element that can wrap a date or time on a page. A valid format of that date is held by the datetime attribute. This is the value accessed by assistive devices. It helps avoid confusion by stating a standardized version of a time, even if it's written in an informal or colloquial manner in the text.");
	   $pdf->AddLessonText("Here's an example:");

	   $pdf->DrawCodeArea(3);
	   $pdf->AddLessonCode("<p>Master Camper Cat officiated the cage match between Goro and Scorpion <time datetime='2013-02-13'>last Wednesday</time>, which ended in a draw.</p>");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Camper Cat's Mortal Kombat survey results are in! Wrap a time tag around the text 'Thursday, September 15<sup>th</sup>' and add a datetime attribute to it set to '2016-09-15'.");

	   $pdf->DrawCodeArea(31);
	   $pdf->AddLessonCode("<body>");
	   $pdf->AddLessonCode("  <header>");
	   $pdf->AddLessonCode("    <h1>Tournaments</h1>");
	   $pdf->AddLessonCode("  </header>");
	   $pdf->AddLessonCode("  <article>");
	   $pdf->AddLessonCode("    <h2>Mortal Kombat Tournament Survey Results</h2>");
	   $pdf->AddLessonCode("    <p>Thank you to everyone for responding to Master Camper Cat's survey. The best day to host the vaunted Mortal Kombat tournament is <time datetime='2016-09-15'>Thursday, September 15<sup>th</sup></time>. May the best ninja win!</p>");
	   $pdf->AddLessonCode("    <section>");
	   $pdf->AddLessonCode("      <h3>Comments:</h3>");
	   $pdf->AddLessonCode("      <article>");
	   $pdf->AddLessonCode("        <p>Posted by: Sub-Zero on <time datetime='2016-08-13T20:01Z'>August 13<sup>th</sup></time></p>");
	   $pdf->AddLessonCode("        <p>Johnny Cage better be there, I'll finish him!</p>");
	   $pdf->AddLessonCode("      </article>");
	   $pdf->AddLessonCode("      <article>");
	   $pdf->AddLessonCode("        <p>Posted by: Doge on <time datetime='2016-08-15T08:12Z'>August 15<sup>th</sup></time></p>");
	   $pdf->AddLessonCode("        <p>Wow, much combat, so mortal.</p>");
	   $pdf->AddLessonCode("      </article>");
	   $pdf->AddLessonCode("      <article>");
	   $pdf->AddLessonCode("        <p>Posted by: The Grim Reaper on <time datetime='2016-08-16T00:00Z'>August 16<sup>th</sup></time></p>");
	   $pdf->AddLessonCode("        <p>Looks like I'll be busy that day.</p>");
	   $pdf->AddLessonCode("      </article>");
	   $pdf->AddLessonCode("    </section>");
	   $pdf->AddLessonCode("  </article>");
	   $pdf->AddLessonCode("  <footer>&copy; 2018 Camper Cat</footer>");
	   $pdf->AddLessonCode("</body>");
   }
 
   function GenerateAALesson15($pdf) {
       $pdf->AddLessonTitle("Make Elements Only Visible to a Screen Reader by Using Custom CSS");
	   $pdf->AddLessonText("Have you noticed that all of the applied accessibility challenges so far haven't used any CSS? This is to show the importance of a logical document outline, and using semantically meaningful tags around your content before introducing the visual design aspect.");
	   $pdf->AddLessonText("However, CSS's magic can also improve accessibility on your page when you want to visually hide content meant only for screen readers. This happens when information is in a visual format (like a chart), but screen reader users need an alternative presentation (like a table) to access the data. CSS is used to position the screen reader-only elements off the visual area of the browser window.");
	   $pdf->AddLessonText("Here's an example of the CSS rules that accomplish this:");

	   $pdf->DrawCodeArea(8);
	   $pdf->AddLessonCode(".sr-only {");
	   $pdf->AddLessonCode("  position: absolute;");
	   $pdf->AddLessonCode("  left: -10000px;");
	   $pdf->AddLessonCode("  width: 1px;");
	   $pdf->AddLessonCode("  height: 1px;");
	   $pdf->AddLessonCode("  top: auto;");
	   $pdf->AddLessonCode("  overflow: hidden;");
	   $pdf->AddLessonCode("}");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Note: The following CSS approaches will NOT do the same thing:");
	   $pdf->AddLessonBullet("display: none; or visibility: hidden; hides content for everyone, including screen reader users");
	   $pdf->AddLessonBullet("Zero values for pixel sizes, such as width: 0px; height: 0px; removes that element from the flow of your document, meaning screen readers will ignore it");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Camper Cat created a really cool stacked bar chart for his training page, and put the data into a table for his visually impaired users. The table already has an sr-only class, but the CSS rules aren't filled in yet. Give the position an absolute value, the left a -10000px value, and the width and height both 1px values.");

	   $pdf->DrawCodeArea(12);
	   $pdf->AddLessonCode("<head>");
	   $pdf->AddLessonCode("  <style>");
	   $pdf->AddLessonCode("  .sr-only {");
	   $pdf->AddLessonCode("    position: absolute;");
	   $pdf->AddLessonCode("    left: -10000px ;");
	   $pdf->AddLessonCode("    width: 1px;");
	   $pdf->AddLessonCode("    height: 1px;");
	   $pdf->AddLessonCode("    top: auto;");
	   $pdf->AddLessonCode("    overflow: hidden;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  </style>");
	   $pdf->AddLessonCode("</head>");
	   
       $pdf->AddLessonTitle("Make Elements Only Visible to a Screen Reader by Using Custom CSS");
	   $pdf->DrawCodeArea(58);
	   $pdf->AddLessonCode("<body>");
	   $pdf->AddLessonCode("  <header>");
	   $pdf->AddLessonCode("    <h1>Training</h1>");
	   $pdf->AddLessonCode("    <nav>");
	   $pdf->AddLessonCode("      <ul>");
	   $pdf->AddLessonCode("        <li><a href='#stealth'>Stealth &amp; Agility</a></li>");
	   $pdf->AddLessonCode("        <li><a href='#combat'>Combat</a></li>");
	   $pdf->AddLessonCode("        <li><a href='#weapons'>Weapons</a></li>");
	   $pdf->AddLessonCode("      </ul>");
	   $pdf->AddLessonCode("    </nav>");
	   $pdf->AddLessonCode("  </header>");
	   $pdf->AddLessonCode("  <section>");
	   $pdf->AddLessonCode("    <h2>Master Camper Cat's Beginner Three Week Training Program</h2>");
	   $pdf->AddLessonCode("    <figure>");
	   $pdf->AddLessonCode("      <!-- Stacked bar chart of weekly training -->");
	   $pdf->AddLessonCode("      <p>[Stacked bar chart]</p>");
	   $pdf->AddLessonCode("      <br />");
	   $pdf->AddLessonCode("      <figcaption>Breakdown per week of time to spend training in stealth, combat, and weapons.</figcaption>");
	   $pdf->AddLessonCode("    </figure>");
	   $pdf->AddLessonCode("    <table class='sr-only'>");
	   $pdf->AddLessonCode("      <caption>Hours of Weekly Training in Stealth, Combat, and Weapons</caption>");
	   $pdf->AddLessonCode("      <thead>");
	   $pdf->AddLessonCode("        <tr>");
	   $pdf->AddLessonCode("          <th></th>");
	   $pdf->AddLessonCode("          <th scope='col'>Stealth &amp; Agility</th>");
	   $pdf->AddLessonCode("          <th scope='col'>Combat</th>");
	   $pdf->AddLessonCode("          <th scope='col'>Weapons</th>");
	   $pdf->AddLessonCode("          <th scope='col'>Total</th>");
	   $pdf->AddLessonCode("        </tr>");
	   $pdf->AddLessonCode("      </thead>");
	   $pdf->AddLessonCode("      <tbody>");
	   $pdf->AddLessonCode("        <tr>");
	   $pdf->AddLessonCode("          <th scope='row'>Week One</th>");
	   $pdf->AddLessonCode("          <td>3</td>");
	   $pdf->AddLessonCode("          <td>5</td>");
	   $pdf->AddLessonCode("          <td>2</td>");
	   $pdf->AddLessonCode("          <td>10</td>");
	   $pdf->AddLessonCode("        </tr>");
	   $pdf->AddLessonCode("        <tr>");
	   $pdf->AddLessonCode("          <th scope='row'>Week Two</th>");
	   $pdf->AddLessonCode("          <td>4</td>");
	   $pdf->AddLessonCode("          <td>5</td>");
	   $pdf->AddLessonCode("          <td>3</td>");
	   $pdf->AddLessonCode("          <td>12</td>");
	   $pdf->AddLessonCode("        </tr>");
	   $pdf->AddLessonCode("        <tr>");
	   $pdf->AddLessonCode("          <th scope='row'>Week Three</th>");
	   $pdf->AddLessonCode("          <td>4</td>");
	   $pdf->AddLessonCode("          <td>6</td>");
	   $pdf->AddLessonCode("          <td>3</td>");
	   $pdf->AddLessonCode("          <td>13</td>");
	   $pdf->AddLessonCode("        </tr>");
	   $pdf->AddLessonCode("      </tbody>");
	   $pdf->AddLessonCode("    </table>");
	   $pdf->AddLessonCode("  </section>");

       $pdf->AddLessonTitle("Make Elements Only Visible to a Screen Reader by Using Custom CSS");
	   $pdf->DrawCodeArea(23);
	   $pdf->AddLessonCode("  <section id='stealth'>");
	   $pdf->AddLessonCode("    <h2>Stealth &amp; Agility Training</h2>");
	   $pdf->AddLessonCode("    <article><h3>Climb foliage quickly using a minimum spanning tree approach</h3></article>");
	   $pdf->AddLessonCode("    <article><h3>No training is NP-complete without parkour</h3></article>");
	   $pdf->AddLessonCode("  </section>");
	   $pdf->AddLessonCode("  <section id='combat'>");
	   $pdf->AddLessonCode("    <h2>Combat Training</h2>");
	   $pdf->AddLessonCode("    <article><h3>Dispatch multiple enemies with multithreaded tactics</h3></article>");
	   $pdf->AddLessonCode("    <article><h3>Goodbye, world: 5 proven ways to knock out an opponent</h3></article>");
	   $pdf->AddLessonCode("  </section>");
	   $pdf->AddLessonCode("  <section id='weapons'>");
	   $pdf->AddLessonCode("    <h2>Weapons Training</h2>");
	   $pdf->AddLessonCode("    <article><h3>Swords: the best tool to literally divide and conquer</h3></article>");
	   $pdf->AddLessonCode("    <article><h3>Breadth-first or depth-first in multi-weapon training?</h3></article>");
	   $pdf->AddLessonCode("  </section>");
	   $pdf->AddLessonCode("  <footer>&copy; 2018 Camper Cat</footer>");
	   $pdf->AddLessonCode("</body>");
   }
 
    function GenerateAALesson16($pdf) {
       $pdf->AddLessonTitle("Improve Readability with High Contrast Text");
	   $pdf->AddLessonText("Low contrast between the foreground and background colors can make text difficult to read. Sufficient contrast improves the readability of your content, but what exactly does 'sufficient' mean?");
	   $pdf->AddLessonText("The Web Content Accessibility Guidelines (WCAG) recommend at least a 4.5 to 1 contrast ratio for normal text. The ratio is calculated by comparing the relative luminance values of two colors. This ranges from 1:1 for the same color, or no contrast, to 21:1 for white against black, the strongest contrast. There are many contrast checking tools available online that calculate this ratio for you.");
	   $pdf->AddLessonText("Camper Cat's choice of light gray text on a white background for his recent blog post has a 1.5:1 contrast ratio, making it hard to read. Change the color of the text from the current gray (#D3D3D3) to a darker gray (#636363) to improve the contrast ratio to 6:1.");

	   $pdf->DrawCodeArea(25);
	   $pdf->AddLessonCode("<head>");
	   $pdf->AddLessonCode("  <style>");
	   $pdf->AddLessonCode("  body {");
	   $pdf->AddLessonCode("    color: #636363;");
	   $pdf->AddLessonCode("    background-color: #FFF;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  </style>");
	   $pdf->AddLessonCode("</head>");
	   $pdf->AddLessonCode("<body>");
	   $pdf->AddLessonCode("  <header>");
	   $pdf->AddLessonCode("    <h1>Deep Thoughts with Master Camper Cat</h1>");
	   $pdf->AddLessonCode("  </header>");
	   $pdf->AddLessonCode("  <article>");
	   $pdf->AddLessonCode("    <h2>A Word on the Recent Catnip Doping Scandal</h2>");
	   $pdf->AddLessonCode("    <p>The influence that catnip has on feline behavior is well-documented, and its use as an herbal supplement in competitive ninja circles remains controversial. Once again, the debate to ban the substance is brought to the public's attention after the high-profile win of Kittytron, a long-time proponent and user of the green stuff, at the Claw of Fury tournament.</p>");
	   $pdf->AddLessonCode("    <p>As I've stated in the past, I firmly believe a true ninja's skills must come from within, with no external influences. My own catnip use shall continue as purely recreational.</p>");
	   $pdf->AddLessonCode("  </article>");
	   $pdf->AddLessonCode("</body>");
   }
 
    function GenerateAALesson17($pdf) {
       $pdf->AddLessonTitle("Avoid Colorblindness Issues by Using Sufficient Contrast");
	   $pdf->AddLessonText("Color is a large part of visual design, but its use introduces two accessibility issues. First, color alone should not be used as the only way to convey important information because screen reader users won't see it. Second, foreground and background colors need sufficient contrast so colorblind users can distinguish them.");
	   $pdf->AddLessonText("Previous challenges covered having text alternatives to address the first issue. The last challenge introduced contrast checking tools to help with the second. The WCAG-recommended contrast ratio of 4.5:1 applies for color use as well as gray-scale combinations.");
	   $pdf->AddLessonText("Colorblind users have trouble distinguishing some colors from others - usually in hue but sometimes lightness as well. You may recall the contrast ratio is calculated using the relative luminance (or lightness) values of the foreground and background colors.");
	   $pdf->AddLessonText("In practice, the 4.5:1 contrast ratio can be reached by shading (adding black to) the darker color and tinting (adding white to) the lighter color. Darker shades on the color wheel are considered to be shades of blues, violets, magentas, and reds, whereas lighter tinted colors are oranges, yellows, greens, and blue-greens.");
	   $pdf->AddLessonText("Camper Cat is experimenting with using color for his blog text and background, but his current combination of a greenish background-color with maroon text color has a 2.5:1 contrast ratio. You can easily adjust the lightness of the colors since he declared them using the CSS hsl() property (which stands for hue, saturation, lightness) by changing the third argument. Increase the background-color lightness value from 35% to 55%, and decrease the color lightness value from 20% to 15%. This improves the contrast to 5.9:1.");

	   $pdf->DrawCodeArea(25);
	   $pdf->AddLessonCode("<head>");
	   $pdf->AddLessonCode("  <style>");
	   $pdf->AddLessonCode("  body {");
	   $pdf->AddLessonCode("    color: hsl(0, 55%, 15%);");
	   $pdf->AddLessonCode("    background-color: hsl(120, 25%, 55%);");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  </style>");
	   $pdf->AddLessonCode("</head>");
	   $pdf->AddLessonCode("<body>");
	   $pdf->AddLessonCode("  <header>");
	   $pdf->AddLessonCode("    <h1>Deep Thoughts with Master Camper Cat</h1>");
	   $pdf->AddLessonCode("  </header>");
	   $pdf->AddLessonCode("  <article>");
	   $pdf->AddLessonCode("    <h2>A Word on the Recent Catnip Doping Scandal</h2>");
	   $pdf->AddLessonCode("    <p>The influence that catnip has on feline behavior is well-documented, and its use as an herbal supplement in competitive ninja circles remains controversial. Once again, the debate to ban the substance is brought to the public's attention after the high-profile win of Kittytron, a long-time proponent and user of the green stuff, at the Claw of Fury tournament.</p>");
	   $pdf->AddLessonCode("    <p>As I've stated in the past, I firmly believe a true ninja's skills must come from within, with no external influences. My own catnip use shall continue as purely recreational.</p>");
	   $pdf->AddLessonCode("  </article>");
	   $pdf->AddLessonCode("</body>");
   }
 
    function GenerateAALesson18($pdf) {
       $pdf->AddLessonTitle("Avoid Colorblindness Issues by Carefully Choosing Colors that Convey Information");
	   $pdf->AddLessonText("There are various forms of colorblindness. These can range from a reduced sensitivity to a certain wavelength of light to the inability to see color at all. The most common form is a reduced sensitivity to detect greens.");
	   $pdf->AddLessonText("For example, if two similar green colors are the foreground and background color of your content, a colorblind user may not be able to distinguish them. Close colors can be thought of as neighbors on the color wheel, and those combinations should be avoided when conveying important information.");
	   $pdf->AddLessonText("Note: Some online color picking tools include visual simulations of how colors appear for different types of colorblindness. These are great resources in addition to online contrast checking calculators.");
	   $pdf->AddLessonText("Camper Cat is testing different styles for an important button, but the yellow (#FFFF33) background-color and the green (#33FF33) text color are neighboring hues on the color wheel and virtually indistinguishable for some colorblind users. (Their similar lightness also fails the contrast ratio check). Change the text color to a dark blue (#003366) to solve both problems.");

	   $pdf->DrawCodeArea(16);
	   $pdf->AddLessonCode("<head>");
	   $pdf->AddLessonCode("  <style>");
	   $pdf->AddLessonCode("  button {");
	   $pdf->AddLessonCode("    color: #003366;");
	   $pdf->AddLessonCode("    background-color: #FFFF33;");
	   $pdf->AddLessonCode("    font-size: 14px;");
	   $pdf->AddLessonCode("    padding: 10px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  </style>");
	   $pdf->AddLessonCode("</head>");
	   $pdf->AddLessonCode("<body>");
	   $pdf->AddLessonCode("  <header>");
	   $pdf->AddLessonCode("    <h1>Danger!</h1>");
	   $pdf->AddLessonCode("  </header>");
	   $pdf->AddLessonCode("  <button>Delete Internet</button>");
	   $pdf->AddLessonCode("</body>");
   }
 
    function GenerateAALesson19($pdf) {
       $pdf->AddLessonTitle("Give Links Meaning by Using Descriptive Link Text");
	   $pdf->AddLessonText("Screen reader users have different options for what type of content their device reads. This includes skipping to (or over) landmark elements, jumping to the main content, or getting a page summary from the headings. Another option is to only hear the links available on a page.");
	   $pdf->AddLessonText("Screen readers do this by reading the link text, or what's between the anchor (a) tags. Having a list of 'click here' or 'read more' links isn't helpful. Instead, you should use brief but descriptive text within the a tags to provide more meaning for these users.");
	   $pdf->AddLessonText("The link text that Camper Cat is using is not very descriptive without the surrounding context. Move the anchor (a) tags so they wrap around the text 'information about batteries' instead of 'Click here'.");

	   $pdf->DrawCodeArea(12);
	   $pdf->AddLessonCode("<body>");
	   $pdf->AddLessonCode("  <header>");
	   $pdf->AddLessonCode("    <h1>Deep Thoughts with Master Camper Cat</h1>");
	   $pdf->AddLessonCode("  </header>");
	   $pdf->AddLessonCode("  <article>");
	   $pdf->AddLessonCode("    <h2>Defeating your Foe: the Red Dot is Ours!</h2>");
	   $pdf->AddLessonCode("    <p>Felines the world over have been waging war on the most persistent of foes. This red nemesis combines both cunning stealth and lightning speed. But chin up, fellow fighters, our time for victory may soon be near. Click here for <a href=''>information about batteries</a></p>");
	   $pdf->AddLessonCode("  </article>");
	   $pdf->AddLessonCode("</body>");
	   $pdf->AddLessonCode("");
   }
 
    function GenerateAALesson20($pdf) {
       $pdf->AddLessonTitle("Make Links Navigable with HTML Access Keys");
	   $pdf->AddLessonText("HTML offers the accesskey attribute to specify a shortcut key to activate or bring focus to an element. This can make navigation more efficient for keyboard-only users.");
	   $pdf->AddLessonText("HTML5 allows this attribute to be used on any element, but it's particularly useful when it's used with interactive ones. This includes links, buttons, and form controls.");
	   $pdf->AddLessonText("Here's an example:");

	   $pdf->DrawCodeArea(1);
	   $pdf->AddLessonCode("<button accesskey='b'>Important Button</button>");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Camper Cat wants the links around the two blog article titles to have keyboard shortcuts so his site's users can quickly navigate to the full story. Add an accesskey attribute to both links and set the first one to 'g' (for Garfield) and the second one to 'c' (for Chuck Norris).");

	   $pdf->DrawCodeArea(23);
	   $pdf->AddLessonCode("<body>");
	   $pdf->AddLessonCode("  <header>");
	   $pdf->AddLessonCode("    <h1>Deep Thoughts with Master Camper Cat</h1>");
	   $pdf->AddLessonCode("  </header>");
	   $pdf->AddLessonCode("  <article>");
	   $pdf->AddLessonCode("    <h2><a id='first' href='#' accesskey='g'>The Garfield Files: Lasagna as Training Fuel?</a></h2>");
	   $pdf->AddLessonCode("    <p>The internet is littered with varying opinions on nutritional paradigms, from catnip paleo to hairball cleanses. But let's turn our attention to an often overlooked fitness fuel, and examine the protein-carb-NOM trifecta that is lasagna...</p>");
	   $pdf->AddLessonCode("  </article>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("  <article>");
	   $pdf->AddLessonCode("    <h2><a id='second' href='#'  accesskey='c'>Is Chuck Norris a Cat Person?</a></h2>");
	   $pdf->AddLessonCode("    <p>Chuck Norris is widely regarded as the premier martial artist on the planet, and it's a complete coincidence anyone who disagrees with this fact mysteriously disappears soon after. But the real question is, is he a cat person?...</p>");
	   $pdf->AddLessonCode("  </article>");
	   $pdf->AddLessonCode("  <footer>&copy; 2018 Camper Cat</footer>");
	   $pdf->AddLessonCode("</body>");
   }
 
    function GenerateAALesson21($pdf) {
       $pdf->AddLessonTitle("Use tabindex to Add Keyboard Focus to an Element");
	   $pdf->AddLessonText("The HTML tabindex attribute has three distinct functions relating to an element's keyboard focus. When it's on a tag, it indicates that element can be focused on. The value (an integer that's positive, negative, or zero) determines the behavior.");
	   $pdf->AddLessonText("Certain elements, such as links and form controls, automatically receive keyboard focus when a user tabs through a page. It's in the same order as the elements come in the HTML source markup. This same functionality can be given to other elements, such as div, span, and p, by placing a tabindex='0' attribute on them. Here's an example:");

	   $pdf->DrawCodeArea(1);
	   $pdf->AddLessonCode("<div tabindex='0'>I need keyboard focus!</div>");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Note: A negative tabindex value (typically -1) indicates that an element is focusable, but is not reachable by the keyboard. This method is generally used to bring focus to content programmatically (like when a div used for a pop-up window is activated), and is beyond the scope of these challenges.");
	   $pdf->AddLessonText("Camper Cat created a new survey to collect information about his users. He knows input fields automatically get keyboard focus, but he wants to make sure his keyboard users pause at the instructions while tabbing through the items. Add a tabindex attribute to the p tag and set its value to '0'. Bonus - using tabindex also enables the CSS pseudo-class :focus to work on the p tag.");

	   $pdf->DrawCodeArea(30);
	   $pdf->AddLessonCode("<head>");
	   $pdf->AddLessonCode("  <style>");
	   $pdf->AddLessonCode("  p:focus {");
	   $pdf->AddLessonCode("    background-color: yellow;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  </style>");
	   $pdf->AddLessonCode("</head>");
	   $pdf->AddLessonCode("<body>");
	   $pdf->AddLessonCode("  <header>");
	   $pdf->AddLessonCode("    <h1>Ninja Survey</h1>");
	   $pdf->AddLessonCode("  </header>");
	   $pdf->AddLessonCode("  <section>");
	   $pdf->AddLessonCode("    <form>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("      <p tabindex='0'>Instructions: Fill in ALL your information then click <b>Submit</b></p>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("      <label for='username'>Username:</label>");
	   $pdf->AddLessonCode("      <input type='text' id='username' name='username'><br>");
	   $pdf->AddLessonCode("      <fieldset>");
	   $pdf->AddLessonCode("        <legend>What level ninja are you?</legend>");
	   $pdf->AddLessonCode("        <input id='newbie' type='radio' name='levels' value='newbie'>");
	   $pdf->AddLessonCode("        <label for='newbie'>Newbie Kitten</label><br>");
	   $pdf->AddLessonCode("        <input id='intermediate' type='radio' name='levels' value='intermediate'>");
	   $pdf->AddLessonCode("        <label for='intermediate'>Developing Student</label><br>");
	   $pdf->AddLessonCode("        <input id='master' type='radio' name='levels' value='master'>");
	   $pdf->AddLessonCode("        <label for='master'>9th Life Master</label>");
	   $pdf->AddLessonCode("      </fieldset>");
	   $pdf->AddLessonCode("      <br>");

       $pdf->AddLessonTitle("Use tabindex to Add Keyboard Focus to an Element");
	   $pdf->DrawCodeArea(19);
	   $pdf->AddLessonCode("      <fieldset>");
	   $pdf->AddLessonCode("      <legend>Select your favorite weapons:</legend>");
	   $pdf->AddLessonCode("      <input id='stars' type='checkbox' name='weapons' value='stars'>");
	   $pdf->AddLessonCode("      <label for='stars'>Throwing Stars</label><br>");
	   $pdf->AddLessonCode("      <input id='nunchucks' type='checkbox' name='weapons' value='nunchucks'>");
	   $pdf->AddLessonCode("      <label for='nunchucks'>Nunchucks</label><br>");
	   $pdf->AddLessonCode("      <input id='sai' type='checkbox' name='weapons' value='sai'>");
	   $pdf->AddLessonCode("      <label for='sai'>Sai Set</label><br>");
	   $pdf->AddLessonCode("      <input id='sword' type='checkbox' name='weapons' value='sword'>");
	   $pdf->AddLessonCode("      <label for='sword'>Sword</label>");
	   $pdf->AddLessonCode("      </fieldset>");
	   $pdf->AddLessonCode("      <br>");
	   $pdf->AddLessonCode("      <input type='submit' name='submit' value='Submit'>");
	   $pdf->AddLessonCode("    </form><br>");
	   $pdf->AddLessonCode("  </section>");
	   $pdf->AddLessonCode("  <footer>&copy; 2018 Camper Cat</footer>");
	   $pdf->AddLessonCode("</body>");
   }
 
    function GenerateAALesson22($pdf) {
       $pdf->AddLessonTitle("Use tabindex to Specify the Order of Keyboard Focus for Several Elements");
	   $pdf->AddLessonText("The tabindex attribute also specifies the exact tab order of elements. This is achieved when the value of the attribute is set to a positive number of 1 or higher.");
	   $pdf->AddLessonText("Setting a tabindex='1' will bring keyboard focus to that element first. Then it cycles through the sequence of specified tabindex values (2, 3, etc.), before moving to default and tabindex='0' items.");
	   $pdf->AddLessonText("It's important to note that when the tab order is set this way, it overrides the default order (which uses the HTML source). This may confuse users who are expecting to start navigation from the top of the page. This technique may be necessary in some circumstances, but in terms of accessibility, take care before applying it.");
	   $pdf->AddLessonText("Here's an example:");

	   $pdf->DrawCodeArea(2);
	   $pdf->AddLessonCode("<div tabindex='1'>I get keyboard focus, and I get it first!</div>");
	   $pdf->AddLessonCode("<div tabindex='2'>I get keyboard focus, and I get it second!</div>");

	   $pdf->AddLessonText("");
	   $pdf->AddLessonText("Camper Cat has a search field on his Inspirational Quotes page that he plans to position in the upper right corner with CSS. He wants the search input and submit input form controls to be the first two items in the tab order. Add a tabindex attribute set to '1' to the search input, and a tabindex attribute set to '2' to the submit input.");

	   $pdf->DrawCodeArea(32);
	   $pdf->AddLessonCode("<body>");
	   $pdf->AddLessonCode("  <header>");
	   $pdf->AddLessonCode("    <h1>Even Deeper Thoughts with Master Camper Cat</h1>");
	   $pdf->AddLessonCode("    <nav>");
	   $pdf->AddLessonCode("      <ul>");
	   $pdf->AddLessonCode("        <li><a href=''>Home</a></li>");
	   $pdf->AddLessonCode("        <li><a href=''>Blog</a></li>");
	   $pdf->AddLessonCode("        <li><a href=''>Training</a></li>");
	   $pdf->AddLessonCode("      </ul>");
	   $pdf->AddLessonCode("    </nav>");
	   $pdf->AddLessonCode("  </header>");
	   $pdf->AddLessonCode("  <form>");
	   $pdf->AddLessonCode("    <label for='search'>Search:</label>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("    <input type='search' name='search' id='search'  tabindex='1'>");
	   $pdf->AddLessonCode("    <input type='submit' name='submit' value='Submit' id='submit'  tabindex='2'>");
	   $pdf->AddLessonCode("");
	   $pdf->AddLessonCode("  </form>");
	   $pdf->AddLessonCode("  <h2>Inspirational Quotes</h2>");
	   $pdf->AddLessonCode("  <blockquote>");
	   $pdf->AddLessonCode("    <p>&ldquo;There's no Theory of Evolution, just a list of creatures I've allowed to live.&rdquo;<br>");
	   $pdf->AddLessonCode("    - Chuck Norris</p>");
	   $pdf->AddLessonCode("  </blockquote>");
	   $pdf->AddLessonCode("  <blockquote>");
	   $pdf->AddLessonCode("    <p>&ldquo;Wise men say forgiveness is divine, but never pay full price for late pizza.&rdquo;<br>");
	   $pdf->AddLessonCode("    - TMNT</p>");
	   $pdf->AddLessonCode("  </blockquote>");
	   $pdf->AddLessonCode("  <footer>&copy; 2018 Camper Cat</footer>");
	   $pdf->AddLessonCode("</body>");   
   }
 
 function GenerateAppliedAccessManual($pdf) {
	   $pdf->AddSubject("Introduction to the Applied Accessibility Challenges");
	   GenerateAALesson1($pdf);
	   GenerateAALesson2($pdf);
	   GenerateAALesson3($pdf);
	   GenerateAALesson4($pdf);
	   GenerateAALesson5($pdf);
	   GenerateAALesson6($pdf);
	   GenerateAALesson7($pdf);
	   GenerateAALesson8($pdf);
	   GenerateAALesson9($pdf);
	   GenerateAALesson10($pdf);
	   GenerateAALesson11($pdf);
	   GenerateAALesson12($pdf);
	   GenerateAALesson13($pdf);
	   GenerateAALesson14($pdf);
	   GenerateAALesson15($pdf);
	   GenerateAALesson16($pdf);
	   GenerateAALesson17($pdf);
	   GenerateAALesson18($pdf);
	   GenerateAALesson19($pdf);
	   GenerateAALesson20($pdf);
	   GenerateAALesson21($pdf);
	   GenerateAALesson22($pdf);
   }

?>
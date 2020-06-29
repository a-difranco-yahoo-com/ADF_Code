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
 
 function GenerateAppliedAccessManual($pdf) {
	   $pdf->AddSubject("Introduction to the Applied Accessibility Challenges");
	   GenerateAALesson1($pdf);
	   GenerateAALesson2($pdf);
	   GenerateAALesson3($pdf);
   }

?>
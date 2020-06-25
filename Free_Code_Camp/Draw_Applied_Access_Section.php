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
 
 function GenerateAppliedAccessManual($pdf) {
	   $pdf->AddSubject("Introduction to the Applied Accessibility Challenges");
	   GenerateAALesson1($pdf);
   }

?>
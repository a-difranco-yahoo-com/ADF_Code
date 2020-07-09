<?php

   function GenerateFLLesson1($pdf) {
       $pdf->AddLessonTitle("Use display: flex to Position Two Boxes");
	   $pdf->AddLessonText("This section uses alternating challenge styles to show how to use CSS to position elements in a flexible way. First, a challenge will explain theory, then a practical challenge using a simple tweet component will apply the flexbox concept.");
	   $pdf->AddLessonText("Placing the CSS property display: flex; on an element allows you to use other flex properties to build a responsive page.");
	   $pdf->AddLessonText("Add the CSS property display to #box-container and set its value to flex.");

	   $pdf->DrawCodeArea("20");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  #box-container {");
	   $pdf->AddLessonCode("    height: 500px;");
	   $pdf->AddLessonCode("    display: flex;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  #box-1 {");
	   $pdf->AddLessonCode("    background-color: dodgerblue;");
	   $pdf->AddLessonCode("    width: 50%;");
	   $pdf->AddLessonCode("    height: 50%;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  #box-2 {");
	   $pdf->AddLessonCode("    background-color: orangered;");
	   $pdf->AddLessonCode("    width: 50%;");
	   $pdf->AddLessonCode("    height: 50%;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("<div id='box-container'>");
	   $pdf->AddLessonCode("  <div id='box-1'></div>");
	   $pdf->AddLessonCode("  <div id='box-2'></div>");
	   $pdf->AddLessonCode("</div>");
   }
 
   function GenerateFLLesson2($pdf) {
       $pdf->AddLessonTitle("Add Flex Superpowers to the Tweet Embed");
	   $pdf->AddLessonText("To the right is the tweet embed that will be used as the practical example. Some of the elements would look better with a different layout. The last challenge demonstrated display: flex. Here you'll add it to several components in the tweet embed to start adjusting their positioning.");
	   $pdf->AddLessonText("Add the CSS property display: flex to all of the following items - note that the selectors are already set up in the CSS:");
	   $pdf->AddLessonText("header, the header's .profile-name, the header's .follow-btn, the header's h3 and h4, the footer, and the footer's .stats.");

	   $pdf->DrawCodeArea("48");
	   $pdf->AddLessonCode("<style>");
	   $pdf->AddLessonCode("  body {");
	   $pdf->AddLessonCode("    font-family: Arial, sans-serif;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  header {");
	   $pdf->AddLessonCode("    display: flex;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  header .profile-thumbnail {");
	   $pdf->AddLessonCode("    width: 50px;");
	   $pdf->AddLessonCode("    height: 50px;");
	   $pdf->AddLessonCode("    border-radius: 4px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  header .profile-name {");
	   $pdf->AddLessonCode("    display: flex;");
	   $pdf->AddLessonCode("    margin-left: 10px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  header .follow-btn {");
	   $pdf->AddLessonCode("    display: flex;");
	   $pdf->AddLessonCode("    margin: 0 0 0 auto;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  header .follow-btn button {");
	   $pdf->AddLessonCode("    border: 0;");
	   $pdf->AddLessonCode("    border-radius: 3px;");
	   $pdf->AddLessonCode("    padding: 5px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  header h3, header h4 {");
	   $pdf->AddLessonCode("    display: flex;");
	   $pdf->AddLessonCode("    margin: 0;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  #inner p {");
	   $pdf->AddLessonCode("    margin-bottom: 10px;");
	   $pdf->AddLessonCode("    font-size: 20px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  #inner hr {");
	   $pdf->AddLessonCode("    margin: 20px 0;");
	   $pdf->AddLessonCode("    border-style: solid;");
	   $pdf->AddLessonCode("    opacity: 0.1;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  footer {");
	   $pdf->AddLessonCode("    display: flex;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  footer .stats {");
	   $pdf->AddLessonCode("    display: flex;");
	   $pdf->AddLessonCode("    font-size: 15px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  footer .stats strong {");
	   $pdf->AddLessonCode("    font-size: 18px;");
	   $pdf->AddLessonCode("  }");

       $pdf->AddLessonTitle("Add Flex Superpowers to the Tweet Embed (Cont'd)");
	   $pdf->DrawCodeArea("46");
	   $pdf->AddLessonCode("  footer .stats .likes {");
	   $pdf->AddLessonCode("    margin-left: 10px;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  footer .cta {");
	   $pdf->AddLessonCode("    margin-left: auto;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("  footer .cta button {");
	   $pdf->AddLessonCode("    border: 0;");
	   $pdf->AddLessonCode("    background: transparent;");
	   $pdf->AddLessonCode("  }");
	   $pdf->AddLessonCode("</style>");
	   $pdf->AddLessonCode("<header>");
	   $pdf->AddLessonCode("  <img src='https://freecodecamp.s3.amazonaws.com/quincy-twitter-photo.jpg' alt='Quincy Larson's profile picture' class='profile-thumbnail'>");
	   $pdf->AddLessonCode("  <div class='profile-name'>");
	   $pdf->AddLessonCode("    <h3>Quincy Larson</h3>");
	   $pdf->AddLessonCode("    <h4>@ossia</h4>");
	   $pdf->AddLessonCode("  </div>");
	   $pdf->AddLessonCode("  <div class='follow-btn'>");
	   $pdf->AddLessonCode("    <button>Follow</button>");
	   $pdf->AddLessonCode("  </div>");
	   $pdf->AddLessonCode("</header>");
	   $pdf->AddLessonCode("<div id='inner'>");
	   $pdf->AddLessonCode("  <p>I meet so many people who are in search of that one trick that will help them work smart. Even if you work smart, you still have to work hard.</p>");
	   $pdf->AddLessonCode("  <span class='date'>1:32 PM - 12 Jan 2018</span>");
	   $pdf->AddLessonCode("  <hr>");
	   $pdf->AddLessonCode("</div>");
	   $pdf->AddLessonCode("<footer>");
	   $pdf->AddLessonCode("  <div class='stats'>");
	   $pdf->AddLessonCode("    <div class='Retweets'>");
	   $pdf->AddLessonCode("      <strong>107</strong> Retweets");
	   $pdf->AddLessonCode("    </div>");
	   $pdf->AddLessonCode("    <div class='likes'>");
	   $pdf->AddLessonCode("      <strong>431</strong> Likes");
	   $pdf->AddLessonCode("    </div>");
	   $pdf->AddLessonCode("  </div>");
	   $pdf->AddLessonCode("  <div class='cta'>");
	   $pdf->AddLessonCode("    <button class='share-btn'>Share</button>");
	   $pdf->AddLessonCode("    <button class='retweet-btn'>Retweet</button>");
	   $pdf->AddLessonCode("    <button class='like-btn'>Like</button>");
	   $pdf->AddLessonCode("  </div>");
	   $pdf->AddLessonCode("</footer>");


   }
 


 function GenerateCSSFlexboxManual($pdf) {
	   $pdf->AddSubject("Introduction to the CSS Flexbox Challenges");
	   GenerateFlLesson1($pdf);
	   GenerateFlLesson2($pdf);
   }

?>
<?php

class Runs_Data
{
   public function __construct()
   {
      $this->Display        = 'ViewGaps';
      $this->Action         = '';
      $this->Origin         = '';
      $this->Search         = '';

      $this->ActionId       = "";
      $this->ComicDBTitleId = "";
      $this->DigitalTitleId = "";
      $this->TitleId        = "";
      $this->StartIssue     = "";
      $this->EndIssue       = "";
   }

   public function Set_Data($post)
   {
      if ( isset($post['Display']))       $this->Display       = $post['Display'];
      if ( isset($post['Origin']))        $this->Origin        = $post['Origin'];
      if ( isset($post['Search']))        $this->Search        = $post['Search'];

      if ( isset($post['AddWishList'])) {
         $this->Action  = "AddWishList";
         $this->Display = 'ViewGaps';
         $this->TitleId = $post['AddWishList'];
      }

      if ( isset($post['TitleToDelete'])) {
         $this->Action  = "TitleToDelete";
         $this->Display = "ViewSplits";
         $this->TitleId = $post['TitleToDelete'];
      }

      if ( isset($post['AddSeriesRun'])) {
            $this->Action = "AddSeriesRun";
            $Titles = explode(",", $post['AddSeriesRun']);
            $this->ComicDBTitleId = $Titles[0];
            $this->DigitalTitleId = $Titles[1];
      }

      if ( isset($post['AddCompleteRun'])) {
         $this->Action  = "AddCompleteRun";
         $this->Display = $this->Origin;
         $Details = explode(",", $post['AddCompleteRun']);
         $this->TitleId    = $Details[0];
         $this->StartIssue = $Details[1];
         $this->EndIssue   = $Details[2];
      }
   }
}
?>
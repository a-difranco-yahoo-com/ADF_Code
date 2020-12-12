<?php

class ViewComicDatabase_Data
{
   public function __construct()
   {
      $this->Option         = 'ViewGaps';
      $this->Origin         = '';
      $this->Search         = '';
      $this->AddWishList    = "";
      $this->TitleToDelete  = "";
      $this->AddSeriesRun   = "";
      $this->ComicDBTitleId = "";
      $this->DigitalTitleId = "";
      $this->AddCompleteRun = "";
   }

   public function Set_Data($post)
   {
      if ( isset($post['Option']))        $this->Option        = $post['Option'];
      if ( isset($post['Origin']))        $this->Origin        = $post['Origin'];
      if ( isset($post['Search']))        $this->Search        = $post['Search'];
      if ( isset($post['AddWishList']))   $this->AddWishList   = $post['AddWishList'];
      if ( isset($post['TitleToDelete'])) $this->TitleToDelete = $post['TitleToDelete'];

      if ( isset($post['AddSeriesRun'])) {
            $this->AddSeriesRun =$post['AddSeriesRun'];
            $Titles = explode(",", $this->AddSeriesRun);
            $this->ComicDBTitleId = $Titles[0];
            $this->DigitalTitleId = $Titles[1];
      }

      if ( isset($post['AddCompleteRun'])) {
            $this->AddCompleteRun =$post['AddCompleteRun'];
            $Details = explode(",", $this->AddCompleteRun);
            $this->TitleId    = $Details[0];
            $this->StartIssue = $Details[1];
            $this->EndIssue   = $Details[2];
      }
   }
}
?>
<?php

class CheckArchive_Data
{
   public function __construct()
   {
      $this->Option            = 'ViewSummary';
      $this->SearchTitle       = '';
      $this->SearchStartYear   = 1960;
      $this->SearchEndYear     = 2100;
      $this->TitleToDelete     = "";

      $this->Origin         = '';
      $this->Search         = '';
      $this->AddWishList    = "";
      $this->AddSeriesRun   = "";
      $this->ComicDBTitleId = "";
      $this->DigitalTitleId = "";
   }

   public function Set_Data($post)
   {
      if ( isset($post['Option'])            ) $this->Option            = $post['Option'];
      if ( isset($post['SearchTitle'])       ) $this->SearchTitle       = $post['SearchTitle'];
      if ( isset($post['SearchStartYear'])   ) $this->SearchStartYear   = $post['SearchStartYear'];
      if ( isset($post['SearchEndYear'])     ) $this->SearchEndYear     = $post['SearchEndYear'];
      if ( isset($post['TitleToDelete'])     ) $this->TitleToDelete     = $post['TitleToDelete'];

      if ( isset($post['ViewArchiveDetail']) ) {
         $this->SearchTitle = $post['ViewArchiveDetail'];
         $this->Option      = "ViewDetails";
      }

      if ( isset($post['Origin']))        $this->Origin        = $post['Origin'];
      if ( isset($post['AddWishList']))   $this->AddWishList   = $post['AddWishList'];

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
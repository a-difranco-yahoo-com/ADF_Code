<?php

class NewComic_Data
{
   public function __construct()
   {
      $this->Display       = 'MatchPull';
      $this->Action        = '';
      $this->MatchLevel    = 80;
      $this->MatchId       = "";
   }

   public function Set_Data($post)
   {
      if ( isset($post['Display']))     $this->Display    = $post['Display'];
      if ( isset($post['MatchLevel']))  $this->MatchLevel = $post['MatchLevel'];

      if ( isset($post['MatchToPull'])) {
         $this->Action  = "MatchToPull";
         $this->Display = "MatchPull";
         $this->MatchId = $post['MatchToPull'];
      }

      if ( isset($post['MatchToWish'])) {
         $this->Action  = "MatchToWish";
         $this->Display = "MatchWish";
         $this->MatchId = $post['MatchToWish'];
      }

      if ( isset($post['MatchToExist'])) {
         $this->Action  = "MatchToExist";
         $this->Display = "MatchExist";
         $this->MatchId = $post['MatchToExist'];
      }

      if ( isset($post['NotOnPullList'])) {
         $this->Action  = "NotOnPullList";
         $this->Display = "ViewNew";
         $this->MatchId = $post['NotOnPullList'];
      } 

      if ( isset($post['DigitalPull'])) {
         $this->Action  = "DigitalPull";
         $this->Display = "ViewPull";
         $this->MatchId = $post['DigitalPull'];
      }
   }
}
?>
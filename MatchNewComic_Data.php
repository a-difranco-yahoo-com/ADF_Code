<?php

class MatchNewComic_Data
{
   public function __construct()
   {
      $this->Option        = 'MatchPull';
      $this->MatchLevel    = 80;
      $this->MatchToPull   = "";
      $this->MatchToWish   = "";
      $this->MatchToExist  = "";
      $this->NotOnPullList = "";
      $this->DigitalPull   = "";
   }

   public function Set_MatchNewComic($post)
   {
      if ( isset($post['Option']))             $this->Option             =$post['Option'];
      if ( isset($post['MatchLevel']))         $this->MatchLevel         =$post['MatchLevel'];
      if ( isset($post['MatchToPull']))        $this->MatchToPull        =$post['MatchToPull'];
      if ( isset($post['MatchToWish']))        $this->MatchToWish        =$post['MatchToWish'];
      if ( isset($post['MatchToExist']))       $this->MatchToExist       =$post['MatchToExist'];
      if ( isset($post['NotOnPullList']))      $this->NotOnPullList      =$post['NotOnPullList'];
      if ( isset($post['DigitalPull']))        $this->DigitalPull        =$post['DigitalPull'];
   }
}
?>
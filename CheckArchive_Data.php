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
   }
}
?>
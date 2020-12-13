<?php

class CheckArchive_Data
{
   public function __construct()
   {
      $this->Display = "ViewSummary";
      $this->Action  = "";
      $this->TitleId = "";

      $this->Search             = array();
      $this->Search['Title']    ="";
      $this->Search['StartYear']="1960";
      $this->Search['EndYear']  ="2012";

   }

   public function Set_Data($post)
   {
      if ( isset($post['Display']))         $this->Display            =$post['Display'];
      if ( isset($post['SearchTitle']))     $this->Search["Title"]    =$post['SearchTitle'];
      if ( isset($post['SearchStartYear'])) $this->Search["StartYear"]=$post['SearchStartYear'];
      if ( isset($post['SearchEndYear']))   $this->Search["EndYear"]  =$post['SearchEndYear'];

      if ( isset($post['TitleToDelete']) ) {
         $this->Action  = "TitleToDelete";
         $this->Display = "ViewDetails";
         $this->TitleId = $post['TitleToDelete'];
      }

      if ( isset($post['ViewArchiveDetail']) ) {
         $this->Display         = "ViewDetails";
         $this->Search['Title'] = $post['ViewArchiveDetail'];
      }
   }
}
?>
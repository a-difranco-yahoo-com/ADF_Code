<?php

class MatchComicDB_Data
{
   public function __construct()
   {
      $this->Option         ="";
      $this->Compare        ="";
      $this->DBMatch        ="";
      $this->TradeId        ="";
      $this->SplitIssue     ="";

      $this->Search             = array();
      $this->Search['Title']    ="";
      $this->Search['StartYear']="";
      $this->Search['EndYear']  ="";

      $this->StartIssue     = array();
      $this->EndIssue       = array();
      $this->RowId          = array();
   }

   public function Set_MatchComicDB($post)
   {
      if ( isset($post['Option']))             $this->Option             =$post['Option'];
      if ( isset($post['SearchTitle']))        $this->Search["Title"]    =$post['SearchTitle'];
      if ( isset($post['SearchStartYear']))    $this->Search["StartYear"]=$post['SearchStartYear'];
      if ( isset($post['SearchEndYear']))      $this->Search["EndYear"]  =$post['SearchEndYear'];
      if ( isset($post['ViewComicDBCompare'])) $this->Compare            =$post['ViewComicDBCompare'];
      if ( isset($post['MatchComicDB']))       $this->DBMatch            =$post['MatchComicDB'];
      if ( isset($post['SplitTrade']))         $this->TradeId            =$post['SplitTrade'];
      if ( isset($post['SplitIssue']))         $this->SplitIssue         =$post['SplitIssue'];

      foreach($post as $key => $value)
      {
         if ( substr($key, 0, 10) == "StartIssue")
           $this->StartIssue[intval(substr($key, 10, 2))] = $value;
         if ( substr($key, 0, 8)  == "EndIssue")
           $this->EndIssue[intval(substr($key, 8, 2))] = $value;
         if ( substr($key, 0, 5) == "RowId")
           $this->RowId[intval(substr($key, 5, 2))] = $value;
      }
   }

   public function Get_StartIssue()
   {
      return $this->StartIssue;
   }
   public function Get_EndIssue()
   {
      return $this->EndIssue;
   }

   public function Get_RowId()
   {
      return $this->RowId;
   }

   public function SplitTrade($Connection)
   {
      foreach ($this->RowId as $key => $rowid)
      {
         if ( isset($this->StartIssue[$key]) && isset($this->EndIssue[$key]) )
           if ( $this->StartKey[$key] < $this->EndIssue[$key] )
              $Connection->SplitTrade($rowid, $this->StartIssue[$key], $this->EndIssue[$key]);
      }
   }
}
?>
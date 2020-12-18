<?php

class ComicDB_Data
{
   public function __construct()
   {
      $this->Display        = "ViewSummary";
      $this->Action         = "";
      $this->MatchId        = "";
      $this->TradeId        = "";

      $this->Search             = array();
      $this->Search['Title']    ="";
      $this->Search['StartYear']="1960";
      $this->Search['EndYear']  ="2012";

      $this->StartIssue     = array();
      $this->EndIssue       = array();
      $this->RowId          = array();
   }

   public function Set_Data($post)
   {
      if ( isset($post['Display']))            $this->Display            =$post['Display'];
      if ( isset($post['SearchTitle']))        $this->Search["Title"]    =$post['SearchTitle'];
      if ( isset($post['SearchStartYear']))    $this->Search["StartYear"]=$post['SearchStartYear'];
      if ( isset($post['SearchEndYear']))      $this->Search["EndYear"]  =$post['SearchEndYear'];

      if ( isset($post['ViewComicDBCompare'])) {
         $this->Display         = "CompareComicDB";
         $this->Search["Title"] = $post['ViewComicDBCompare'];
      }

      if ( isset($post['MatchComicDB'])) {
         $this->Action  = "DBMatch";
         $this->Display = 'CompareComicDB';
         $this->MatchId = $post['MatchComicDB'];
      }

      if ( isset($post['SplitTrade'])) {
         $this->Display = "SplitTrade";
         $this->TradeId = $post['SplitTrade'];
      }

      if ( isset($post['SplitIssue'])) {
         $this->Action  = "SplitIssue";
         $this->Display = "CompareComicDB";

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
   }
}
?>
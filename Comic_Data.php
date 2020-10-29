<?php

class Comic_Data
{
   public function __construct()
   {
      $this->Option         ="";
      $this->Commit         ="";
      $this->SearchTitle    ="";
      $this->SearchStartYear="";
      $this->SearchEndYear  ="";
      $this->Compare        ="";
      $this->DBMatch        ="";
      $this->TradeId        ="";
      $this->StartIssue     = array();
      $this->EndIssue       = array();
      $this->RowId          = array();
   }

   public function Set_MatchComicDB($post)
   {
      $this->Option             =$_POST['Option'];
      $this->Search["Title"]    =$_POST['SearchTitle'];
      $this->Search["StartYear"]=$_POST['SearchStartYear'];
      $this->Search["EndYear"]  =$_POST['SearchEndYear'];
      $this->Compare            =$_POST['ViewComicDBCompare'];
      $this->DBMatch            =$_POST['MatchComicDB'];
      $this->TradeId            =$_POST['SplitTrade'];
      $this->SplitIssue         =$_POST['SplitIssue'];

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
}
?>
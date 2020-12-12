<?php

class ReadingOrder_Data
{
   public function __construct()
   {
      $this->Option = 'ViewListHierarchy';
   }

   public function Set_Data($post)
   {
      if ( isset($post['Option']) ) $this->Option = $post['Option'];
   }
}
?>
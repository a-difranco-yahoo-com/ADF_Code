<?php

class ReadingOrder_Data
{
   public function __construct()
   {
      $this->Display = 'ViewListHierarchy';
   }

   public function Set_Data($post)
   {
      if ( isset($post['Display']) ) $this->Display = $post['Display'];
   }
}
?>
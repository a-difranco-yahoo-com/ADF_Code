<?php

class Comic_Data
{
    private $from_date;
    private $to_date;
    private $investor_type;

   public function __construct($from_date, $to_date, $investor_type)
   {
      $this->from_date = $from_date;
      $this->to_date    = $to_date;
      $this->investor_type = $investor_type ? $investor_type : 'Not Set';
    }

   public function Get_From_Date()
   {
	   return $this->from_date;
   }

   public function Get_To_Date()
   {
	   return $this->to_date;
   }

   public function Get_Investor_Type()
   {
	   return $this->investor_type;
   }

   public function Set_Default_Dates()
   {
       $this->from = date('d-m-Y',time()-7*24*3600); //week ago
       $this->to = date('d-m-Y');
   }

}
?>
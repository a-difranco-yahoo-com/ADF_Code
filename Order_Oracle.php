<?php

include 'Comic_Oracle.php';

class Order_Oracle extends Comic_Oracle
{
   public function Get_List_Hierarchy() {
      $SQL = " SELECT First_List, Second_List, Level"
           . " FROM   LIST_HIERARCHY"
           . " CONNECT BY PRIOR Second_List = First_List AND Second_List != First_List"
           . " START WITH First_List = Second_List"
           . " ORDER BY Level";

      return $this->Execute_DB_Select($SQL, array() );
    }

   public function Get_List_Summary() {
      $SQL = " SELECT List, Count(*) Comics, count(Distinct Title) Titles"
           . " FROM   MERGED_READING_ORDER"
           . " GROUP BY List"
           . " ORDER BY Count(*)";

      return $this->Execute_DB_Select($SQL, array() );
    }

   public function Get_List_Title_Summary() {
      $SQL = " SELECT List, Title, min(Issue) Min_Issue, max(Issue) Max_Issue"
           . " FROM   MERGED_READING_ORDER"
           . " GROUP BY List, Title"
           . " ORDER BY List, Title";

      return $this->Execute_DB_Select($SQL, array() );
    }

   public function Get_List_Detail() {
      $SQL = " SELECT List, Sequence_Number, Title, Issue"
           . " FROM   MERGED_READING_ORDER"
           . " ORDER BY List, Sequence_Number";

      return $this->Execute_DB_Select($SQL, array() );
    }

   public function Delete_Title($TitleId) {
      $PLSQL = " BEGIN"
             . "    COMICS.Delete_Title(:TitleId);"
             . " END;";

      $this->Execute_PLSQL_Code($PLSQL, array(":TitleId"=>$TitleId) );
   }

}
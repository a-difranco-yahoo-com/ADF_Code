<?php

class Comic_Oracle
{
   protected $Connection;

   public function __construct($app)
   {
      $this->Connect($app);
   }

   public function Connect($app)
   {
	  if ($app == "COMICS") {
        $this->Connection = oci_connect('Comics', 'Comics', '');
     } else {
        $this->Connection = oci_connect('Carnaby', 'Carnaby', '');
     }
     if (! $this->Connection) {
           echo("ERROR : Connecting to oracle \n");
          exit(1);
      }
   }

 
   public function Get_Contacts($search)
   {
      $SQL = " SELECT * FROM CONTACT "
         . " WHERE (:title      is NULL or lower(TITLE)      like lower(:title))"
         . " AND   (:first_Name is NULL or lower(FIRST_NAME) like lower(:first_Name))"
         . " AND   (:last_name  is NULL or lower(LAST_NAME)  like lower(:last_name)) "
         . " AND   (:address1   is NULL or lower(ADDRESS_1)  like lower(:address1)) "
         . " AND   (:address2   is NULL or lower(ADDRESS_2)  like lower(:address2)) "
         . " AND   (:address3   is NULL or lower(ADDRESS_3)  like lower(:address3)) "
         . " AND   (:address4   is NULL or lower(ADDRESS_4)  like lower(:address4)) "
         . " AND   (:address5   is NULL or lower(ADDRESS_5)  like lower(:address5)) "
         . " AND   (:address6   is NULL or lower(ADDRESS_6)  like lower(:address6)) "
         . " AND   (:country    is NULL or lower(COUNTRY)    like lower(:country)) "
         . " AND   (:postcode   is NULL or lower(POSTCODE)   like lower(:postcode)) "
         . " AND   (:email      is NULL or lower(E_MAIL)     like lower(:email))    "
         . " AND    rownum <= 500";

      $stmt = ociparse($this->Connection, $SQL);
      ocibindbyname($stmt,  ":title",      $search['TITLE'],      40);
      ocibindbyname($stmt, ":first_Name",  $search['FIRST_NAME'], 40);
      ocibindbyname($stmt, ":last_name",   $search['LAST_NAME'],  40);
      ocibindbyname($stmt, ":address1",    $search['ADDRESS_1'],  40);
      ocibindbyname($stmt, ":address2",    $search['ADDRESS_2'],  40);
      ocibindbyname($stmt, ":address3",    $search['ADDRESS_3'],  40);
      ocibindbyname($stmt, ":address4",    $search['ADDRESS_4'],  40);
      ocibindbyname($stmt, ":address5",    $search['ADDRESS_5'],  40);
      ocibindbyname($stmt, ":address6",    $search['ADDRESS_6'],  40);
      ocibindbyname($stmt, ":country",     $search['COUNTRY'],    8);
      ocibindbyname($stmt, ":postcode",    $search['POSTCODE'],   40);
      ocibindbyname($stmt, ":email",       $search['E_MAIL'],     80);

      ociexecute($stmt);   
      $rows = oci_fetch_all($stmt, $results, 0, -1, OCI_FETCHSTATEMENT_BY_ROW + OCI_RETURN_NULLS + OCI_ASSOC);
      oci_free_statement($stmt);
   
      return $results;
   }

   public function RecordSearch($title, $rows)
   {
       $SQL = "INSERT INTO SEARCH_CONTACT (Search_Date, Rows_Returned, Title) "
            . " VALUES (sysdate, $rows, '" . $title . "')";
       $stmt = oci_parse($this->Connection, "$SQL");
       oci_execute($stmt, OCI_NO_AUTO_COMMIT);

       oci_commit($this->Connection);
       oci_free_statement($stmt);
   }

   public function Get_Sub_Menus($Menu_Id)
   {
       $SQL = "SELECT * FROM SUBMENU WHERE Menu_Id = '$Menu_Id'";
       $stmt = oci_parse($this->Connection, "$SQL");
       oci_execute($stmt, OCI_DEFAULT);

       $rows = oci_fetch_all($stmt, $results, 0, -1, OCI_FETCHSTATEMENT_BY_ROW + OCI_RETURN_NULLS + OCI_ASSOC);
       oci_free_statement($stmt);
       return $results;
   }
}
?>
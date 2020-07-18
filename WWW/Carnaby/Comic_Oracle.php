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

   public function Get_Contacts(
       $title,    $first_Name, $last_name,
       $address1, $address2,   $address3,  $address4,  $address5,  $address6,
       $country,  $postcode,   $email )
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
      ocibindbyname($stmt,   ":title",      $title,      40);
       ocibindbyname($stmt, ":first_Name",  $first_Name, 40);
       ocibindbyname($stmt, ":last_name",   $last_name,  40);
       ocibindbyname($stmt, ":address1",    $address1,   40);
       ocibindbyname($stmt, ":address2",    $address2,   40);
       ocibindbyname($stmt, ":address3",    $address3,   40);
       ocibindbyname($stmt, ":address4",    $address4,   40);
       ocibindbyname($stmt, ":address5",    $address5,   40);
       ocibindbyname($stmt, ":address6",    $address6,   40);
       ocibindbyname($stmt, ":country",     $country,    8);
       ocibindbyname($stmt, ":postcode",    $postcode,   40);
       ocibindbyname($stmt, ":email",       $email,      80);

     ociexecute($stmt);   
     $rows = oci_fetch_all($stmt, $results, 0, -1, OCI_FETCHSTATEMENT_BY_ROW + OCI_RETURN_NULLS + OCI_ASSOC);
     oci_free_statement($stmt);
   
      $this->RecordSearch($title, $rows);
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
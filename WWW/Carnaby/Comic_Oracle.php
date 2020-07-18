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

   public function Get_Investors($data) {
   	$SQL = " SELECT C.Title, C.First_Name, C.Last_Name, C.Address_1, C.Country, C.Postcode, C.Item_Code "
	    	  . " FROM   CONTACT      C "
           . " WHERE  C.Site_Source  = '" . $data->Get_Investor_Type() . "' "
	        . " AND    trunc(C.Date_Requested) BETWEEN "
	        . "        trunc( to_date('" . $data->Get_From_Date() . "', 'DD-MM-YY') ) "
	        . "    AND trunc( to_date('" . $data->Get_To_Date()   . "', 'DD-MM-YY') ) ";

      $stmt = ociparse($this->Connection, $SQL);
	   oci_execute($stmt);
	   oci_fetch_all($stmt, $rows, 0, 500, OCI_FETCHSTATEMENT_BY_ROW + OCI_RETURN_NULLS + OCI_NUM);
	   return $rows;
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

   public function Update_Contact($post)
   {
      $SQL = "UPDATE CONTACT "
           . "SET   TITLE                   = '" . $post['TITLE']             . "', "
           . "      FIRST_NAME              = '" . $post['FIRST_NAME']        . "', "
           . "      LAST_NAME               = '" . $post['LAST_NAME']         . "', "
           . "      ADDRESS_1               = '" . $post['ADDRESS_1']         . "', "
           . "      ADDRESS_2               = '" . $post['ADDRESS_2']         . "', "
           . "      ADDRESS_3               = '" . $post['ADDRESS_3']         . "', "
           . "      ADDRESS_4               = '" . $post['ADDRESS_4']         . "', "
           . "      ADDRESS_5               = '" . $post['ADDRESS_5']         . "', "
           . "      ADDRESS_6               = '" . $post['ADDRESS_6']         . "', "
           . "      COUNTRY                 = '" . $post['COUNTRY']           . "', "
           . "      POSTCODE                = '" . $post['POSTCODE']          . "', "
           . "      E_MAIL                  = '" . $post['E_MAIL']            . "', "
           . "      TELEPHONE_DAYTIME       = '" . $post['TELEPHONE_DAYTIME'] . "', "
           . "      TELEPHONE_EVENING       = '" . $post['TELEPHONE_EVENING'] . "', "
           . "      TELEPHONE_MOBILE        = '" . $post['TELEPHONE_MOBILE']  . "', "
           . "      STATUS                  = '" . $post['STATUS']            . "', "
           . "      PREF_COMEDY             = '" . $post['PREF_COMEDY']       . "', "
           . "      PREF_DRAMA              = '" . $post['PREF_DRAMA']        . "', "
           . "      PREF_HORROR             = '" . $post['PREF_HORROR']       . "', "
           . "      PREF_ROMANCE            = '" . $post['PREF_ROMANCE']      . "', "
           . "      PREF_SCIFI              = '" . $post['PREF_SCIFI']        . "', "
           . "      PREF_THRILLER           = '" . $post['PREF_THRILLER']     . "' "
           . "WHERE PERSON_ID               = " . $post['id'];

      $stmt = oci_parse($this->Connection, "$SQL");
      oci_execute($stmt, OCI_NO_AUTO_COMMIT);

      oci_commit($this->Connection);
      oci_free_statement($stmt);
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
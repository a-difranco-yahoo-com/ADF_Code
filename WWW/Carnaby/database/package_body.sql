set define off
--

CREATE OR REPLACE PACKAGE BODY WebForm is
--
--#############################################################################
--#
--#			Public Procedures 
--#
--#############################################################################
--
--*****************************************************************************
--*
--*			ContactSearch
--*
--*	Searches for carnaby contacts and returns 
--* 	first 500 records in cursor
--*
--*****************************************************************************

procedure ContactSearch
(
  spTITLE                  in varchar2,
  spFIRST_NAME             in varchar2,
  spLAST_NAME              in varchar2,
  spADDRESS_1              in varchar2,
  spADDRESS_2              in varchar2,
  spADDRESS_3              in varchar2,
  spADDRESS_4              in varchar2,
  spADDRESS_5              in varchar2,
  spADDRESS_6              in varchar2,
  spCOUNTRY                in varchar2,
  spPOSTCODE               in varchar2,
  spE_MAIL                 in varchar2,
  spRESULT                 out OutCursor)
as
begin
  open spRESULT for
    select *
    from contact
    where (spTITLE      is NULL or lower(TITLE)      like lower(spTITLE))
      and (spFIRST_NAME is NULL or lower(FIRST_NAME) like lower(spFIRST_NAME))
      and (spLAST_NAME  is NULL or lower(LAST_NAME)  like lower(spLAST_NAME))
      and (spADDRESS_1  is NULL or lower(ADDRESS_1)  like lower(spADDRESS_1))
      and (spADDRESS_2  is NULL or lower(ADDRESS_2)  like lower(spADDRESS_2))
      and (spADDRESS_3  is NULL or lower(ADDRESS_3)  like lower(spADDRESS_3))
      and (spADDRESS_4  is NULL or lower(ADDRESS_4)  like lower(spADDRESS_4))
      and (spADDRESS_5  is NULL or lower(ADDRESS_5)  like lower(spADDRESS_5))
      and (spADDRESS_6  is NULL or lower(ADDRESS_6)  like lower(spADDRESS_6))
      and (spCOUNTRY    is NULL or lower(COUNTRY)    like lower(spCOUNTRY))
      and (spPOSTCODE   is NULL or lower(POSTCODE)   like lower(spPOSTCODE))
      and (spE_MAIL     is NULL or lower(E_MAIL)     like lower(spE_MAIL))
      and rownum <= 500;
exception
  when others then
    if spRESULT%ISOPEN then
      close spRESULT;
    end if;
    raise;
end ContactSearch;

--
--*****************************************************************************
--*
--*			ContactUpdate
--*
--*	Updates CONTACT table storing history in CONTACT_History table
--* 	
--*
--*****************************************************************************

procedure ContactUpdate
(
  spPERSON_ID                in varchar2,
  spTITLE                    in varchar2,
  spFIRST_NAME               in varchar2,
  spLAST_NAME                in varchar2,
  spADDRESS_1                in varchar2,
  spADDRESS_2                in varchar2,
  spADDRESS_3                in varchar2,
  spADDRESS_4                in varchar2,
  spADDRESS_5                in varchar2,
  spADDRESS_6                in varchar2,
  spCOUNTRY                  in varchar2,
  spPOSTCODE                 in varchar2,
  spE_MAIL                   in varchar2,
  spTELEPHONE_DAYTIME        in varchar2,
  spTELEPHONE_EVENING        in varchar2,
  spTELEPHONE_MOBILE         in varchar2,
  spSTATUS                   in varchar2,
  spPREF_COMEDY              in varchar2,
  spPREF_DRAMA               in varchar2,
  spPREF_HORROR              in varchar2,
  spPREF_ROMANCE             in varchar2,
  spPREF_SCIFI               in varchar2,
  spPREF_THRILLER            in varchar2
)
as
begin

  update CONTACT
  set
     TITLE                   = spTITLE,
     FIRST_NAME              = spFIRST_NAME,
     LAST_NAME               = spLAST_NAME,
     ADDRESS_1               = spADDRESS_1,
     ADDRESS_2               = spADDRESS_2,
     ADDRESS_3               = spADDRESS_3,
     ADDRESS_4               = spADDRESS_4,
     ADDRESS_5               = spADDRESS_5,
     ADDRESS_6               = spADDRESS_6,
     COUNTRY                 = spCOUNTRY,
     POSTCODE                = spPOSTCODE,
     E_MAIL                  = spE_MAIL,
     TELEPHONE_DAYTIME       = spTELEPHONE_DAYTIME,
     TELEPHONE_EVENING       = spTELEPHONE_EVENING,
     TELEPHONE_MOBILE        = spTELEPHONE_MOBILE,
     STATUS                  = spSTATUS,
     PREF_COMEDY             = spPREF_COMEDY,
     PREF_DRAMA              = spPREF_DRAMA,
     PREF_HORROR             = spPREF_HORROR,
     PREF_ROMANCE            = spPREF_ROMANCE,
     PREF_SCIFI              = spPREF_SCIFI,
     PREF_THRILLER           = spPREF_THRILLER
  where PERSON_ID = spPERSON_ID;

  commit;
exception
  when others then
    rollback;
    raise;
end ContactUpdate;

end WebForm;
/
show errors

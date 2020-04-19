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
  spOTHER_NAME             in varchar2,
  spLAST_NAME              in varchar2,
  spSUFFIX                 in varchar2,
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
      and (spOTHER_NAME is NULL or lower(OTHER_NAME) like lower(spOTHER_NAME))
      and (spLAST_NAME  is NULL or lower(LAST_NAME)  like lower(spLAST_NAME))
      and (spSUFFIX     is NULL or lower(SUFFIX)     like lower(spSUFFIX))
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
  spOTHER_NAME               in varchar2,
  spLAST_NAME                in varchar2,
  spSUFFIX                   in varchar2,
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
  spDO_NOT_MAIL              in varchar2,
  spDO_NOT_TELEPHONE         in varchar2,
  spDO_NOT_EMAIL             in varchar2,
  spSALES_STATUS             in varchar2,
  spCREATED_BY               in varchar2,
  spCREATED_VARCHAR          in varchar2,
  spLAST_CHANGED_VARCHAR     in varchar2,
  spLAST_CHANGED_BY          in varchar2,
  spGEODEMOGRAPHIC_CATEGORY  in varchar2,
  spSEGMENTATION_CATEGORY    in varchar2,
  spAGE_BAND                 in varchar2,
  spMID_IDENTIFIER           in varchar2,
  spGM_ACCOUNTNO             in varchar2,
  spSALESMAN                 in varchar2,
  spPREF_COMEDY              in varchar2,
  spPREF_DRAMA               in varchar2,
  spPREF_HORROR              in varchar2,
  spPREF_ROMANCE             in varchar2,
  spPREF_SCIFI               in varchar2,
  spPREF_THRILLER            in varchar2,
  spPREF_OTHER               in varchar2,
  spFROM_KAHOONA             in varchar2
)
as
  spCREATED                     date;
  spLAST_CHANGED                date;
begin
  spCREATED      := TO_DATE(spCREATED_VARCHAR,      'DD-MON-YYYY');
  spLAST_CHANGED := TO_DATE(spLAST_CHANGED_VARCHAR, 'DD-MON-YYYY');

  update CONTACT
  set
     TITLE                   = spTITLE,
     FIRST_NAME              = spFIRST_NAME,
     OTHER_NAME              = spOTHER_NAME,
     LAST_NAME               = spLAST_NAME,
     SUFFIX                  = spSUFFIX,
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
     DO_NOT_MAIL             = spDO_NOT_MAIL,
     DO_NOT_TELEPHONE        = spDO_NOT_TELEPHONE,
     DO_NOT_EMAIL            = spDO_NOT_EMAIL,
     SALES_STATUS            = spSALES_STATUS,
     CREATED_BY              = spCREATED_BY,
     CREATED                 = spCREATED,
     LAST_CHANGED            = spLAST_CHANGED,
     LAST_CHANGED_BY         = spLAST_CHANGED_BY,
     GEODEMOGRAPHIC_CATEGORY = spGEODEMOGRAPHIC_CATEGORY,
     SEGMENTATION_CATEGORY   = spSEGMENTATION_CATEGORY,
     AGE_BAND                = spAGE_BAND,
     MID_IDENTIFIER          = spMID_IDENTIFIER,
     GM_ACCOUNTNO            = spGM_ACCOUNTNO,
     SALESMAN                = spSALESMAN,
     PREF_COMEDY             = spPREF_COMEDY,
     PREF_DRAMA              = spPREF_DRAMA,
     PREF_HORROR             = spPREF_HORROR,
     PREF_ROMANCE            = spPREF_ROMANCE,
     PREF_SCIFI              = spPREF_SCIFI,
     PREF_THRILLER           = spPREF_THRILLER,
     PREF_OTHER              = spPREF_OTHER,
     FROM_KAHOONA            = spFROM_KAHOONA
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

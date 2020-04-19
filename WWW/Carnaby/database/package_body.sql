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
  oldPERSON_ID                  CONTACT.PERSON_ID%type;
  oldTITLE                      CONTACT.TITLE%type;
  oldFIRST_NAME                 CONTACT.FIRST_NAME%type;
  oldOTHER_NAME                 CONTACT.OTHER_NAME%type;
  oldLAST_NAME                  CONTACT.LAST_NAME%type;
  oldSUFFIX                     CONTACT.SUFFIX%type;
  oldADDRESS_1                  CONTACT.ADDRESS_1%type;
  oldADDRESS_2                  CONTACT.ADDRESS_2%type;
  oldADDRESS_3                  CONTACT.ADDRESS_3%type;
  oldADDRESS_4                  CONTACT.ADDRESS_4%type;
  oldADDRESS_5                  CONTACT.ADDRESS_5%type;
  oldADDRESS_6                  CONTACT.ADDRESS_6%type;
  oldCOUNTRY                    CONTACT.COUNTRY%type;
  oldPOSTCODE                   CONTACT.POSTCODE%type;
  oldE_MAIL                     CONTACT.E_MAIL%type;
  oldTELEPHONE_DAYTIME          CONTACT.TELEPHONE_DAYTIME%type;
  oldTELEPHONE_EVENING          CONTACT.TELEPHONE_EVENING%type;
  oldTELEPHONE_MOBILE           CONTACT.TELEPHONE_MOBILE%type;
  oldSTATUS                     CONTACT.STATUS%type;
  oldDO_NOT_MAIL                CONTACT.DO_NOT_MAIL%type;
  oldDO_NOT_TELEPHONE           CONTACT.DO_NOT_TELEPHONE%type;
  oldDO_NOT_EMAIL               CONTACT.DO_NOT_EMAIL%type;
  oldSALES_STATUS               CONTACT.SALES_STATUS%type;
  oldCREATED_BY                 CONTACT.CREATED_BY%type;
  oldCREATED                    CONTACT.CREATED%type;
  oldLAST_CHANGED               CONTACT.LAST_CHANGED%type;
  oldLAST_CHANGED_BY            CONTACT.LAST_CHANGED_BY%type;
  oldGEODEMOGRAPHIC_CATEGORY    CONTACT.GEODEMOGRAPHIC_CATEGORY%type;
  oldSEGMENTATION_CATEGORY      CONTACT.SEGMENTATION_CATEGORY%type;
  oldAGE_BAND                   CONTACT.AGE_BAND%type;
  oldMID_IDENTIFIER             CONTACT.MID_IDENTIFIER%type;
  oldGM_ACCOUNTNO               CONTACT.GM_ACCOUNTNO%type;
  oldSALESMAN                   CONTACT.SALESMAN%type;
  oldPREF_COMEDY                CONTACT.PREF_COMEDY%type;
  oldPREF_DRAMA                 CONTACT.PREF_DRAMA%type;
  oldPREF_HORROR                CONTACT.PREF_HORROR%type;
  oldPREF_ROMANCE               CONTACT.PREF_ROMANCE%type;
  oldPREF_SCIFI                 CONTACT.PREF_SCIFI%type;
  oldPREF_THRILLER              CONTACT.PREF_THRILLER%type;
  oldPREF_OTHER                 CONTACT.PREF_OTHER%type;
  oldFROM_KAHOONA               CONTACT.FROM_KAHOONA%type;
  spCREATED                     date;
  spLAST_CHANGED                date;
begin
  spCREATED      := TO_DATE(spCREATED_VARCHAR,     'DD-MON-YYYY');
  spLAST_CHANGED := TO_DATE(spLAST_CHANGED_VARCHAR, 'DD-MON-YYYY');
  select
    PERSON_ID,
    TITLE,
    FIRST_NAME,
    OTHER_NAME,
    LAST_NAME,
    SUFFIX,
    ADDRESS_1,
    ADDRESS_2,
    ADDRESS_3,
    ADDRESS_4,
    ADDRESS_5,
    ADDRESS_6,
    COUNTRY,
    POSTCODE,
    E_MAIL,
    TELEPHONE_DAYTIME,
    TELEPHONE_EVENING,
    TELEPHONE_MOBILE,
    STATUS,
    DO_NOT_MAIL,
    DO_NOT_TELEPHONE,
    DO_NOT_EMAIL,
    SALES_STATUS,
    CREATED_BY,
    CREATED,
    LAST_CHANGED,
    LAST_CHANGED_BY,
    GEODEMOGRAPHIC_CATEGORY,
    SEGMENTATION_CATEGORY,
    AGE_BAND,
    MID_IDENTIFIER,
    GM_ACCOUNTNO,
    SALESMAN,
    PREF_COMEDY,
    PREF_DRAMA,
    PREF_HORROR,
    PREF_ROMANCE,
    PREF_SCIFI,
    PREF_THRILLER,
    PREF_OTHER,
    FROM_KAHOONA
  into
    oldPERSON_ID,
    oldTITLE,
    oldFIRST_NAME,
    oldOTHER_NAME,
    oldLAST_NAME,
    oldSUFFIX,
    oldADDRESS_1,
    oldADDRESS_2,
    oldADDRESS_3,
    oldADDRESS_4,
    oldADDRESS_5,
    oldADDRESS_6,
    oldCOUNTRY,
    oldPOSTCODE,
    oldE_MAIL,
    oldTELEPHONE_DAYTIME,
    oldTELEPHONE_EVENING,
    oldTELEPHONE_MOBILE,
    oldSTATUS,
    oldDO_NOT_MAIL,
    oldDO_NOT_TELEPHONE,
    oldDO_NOT_EMAIL,
    oldSALES_STATUS,
    oldCREATED_BY,
    oldCREATED,
    oldLAST_CHANGED,
    oldLAST_CHANGED_BY,
    oldGEODEMOGRAPHIC_CATEGORY,
    oldSEGMENTATION_CATEGORY,
    oldAGE_BAND,
    oldMID_IDENTIFIER,
    oldGM_ACCOUNTNO,
    oldSALESMAN,
    oldPREF_COMEDY,
    oldPREF_DRAMA,
    oldPREF_HORROR,
    oldPREF_ROMANCE,
    oldPREF_SCIFI,
    oldPREF_THRILLER,
    oldPREF_OTHER,
    oldFROM_KAHOONA
  from CONTACT
  where PERSON_ID = spPERSON_ID;

  IF (
   NVL(spPERSON_ID,'N/A') <> NVL(oldPERSON_ID,'N/A') OR
   NVL(spTITLE,'N/A') <> NVL(oldTITLE,'N/A') OR
   NVL(spFIRST_NAME,'N/A') <> NVL(oldFIRST_NAME,'N/A') OR
   NVL(spOTHER_NAME,'N/A') <> NVL(oldOTHER_NAME,'N/A') OR
   NVL(spLAST_NAME,'N/A') <> NVL(oldLAST_NAME,'N/A') OR
   NVL(spSUFFIX,'N/A') <> NVL(oldSUFFIX,'N/A') OR
   NVL(spADDRESS_1,'N/A') <> NVL(oldADDRESS_1,'N/A') OR
   NVL(spADDRESS_2,'N/A') <> NVL(oldADDRESS_2,'N/A') OR
   NVL(spADDRESS_3,'N/A') <> NVL(oldADDRESS_3,'N/A') OR
   NVL(spADDRESS_4,'N/A') <> NVL(oldADDRESS_4,'N/A') OR
   NVL(spADDRESS_5,'N/A') <> NVL(oldADDRESS_5,'N/A') OR
   NVL(spADDRESS_6,'N/A') <> NVL(oldADDRESS_6,'N/A') OR
   NVL(spCOUNTRY,'N/A') <> NVL(oldCOUNTRY,'N/A') OR
   NVL(spPOSTCODE,'N/A') <> NVL(oldPOSTCODE,'N/A') OR
   NVL(spE_MAIL,'N/A') <> NVL(oldE_MAIL,'N/A') OR
   NVL(spTELEPHONE_DAYTIME,'N/A') <> NVL(oldTELEPHONE_DAYTIME,'N/A') OR
   NVL(spTELEPHONE_EVENING,'N/A') <> NVL(oldTELEPHONE_EVENING,'N/A') OR
   NVL(spTELEPHONE_MOBILE,'N/A') <> NVL(oldTELEPHONE_MOBILE,'N/A') OR
   NVL(spSTATUS,'N/A') <> NVL(oldSTATUS,'N/A') OR
   NVL(spDO_NOT_MAIL,'N/A') <> NVL(oldDO_NOT_MAIL,'N/A') OR
   NVL(spDO_NOT_TELEPHONE,'N/A') <> NVL(oldDO_NOT_TELEPHONE,'N/A') OR
   NVL(spDO_NOT_EMAIL,'N/A') <> NVL(oldDO_NOT_EMAIL,'N/A') OR
   NVL(spSALES_STATUS,'N/A') <> NVL(oldSALES_STATUS,'N/A') OR
   NVL(spCREATED_BY,'N/A') <> NVL(oldCREATED_BY,'N/A') OR
   NVL(spCREATED,TO_DATE('01-JAN-0001','DD-MON-YYYY')) <> NVL(oldCREATED,TO_DATE('01-JAN-0001','DD-MON-YYYY')) OR
   NVL(spLAST_CHANGED,TO_DATE('01-JAN-0001','DD-MON-YYYY')) <> NVL(oldLAST_CHANGED,TO_DATE('01-JAN-0001','DD-MON-YYYY')) OR
   NVL(spLAST_CHANGED_BY,'N/A') <> NVL(oldLAST_CHANGED_BY,'N/A') OR
   NVL(spGEODEMOGRAPHIC_CATEGORY,'N/A') <> NVL(oldGEODEMOGRAPHIC_CATEGORY,'N/A') OR
   NVL(spSEGMENTATION_CATEGORY,'N/A') <> NVL(oldSEGMENTATION_CATEGORY,'N/A') OR
   NVL(spAGE_BAND,'N/A') <> NVL(oldAGE_BAND,'N/A') OR
   NVL(spMID_IDENTIFIER,'N/A') <> NVL(oldMID_IDENTIFIER,'N/A') OR
   NVL(spGM_ACCOUNTNO,'N/A') <> NVL(oldGM_ACCOUNTNO,'N/A') OR
   NVL(spSALESMAN,'N/A') <> NVL(oldSALESMAN,'N/A') OR
   NVL(spPREF_COMEDY,'N/A') <> NVL(oldPREF_COMEDY,'N/A') OR
   NVL(spPREF_DRAMA,'N/A') <> NVL(oldPREF_DRAMA,'N/A') OR
   NVL(spPREF_HORROR,'N/A') <> NVL(oldPREF_HORROR,'N/A') OR
   NVL(spPREF_ROMANCE,'N/A') <> NVL(oldPREF_ROMANCE,'N/A') OR
   NVL(spPREF_SCIFI,'N/A') <> NVL(oldPREF_SCIFI,'N/A') OR
   NVL(spPREF_THRILLER,'N/A') <> NVL(oldPREF_THRILLER,'N/A') OR
   NVL(spPREF_OTHER,'N/A') <> NVL(oldPREF_OTHER,'N/A') OR
   NVL(spFROM_KAHOONA,'N/A') <> NVL(oldFROM_KAHOONA,'N/A')
  ) then  
  INSERT INTO CONTACT_History (
    PERSON_ID,
    old_TITLE, new_TITLE,
    old_FIRST_NAME, new_FIRST_NAME,
    old_OTHER_NAME, new_OTHER_NAME,
    old_LAST_NAME, new_LAST_NAME,
    old_SUFFIX, new_SUFFIX,
    old_ADDRESS_1, new_ADDRESS_1,
    old_ADDRESS_2, new_ADDRESS_2,
    old_ADDRESS_3, new_ADDRESS_3,
    old_ADDRESS_4, new_ADDRESS_4,
    old_ADDRESS_5, new_ADDRESS_5,
    old_ADDRESS_6, new_ADDRESS_6,
    old_COUNTRY, new_COUNTRY,
    old_POSTCODE, new_POSTCODE,
    old_E_MAIL, new_E_MAIL,
    old_TELEPHONE_DAYTIME, new_TELEPHONE_DAYTIME,
    old_TELEPHONE_EVENING, new_TELEPHONE_EVENING,
    old_TELEPHONE_MOBILE, new_TELEPHONE_MOBILE,
    old_STATUS, new_STATUS,
    old_DO_NOT_MAIL, new_DO_NOT_MAIL,
    old_DO_NOT_TELEPHONE, new_DO_NOT_TELEPHONE,
    old_DO_NOT_EMAIL, new_DO_NOT_EMAIL,
    old_SALES_STATUS, new_SALES_STATUS,
    old_CREATED_BY, new_CREATED_BY,
    old_CREATED, new_CREATED,
    old_LAST_CHANGED, new_LAST_CHANGED,
    old_LAST_CHANGED_BY, new_LAST_CHANGED_BY,
    old_GEODEMOGRAPHIC_CATEGORY, new_GEODEMOGRAPHIC_CATEGORY,
    old_SEGMENTATION_CATEGORY, new_SEGMENTATION_CATEGORY,
    old_AGE_BAND, new_AGE_BAND,
    old_MID_IDENTIFIER, new_MID_IDENTIFIER,
    old_GM_ACCOUNTNO, new_GM_ACCOUNTNO,
    old_SALESMAN, new_SALESMAN,
    old_PREF_COMEDY, new_PREF_COMEDY,
    old_PREF_DRAMA, new_PREF_DRAMA,
    old_PREF_HORROR, new_PREF_HORROR,
    old_PREF_ROMANCE, new_PREF_ROMANCE,
    old_PREF_SCIFI, new_PREF_SCIFI,
    old_PREF_THRILLER, new_PREF_THRILLER,
    old_PREF_OTHER, new_PREF_OTHER,
    old_FROM_KAHOONA, new_FROM_KAHOONA
  )
  VALUES (
    spPERSON_ID,
    decode(NVL(oldTITLE,'N/A'), NVL(spTITLE,'N/A'), NULL, oldTITLE),


     decode(NVL(oldTITLE,'N/A'), NVL(spTITLE,'N/A'), NULL, spTITLE),
    decode(NVL(oldFIRST_NAME,'N/A'), NVL(spFIRST_NAME,'N/A'), NULL, oldFIRST_NAME),
     decode(NVL(oldFIRST_NAME,'N/A'), NVL(spFIRST_NAME,'N/A'), NULL, spFIRST_NAME),
    decode(NVL(oldOTHER_NAME,'N/A'), NVL(spOTHER_NAME,'N/A'), NULL, oldOTHER_NAME),
     decode(NVL(oldOTHER_NAME,'N/A'), NVL(spOTHER_NAME,'N/A'), NULL, spOTHER_NAME),
    decode(NVL(oldLAST_NAME,'N/A'), NVL(spLAST_NAME,'N/A'), NULL, oldLAST_NAME),
     decode(NVL(oldLAST_NAME,'N/A'), NVL(spLAST_NAME,'N/A'), NULL, spLAST_NAME),
    decode(NVL(oldSUFFIX,'N/A'), NVL(spSUFFIX,'N/A'), NULL, oldSUFFIX),
     decode(NVL(oldSUFFIX,'N/A'), NVL(spSUFFIX,'N/A'), NULL, spSUFFIX),
    decode(NVL(oldADDRESS_1,'N/A'), NVL(spADDRESS_1,'N/A'), NULL, oldADDRESS_1),
     decode(NVL(oldADDRESS_1,'N/A'), NVL(spADDRESS_1,'N/A'), NULL, spADDRESS_1),
    decode(NVL(oldADDRESS_2,'N/A'), NVL(spADDRESS_2,'N/A'), NULL, oldADDRESS_2),
     decode(NVL(oldADDRESS_2,'N/A'), NVL(spADDRESS_2,'N/A'), NULL, spADDRESS_2),
    decode(NVL(oldADDRESS_3,'N/A'), NVL(spADDRESS_3,'N/A'), NULL, oldADDRESS_3),
     decode(NVL(oldADDRESS_3,'N/A'), NVL(spADDRESS_3,'N/A'), NULL, spADDRESS_3),
    decode(NVL(oldADDRESS_4,'N/A'), NVL(spADDRESS_4,'N/A'), NULL, oldADDRESS_4),
     decode(NVL(oldADDRESS_4,'N/A'), NVL(spADDRESS_4,'N/A'), NULL, spADDRESS_4),
    decode(NVL(oldADDRESS_5,'N/A'), NVL(spADDRESS_5,'N/A'), NULL, oldADDRESS_5),
     decode(NVL(oldADDRESS_5,'N/A'), NVL(spADDRESS_5,'N/A'), NULL, spADDRESS_5),
    decode(NVL(oldADDRESS_6,'N/A'), NVL(spADDRESS_6,'N/A'), NULL, oldADDRESS_6),
     decode(NVL(oldADDRESS_6,'N/A'), NVL(spADDRESS_6,'N/A'), NULL, spADDRESS_6),
    decode(NVL(oldCOUNTRY,'N/A'), NVL(spCOUNTRY,'N/A'), NULL, oldCOUNTRY),
     decode(NVL(oldCOUNTRY,'N/A'), NVL(spCOUNTRY,'N/A'), NULL, spCOUNTRY),
    decode(NVL(oldPOSTCODE,'N/A'), NVL(spPOSTCODE,'N/A'), NULL, oldPOSTCODE),
     decode(NVL(oldPOSTCODE,'N/A'), NVL(spPOSTCODE,'N/A'), NULL, spPOSTCODE),
    decode(NVL(oldE_MAIL,'N/A'), NVL(spE_MAIL,'N/A'), NULL, oldE_MAIL),
     decode(NVL(oldE_MAIL,'N/A'), NVL(spE_MAIL,'N/A'), NULL, spE_MAIL),
    decode(NVL(oldTELEPHONE_DAYTIME,'N/A'), NVL(spTELEPHONE_DAYTIME,'N/A'), NULL, oldTELEPHONE_DAYTIME),
     decode(NVL(oldTELEPHONE_DAYTIME,'N/A'), NVL(spTELEPHONE_DAYTIME,'N/A'), NULL, spTELEPHONE_DAYTIME),
    decode(NVL(oldTELEPHONE_EVENING,'N/A'), NVL(spTELEPHONE_EVENING,'N/A'), NULL, oldTELEPHONE_EVENING),
     decode(NVL(oldTELEPHONE_EVENING,'N/A'), NVL(spTELEPHONE_EVENING,'N/A'), NULL, spTELEPHONE_EVENING),
    decode(NVL(oldTELEPHONE_MOBILE,'N/A'), NVL(spTELEPHONE_MOBILE,'N/A'), NULL, oldTELEPHONE_MOBILE),
     decode(NVL(oldTELEPHONE_MOBILE,'N/A'), NVL(spTELEPHONE_MOBILE,'N/A'), NULL, spTELEPHONE_MOBILE),
    decode(NVL(oldSTATUS,'N/A'), NVL(spSTATUS,'N/A'), NULL, oldSTATUS),
     decode(NVL(oldSTATUS,'N/A'), NVL(spSTATUS,'N/A'), NULL, spSTATUS),
    decode(NVL(oldDO_NOT_MAIL,'N/A'), NVL(spDO_NOT_MAIL,'N/A'), NULL, oldDO_NOT_MAIL),
     decode(NVL(oldDO_NOT_MAIL,'N/A'), NVL(spDO_NOT_MAIL,'N/A'), NULL, spDO_NOT_MAIL),
    decode(NVL(oldDO_NOT_TELEPHONE,'N/A'), NVL(spDO_NOT_TELEPHONE,'N/A'), NULL, oldDO_NOT_TELEPHONE),
     decode(NVL(oldDO_NOT_TELEPHONE,'N/A'), NVL(spDO_NOT_TELEPHONE,'N/A'), NULL, spDO_NOT_TELEPHONE),
    decode(NVL(oldDO_NOT_EMAIL,'N/A'), NVL(spDO_NOT_EMAIL,'N/A'), NULL, oldDO_NOT_EMAIL),
     decode(NVL(oldDO_NOT_EMAIL,'N/A'), NVL(spDO_NOT_EMAIL,'N/A'), NULL, spDO_NOT_EMAIL),
    decode(NVL(oldSALES_STATUS,'N/A'), NVL(spSALES_STATUS,'N/A'), NULL, oldSALES_STATUS),
     decode(NVL(oldSALES_STATUS,'N/A'), NVL(spSALES_STATUS,'N/A'), NULL, spSALES_STATUS),
    decode(NVL(oldCREATED_BY,'N/A'), NVL(spCREATED_BY,'N/A'), NULL, oldCREATED_BY),
     decode(NVL(oldCREATED_BY,'N/A'), NVL(spCREATED_BY,'N/A'), NULL, spCREATED_BY),
    decode(NVL(TO_CHAR(oldCREATED,'DD-MON-YYYY'),'N/A'), NVL(TO_CHAR(spCREATED,'DD-MON-YYYY'),'N/A'), NULL, oldCREATED),
     decode(NVL(TO_CHAR(oldCREATED,'DD-MON-YYYY'),'N/A'), NVL(TO_CHAR(spCREATED,'DD-MON-YYYY'),'N/A'), NULL, spCREATED),
    decode(NVL(TO_CHAR(oldLAST_CHANGED,'DD-MON-YYYY'),'N/A'), NVL(TO_CHAR(spLAST_CHANGED,'DD-MON-YYYY'),'N/A'), NULL, oldLAST_CHANGED),
     decode(NVL(TO_CHAR(oldLAST_CHANGED,'DD-MON-YYYY'),'N/A'), NVL(TO_CHAR(spLAST_CHANGED,'DD-MON-YYYY'),'N/A'), NULL, spLAST_CHANGED),
    decode(NVL(oldLAST_CHANGED_BY,'N/A'), NVL(spLAST_CHANGED_BY,'N/A'), NULL, oldLAST_CHANGED_BY),
     decode(NVL(oldLAST_CHANGED_BY,'N/A'), NVL(spLAST_CHANGED_BY,'N/A'), NULL, spLAST_CHANGED_BY),
    decode(NVL(oldGEODEMOGRAPHIC_CATEGORY,'N/A'), NVL(spGEODEMOGRAPHIC_CATEGORY,'N/A'), NULL, oldGEODEMOGRAPHIC_CATEGORY),
     decode(NVL(oldGEODEMOGRAPHIC_CATEGORY,'N/A'), NVL(spGEODEMOGRAPHIC_CATEGORY,'N/A'), NULL, spGEODEMOGRAPHIC_CATEGORY),
    decode(NVL(oldSEGMENTATION_CATEGORY,'N/A'), NVL(spSEGMENTATION_CATEGORY,'N/A'), NULL, oldSEGMENTATION_CATEGORY),
     decode(NVL(oldSEGMENTATION_CATEGORY,'N/A'), NVL(spSEGMENTATION_CATEGORY,'N/A'), NULL, spSEGMENTATION_CATEGORY),
    decode(NVL(oldAGE_BAND,'N/A'), NVL(spAGE_BAND,'N/A'), NULL, oldAGE_BAND),
     decode(NVL(oldAGE_BAND,'N/A'), NVL(spAGE_BAND,'N/A'), NULL, spAGE_BAND),
    decode(NVL(oldMID_IDENTIFIER,'N/A'), NVL(spMID_IDENTIFIER,'N/A'), NULL, oldMID_IDENTIFIER),
     decode(NVL(oldMID_IDENTIFIER,'N/A'), NVL(spMID_IDENTIFIER,'N/A'), NULL, spMID_IDENTIFIER),
    decode(NVL(oldGM_ACCOUNTNO,'N/A'), NVL(spGM_ACCOUNTNO,'N/A'), NULL, oldGM_ACCOUNTNO),
     decode(NVL(oldGM_ACCOUNTNO,'N/A'), NVL(spGM_ACCOUNTNO,'N/A'), NULL, spGM_ACCOUNTNO),
    decode(NVL(oldSALESMAN,'N/A'), NVL(spSALESMAN,'N/A'), NULL, oldSALESMAN),
     decode(NVL(oldSALESMAN,'N/A'), NVL(spSALESMAN,'N/A'), NULL, spSALESMAN),
    decode(NVL(oldPREF_COMEDY,'N/A'), NVL(spPREF_COMEDY,'N/A'), NULL, oldPREF_COMEDY),
     decode(NVL(oldPREF_COMEDY,'N/A'), NVL(spPREF_COMEDY,'N/A'), NULL, spPREF_COMEDY),
    decode(NVL(oldPREF_DRAMA,'N/A'), NVL(spPREF_DRAMA,'N/A'), NULL, oldPREF_DRAMA),
     decode(NVL(oldPREF_DRAMA,'N/A'), NVL(spPREF_DRAMA,'N/A'), NULL, spPREF_DRAMA),
    decode(NVL(oldPREF_HORROR,'N/A'), NVL(spPREF_HORROR,'N/A'), NULL, oldPREF_HORROR),
     decode(NVL(oldPREF_HORROR,'N/A'), NVL(spPREF_HORROR,'N/A'), NULL, spPREF_HORROR),
    decode(NVL(oldPREF_ROMANCE,'N/A'), NVL(spPREF_ROMANCE,'N/A'), NULL, oldPREF_ROMANCE),
     decode(NVL(oldPREF_ROMANCE,'N/A'), NVL(spPREF_ROMANCE,'N/A'), NULL, spPREF_ROMANCE),
    decode(NVL(oldPREF_SCIFI,'N/A'), NVL(spPREF_SCIFI,'N/A'), NULL, oldPREF_SCIFI),
     decode(NVL(oldPREF_SCIFI,'N/A'), NVL(spPREF_SCIFI,'N/A'), NULL, spPREF_SCIFI),
    decode(NVL(oldPREF_THRILLER,'N/A'), NVL(spPREF_THRILLER,'N/A'), NULL, oldPREF_THRILLER),
     decode(NVL(oldPREF_THRILLER,'N/A'), NVL(spPREF_THRILLER,'N/A'), NULL, spPREF_THRILLER),
    decode(NVL(oldPREF_OTHER,'N/A'), NVL(spPREF_OTHER,'N/A'), NULL, oldPREF_OTHER),
     decode(NVL(oldPREF_OTHER,'N/A'), NVL(spPREF_OTHER,'N/A'), NULL, spPREF_OTHER),
    decode(NVL(oldFROM_KAHOONA,'N/A'), NVL(spFROM_KAHOONA,'N/A'), NULL, oldFROM_KAHOONA),
     decode(NVL(oldFROM_KAHOONA,'N/A'), NVL(spFROM_KAHOONA,'N/A'), NULL, spFROM_KAHOONA)
  );
  end if;

  --now only update contact table
  update CONTACT
  set
     TITLE = spTITLE,
     FIRST_NAME = spFIRST_NAME,
     OTHER_NAME = spOTHER_NAME,
     LAST_NAME = spLAST_NAME,
     SUFFIX = spSUFFIX,
     ADDRESS_1 = spADDRESS_1,
     ADDRESS_2 = spADDRESS_2,
     ADDRESS_3 = spADDRESS_3,
     ADDRESS_4 = spADDRESS_4,
     ADDRESS_5 = spADDRESS_5,
     ADDRESS_6 = spADDRESS_6,
     COUNTRY = spCOUNTRY,
     POSTCODE = spPOSTCODE,
     E_MAIL = spE_MAIL,
     TELEPHONE_DAYTIME = spTELEPHONE_DAYTIME,
     TELEPHONE_EVENING = spTELEPHONE_EVENING,
     TELEPHONE_MOBILE = spTELEPHONE_MOBILE,
     STATUS = spSTATUS,
     DO_NOT_MAIL = spDO_NOT_MAIL,
     DO_NOT_TELEPHONE = spDO_NOT_TELEPHONE,
     DO_NOT_EMAIL = spDO_NOT_EMAIL,
     SALES_STATUS = spSALES_STATUS,
     CREATED_BY = spCREATED_BY,
     CREATED = spCREATED,
     LAST_CHANGED = spLAST_CHANGED,
     LAST_CHANGED_BY = spLAST_CHANGED_BY,
     GEODEMOGRAPHIC_CATEGORY = spGEODEMOGRAPHIC_CATEGORY,
     SEGMENTATION_CATEGORY = spSEGMENTATION_CATEGORY,
     AGE_BAND = spAGE_BAND,
     MID_IDENTIFIER = spMID_IDENTIFIER,
     GM_ACCOUNTNO = spGM_ACCOUNTNO,
     SALESMAN = spSALESMAN,
     PREF_COMEDY = spPREF_COMEDY,
     PREF_DRAMA = spPREF_DRAMA,
     PREF_HORROR = spPREF_HORROR,
     PREF_ROMANCE = spPREF_ROMANCE,
     PREF_SCIFI = spPREF_SCIFI,
     PREF_THRILLER = spPREF_THRILLER,
     PREF_OTHER = spPREF_OTHER,
     FROM_KAHOONA = spFROM_KAHOONA
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

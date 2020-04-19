set define off
--

CREATE OR REPLACE PACKAGE WebForm is
--
--
--#############################################################################
--#
--#				Public Procedures 
--#
--#############################################################################
--
type OutCursor is ref cursor;
--
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
  spRESULT                  out OutCursor
);
--
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
);
--
END WebForm;
/
show errors

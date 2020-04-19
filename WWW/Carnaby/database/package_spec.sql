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
  spRESULT                  out OutCursor
);
--
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
);
--
END WebForm;
/
show errors

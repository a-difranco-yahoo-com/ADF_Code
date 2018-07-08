
CREATE OR REPLACE PACKAGE QUAGMIRE_SETUP
AS 
  Procedure Setup_Cipher(p_Cipher_Id VARCHAR2);
  Procedure Assign_Word(p_Word_Id  NUMBER, p_Word VARCHAR2);
END QUAGMIRE_SETUP;
/

CREATE OR REPLACE PACKAGE BODY QUAGMIRE_SETUP 
AS
  PKG_ALPHABET     Varchar2(26) := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  PKG_CIPHER_TEXT  Varchar2(2000);
  PKG_PERIOD       Number;
--
   Procedure Setup_Cipher_Details(p_Cipher_Id VARCHAR2)
   AS
   BEGIN
      IF    p_Cipher_Id = 'Trib' Then
         PKG_CIPHER_TEXT := 'uhtkx rxy robch nhxuswb tnk eqj it zfu arkkl huirolwm az zfu aibkl sioxjgdutky ydx furjeq tnk pypex jmmhszxcqg utzgb soa mcj no znc myix gr jbe wayway lrscy cgifu ao juud nhk ljkge gz rxy luccin pgxr ez tnk dbomk oq fcpk zm jbe xoexn az gpeonj ifumt nkgwbt ju len gu ol jbiy hsj wotzgdoe gxmkhd utc xonjxct gezxci xoctqjlegs ydx yua uyfl xkysb a vrysy wozf rurxkb ejetolwm ot zfu felz cyahze kunrky yvnex zfu fayz mfynote jbexk gi u otk kunrk jgqgezkp fcpk ul jbe xoexn szkn kj itzm jbaz glt ao kgqj urualt zilzw cytxkq ji a vrysy wnkpu soa iyd mtgtb kj tnkl iiuzn yriuz kgwbte scjley zm qhoznch mtgtbyhg av nbuck cfule eus mclr lgdx tnk aqwhk';
         PKG_PERIOD      := 6;
      ELSIF p_Cipher_Id = 'Mama' Then
         PKG_CIPHER_TEXT := 'uhtkx rxy robch ut znc wcvkt aeirjolqney od jbe mgru ink nsdxrkj kunrky qeotn ud xyrk oq khluiiux oznchqiyk cdnex zfu libkp jbruaex nhk myf cn znc wlekt pqclotei ucxuqi nhk xmqx fxuk jbe ruaayd mgru unj ncqx duclinrkgk vilruu jbe xotul pgyqyhg atbul tnk zhcdmkq khtor weo rkgax nhk ykqfl ckgh qhkxc jbe wayway lrscy cgifu cs ruaqnej mm tiwt zfu qeox yi nhk hmjnos ud jbe zaldyl zu rxy romfj if znc myix oq qloatb sbeyz fucgnz ee cnzu rxy tatluf atj ahuwr zm jbe igaxy iz oq yh tnk rxcrj vjqwe cnchy yua aqh szglt op cngsb axk tuly tkyhfy znc iumk jginatic qjaxz g siutzct no zcm xonjxct enkkji vezccuh egif ffaik g miurj puwosscdx ktkc fudy mjepey glt u svgpu noxif jbe igaxy ngsc ym bgyct in utc ez me lyliuxopu zrgti pupvg qehgy cfywh oy gd nhxkc civkscdns gtb ym rkryjcvkrw binm';
         PKG_PERIOD      := 6;
      END If;
   END;

   Procedure Setup_Quagmire_Period
   AS
   BEGIN
      INSERT INTO QUAGMIRE_PERIOD (PERIOD_LENGTH) VALUES (PKG_PERIOD);
   END;

   Procedure Setup_Quagmire_Words
   AS
      Loc_Cipher_Text Varchar2(2000) := PKG_CIPHER_TEXT;
      Loc_Word        Varchar2(200);
      Loc_Word_Id     Number := 1;
      Loc_Word_Pos    Number := 1;
      Loc_Pos         Number := 1;
   BEGIN
      Loc_Pos := instr(Loc_Cipher_Text, ' ');
      While Loc_Pos > 0
      Loop
         INSERT INTO QUAGMIRE_WORD (WORD_ID, WORD, WORD_LENGTH, WORD_POSITION)
         VALUES (Loc_Word_Id, substr(Loc_Cipher_Text, 1, Loc_Pos - 1), Loc_Pos - 1, Loc_Word_Pos);
      
         Loc_Cipher_Text := substr(Loc_Cipher_Text, Loc_Pos + 1);
         Loc_Word_Id     := Loc_Word_Id  + 1;
         Loc_Word_Pos    := Loc_Word_Pos + Loc_Pos - 1;
         Loc_Pos         := instr(Loc_Cipher_Text, ' ');
      End Loop;

      INSERT INTO QUAGMIRE_WORD (WORD_ID, WORD, WORD_LENGTH, WORD_POSITION)
      VALUES (Loc_Word_Id, Loc_Cipher_Text, length(Loc_Cipher_Text), Loc_Word_Pos);
   END;

   Procedure Setup_Quagmire_Letters
   AS
   BEGIN
      FOR WORD_REC IN (SELECT * FROM QUAGMIRE_WORD)
      Loop
         FOR i IN 1..WORD_REC.Word_Length
         Loop
            INSERT INTO QUAGMIRE_LETTER (WORD_ID, LETTER_POSITION, OFFSET, LETTER)
            Values (WORD_REC.Word_Id, i, mod(WORD_REC.Word_Position + i - 1, PKG_PERIOD), substr(WORD_REC.Word, i, 1) );
         End Loop;
      End Loop;
   END;

   Procedure Setup_Quagmire_Dictionary
   AS
   BEGIN
      INSERT INTO QUAGMIRE_DICTIONARY (Dictionary_Id, Word, Word_Length)
      SELECT Rownum, Word, length(Word)
      FROM   DICTIONARY.Word_List
      WHERE  length(Word) IN (SELECT Word_Length FROM QUAGMIRE_WORD)
      AND    translate(Word, 'xABCDEFGHIJKLMNOPQRSTUVWXYZ', 'x') IS NULL;
   EXCEPTION
      WHEN OTHERS THEN
         RAISE_APPLICATION_ERROR(-20101, 'ERROR: IN Setup_Quagmire_Dictionary : ' || sqlerrm);
   END;

   Procedure Setup_Quagmire_Dictionary_Word
   AS
   BEGIN
      INSERT INTO QUAGMIRE_DICTIONARY_WORD (Dictionary_Id, Word_Id, Valid)
      SELECT D.Dictionary_Id, W.Word_Id, 'Y'
      FROM   QUAGMIRE_DICTIONARY D
        JOIN QUAGMIRE_WORD       W ON W.Word_Length = D.Word_Length;
   END;

   Procedure Remove_Matching_Offsets
   AS
   BEGIN
      FOR DEL_REC IN (SELECT  L1.Word_Id, L1.Letter_Position Letter_Position1, L2.Letter_Position Letter_Position2
                       FROM   QUAGMIRE_LETTER L1
                         JOIN QUAGMIRE_LETTER L2 ON L2.Word_Id         = L1.Word_Id
                                                AND L2.Offset          = L1.Offset
                                                AND L2.Letter          = L1.Letter
                                                AND L2.Letter_Position > L1.Letter_Position)
      LOOP
         DELETE FROM QUAGMIRE_DICTIONARY_WORD DW
         WHERE   DW.Word_Id = DEL_REC.Word_Id
         AND EXISTS (SELECT 1
                     FROM   QUAGMIRE_DICTIONARY D
                     WHERE  D.Dictionary_Id = DW.Dictionary_Id
                     AND    substr(D.Word, DEL_REC.Letter_Position1, 1) !=
                            substr(D.Word, DEL_REC.Letter_Position2, 1) );
      END LOOP;
   END;

   Procedure Remove_MisMatching_Offsets
   AS
   BEGIN
      FOR DEL_REC IN (SELECT  L1.Word_Id, L1.Letter_Position Letter_Position1, L2.Letter_Position Letter_Position2
                       FROM   QUAGMIRE_LETTER L1
                         JOIN QUAGMIRE_LETTER L2 ON L2.Word_Id         = L1.Word_Id
                                                AND L2.Offset          = L1.Offset
                                                AND L2.Letter         != L1.Letter
                                                AND L2.Letter_Position > L1.Letter_Position)
      LOOP
         DELETE FROM QUAGMIRE_DICTIONARY_WORD DW
         WHERE   DW.Word_Id = DEL_REC.Word_Id
         AND EXISTS (SELECT 1
                     FROM   QUAGMIRE_DICTIONARY D
                     WHERE  D.Dictionary_Id = DW.Dictionary_Id
                     AND    substr(D.Word, DEL_REC.Letter_Position1, 1) =
                            substr(D.Word, DEL_REC.Letter_Position2, 1) );
      END LOOP;
   END;

/*   =========================================================
     DICTIONARY_WORD Procedures
     ========================================================= */
     Procedure Assign_Word(p_Word_Id  NUMBER, p_Word VARCHAR2)
     AS
        Loc_Dictionary_Id  NUMBER;
     BEGIN
         SELECT Dictionary_Id
         INTO   Loc_Dictionary_Id
         FROM   QUAGMIRE_DICTIONARY
         WHERE  Word = p_Word;

         UPDATE QUAGMIRE_DICTIONARY_WORD
         SET    Valid          = 'N'
         WHERE  Valid          = 'Y'
         AND    Word_Id        = p_Word_Id
         AND    Dictionary_Id != Loc_Dictionary_Id;        
     END;
     
  Procedure Reset_Cipher
   AS
   BEGIN
      Execute Immediate 'TRUNCATE TABLE QUAGMIRE_PERIOD';
      Execute Immediate 'TRUNCATE TABLE QUAGMIRE_WORD';
      Execute Immediate 'TRUNCATE TABLE QUAGMIRE_LETTER';
      Execute Immediate 'TRUNCATE TABLE QUAGMIRE_SOLUTION';
      Execute Immediate 'TRUNCATE TABLE QUAGMIRE_DIAGRAPH';
      Execute Immediate 'TRUNCATE TABLE QUAGMIRE_DICTIONARY';
      Execute Immediate 'TRUNCATE TABLE QUAGMIRE_DICTIONARY_WORD';
      Execute Immediate 'TRUNCATE TABLE QUAGMIRE_DIAGNOSTIC_RUN';
      Execute Immediate 'TRUNCATE TABLE QUAGMIRE_DIAGNOSTIC_MISMATCH';
   END;

   Procedure Setup_Cipher(p_Cipher_Id VARCHAR2)
   AS
   BEGIN
      Reset_Cipher;
      Setup_Cipher_Details(p_Cipher_Id);
      Setup_Quagmire_Period;
      Setup_Quagmire_Words;
      Setup_Quagmire_Letters;
      Setup_Quagmire_Dictionary;
      Setup_Quagmire_Dictionary_Word;
      Remove_Matching_Offsets;
      Remove_MisMatching_Offsets;
   END;

END QUAGMIRE_SETUP;
/


CREATE OR REPLACE PACKAGE SOLVE_QUAGMIRE
AS
--
   PKG_ALPHABET VARCHAR2(26) := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
   PROCEDURE  Solve_Quagmire(p_Plain_Key VARCHAR2, p_Cipher_Key VARCHAR2,  p_Indicator_Key VARCHAR2,   p_Indicator_Letter VARCHAR2, p_Text VARCHAR2);
END;
/

CREATE OR REPLACE PACKAGE BODY SOLVE_QUAGMIRE
AS
--
   FUNCTION  Scramble_Alphabet(p_Key VARCHAR2)
      RETURN VARCHAR2
   AS
      Loc_Src_Aplhabet  VARCHAR2(26) := PKG_ALPHABET;
      Loc_Tgt_Aplhabet  VARCHAR2(26) := '';
      Loc_Char          VARCHAR2(1);
   BEGIN
      FOR i in 1..length(p_Key)
      LOOP
         Loc_Char := substr(p_Key, i, 1);
         IF instr(Loc_Src_Aplhabet, Loc_Char) > 0
         THEN
            Loc_Src_Aplhabet  := translate(Loc_Src_Aplhabet, Loc_Char, '');
            Loc_Tgt_Aplhabet  := Loc_Tgt_Aplhabet || Loc_Char;            
         END IF;
      END LOOP;
      
      RETURN Loc_Tgt_Aplhabet || Loc_Src_Aplhabet;
   END;
--
   PROCEDURE  Set_Cipher_Alphabets(p_Cipher_Alphabet VARCHAR2, p_Plain_Alphabet VARCHAR2,  p_Indicator_Key VARCHAR2,   p_Indicator_Letter VARCHAR2)
   AS
      Loc_Ind_Pos         NUMBER;
      Loc_Key_Pos         NUMBER;
      Loc_Char            VARCHAR2(1);
      Loc_Cipher_Alphabet VARCHAR2(26);
   BEGIN
      Loc_Ind_Pos := instr(p_Plain_Alphabet, p_Indicator_Letter);
      FOR i in 1..length(p_Indicator_Key)
      LOOP
         Loc_Char := substr(p_Indicator_Key, i, 1);
         Loc_Key_Pos := instr(p_Cipher_Alphabet, Loc_Char);
         Loc_Key_Pos := mod(27 + Loc_Key_Pos - Loc_Ind_Pos, 26);

         Loc_Cipher_Alphabet  := substr(p_Cipher_Alphabet, Loc_Key_Pos) || substr(p_Cipher_Alphabet, 1, Loc_Key_Pos - 1);
      END LOOP;
   END;
--
   PROCEDURE  Solve_Quagmire(p_Plain_Key VARCHAR2, p_Cipher_Key VARCHAR2,  p_Indicator_Key VARCHAR2,   p_Indicator_Letter VARCHAR2, p_Text VARCHAR2)
   AS
      Loc_Plain_Text  VARCHAR2(26);
      Loc_Cipher_Text VARCHAR2(26);
   BEGIN
      Loc_Plain_Text  := Scramble_Alphabet(p_Plain_Key);
      Loc_Cipher_Text := Scramble_Alphabet(p_Cipher_Key);
      Set_Cipher_Alphabets(Loc_Cipher_Text, Loc_Plain_Text, p_Indicator_Key, p_Indicator_Letter);
      Decrypt_Text(p_Text, Loc_Plain_Text, length(p_Indicator_Key) );
   END;
END;
/


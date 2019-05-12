
-- N (A+K+P)° (N-M)(F-E+H).((AxM)+F) W 000° (H-L).((DxG)-J)
-- N 51° 31.885 W 000° 07.455 
-- Ove Nyquist Arup
SELECT 'N ' || (A+K+P) || ' ' || (N-M) || (F-E+H) || '.' || ((A * M) + F) North,
       'W 000 ' || (H-L) || '.' || ((D*G) - J) West
FROM (
WITH ALPHABET AS (SELECT 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' Alphabet FROM DUAL)
SELECT
        instr(Alphabet, 'O') A,
        instr(Alphabet, 'V') B,
        instr(Alphabet, 'E') C,
--
        instr(Alphabet, 'N') D,
        instr(Alphabet, 'Y') E,
        instr(Alphabet, 'Q') F,
        instr(Alphabet, 'U') G,
        instr(Alphabet, 'I') H,
        instr(Alphabet, 'S') J,
        instr(Alphabet, 'T') K,
--
        instr(Alphabet, 'A') L,
        instr(Alphabet, 'R') M,
        instr(Alphabet, 'U') N,
        instr(Alphabet, 'P') P
FROM    ALPHABET
)
/



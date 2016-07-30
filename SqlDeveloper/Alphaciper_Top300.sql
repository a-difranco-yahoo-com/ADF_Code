

the letters of the word JUMBLE DECREASE in value from left to right
ZERO 73 TEN      15 ONE   35 HUNDREDS 95
TWO  30 THOUSAND 93 PI    29 MILLION  76
FIVE 55 BILLION  72 EIGHT 41 CLOCK    80
NINE 15


ABLE  38   ACID  23   ACRID 24   ADMIT  45
ADO   16   AGREE 37   AHEAD 43   AISLE  45
ALE   30   ANIL  48   ANKLE 66   ANTLER 52
ANVIL 66   APPLE 72   AQUA  36   AREA   12
ARENA 24   ARROW 27   AURA  27   AWAY   41
AWE   24   AWFUL 78   AXLE  44   AZALEA 49

Drop Table ComicsTop300 Purge;
Create Table ComicsTop300 (
YearMonth    Varchar2(200),
Rank         Varchar2(200),
EstIndex     Varchar2(200),
Title        Varchar2(200),
Price        Varchar2(200),
Pub          Varchar2(200),
EstQty       Varchar2(200)
);

SELECT yearmonth, Count(*) FROM ComicsTop300 group by yearmonth Order By Count(*);

SELECT Rank,   Count(*) FROM comicstop300 GROUP BY Rank;
SELECT Price,  Count(*) FROM comicstop300 GROUP BY Price;
SELECT EstQty, Count(*) FROM comicstop300 GROUP BY EstQty;





CREATE Table  Alpha_nos
AS
SELECT Rownum Nos
FROm   all_objects
WHERE  rownum < 27
/

DROP Table  AlphaCipher purge;
CREATE Table  AlphaCipher (
A NUMBER,
B NUMBER,
C NUMBER,
D NUMBER,
E NUMBER,
F NUMBER,
G NUMBER,
H NUMBER,
I NUMBER,
J NUMBER,
K NUMBER,
L NUMBER,
M NUMBER,
N NUMBER,
O NUMBER,
P NUMBER,
Q NUMBER,
R NUMBER,
S NUMBER,
T NUMBER,
U NUMBER,
V NUMBER,
W NUMBER,
X NUMBER,
Y NUMBER,
Z NUMBER)
/

-- 198120 / 7,893,600
SELECT A.Nos + B.Nos + C.Nos + (2 * D.Nos) + E.Nos, Count(*)
FROM   Alpha_Nos A
  JOIN Alpha_Nos B ON b.nos != A.Nos
  JOIN Alpha_Nos C ON C.nos Not In (A.Nos, B.Nos)
  JOIN Alpha_Nos D ON D.nos Not In (A.Nos, B.Nos, C.Nos)
  JOIN Alpha_Nos E ON E.nos Not In (A.Nos, B.Nos, C.Nos, D.Nos)
WHERE A.Nos + B.Nos + C.Nos + (2 * D.Nos) + E.Nos = 50
GROUP By A.Nos + B.Nos + C.Nos + (2 * D.Nos) + E.Nos
Order By 2 Desc
/

DROP TABLE ALPHACIPHER_CLUE Purge;
CREATE TABLE ALPHACIPHER_CLUE (
CLUE_WORD          Varchar2(20),
CLUE_TOTAL         Number,
UNRESOLVED_LETTERS Varchar2(20),
CLUE_RESOLVED      Varchar2(1),
AVERAGE_VALUE      Number
)
/

INSERT INTO ALPHACIPHER_CLUE (CLUE_WORD, CLUE_TOTAL)
      SELECT 'ANGELOU',  45 FROM DUAL
UNION SELECT 'ATWOOD',   55 FROM DUAL
UNION SELECT 'BALZAC',   59 FROM DUAL
UNION SELECT 'BRAINE',   47 FROM DUAL
UNION SELECT 'CONRAD',   59 FROM DUAL
UNION SELECT 'EVELYN',   63 FROM DUAL
UNION SELECT 'FORESTER', 58 FROM DUAL
UNION SELECT 'GASKELL',  47 FROM DUAL
UNION SELECT 'GOGOL',    41 FROM DUAL
UNION SELECT 'HAMSUN',   53 FROM DUAL
UNION SELECT 'HELLER',   35 FROM DUAL
UNION SELECT 'JEROME',   53 FROM DUAL
UNION SELECT 'KAFKA',    74 FROM DUAL
UNION SELECT 'LESSING',  45 FROM DUAL
UNION SELECT 'NESBIT',   45 FROM DUAL
UNION SELECT 'PARKER',   58 FROM DUAL
UNION SELECT 'POTTER',   47 FROM DUAL
UNION SELECT 'PROUST',   42 FROM DUAL
UNION SELECT 'QUENEAU',  56 FROM DUAL
UNION SELECT 'RANSOME',  45 FROM DUAL
UNION SELECT 'RENAULT',  40 FROM DUAL
UNION SELECT 'SALINGER', 55 FROM DUAL
UNION SELECT 'SHUTE',    37 FROM DUAL
UNION SELECT 'SYMONS',   50 FROM DUAL
UNION SELECT 'WALTON',   49 FROM DUAL
/

DECLARE
   AlphaBet Varchar2(26) := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
   Letter   Varchar2(1);
BEGIN
   UPDATE  ALPHACIPHER_CLUE
   SET     Unresolved_Letters = '',
           CLUE_RESOLVED      = 'N',
           AVERAGE_VALUE      = Clue_Total / length(Clue_Word);

   For i in 1..26
   Loop
      Letter := substr(AlphaBet, i, 1);
      
      UPDATE  ALPHACIPHER_CLUE
      SET     Unresolved_Letters = Unresolved_Letters || Letter
      WHERE   Clue_Word Like '%' || Letter || '%';
   End Loop;    
END;
/


DECLARE
   SolvedWord Varchar2(26) := 'HAMSUN';
   Letter   Varchar2(1);
BEGIN
   UPDATE ALPHACIPHER_CLUE
   SET    CLUE_RESOLVED = 'Y'
   WHERE  CLUE_Word     = SolvedWord;

   For i in 1..length(SolvedWord)
   Loop
      Letter := substr(SolvedWord, i, 1);
      
      UPDATE  ALPHACIPHER_CLUE
      SET     Unresolved_Letters = replace(Unresolved_Letters, Letter, '')
      WHERE   Unresolved_Letters Like '%' || Letter || '%';
   End Loop;    
END;
/

SELECT AC.*, length(Unresolved_Letters) Letters_to_Solve FROM ALPHACIPHER_CLUE AC 
Order By AC.Clue_Resolved, nvl(length(Unresolved_Letters), 0), 5;

SELECT * FROM ALPHACIPHER;

-- HAMSUN : 53
DELETE FROM ALPHACIPHER
WHERE H+A+M+S+U+N	!= 53
/

-- RANSOME : 45
INSERT INTO ALPHACIPHER (S, H, U, T, E, L, R, O, P, F, G, A, N, M)
SELECT AC.S, AC.H, AC.U, AC.T, AC.E, AC.L, AC.R, AC.O, AC.P, AC.F, AC.G, AC.A, AC.N, M.Nos
FROM   AlphaCipher AC
  JOIN Alpha_Nos M ON M.nos Not In (AC.S, AC.H, AC.U, AC.T, AC.E, AC.L, AC.R, AC.O, AC.P, AC.F, AC.G, AC.A, AC.N)
WHERE AC.R + AC.A + AC.N + AC.S + AC.O + M.Nos + AC.E = 45
/
DELETE FROM ALPHACIPHER WHERE M IS NULL
/

-- ANGELOU : 45
DELETE FROM ALPHACIPHER
WHERE A + N + G + E + L + O + U	!= 45
/

-- RENAULT : 40
INSERT INTO ALPHACIPHER (S, H, U, T, E, L, R, O, P, F, G, A, N)
SELECT AC.S, AC.H, AC.U, AC.T, AC.E, AC.L, AC.R, AC.O, AC.P, AC.F, AC.G, A.Nos, N.Nos
FROM   AlphaCipher AC
  JOIN Alpha_Nos A ON A.nos Not In (AC.S, AC.H, AC.U, AC.T, AC.E, AC.L, AC.R, AC.O, AC.P, AC.F, AC.G)
  JOIN Alpha_Nos N ON N.nos Not In (AC.S, AC.H, AC.U, AC.T, AC.E, AC.L, AC.R, AC.O, AC.P, AC.F, AC.G, A.Nos)
WHERE AC.R + AC.E + N.Nos + A.Nos + AC.U + AC.L + AC.T = 40
/
DELETE FROM ALPHACIPHER WHERE A IS NULL
/

-- GOGOL : 41
INSERT INTO ALPHACIPHER (S, H, U, T, E, L, R, O, P, F, G)
SELECT AC.S, AC.H, AC.U, AC.T, AC.E, AC.L, AC.R, AC.O, AC.P, AC.F, G.Nos
FROM   AlphaCipher AC
  JOIN Alpha_Nos G ON G.nos Not In (AC.S, AC.H, AC.U, AC.T, AC.E, AC.L, AC.R, AC.O, AC.P, AC.F)
WHERE G.Nos + AC.O + G.Nos + AC.O + AC.L= 41
/
DELETE FROM ALPHACIPHER WHERE G IS NULL
/

-- FORESTER : 58
INSERT INTO ALPHACIPHER (S, H, U, T, E, L, R, O, P, F)
SELECT AC.S, AC.H, AC.U, AC.T, AC.E, AC.L, AC.R, AC.O, AC.P, F.Nos
FROM   AlphaCipher AC
  JOIN Alpha_Nos F ON F.nos Not In (AC.S, AC.H, AC.U, AC.T, AC.E, AC.L, AC.R, AC.O, AC.P)
WHERE F.Nos + AC.O + AC.R + AC.E + AC.S + AC.T + AC.E + AC.R= 58
/
DELETE FROM ALPHACIPHER WHERE F IS NULL
/

-- POTTER : 47
DELETE FROM ALPHACIPHER
WHERE P + O + T + T + E + R != 47
/

-- PROUST : 42
INSERT INTO ALPHACIPHER (S, H, U, T, E, L, R, O, P)
SELECT AC.S, AC.H, AC.U, AC.T, AC.E, AC.L, AC.R, O.Nos, P.Nos
FROM   AlphaCipher AC
  JOIN Alpha_Nos O ON O.nos Not In (AC.S, AC.H, AC.U, AC.T, AC.E, AC.L, AC.R)
  JOIN Alpha_Nos P ON P.nos Not In (AC.S, AC.H, AC.U, AC.T, AC.E, AC.L, AC.R, O.Nos)
WHERE P.Nos + AC.R + O.NOS + AC.U + AC.S + AC.T = 42
/
DELETE FROM ALPHACIPHER WHERE O IS NULL
/

-- HELLER : 35
INSERT INTO ALPHACIPHER (S, H, U, T, E, L, R)
SELECT AC.S, AC.H, AC.U, AC.T, AC.E, L.Nos, R.Nos
FROM   AlphaCipher AC
  JOIN Alpha_Nos L ON L.nos Not In (AC.S, AC.H, AC.U, AC.T, AC.E)
  JOIN Alpha_Nos R ON R.nos Not In (AC.S, AC.H, AC.U, AC.T, AC.E, L.Nos)
WHERE AC.H + AC.E + L.Nos + L.NOS + AC.E + R.NOS = 35
/
DELETE FROM ALPHACIPHER WHERE L IS NULL
/


-- Shute : 37
INSERT INTO ALPHACIPHER (S, H, U, T, E)
SELECT S.Nos, H.Nos, U.Nos, T.Nos, E.Nos
FROM   Alpha_Nos S
  JOIN Alpha_Nos H ON H.nos != S.Nos
  JOIN Alpha_Nos U ON U.nos Not In (S.Nos, H.Nos)
  JOIN Alpha_Nos T ON T.nos Not In (S.Nos, H.Nos, U.Nos)
  JOIN Alpha_Nos E ON E.nos Not In (S.Nos, H.Nos, U.Nos, T.Nos)
WHERE S.Nos + H.Nos + U.Nos + T.Nos + E.Nos = 37
/


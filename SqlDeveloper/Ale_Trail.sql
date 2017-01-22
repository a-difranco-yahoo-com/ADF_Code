
Drop   Table GC_Ale_Trail Purge
/
Create Table GC_Ale_Trail (
A      NUMBER, B      NUMBER, C      NUMBER, D      NUMBER, E      NUMBER, F      NUMBER,
G      NUMBER, H      NUMBER, J      NUMBER, K      NUMBER, L      NUMBER, M      NUMBER,
N      NUMBER, P      NUMBER, Q      NUMBER, R      NUMBER, S      NUMBER, T      NUMBER,
U      NUMBER, V      NUMBER, W      NUMBER, X      NUMBER, Y      NUMBER, Z      NUMBER,
AA     NUMBER, AB     NUMBER, AC     NUMBER, AD     NUMBER, AE     NUMBER, AF     NUMBER,
AG     NUMBER, AH     NUMBER, AJ     NUMBER, AK     NUMBER, AL     NUMBER, AM     NUMBER,
AN     NUMBER, AP     NUMBER, AQ     NUMBER, AR     NUMBER, ASw    NUMBER, AT     NUMBER,
AU     NUMBER, AV     NUMBER, AW     NUMBER, AX     NUMBER, AY     NUMBER, AZ     NUMBER)
/

-- Whitbread's main brewery was on ? Street. Number of letters in ? is A. (Chiswell) = 8
-- The steam engine was purchased in 17BC = 1785
-- Another (generic) name for strong Porter beer is D (no. of letters) (Stout) = 5
-- This event occurred on Monday Eth of October 1FGH = 17th of 1814
-- The site is now partly occupied by a famous theatre. J is number of letters in the theatre's name.
-- (Dominion) = 8

INSERT INTO GC_ALE_TRAIL (A, B, C, D, E, F, G, H, J) VALUES (8, 8, 5, 5, 17, 8, 1, 4, 8); -- Not Verified : F / H / J

Create Or Replace View GC_Ale_Trail_Stage_1
AS
SELECT     'N51 30.'  || ( (A * C * E) + ((C + G) * B) )  Northing,
           'W000 06.' || ( (A * C * D) + ((C + G) * D) ) Westing
FROM       GC_Ale_Trail
/

-- K = (19)     count the men of copper at eye level.
-- L = (8 or 5) a large man sat here long ago waiting judgement. His number?
-- M = (260)    "the ? years of the..."

UPDATE GC_ALE_TRAIL  SET    K = 19, L = 5, M = 260;  -- Not Verified : F / J / L

Create Or Replace View GC_Ale_Trail_Stage_2
AS
SELECT 'N51 31.'  || (M - ((E * D) + H))         Northing,
       'W000 05.' || ((E+K) * (C * D) + (K+K+K)) Westing
FROM   GC_Ale_Trail
/

/*
Stage 2: (look for a large board in a small lane) : N51 31.161	W000 05.957
Questions:
N, P (3, 5) (hot toddy) = the host was famous for "... his ? ? which consisted... "
          (No. of letters in the 2 words, e.g. "warm beer" would be 4 and 4)
Q (7) (Ustinov)= and the 2nd famous visitor's surname was ? (No. of letters)
*/

UPDATE GC_ALE_TRAIL SET    N = 3, P = 5, Q = 7; -- Not Verified : F / J  

Create Or Replace View GC_Ale_Trail_Stage_3
AS
SELECT 'N51 31.'  || (M - ((E * D) + H) - ((Q + H) * G) )         Northing,
       'W000 05.' || ((E+K) * (C * D) + (K+K+K) - (N + P + Q + L) )Westing
FROM   GC_Ale_Trail
/

/*
Stage 3: N51 31.160	W000 05.937
Questions:
R, S (2, 3) = "was built in the precincts of ... in 11??"
T (4) = something used to be 14 days, but was reduced to ? days.
U, V (7, 6) (newgate prison) = be very happy that your next stop is not the once "nearby" building called ? ?, after your last beer on earth.
(no. of letters, 2 words)
*/
UPDATE GC_ALE_TRAIL  SET    R = 2, S = 3, T = 4, U = 7, V = 6; -- Not Verified : F / J

Create Or Replace View GC_Ale_Trail_Stage_4
AS
SELECT 'N51 30.'  || ( (R * S * T * U * V) - (Q + U) )  Northing,
       'W000 05.' || ( (R * S * T * U * P) - (U+U+U) )  Westing
FROM   GC_Ale_Trail
/

/*
Stage 4: N51 30.994	W000 05.819
Questions:
W, X (5, 3) (Right arm) = what was lost in the battle... "? ?"
(no. of letters, in the 2 words)
*/
UPDATE GC_ALE_TRAIL SET    W = 5, x = 3; -- Not Verified : F / J 

Create Or Replace View GC_Ale_Trail_Stage_5
AS
SELECT 'N51 30.'  || ( (R * X * W * W * V) + (W * X * X) )  Northing,
       'W000 05.' || ( (W * T * W * T)     + (R * L * R) )  Westing
FROM   GC_Ale_Trail
/

/*
Stage 5: (look up for a sign) : 
Questions: N51 30.945	W000 05.420
Y (10) = no. of letters in the longest word.
Z  (7)= no. of words going around.
*/
UPDATE GC_ALE_TRAIL SET    Y = 10, Z = 7;  -- Not Verified : F / J

Create Or Replace View GC_Ale_Trail_Stage_6
AS
SELECT 'N51  ' || ( (31000 + (W * Y) + W )           / 1000 )  Northing,
       'W000 ' || ( ( 5000 + (Y * Z * T) + (Z * V) ) / 1000 )  Westing
FROM   GC_Ale_Trail
/
/*
Stage 6: N51  31.055	W000 5.322 
N51 31000 + (W x Y) + W / 1000
W000 5000 + (Y x Z x T) + (Z x V) / 1000
Questions:
AA (8) (Portugal)= this pubs sign indicates the country of ? (no. of letters)
AB (11) (Nightingale)= animal featured in a poem (no. of letters)
*/

UPDATE GC_ALE_TRAIL SET    AA = 8, AB = 11; -- Not Verified : F / J

Create Or Replace View GC_Ale_Trail_Stage_7
AS
SELECT 'N51  31.0' || ( AA + AB + Y + Y )  Northing,
       'W000 04.' || ( (AA * AB * Y) + (Y * Y) + (W + T) )  Westing
FROM   GC_Ale_Trail
/

/*
Stage 7: N51  31.039	W000 04.989
N51 31. (AA+AB+Y+Y)
W000 04. (AA x AB x Y) + (Y x Y) + (W+T)
Questions:
AC, AD (4, 4) = an old name for this pub was... "called ? and ?" (no. of letters, 2 words)
King and Keys
*/

UPDATE GC_ALE_TRAIL SET    AC = 4, AD = 4; -- Not Verified : F / J

Create Or Replace View GC_Ale_Trail_Stage_8
AS
SELECT 'N51  30.' || ( (Y * Y * Y) - (AC * AD) )  Northing,
       'W000 04.' || ( (Y * Y * Z) + M )  Westing
FROM   GC_Ale_Trail
/


/*
NEW Stage 8: N51  30.984	W000 04.960
N51 30. (Y x Y x Y) - (AC x AD)
W000 04. (Y x Y x Z) + M
Questions:
At Stage 8 you will find an interesting history board. Its has lots of dates on it. Fourteen of them!.
Note down the dates in the order they appear, and use them to calculate the next clues.
AE = (13th - 9th) - 2 : 1819 - 1571 - 2   = 246
AF = (14th - 8th) - 1 : 1590 - 1212 - 1   = 377
AG = (7th - 2nd) - 406 : 1910 - 675 - 406 = 829
The sum of these 3 new clues should be 1452.
*/

UPDATE GC_ALE_TRAIL  SET    AE= 246, AF = 377, AG = 829; -- Not Verified : F / J / AF


Create Or Replace View GC_Ale_Trail_Stage_9
AS
SELECT 'N51  31.' || ( AE - ((AC * AD * X) + (AA * AA) + (N * Y)) )  Northing,
       'W000 04.' || ( AG -  (AC * AD * X) )  Westing
FROM   GC_Ale_Trail
/
/*
Stage 9: N51  31.104	W000 04.781
N51 31. AE - ((AC x AD x X) + (AA x AA) + (N x Y))
W000 04. AG - (AC x AD x X)
Questions:
AH (11) (Bishopsgate not ERKENWALD) = unusual name found near the bottom (no. of letters)
AJ 18 (693 - 675)  = result of the subtraction near the bottom (stay positive).
*/

UPDATE GC_ALE_TRAIL SET AH= 11, AJ = (693 - 675); -- Not Verified : F / J / AF

Create Or Replace View GC_Ale_Trail_Stage_10
AS
SELECT 'N51  30.' || ( (AC * AD * AD * AH) + AJ )  Northing,
       'W000 04.' || ( (AC * AD * AD * AH) + AJ+AJ+AH )  Westing
FROM   GC_Ale_Trail
/


/*
Stage 10: N51  30.722	W000 04.751
N51 30. (AC x AD x AD x AH) + AJ
W000 04. (AC x AD x AD x AH) + AJ+AJ+AH
Questions:
AK (200) = a large sum of money was invested by how many people?
AL (10)  = look for the fraction that was revenue.
*/
UPDATE GC_ALE_TRAIL SET AK= 200, AL = 10; -- Not Verified : F / J / AF / AK / AL

Create Or Replace View GC_Ale_Trail_Stage_11
AS
SELECT 'N51  ' || ((31000 - (AK + AK + (AC * Z))) / 1000) Northing,
       'W000 ' || (( 6000 - (AG + (AD * AD * Z))) / 1000) Westing
FROM   GC_Ale_Trail
/

/*
Stage 11: N51  30.572	W000 5.059
N51, subtract  from 31000, and divide by 1000
W000, subtract AG + (AD x AD x Z) from 6000, and divide by 1000
Questions:
AM (13 Mathematician) = I didn't know this person was also a ? (no. of letters of the longer talent)
AN (12 Looking-Glass) = no. of letters of the hyphenated word (eg. big-toe is 6)
*/
UPDATE GC_ALE_TRAIL SET AM= 13, AN = 12; -- Not Verified : F / J / AF / AK / AL

Create Or Replace View GC_Ale_Trail_Stage_12
AS
SELECT 'N51  30.' || ((AM * AN * AC) + AJ) Northing,
       'W000 05.0' || ((AK / AD)) Westing,
       AK / R Distance, ak, r
FROM   GC_Ale_Trail
/

/*
Stages 12 and 13: (was paper history - both now missing)
N51 30. (AM x AN x AC) + AJ
W000 05. (AK / AD)
When you get to these coords, you should be on a main street, with smaller roads going east and west.
Walk about 100 (AK / R) meters west. When you've done that, seek out P12, which is hidden from view, 
by walking south. (If you do not find within 30m, you probably went south from the wrong place!).
P13 is also hidden, but is actually less than 30m west from P12.
P12 Questions:
*/

SELECT * FROM GC_Ale_Trail;
SELECT * FROM GC_Ale_Trail_Stage_1;
SELECT * FROM GC_Ale_Trail_Stage_2;
SELECT * FROM GC_Ale_Trail_Stage_3;
SELECT * FROM GC_Ale_Trail_Stage_4;
SELECT * FROM GC_Ale_Trail_Stage_5;
SELECT * FROM GC_Ale_Trail_Stage_6;
SELECT * FROM GC_Ale_Trail_Stage_7;
SELECT * FROM GC_Ale_Trail_Stage_8;
SELECT * FROM GC_Ale_Trail_Stage_9;
SELECT * FROM GC_Ale_Trail_Stage_10;
SELECT * FROM GC_Ale_Trail_Stage_11;
SELECT * FROM GC_Ale_Trail_Stage_12;






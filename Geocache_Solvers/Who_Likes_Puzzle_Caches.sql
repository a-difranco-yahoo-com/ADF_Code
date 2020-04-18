

/* =============  Setup Ref Tables =================== */
CREATE TABLE WLPC_REF_TYPE
AS
SELECT 'Multi'       Cache_Type FROM DUAL UNION
SELECT 'Traditional' Cache_Type FROM DUAL UNION
SELECT 'Puzzle'      Cache_Type FROM DUAL UNION
SELECT 'Earth'       Cache_Type FROM DUAL UNION
SELECT 'Virtual'     Cache_Type FROM DUAL;

CREATE TABLE WLPC_REF_SIZE
AS
SELECT 'Nano'    Cache_Size FROM DUAL UNION
SELECT 'Micro'   Cache_Size FROM DUAL UNION
SELECT 'Small'   Cache_Size FROM DUAL UNION
SELECT 'Regular' Cache_Size FROM DUAL UNION
SELECT 'Large'   Cache_Size FROM DUAL;

CREATE TABLE WLPC_REF_DIFFICULTY
AS
SELECT 'D1' Difficulty FROM DUAL UNION
SELECT 'D2' Difficulty FROM DUAL UNION
SELECT 'D3' Difficulty FROM DUAL UNION
SELECT 'D4' Difficulty FROM DUAL UNION
SELECT 'D5' Difficulty FROM DUAL;

CREATE TABLE WLPC_REF_ATTRIBUTES
AS
SELECT 'fab'    Attributes FROM DUAL UNION
SELECT 'gr0ovy' Attributes FROM DUAL UNION
SELECT 'deep'   Attributes FROM DUAL UNION
SELECT 'jazzy'  Attributes FROM DUAL UNION
SELECT 'moody'  Attributes FROM DUAL;

CREATE TABLE WLPC_REF_GEOCACHER
AS
SELECT 'Kats_and_Fish'   Geocacher FROM DUAL UNION
SELECT 'SkiShoos8'       Geocacher FROM DUAL UNION
SELECT 'Georumkub'       Geocacher FROM DUAL UNION
SELECT 'Sir_JJB_Away'    Geocacher FROM DUAL UNION
SELECT 'aB5lueTeebanger' Geocacher FROM DUAL;

CREATE TABLE WLPC_REF_POSITION
AS
SELECT 1 Position FROM DUAL UNION
SELECT 2 Position FROM DUAL UNION
SELECT 3 Position FROM DUAL UNION
SELECT 4 Position FROM DUAL UNION
SELECT 5 Position FROM DUAL;

DESC WLPC_REF_POSITION;

/* =============  Setup Combinations  =================== */
CREATE TABLE WLPC_COMBINATION
AS
SELECT     Position, Geocacher, Difficulty, Cache_Size, Attributes, Cache_Type
FROM       WLPC_REF_POSITION
CROSS JOIN WLPC_REF_GEOCACHER
CROSS JOIN WLPC_REF_DIFFICULTY
CROSS JOIN WLPC_REF_SIZE
CROSS JOIN WLPC_REF_ATTRIBUTES
CROSS JOIN WLPC_REF_TYPE
WHERE      NOT (Geocacher   = 'Georumkub'       AND Cache_Size != 'Nano')          -- Georumkub likes nanos.
AND        NOT (Geocacher  != 'Georumkub'       AND Cache_Size  = 'Nano')          -- Georumkub likes nanos.
AND        NOT (Geocacher   = 'Sir_JJB_Away'    AND Cache_Type != 'Multi')         -- Sir_JJB_Away likes multis.
AND        NOT (Geocacher  != 'Sir_JJB_Away'    AND Cache_Type  = 'Multi')         -- Sir_JJB_Away likes multis.
AND        NOT (Geocacher   = 'SkiShoos8'       AND Attributes != 'fab')           -- SkiShoos8 is fab.
AND        NOT (Geocacher  != 'SkiShoos8'       AND Attributes  = 'fab')           -- SkiShoos8 is fab.
AND        NOT (Geocacher   = 'aB5lueTeebanger' AND Cache_Size  = 'Regular')       -- aB5lueTeebanger is standing next to the cacher who likes regular caches.
AND        NOT (Geocacher   = 'aB5lueTeebanger' AND Position   != 1)               -- aB5lueTeebanger is standing in position 1.
AND        NOT (Geocacher  != 'aB5lueTeebanger' AND Position    = 1)               -- aB5lueTeebanger is standing in position 1.
AND        NOT (Geocacher   = 'Kats_and_Fish'   AND Difficulty != 'D4')            -- Kats_and_Fish prefers D4 caches.
AND        NOT (Geocacher  != 'Kats_and_Fish'   AND Difficulty  = 'D4')            -- Kats_and_Fish prefers D4 caches.
AND        NOT (Cache_Size  = 'Small'           AND Attributes != 'gr0ovy')        -- The cacher who likes small containers is gr0ovy.
AND        NOT (Cache_Size != 'Small'           AND Attributes  = 'gr0ovy')        -- The cacher who likes small containers is gr0ovy.
AND        NOT (Position    = 3                 AND Attributes != 'moody')         -- The cacher standing in the middle is moody.
AND        NOT (Position   != 3                 AND Attributes  = 'moody')         -- The cacher standing in the middle is moody.
AND        NOT (Difficulty  = 'D1'              AND Cache_Type != 'Earth')         -- The cacher who likes D1 caches also prefers Earth caches.
AND        NOT (Difficulty != 'D1'              AND Cache_Type  = 'Earth')         -- The cacher who likes D1 caches also prefers Earth caches.
AND        NOT (Difficulty  = 'D2'              AND Cache_Type  = 'Virtual')       -- The cacher who prefers Virtual caches is standing next to the cacher who prefers D2 caches.
AND        NOT (Difficulty  = 'D2'              AND Cache_Size != 'Large')         -- The cacher who likes large containers likes D2 caches.
AND        NOT (Difficulty != 'D2'              AND Cache_Size  = 'Large')         -- The cacher who likes large containers likes D2 caches.
AND        NOT (Difficulty  = 'D3'              AND Attributes != 'jazzy')         -- The cacher who likes D3 caches is jazzy.
AND        NOT (Difficulty != 'D3'              AND Attributes  = 'jazzy')         -- The cacher who likes D3 caches is jazzy.
AND        NOT (Difficulty  = 'D5'              AND Cache_Type  = 'Traditional')   -- The cacher who likes D5 caches is standing next to the cacher who prefers Traditional caches.
AND        NOT (Difficulty  = 'D5'              AND Attributes  = 'deep')          -- The D5 cacher is standing next to the cacher who is deep.
/
/* =============  Setup Solution  =================== */
DROP   TABLE WLPC_SOLUTION PURGE;
CREATE TABLE WLPC_SOLUTION
AS
SELECT 
       P1.Geocacher Geocacher1,   P1.Difficulty Difficulty1, P1.Cache_Size Cache_Size1,
       P1.Attributes Attributes1, P1.Cache_Type Cache_Type1,
       P2.Geocacher Geocacher2,   P2.Difficulty Difficulty2, P2.Cache_Size Cache_Size2,
       P2.Attributes Attributes2, P2.Cache_Type Cache_Type2,
       P3.Geocacher Geocacher3,   P3.Difficulty Difficulty3, P3.Cache_Size Cache_Size3,
       P3.Attributes Attributes3, P3.Cache_Type Cache_Type3,
       P4.Geocacher Geocacher4,   P4.Difficulty Difficulty4, P4.Cache_Size Cache_Size4,
       P4.Attributes Attributes4, P4.Cache_Type Cache_Type4,
       P5.Geocacher Geocacher5,   P5.Difficulty Difficulty5, P5.Cache_Size Cache_Size5,
       P5.Attributes Attributes5, P5.Cache_Type Cache_Type5
FROM   WLPC_COMBINATION P1
 JOIN  WLPC_COMBINATION P2 ON P2.Position = 2
 JOIN  WLPC_COMBINATION P3 ON P3.Position = 3
 JOIN  WLPC_COMBINATION P4 ON P4.Position = 4
 JOIN  WLPC_COMBINATION P5 ON P5.Position = 5
WHERE  P1.Position = 1
AND    P1.Geocacher  NOT IN (P2.Geocacher, P3.Geocacher, P4.Geocacher, P5.Geocacher)
AND    P2.Geocacher  NOT IN (P3.Geocacher, P4.Geocacher, P5.Geocacher)
AND    P3.Geocacher  NOT IN (P4.Geocacher, P5.Geocacher)
AND    P4.Geocacher  NOT IN (P5.Geocacher)
AND    P1.Difficulty NOT IN (P2.Difficulty, P3.Difficulty, P4.Difficulty, P5.Difficulty)
AND    P2.Difficulty NOT IN (P3.Difficulty, P4.Difficulty, P5.Difficulty)
AND    P3.Difficulty NOT IN (P4.Difficulty, P5.Difficulty)
AND    P4.Difficulty NOT IN (P5.Difficulty)
AND    P1.Cache_Size NOT IN (P2.Cache_Size, P3.Cache_Size, P4.Cache_Size, P5.Cache_Size)
AND    P2.Cache_Size NOT IN (P3.Cache_Size, P4.Cache_Size, P5.Cache_Size)
AND    P3.Cache_Size NOT IN (P4.Cache_Size, P5.Cache_Size)
AND    P4.Cache_Size NOT IN (P5.Cache_Size)
AND    P1.Cache_Type NOT IN (P2.Cache_Type, P3.Cache_Type, P4.Cache_Type, P5.Cache_Type)
AND    P2.Cache_Type NOT IN (P3.Cache_Type, P4.Cache_Type, P5.Cache_Type)
AND    P3.Cache_Type NOT IN (P4.Cache_Type, P5.Cache_Type)
AND    P4.Cache_Type NOT IN (P5.Cache_Type)
AND    P1.Attributes NOT IN (P2.Attributes, P3.Attributes, P4.Attributes, P5.Attributes)
AND    P2.Attributes NOT IN (P3.Attributes, P4.Attributes, P5.Attributes)
AND    P3.Attributes NOT IN (P4.Attributes, P5.Attributes)
AND    P4.Attributes NOT IN (P5.Attributes)
/
/* =============  Add Virtual Columns  =================== */
ALTER TABLE WLPC_SOLUTION Add (aB5lueTeebanger_Position AS (
CASE WHEN Geocacher1 = 'aB5lueTeebanger' THEN 1 WHEN Geocacher2 = 'aB5lueTeebanger' THEN 2 WHEN Geocacher3 = 'aB5lueTeebanger' THEN 3
     WHEN Geocacher4 = 'aB5lueTeebanger' THEN 4 WHEN Geocacher5 = 'aB5lueTeebanger' THEN 5 END));
ALTER TABLE WLPC_SOLUTION Add (SkiShoos8_Position AS (
CASE WHEN Geocacher1 = 'SkiShoos8' THEN 1 WHEN Geocacher2 = 'SkiShoos8' THEN 2 WHEN Geocacher3 = 'SkiShoos8' THEN 3
     WHEN Geocacher4 = 'SkiShoos8' THEN 4 WHEN Geocacher5 = 'SkiShoos8' THEN 5 END));
ALTER TABLE WLPC_SOLUTION Add (Sir_JJB_Away_Position AS (
CASE WHEN Geocacher1 = 'Sir_JJB_Away' THEN 1 WHEN Geocacher2 = 'Sir_JJB_Away' THEN 2 WHEN Geocacher3 = 'Sir_JJB_Away' THEN 3
     WHEN Geocacher4 = 'Sir_JJB_Away' THEN 4 WHEN Geocacher5 = 'Sir_JJB_Away' THEN 5 END));
ALTER TABLE WLPC_SOLUTION Add (Georumkub_Position AS (
CASE WHEN Geocacher1 = 'Georumkub' THEN 1 WHEN Geocacher2 = 'Georumkub' THEN 2 WHEN Geocacher3 = 'Georumkub' THEN 3
     WHEN Geocacher4 = 'Georumkub' THEN 4 WHEN Geocacher5 = 'Georumkub' THEN 5 END));
ALTER TABLE WLPC_SOLUTION Add (Kats_and_Fish_Position AS (
CASE WHEN Geocacher1 = 'Kats_and_Fish' THEN 1 WHEN Geocacher2 = 'Kats_and_Fish' THEN 2 WHEN Geocacher3 = 'Kats_and_Fish' THEN 3
     WHEN Geocacher4 = 'Kats_and_Fish' THEN 4 WHEN Geocacher5 = 'Kats_and_Fish' THEN 5 END));


ALTER TABLE WLPC_SOLUTION Add (Earth_Position AS (
CASE WHEN Cache_Type1  = 'Earth' THEN 1 WHEN Cache_Type2  = 'Earth' THEN 2  WHEN Cache_Type3  = 'Earth' THEN 3
     WHEN Cache_Type4  = 'Earth' THEN 4 WHEN Cache_Type5  = 'Earth' THEN 5 END));
ALTER TABLE WLPC_SOLUTION Add (Multi_Position AS (
CASE WHEN Cache_Type1  = 'Multi' THEN 1 WHEN Cache_Type2  = 'Multi' THEN 2  WHEN Cache_Type3  = 'Multi' THEN 3
     WHEN Cache_Type4  = 'Multi' THEN 4 WHEN Cache_Type5  = 'Multi' THEN 5 END));
ALTER TABLE WLPC_SOLUTION Add (Virtual_Position AS (
CASE WHEN Cache_Type1  = 'Virtual' THEN 1 WHEN Cache_Type2  = 'Virtual' THEN 2  WHEN Cache_Type3  = 'Virtual' THEN 3
     WHEN Cache_Type4  = 'Virtual' THEN 4 WHEN Cache_Type5  = 'Virtual' THEN 5 END));
ALTER TABLE WLPC_SOLUTION Add (Traditional_Position AS (
CASE WHEN Cache_Type1 = 'Traditional' THEN 1  WHEN Cache_Type2 = 'Traditional' THEN 2 WHEN Cache_Type3 = 'Traditional' THEN 3
     WHEN Cache_Type4 = 'Traditional' THEN 4  WHEN Cache_Type4 = 'Traditional' THEN 5 END));
ALTER TABLE WLPC_SOLUTION Add (Puzzle_Position AS (
CASE WHEN Cache_Type1 = 'Puzzle' THEN 1  WHEN Cache_Type2 = 'Puzzle' THEN 2 WHEN Cache_Type3 = 'Puzzle' THEN 3
     WHEN Cache_Type4 = 'Puzzle' THEN 4  WHEN Cache_Type4 = 'Puzzle' THEN 5 END));

ALTER TABLE WLPC_SOLUTION Add (D1_Position AS (
CASE WHEN Difficulty1 = 'D1' THEN 1 WHEN Difficulty2 = 'D1' THEN 2    WHEN Difficulty3  = 'D1' THEN 3
     WHEN Difficulty4 = 'D1' THEN 4 WHEN Difficulty5 = 'D1' THEN 5 END));
ALTER TABLE WLPC_SOLUTION Add (D2_Position AS (
CASE WHEN Difficulty1 = 'D2' THEN 1 WHEN Difficulty2 = 'D2' THEN 2    WHEN Difficulty3  = 'D2' THEN 3
     WHEN Difficulty4 = 'D2' THEN 4 WHEN Difficulty5 = 'D2' THEN 5 END));
ALTER TABLE WLPC_SOLUTION Add (D3_Position AS (
CASE WHEN Difficulty1 = 'D3' THEN 1 WHEN Difficulty2 = 'D3' THEN 2    WHEN Difficulty3  = 'D3' THEN 3
     WHEN Difficulty4 = 'D3' THEN 4 WHEN Difficulty5 = 'D3' THEN 5 END));
ALTER TABLE WLPC_SOLUTION Add (D4_Position AS (
CASE WHEN Difficulty1 = 'D4' THEN 1 WHEN Difficulty2 = 'D4' THEN 2    WHEN Difficulty3  = 'D4' THEN 3
     WHEN Difficulty4 = 'D4' THEN 4 WHEN Difficulty5 = 'D4' THEN 5 END));
ALTER TABLE WLPC_SOLUTION Add (D5_Position AS (
CASE WHEN Difficulty1 = 'D5' THEN 1 WHEN Difficulty2 = 'D5' THEN 2    WHEN Difficulty3  = 'D5' THEN 3
     WHEN Difficulty4 = 'D5' THEN 4 WHEN Difficulty5 = 'D5' THEN 5 END));

ALTER TABLE WLPC_SOLUTION Add (Nano_Position AS (
CASE WHEN Cache_Size1 = 'Nano' THEN 1 WHEN Cache_Size2 = 'Nano' THEN 2 WHEN Cache_Size3 = 'Nano' THEN 3
     WHEN Cache_Size4 = 'Nano' THEN 4 WHEN Cache_Size5 = 'Nano' THEN 5 END));
ALTER TABLE WLPC_SOLUTION Add (Regular_Position AS (
CASE WHEN Cache_Size1 = 'Regular' THEN 1 WHEN Cache_Size2 = 'Regular' THEN 2 WHEN Cache_Size3 = 'Regular' THEN 3
     WHEN Cache_Size4 = 'Regular' THEN 4 WHEN Cache_Size5 = 'Regular' THEN 5 END));
ALTER TABLE WLPC_SOLUTION Add (Large_Position AS (
CASE WHEN Cache_Size1 = 'Large' THEN 1 WHEN Cache_Size2 = 'Large' THEN 2 WHEN Cache_Size3 = 'Large' THEN 3
     WHEN Cache_Size4 = 'Large' THEN 4 WHEN Cache_Size5 = 'Large' THEN 5 END));

ALTER TABLE WLPC_SOLUTION Add (Small_Position AS (
CASE WHEN Cache_Size1 = 'Small' THEN 1 WHEN Cache_Size2 = 'Small' THEN 2 WHEN Cache_Size3 = 'Small' THEN 3
     WHEN Cache_Size4 = 'Small' THEN 4 WHEN Cache_Size5 = 'Small' THEN 5 END));
ALTER TABLE WLPC_SOLUTION Add (Micro_Position AS (
CASE WHEN Cache_Size1 = 'Micro' THEN 1 WHEN Cache_Size2 = 'Micro' THEN 2 WHEN Cache_Size3 = 'Micro' THEN 3
     WHEN Cache_Size4 = 'Micro' THEN 4 WHEN Cache_Size5 = 'Micro' THEN 5 END));

ALTER TABLE WLPC_SOLUTION Add (deep_Position AS (
CASE WHEN Attributes1 = 'deep' THEN 1 WHEN Attributes2 = 'deep' THEN 2 WHEN Attributes3 = 'deep' THEN 3 
     WHEN Attributes4 = 'deep' THEN 4 WHEN Attributes5 = 'deep' THEN 5 END));
ALTER TABLE WLPC_SOLUTION Add (fab_Position AS (
CASE WHEN Attributes1 = 'fab' THEN 1 WHEN Attributes2 = 'fab' THEN 2 WHEN Attributes3 = 'fab' THEN 3 
     WHEN Attributes4 = 'fab' THEN 4 WHEN Attributes5 = 'fab' THEN 5 END));
ALTER TABLE WLPC_SOLUTION Add (gr0ovy_Position AS (
CASE WHEN Attributes1 = 'gr0ovy' THEN 1 WHEN Attributes2 = 'gr0ovy' THEN 2 WHEN Attributes3 = 'gr0ovy' THEN 3 
     WHEN Attributes4 = 'gr0ovy' THEN 4 WHEN Attributes5 = 'gr0ovy' THEN 5 END));
ALTER TABLE WLPC_SOLUTION Add (moody_Position AS (
CASE WHEN Attributes1 = 'moody' THEN 1 WHEN Attributes2 = 'moody' THEN 2 WHEN Attributes3 = 'moody' THEN 3 
     WHEN Attributes4 = 'moody' THEN 4 WHEN Attributes5 = 'moody' THEN 5 END));
ALTER TABLE WLPC_SOLUTION Add (jazzy_Position AS (
CASE WHEN Attributes1 = 'jazzy' THEN 1 WHEN Attributes2 = 'jazzy' THEN 2 WHEN Attributes3 = 'jazzy' THEN 3 
     WHEN Attributes4 = 'jazzy' THEN 4 WHEN Attributes5 = 'jazzy' THEN 5 END));

/* =============  Filter Solutions  =================== */
-- aB5lueTeebanger is standing next to the cacher who likes regular caches.
DELETE FROM     WLPC_SOLUTION WHERE abs(aB5lueTeebanger_Position - Regular_Position) != 1;

-- Cacher who likes small containers is just to the left of the cacher who likes micro containers.
DELETE FROM     WLPC_SOLUTION WHERE Micro_Position - Small_Position != 1;

-- The cacher who prefers Virtual caches is standing next to the cacher who prefers D2 caches.
DELETE FROM     WLPC_SOLUTION WHERE abs(Virtual_Position - D2_Position) != 1;

-- The cacher who likes D5 caches is standing next to the cacher who prefers Traditional caches.
DELETE FROM     WLPC_SOLUTION WHERE abs(D5_Position - Traditional_Position) != 1;

-- The D5 cacher is standing next to the cacher who is deep.
DELETE FROM     WLPC_SOLUTION WHERE abs(D5_Position - Deep_Position) != 1;

SELECT   Traditional_Position, Deep_Position, D5_Position, count(*)
FROM     WLPC_SOLUTION
GROUP BY Traditional_Position, Deep_Position, D5_Position
/
---------------------------


SELECT 'N 51� ' || A || B || '.' || C || D || E    Northing,
       'E 000 � '  || F || G || '.' || H || I || J Westing
FROM (SELECT (Kats_and_Fish_Position   - D2_Position + Regular_Position - jazzy_Position  + Traditional_Position) A,
             (SkiShoos8_Position       - D5_Position + Micro_Position   - deep_Position   + Multi_Position) B,
             (Georumkub_Position       - D3_Position + Large_Position   - fab_Position    + Puzzle_Position) C,
             (Sir_JJB_Away_Position    - D2_Position + Small_Position   - moody_Position  + Earth_Position) D,
             (aB5lueTeebanger_Position - D5_Position + Nano_Position    - fab_Position    + Puzzle_Position) E,
             (Kats_and_Fish_Position   + D4_Position - Regular_Position - jazzy_Position  + Virtual_Position) F,
             (aB5lueTeebanger_Position + D4_Position - Small_Position   + gr0ovy_Position - Multi_Position) G,
             (Georumkub_Position       + D3_Position + Large_Position   - moody_Position  - Earth_Position) H,
             (Sir_JJB_Away_Position    + D1_Position + Regular_Position - gr0ovy_Position - Virtual_Position) I,
             (Skishoos8_Position       + D3_Position + Micro_Position   - fab_Position    - Traditional_Position) J
      FROM     WLPC_SOLUTION) 
/
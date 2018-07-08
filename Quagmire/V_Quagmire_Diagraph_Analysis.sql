

CREATE OR REPLACE VIEW V_QUAGMIRE_DIAGRAPH_ANALYSIS
AS
SELECT   Word_Id1, Word_Id2, count(*) Combinations,
         count(Distinct Dictionary_Id1) Distinct_Dictionary_Id1,
         count(Distinct Dictionary_Id2) Distinct_Dictionary_Id2
FROM     QUAGMIRE_DIAGRAPH
GROUP BY Word_Id1, Word_Id2
/

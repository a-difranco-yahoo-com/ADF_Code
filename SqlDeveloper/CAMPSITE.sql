

BEGIN
  CS_SOLVER.Solve_Puzzle(1, 22);
END;
/
SELECT S.Tree_Id, Tr.Row_No, Tr.Col_No, Te.Row_No, Te.Col_No, Count(*)
FROM   CS_SOLUTION S
  JOIN CS_TREE     TR ON TR.Tree_Id = S.Tree_Id
  JOIN CS_TENT     TE ON TE.Tent_Id = S.Tent_Id
GROUP BY S.Tree_Id, Tr.Row_No, Tr.Col_No, Te.Row_No, Te.Col_No
ORDER BY S.Tree_Id, Tr.Row_No, Tr.Col_No, Te.Row_No, Te.Col_No
/  

SELECT * FROM   CS_SOLUTION ORDER BY Solution_Id;
SELECT * FROM   CS_TREE;
SELECT * FROM   CS_TENT;
SELECT * FROM   V_CLUE_ANALYSIS WHERE Row_Or_Col = 'R';


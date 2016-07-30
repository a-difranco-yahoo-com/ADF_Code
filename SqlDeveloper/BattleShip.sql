

BEGIN
  BS_SOLVER.Solve_Puzzle(1); 
END;
/

SELECT Count(*) FROM BS_SOLUTION;

SELECT SO.Solution_Id, 
       Sum(Decode(SP.Row_No, 1, 1, 0)) Row1,
       Sum(Decode(SP.Row_No, 2, 1, 0)) Row2,
       Sum(Decode(SP.Row_No, 3, 1, 0)) Row3,
       Sum(Decode(SP.Row_No, 4, 1, 0)) Row4,
       Sum(Decode(SP.Row_No, 5, 1, 0)) Row5,
       Sum(Decode(SP.Row_No, 6, 1, 0)) Row6,
       Sum(Decode(SP.Row_No, 7, 1, 0)) Row7,
       Sum(Decode(SP.Row_No, 8, 1, 0)) Row8,
       Sum(Decode(SP.Row_No, 9, 1, 0)) Row9,
       Sum(Decode(SP.Col_No, 1, 1, 0)) Col1,
       Sum(Decode(SP.Col_No, 2, 1, 0)) Col2,
       Sum(Decode(SP.Col_No, 3, 1, 0)) Col3,
       Sum(Decode(SP.Col_No, 4, 1, 0)) Col4,
       Sum(Decode(SP.Col_No, 5, 1, 0)) Col5,
       Sum(Decode(SP.Col_No, 6, 1, 0)) Col6,
       Sum(Decode(SP.Col_No, 7, 1, 0)) Col7,
       Sum(Decode(SP.Col_No, 8, 1, 0)) Col8,
       Sum(Decode(SP.Col_No, 9, 1, 0)) Col9,
       'x'
FROM   BS_SOLUTION  SO
--  JOIN BS_SHIP      SH ON SH.Ship_Id = SO.Ship_Id
  JOIN BS_SHIP_PART SP ON SP.Ship_Id = SO.Ship_Id
GROUP BY SO.Solution_Id
/




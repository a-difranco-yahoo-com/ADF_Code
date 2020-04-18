

SELECT Sum (Squares)
FROM  (
SELECT Rownum Square_Size, Rownum * Rownum Squares
FROM   ALL_OBJECTS
WHERE  Rownum <= 15
)
/

ABCDE = 1240

N 50 57.(1+2+4)(4+4-1)(2+0), W 000 08.(1+0)(4+4+0)(2)
N 50 57.772, W 000 08.182

N 50 57.(B+C+D)(D+D-B)(C+E), W 000 08.(B+E)(D+D+A)(C)
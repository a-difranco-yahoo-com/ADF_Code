

The total number of embossed crowns on the exterior of the phone box and the post box = A  5 ?
The first letter under the large crown on the front of the post box                   = B  7 (G)
The second letter under the large crown on the front of the post box                  = C  18  (R)STUVWXYZ
The number of letters in the first word next to the slot for letters on the post box  = D  4 Next
The number of letters in the second word next to the slot for letters on the post box = E  10 Collection
The cache can be found at
/

WITH Digits AS (SELECT Rownum X FROM ALL_OBJECTS WHERE Rownum <= 26)
SELECT 'N 51° 28.' || (A.X+D.X) || (C.X-E.X) || (B.X-A.X) Northing,
       'W 000° 00.' || (E.X-D.X) || B.X || D.X Westing, A.X
FROM   Digits A
JOIN   Digits B ON B.X = 7
JOIN   Digits C ON C.X = 18
JOIN   Digits D ON D.X = 4
JOIN   Digits E ON E.X = 10
WHERE  A.X Between 3 and 5
/

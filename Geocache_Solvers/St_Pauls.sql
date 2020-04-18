/*
Stage 1
Once you are in place, look down at your feet and note the four digit number on a round plaque. This is 12AB. => 1260

Stage 2
When you are standing in place, look to the entrance of the alleyway on the left,
where you will find a plaque on the ground celebrating an industry for which this street is well known.
The date of this edition is April CD 1900 => 24

Stage 3
At this point, look up to the wall on your right and you will see a metal plaque.
The last two numbers of the phone number are EF => 37

Stage 4
When you are standing in the correct location, look behind you and you will see a statue of a lion.

The artist was born in 18GH => 1892

Stage 5
Here, look to your left where you will see a bronze seated statue. The statue was erected in 20JK => 2002

 

The cache can be found at N 51� EB.F(A/C)J' W 0� (G-D).G(C-K)B'
*/
WITH ANSWERS AS (SELECT 6 A, 0 B, 2 C, 4 D,    3 E, 7 F, 9 G, 2 H, 0 J, 2 K FROM DUAL)
SELECT 'N 51� ' || E || B|| '.' || F ||(D + E) || C  Northing,
       'W 000� 0' || (G-D) || '.' || G || J || (C + H + K) Westing
FROM ANSWERS
/
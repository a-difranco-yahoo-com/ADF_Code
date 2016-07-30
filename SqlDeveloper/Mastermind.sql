

BEGIN
  mastermind.generate_results;
END;
/

BEGIN
  mastermind.generate_level2;
END;
/

SELECT combination, result_1234, max(amount), 
       row_number()  OVER (PARTITION BY result_1234
                           ORDER BY     max(amount)) RN
FROM   mastermind_level2
GROUP BY combination, result_1234
ORDER BY RN, max(amount)
/
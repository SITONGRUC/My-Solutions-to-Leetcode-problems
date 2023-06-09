# Write your MySQL query statement below
SELECT 
MAX(num) AS num
FROM (SELECT 
num,
COUNT(CASE WHEN num IS NOT NULL THEN 1
ELSE 0 END) AS count
FROM MyNumbers
GROUP BY num
HAVING count = 1) AS c;

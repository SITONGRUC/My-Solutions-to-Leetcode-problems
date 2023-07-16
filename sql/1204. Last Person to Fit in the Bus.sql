# Write your MySQL query statement below
SELECT
person_name AS person_name
FROM 
(SELECT
*,
SUM(weight) OVER(ORDER BY turn) AS total_weight
FROM Queue 
ORDER BY turn) AS res
WHERE total_weight<=1000
ORDER BY total_weight DESC
LIMIT 1;

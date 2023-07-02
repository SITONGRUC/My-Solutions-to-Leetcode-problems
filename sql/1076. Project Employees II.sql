# Write your MySQL query statement below
SELECT 
project_id
FROM (SELECT 
project_id,
COUNT(employee_id) AS cnt
FROM Project
GROUP BY project_id
ORDER BY cnt DESC) AS res
WHERE cnt = (SELECT MAX(cnt) FROM (SELECT 
project_id,
COUNT(employee_id) AS cnt
FROM Project
GROUP BY project_id
ORDER BY cnt DESC) AS res)

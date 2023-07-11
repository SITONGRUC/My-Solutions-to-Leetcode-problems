# Write your MySQL query statement below
SELECT
s.company_id,
s.employee_id,
s.employee_name,
ROUND((CASE WHEN max1 < 1000 THEN (1-0)*salary
WHEN max1 >= 1000 AND max1 <= 10000 THEN (1-0.24)*salary
ELSE (1-0.49)*salary END),0) AS salary
FROM 
Salaries AS s
LEFT JOIN 
(SELECT
company_id,
MAX(salary) AS max1
FROM Salaries
GROUP BY company_id) AS max1
ON max1.company_id = s.company_id
ORDER BY s.company_id

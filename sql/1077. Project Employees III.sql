# Write your MySQL query statement below
SELECT
project_id,
employee_id
FROM 
(SELECT
p.project_id,
p.employee_id,
e.experience_years,
MAX(experience_years) OVER(PARTITION BY p.project_id) AS max1
FROM
Project AS p
LEFT JOIN 
Employee AS e
ON p.employee_id=e.employee_id) AS res
WHERE max1 = experience_years

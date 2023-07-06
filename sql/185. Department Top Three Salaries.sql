# Write your MySQL query statement below
SELECT
d.name AS Department,
Employee,
Salary
FROM
(SELECT 
name AS Employee,
salary AS Salary,
departmentId
FROM 
(SELECT
*,
DENSE_RANK() OVER(PARTITION BY departmentId ORDER BY salary DESC ) AS rank1
FROM Employee) AS res
WHERE rank1 <= 3) AS res1
LEFT JOIN 
Department AS d
ON d.id = res1.departmentId 

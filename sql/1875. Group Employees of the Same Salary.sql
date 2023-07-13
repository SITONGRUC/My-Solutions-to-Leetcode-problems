# Write your MySQL query statement below
SELECT
employee_id,
name,
salary,
DENSE_RANK() OVER(ORDER BY salary ASC) AS team_id
FROM
(SELECT
*,
COUNT(employee_id) OVER(PARTITION BY salary ) AS cnt
FROM Employees) AS res
WHERE cnt >1
ORDER BY team_id ASC,employee_id ASC;

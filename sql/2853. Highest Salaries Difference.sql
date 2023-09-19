SELECT 
ABS((SELECT 
MAX(salary) AS v
FROM Salaries
WHERE department = 'Engineering')-(SELECT 
MAX(salary) AS v
FROM Salaries
WHERE department = 'Marketing')) AS salary_difference


# Write your MySQL query statement below
WITH cet
AS (
SELECT
*,
RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS rnk
FROM Salaries)

SELECT
DISTINCT 
ABS(c1.salary - c2.salary) AS salary_difference
FROM cet AS c1
LEFT JOIN cet AS c2
ON c1.rnk = c2.rnk
WHERE c1.rnk = 1 AND c2.rnk = 1 AND c1.department != c2.department

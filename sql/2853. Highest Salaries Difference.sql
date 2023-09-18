SELECT 
ABS((SELECT 
MAX(salary) AS v
FROM Salaries
WHERE department = 'Engineering')-(SELECT 
MAX(salary) AS v
FROM Salaries
WHERE department = 'Marketing')) AS salary_difference

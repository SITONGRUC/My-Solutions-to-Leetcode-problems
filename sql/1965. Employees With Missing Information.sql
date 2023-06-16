# Write your MySQL query statement below
SELECT 
employee_id 
FROM 
(SELECT 
s.employee_id 
FROM Employees AS e
RIGHT JOIN 
Salaries AS s
on s.employee_id  = e.employee_id
WHERE e.name IS NULL
UNION 
SELECT 
e.employee_id 
FROM Employees AS e
LEFT JOIN 
Salaries AS s
on s.employee_id  = e.employee_id
WHERE s.salary IS NULL) AS total
ORDER BY employee_id ;

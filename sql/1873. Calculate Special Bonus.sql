SELECT 
Employees.employee_id,
CASE WHEN bonus IS NULL THEN 0
ELSE bonus END AS bonus
FROM 
Employees
LEFT JOIN 
(SELECT 
employee_id,
salary AS bonus
FROM Employees
WHERE employee_id % 2 != 0 AND name NOT LIKE "M%") AS res
ON res.employee_id = Employees.employee_id
ORDER BY employee_id ASC;

SELECT 
p.employee_id,
e.name,
p.reports_count,
p.average_age
FROM 
(SELECT 
reports_to AS employee_id,
COUNT(employee_id) AS reports_count,
ROUND(AVG(age),0) AS  average_age 
FROM Employees
GROUP BY reports_to
HAVING reports_to IS NOT NULL) AS p
LEFT JOIN  Employees AS e
ON p.employee_id = e.employee_id
ORDER BY employee_id ASC;


SELECT 
e.employee_id,
e.name,
(SELECT COUNT(e1.employee_id) FROM employees AS e1 WHERE e1.reports_to = e.employee_id) AS  reports_count,
ROUND((SELECT AVG(e2.age) FROM employees AS e2 WHERE e2.reports_to = e.employee_id),0) AS average_age
FROM employees AS e
GROUP BY e.employee_id
HAVING average_age IS NOT NULL AND reports_count >0
ORDER BY e.employee_id;


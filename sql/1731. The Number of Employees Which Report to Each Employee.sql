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

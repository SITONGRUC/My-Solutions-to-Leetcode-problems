SELECT 
d.name AS Department,
e.name  AS Employee ,
top.salary AS Salary
FROM 
(SELECT 
departmentId,
MAX(salary) AS salary
FROM Employee
GROUP BY departmentId) AS top
LEFT JOIN 
Employee AS e
ON e.salary = top.salary AND e.departmentId = top.departmentId
LEFT JOIN 
Department AS d
ON d.id = e.departmentId;

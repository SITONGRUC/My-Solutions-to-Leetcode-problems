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

#--------------------------------------------

SELECT 
d.name AS Department,
res.name AS Employee,
res.salary AS salary
FROM 
(SELECT 
*,
RANK() OVER(PARTITION BY departmentId ORDER BY salary DESC) AS rnk
FROM Employee) AS res
LEFT JOIN Department AS d
ON d.id = res.departmentId
WHERE rnk = 1

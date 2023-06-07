# first solution
SELECT name AS Employee
FROM Employee AS e
LEFT JOIN 
(SELECT id,salary AS m_salary
FROM Employee) AS m
ON e.managerId = m.id
WHERE salary > m_salary;

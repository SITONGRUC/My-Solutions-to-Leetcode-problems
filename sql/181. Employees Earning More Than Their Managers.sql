# first solution
SELECT name AS Employee
FROM Employee AS e
LEFT JOIN 
(SELECT id,salary AS m_salary
FROM Employee) AS m
ON e.managerId = m.id
WHERE salary > m_salary;

# Second Solution 
SELECT name AS Employee
FROM (SELECT id AS m_id,salary AS m_salary
FROM Employee) AS manager_salary,
Employee
WHERE managerId  = m_id AND salary > m_salary;

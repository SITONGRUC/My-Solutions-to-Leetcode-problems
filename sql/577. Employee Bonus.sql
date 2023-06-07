SELECT name,bonus
FROM Employee 
LEFT JOIN Bonus
ON Bonus.empId = Employee.empId
WHERE bonus IS NULL OR bonus < 1000;

#Some faster solution


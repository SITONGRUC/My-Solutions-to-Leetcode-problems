SELECT
DISTINCT
name 
FROM 
(SELECT
mentor.id,
mentor.name,
COUNT(mentee.id) AS cnt
FROM
Employee AS mentor
LEFT JOIN 
Employee AS mentee
ON mentee.managerId = mentor.id
GROUP BY mentor.id
HAVING cnt >=5) AS res

#____________dd________

  
SELECT 
name
FROM Employee
WHERE id IN 
(
SELECT 
managerId
FROM Employee
WHERE managerId IS NOT NULL 
GROUP BY managerId
HAVING COUNT(DISTINCT id) >= 5
)

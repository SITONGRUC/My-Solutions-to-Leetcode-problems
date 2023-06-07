# Write your MySQL query statement below
SELECT p.firstName,p.lastName,city,state
FROM Person AS p
LEFT JOIN Address AS a
ON p.personId = a.personId;

# Write your MySQL query statement below
SELECT p.firstName,p.lastName,city,state
FROM Person AS p
LEFT JOIN Address AS a
ON p.personId = a.personId;


SELECT p.firstName,p.lastName,a.city,a.state FROM person AS p
LEFT JOIN 
address AS a 
ON  p.personid = a.personid;


SELECT 
p.firstName ,
p.lastName ,
(SELECT a.city FROM Address AS a WHERE a.personid = p.personid) AS city,
(SELECT a.state FROM Address AS a WHERE a.personid = p.personid) AS state
FROM person AS p;

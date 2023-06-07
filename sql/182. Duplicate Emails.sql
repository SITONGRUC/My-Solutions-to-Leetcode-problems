#First Solution
SELECT email AS Email 
FROM (SELECT email,COUNT(id)
FROM Person 
GROUP BY email
HAVING COUNT(id) >1) AS group_result


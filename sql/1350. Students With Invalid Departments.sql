# Write your MySQL query statement below
SELECT
s.id AS id,
s.name AS name
FROM 
Students AS s
LEFT JOIN Departments AS d
ON s.department_id = d.id
WHERE d.name IS NULL

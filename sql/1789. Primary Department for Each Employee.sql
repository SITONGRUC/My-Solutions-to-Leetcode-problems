# Write your MySQL query statement below
SELECT 
employee_id,
department_id
FROM 
(SELECT 
employee_id,
department_id,
primary_flag,
(CASE WHEN COUNT(primary_flag) OVER(PARTITION BY employee_id)  = 1 THEN 1
ELSE 0 END ) AS cnt
FROM Employee) AS data
WHERE data.cnt= 1 OR (data.cnt= 0 AND primary_flag = 'Y' );

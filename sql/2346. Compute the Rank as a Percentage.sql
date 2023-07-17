# Write your MySQL query statement below
SELECT
student_id ,
department_id ,
CASE WHEN ROUND((rank1-1)*100/(cnt1-1),2) IS NULL THEN 0 ELSE ROUND((rank1-1)*100/(cnt1-1),2) END AS percentage 
FROM
(SELECT
student_id,
department_id,
RANK() OVER(PARTITION BY department_id  ORDER BY mark DESC) AS rank1,
COUNT(student_id) OVER(PARTITION BY department_id ) AS cnt1
FROM Students) AS res

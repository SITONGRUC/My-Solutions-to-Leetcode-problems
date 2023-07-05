# Write your MySQL query statement below
SELECT 
d.dept_name,
CASE WHEN student_number IS NULL THEN 0 ELSE student_number END AS student_number
FROM 
Department AS d
LEFT JOIN
(SELECT
dept_id,
COUNT(student_id) AS student_number
FROM Student
GROUP BY dept_id) AS stu_cnt
ON d.dept_id = stu_cnt.dept_id
ORDER BY student_number DESC,dept_name ASC;

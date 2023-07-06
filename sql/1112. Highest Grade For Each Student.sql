SELECT
student_id,
course_id,
grade
FROM
(SELECT 
student_id,
course_id,
grade,
RANK() OVER(PARTITION BY student_id ORDER BY course_id ASC) AS rank2
FROM
(SELECT
*,
RANK() OVER(PARTITION BY student_id ORDER BY  grade DESC ) AS rank1
FROM Enrollments) AS res
WHERE rank1 = 1) AS res1
WHERE rank2 = 1
ORDER BY student_id ASC;

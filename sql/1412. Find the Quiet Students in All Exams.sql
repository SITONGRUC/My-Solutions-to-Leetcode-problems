SELECT
DISTINCT
e.student_id   AS student_id,
s.student_name  AS student_name  
FROM Exam AS e
LEFT JOIN Student AS s
ON e.student_id=s.student_id
WHERE e.student_id NOT IN 
(
SELECT
student_id 
FROM
(SELECT
*,
MAX(score ) OVER(PARTITION BY exam_id   ) AS mx,
MIN(score) OVER(PARTITION BY exam_id   ) AS mn
FROM Exam) AS res
WHERE score = mx OR  score = mn)
ORDER BY student_id

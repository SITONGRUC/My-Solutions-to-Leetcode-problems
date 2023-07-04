SELECT
DISTINCT
st.student_id,
st.student_name,
su.subject_name,
SUM(CASE WHEN cnt IS NULL THEN 0 ELSE cnt END) OVER(PARTITION BY st.student_id,su.subject_name ) AS attended_exams
FROM 
Students AS st
CROSS JOIN 
Subjects AS su
LEFT JOIN 
(
  SELECT 
  *,
  1 AS cnt
  FROM Examinations
) AS e
ON e.student_id = st.student_id AND e.subject_name = su.subject_name;

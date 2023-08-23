SELECT
school.school_id,
CASE WHEN score IS NULL THEN -1 ELSE score END AS score
FROM 
(SELECT school_id  FROM Schools) AS school
LEFT JOIN 
(SELECT
school_id ,
MIN(score) AS score
FROM Schools AS s
CROSS JOIN 
Exam AS e
WHERE capacity >= student_count 
GROUP BY school_id ) AS res
ON school.school_id = res.school_id

# Write your MySQL query statement below
SELECT DISTINCT c1.candidate_id
FROM Candidates AS c1
LEFT JOIN Candidates AS c2
ON c1.candidate_id = c2.candidate_id
LEFT JOIN Candidates AS c3
ON c1.candidate_id = c3.candidate_id
WHERE c1.skill = "Python" AND c2.skill = "Tableau" AND c3.skill = "PostgreSQL"
ORDER BY c1.candidate_id ASC;


-- OR


SELECT c.candidate_id FROM Candidates AS c WHERE c.skill = "Python"
INTERSECT
SELECT c.candidate_id FROM Candidates AS c WHERE c.skill = "Tableau"
INTERSECT
SELECT c.candidate_id FROM Candidates AS c WHERE c.skill = "PostgreSQL"
ORDER BY candidate_id  ASC;

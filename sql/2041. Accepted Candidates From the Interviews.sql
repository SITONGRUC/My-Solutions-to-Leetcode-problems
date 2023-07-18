# Write your MySQL query statement below

SELECT
candidate_id 
FROM Candidates 
WHERE years_of_exp >=2
AND 
interview_id  IN (
SELECT interview_id 
FROM Rounds 
GROUP BY interview_id 
HAVING SUM(score) >15) ;

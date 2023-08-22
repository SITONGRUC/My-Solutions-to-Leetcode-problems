# Write your MySQL query statement below
WITH cet AS (

SELECT
v.candidate,
SUM(cnt) AS vote
FROM 
Votes AS v
LEFT JOIN (
SELECT 
voter,
1/COUNT(candidate) AS cnt
FROM Votes
GROUP BY voter) AS res
ON res.voter   = v.voter    
GROUP BY v.candidate)

SELECT 
candidate 
FROM cet
WHERE vote = (SELECT MAX(vote) FROM cet)
ORDER BY candidate  ASC;

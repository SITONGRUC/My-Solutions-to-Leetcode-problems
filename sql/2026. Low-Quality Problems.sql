# Write your MySQL query statement below

SELECT
DISTINCT
problem_id 
FROM Problems
WHERE 
likes/(dislikes+likes) < 0.6
ORDER BY problem_id ASC;

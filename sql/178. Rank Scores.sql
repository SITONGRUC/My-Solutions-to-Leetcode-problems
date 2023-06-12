# Write your MySQL query statement below
SELECT 
orgin.score,
srank AS 'rank' #Pay attention to THIS
FROM Scores AS orgin
LEFT JOIN (SELECT 
score,
RANK() OVER(ORDER BY score DESC) AS srank
FROM (SELECT DISTINCT score FROM Scores) AS s) AS result
ON result.score = orgin.score
ORDER BY score DESC;


#Or just using dense_rank()

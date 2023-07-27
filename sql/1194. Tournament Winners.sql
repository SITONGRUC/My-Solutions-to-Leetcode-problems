# Write your MySQL query statement below
SELECT
group_id,
player_id
FROM (
SELECT
p.group_id,
p.player_id ,
RANK() OVER(PARTITION BY group_id  ORDER BY score DESC,p.player_id ASC) AS rnk
FROM Players AS p
LEFT JOIN
(SELECT
player_id ,
SUM(score) AS score 
FROM (
SELECT first_player AS player_id , first_score AS score FROM Matches
UNION ALL 
SELECT second_player AS player_id , second_score AS score FROM Matches ) AS res
GROUP BY player_id ) AS result
ON p.player_id = result.player_id ) AS result1
WHERE rnk = 1

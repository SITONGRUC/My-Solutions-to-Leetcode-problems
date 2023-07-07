# Write your MySQL query statement below
SELECT
t.team_id,
t.team_name,
CASE WHEN SUM(res.num_points) IS NULL THEN 0 ELSE SUM(res.num_points) END   AS num_points
FROM 
Teams AS t
LEFT JOIN
(SELECT
host_team AS team_id,
CASE WHEN host_goals > guest_goals THEN 3 
WHEN host_goals = guest_goals THEN 1
ELSE 0 END AS num_points 
FROM Matches
UNION ALL 
SELECT
guest_team AS team_id ,
CASE WHEN host_goals > guest_goals THEN 0
WHEN host_goals = guest_goals THEN 1
ELSE 3 END AS num_points 
FROM Matches ) AS res
ON t.team_id = res.team_id
GROUP BY t.team_id
ORDER BY CASE WHEN SUM(res.num_points) IS NULL THEN 0 ELSE SUM(res.num_points) END  DESC,t.team_id ASC

# Write your MySQL query statement below
SELECT
t.team_name,
res.matches_played,
res.points,
res.goal_for,
res.goal_against,
res.goal_for-res.goal_against AS goal_diff
FROM
(SELECT
home_team_id,
COUNT(home_team_id) AS matches_played,
SUM(home_team_goals) AS goal_for,
SUM(away_team_goals) AS goal_against,
SUM(CASE WHEN home_team_goals > away_team_goals THEN 3 
WHEN home_team_goals < away_team_goals THEN 0
ELSE 1 END) AS points 
FROM 
(SELECT * FROM Matches
UNION ALL 
SELECT away_team_id,home_team_id,away_team_goals,home_team_goals FROM Matches) AS matches_dup
GROUP BY home_team_id) AS res
LEFT JOIN Teams AS t
ON t.team_id = res.home_team_id
ORDER BY points DESC,goal_diff DESC,team_name ASC;

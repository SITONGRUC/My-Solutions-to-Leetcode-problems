# Write your MySQL query statement below
SELECT
*
FROM
(SELECT team_name AS home_team  FROM Teams ) AS home
CROSS JOIN 
(SELECT team_name AS away_team  FROM Teams ) AS away
WHERE home_team != away_team

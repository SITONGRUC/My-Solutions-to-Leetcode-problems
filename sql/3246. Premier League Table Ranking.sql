SELECT 
t.team_id,
t.team_name,
t.wins*3+t.draws*1 AS points,
RANK() OVER(ORDER BY t.wins*3+t.draws*1 DESC) AS position
FROM TeamStats AS t
ORDER BY position ASC,team_name ASC;


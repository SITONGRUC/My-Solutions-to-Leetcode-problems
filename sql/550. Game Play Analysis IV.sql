SELECT
CASE WHEN fraction IS NOT NULL THEN fraction ELSE 0 END AS fraction
FROM(
SELECT
 ROUND(COUNT(DISTINCT res.player_id)/COUNT(DISTINCT act.player_id),2) AS fraction
FROM
(SELECT
player_id,
DATE_ADD(MIN(event_date), INTERVAL 1 DAY) AS first_day
FROM Activity
GROUP BY player_id
INTERSECT
SELECT
player_id,
event_date AS first_day
FROM Activity) AS res,
Activity AS act) AS fraction




WITH 
sec AS (
       SELECT
    player_id,
    DATE_ADD(MIN(event_date), INTERVAL 1 DAY) AS sec
    FROM Activity
    GROUP BY player_id
)

SELECT
CASE WHEN ROUND(COUNT(DISTINCT c.player_id)/COUNT(DISTINCT a.player_id),2) IS NOT NULL THEN ROUND(COUNT(DISTINCT c.player_id)/COUNT(DISTINCT a.player_id),2) ELSE 0 END AS fraction
FROM Activity AS a
LEFT JOIN sec AS c
ON a.player_id = c.player_id AND a.event_date = c.sec


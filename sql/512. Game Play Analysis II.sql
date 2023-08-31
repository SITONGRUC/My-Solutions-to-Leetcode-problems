# Write your MySQL query statement below
SELECT
a.player_id ,
a.device_id
FROM
(SELECT 
player_id,
MIN(event_date) AS event_date
FROM Activity
GROUP BY player_id) AS res
LEFT JOIN Activity AS a
ON a.event_date = res.event_date AND a.player_id = res.player_id
#_________________________________________________________________________________--

SELECT 
player_id ,
device_id 
FROM (
SELECT
*,
RANK() OVER(PARTITION BY player_id  ORDER BY event_date  ASC ) AS rnk
FROM Activity ) AS res
WHERE rnk = 1

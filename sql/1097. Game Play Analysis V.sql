# Write your MySQL query statement below
SELECT
first_date  AS install_dt ,
SUM(CASE WHEN event_date=first_date THEN 1 ELSE 0 END ) AS installs ,


ROUND(SUM(CASE WHEN DATE_ADD(first_date,INTERVAL 1 DAY) = event_date THEN 1 ELSE 0 END)/SUM(CASE WHEN event_date=first_date THEN 1 ELSE 0 END ),2) AS Day1_retention 


FROM (
SELECT
*,
MIN(event_date ) OVER(PARTITION BY player_id ) AS first_date
FROM Activity ) AS res
GROUP BY first_date

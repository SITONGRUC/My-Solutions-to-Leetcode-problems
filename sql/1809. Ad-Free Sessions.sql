# Write your MySQL query statement below
SELECT 
session_id
FROM
(SELECT
session_id,
SUM(CASE WHEN timestamp BETWEEN start_time AND end_time THEN 1
ELSE 0 END) AS judge
FROM
Ads AS a
RIGHT JOIN Playback AS p
ON a.customer_id = p.customer_id
GROUP BY session_id
HAVING judge = 0) AS res

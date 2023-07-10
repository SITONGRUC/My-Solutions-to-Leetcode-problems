# Write your MySQL query statement below
SELECT
from_id AS person1,
to_id AS person2,
COUNT(duration) AS call_count,
SUM(duration) AS total_duration
FROM
(SELECT
CASE WHEN from_id > to_id THEN to_id ELSE from_id END AS from_id,
CASE WHEN from_id < to_id THEN to_id ELSE from_id END AS to_id,
duration
FROM Calls) AS res
GROUP BY from_id,to_id;

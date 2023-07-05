# Write your MySQL query statement below
SELECT
DISTINCT
id,
COUNT(id) OVER(PARTITION BY id) AS num
FROM
(SELECT requester_id  AS id FROM RequestAccepted
UNION ALL
SELECT accepter_id AS id FROM RequestAccepted) AS res
ORDER BY num DESC
LIMIT 1;

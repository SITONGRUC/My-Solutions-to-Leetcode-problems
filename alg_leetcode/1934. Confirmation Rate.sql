# Write your MySQL query statement below
SELECT
s.user_id,
ROUND(CASE WHEN SUM(CASE WHEN action = 'confirmed' THEN 1 END)/COUNT(action) IS NULL THEN 0 ELSE SUM(CASE WHEN action = 'confirmed' THEN 1 END)/COUNT(action) END,2) AS confirmation_rate
FROM
Signups AS s
LEFT JOIN Confirmations AS c
ON s.user_id  = c.user_id
GROUP BY s.user_id

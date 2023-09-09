# Write your MySQL query statement below

SELECT
u.user_id,
u.name,
CASE WHEN sm IS NULL THEN 0 ELSE sm END AS "traveled distance"
FROM Users AS u
LEFT JOIN (
SELECT
user_id ,
SUM(distance) AS sm
FROM Rides 
GROUP BY user_id) AS s
ON u.user_id = s.user_id
ORDER BY u.user_id ASC

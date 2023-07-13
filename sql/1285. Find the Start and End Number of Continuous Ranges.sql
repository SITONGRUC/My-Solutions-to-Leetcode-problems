# Write your MySQL query statement below
SELECT
start_id ,
end_id
FROM
(SELECT
RANK() OVER(ORDER BY log_id) AS rnk,
log_id  AS start_id
FROM 
(SELECT
*,
(LAG(log_id,1) OVER(ORDER BY log_id))+1 AS lag1,
(LEAD(log_id,1) OVER(ORDER BY log_id))-1 AS lead1
FROM Logs) AS res
WHERE CASE WHEN lag1 IS NULL THEN 0 ELSE lag1 END != log_id) AS start
LEFT JOIN
(SELECT
RANK() OVER(ORDER BY log_id) AS rnk,
log_id  AS end_id
FROM 
(SELECT
*,
(LAG(log_id,1) OVER(ORDER BY log_id))+1 AS lag1,
(LEAD(log_id,1) OVER(ORDER BY log_id))-1 AS lead1
FROM Logs) AS res
WHERE CASE WHEN lead1 IS NULL THEN 0 ELSE lead1 END != log_id) AS end
ON start.rnk = end.rnk

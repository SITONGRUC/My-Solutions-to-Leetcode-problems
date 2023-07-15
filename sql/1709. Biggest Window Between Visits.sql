# # Write your MySQL query statement below
SELECT
user_id,
MAX(biggest_window) AS biggest_window
FROM 
(SELECT
user_id,
ABS(DATEDIFF(LAG(visit_date,1) OVER(PARTITION BY user_id ORDER BY visit_date),visit_date)) AS biggest_window
FROM (
SELECT * FROM UserVisits
UNION ALL
(SELECT
DISTINCT user_id,
'2021-1-1' AS visit_date 
FROM UserVisits)) AS u) AS res
GROUP BY user_id
ORDER BY user_id;

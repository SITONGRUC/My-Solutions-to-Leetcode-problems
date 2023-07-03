# Write your MySQL query statement below
SELECT 
CASE WHEN average_sessions_per_user IS NOT NULL THEN average_sessions_per_user
ELSE 0 END AS average_sessions_per_user
FROM
(SELECT
ROUND(COUNT(DISTINCT session_id)/COUNT(DISTINCT user_id) ,2) AS average_sessions_per_user
FROM Activity
WHERE activity_date BETWEEN DATE_ADD('2019-07-27', INTERVAL -29 DAY) AND '2019-07-27

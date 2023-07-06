# Write your MySQL query statement below
SELECT
first_login AS login_date,
COUNT(user_id) AS user_count
FROM
(SELECT
user_id,
MIN(activity_date) AS first_login
FROM Traffic
WHERE activity = 'login'
GROUP BY user_id
HAVING MIN(activity_date) BETWEEN DATE_ADD('2019-06-30',INTERVAL -90 DAY) AND '2019-06-30') AS res
GROUP BY first_login

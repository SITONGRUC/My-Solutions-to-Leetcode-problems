
WITH cet AS (
SELECT
user_id,
steps_date
FROM (
SELECT 
*,
DATE_ADD(LEAD(steps_date,1) OVER(PARTITION BY user_id ORDER BY steps_date ASC), INTERVAL -1 DAY) AS ld,
DATE_ADD(LAG(steps_date,1) OVER(PARTITION BY user_id ORDER BY steps_date ASC), INTERVAL 1 DAY)  AS lg
FROM Steps) AS res
WHERE steps_date = ld AND lg = steps_date)

SELECT
user_id,
steps_date,
ROUND(rolling_average,2) AS rolling_average
FROM (
SELECT
*,
AVG(steps_count) OVER(PARTITION BY user_id ORDER BY steps_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS rolling_average,
ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY steps_date) AS cnt
FROM (
SELECT
DISTINCT 
s.user_id,
s.steps_date,
s.steps_count
FROM 
(SELECT user_id,steps_date FROM cet
UNION 
SELECT user_id,DATE_ADD(steps_date,INTERVAL -1 DAY) FROM cet
UNION 
SELECT user_id,DATE_ADD(steps_date,INTERVAL 1 DAY) FROM cet) AS date_list
LEFT JOIN Steps AS s
ON s.user_id = date_list.user_id AND s.steps_date = date_list.steps_date) AS result) AS result2
WHERE CNT >=3
ORDER BY user_id ASC,steps_date ASC

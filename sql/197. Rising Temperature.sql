#pay attention to the function we use
SELECT id
FROM (SELECT 
id,
recordDate AS today,
DATE_ADD(recordDate,INTERVAL -1 DAY) AS yesterday,
temperature AS today_tem
FROM Weather) AS a
LEFT JOIN 
(SELECT recordDate AS today,
temperature AS yesterday_tem
FROM Weather
) AS b 
ON a.yesterday = b.today
WHERE today_tem>yesterday_tem

# Write your MySQL query statement below
SELECT w.id FROM Weather AS w
LEFT JOIN (
SELECT *,DATE_ADD(recordDate, INTERVAL 1 DAY) AS date FROM Weather AS w) AS last_day
ON w.recordDate = last_day.date
WHERE w.temperature -last_day.temperature >0

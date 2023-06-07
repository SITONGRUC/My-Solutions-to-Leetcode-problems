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

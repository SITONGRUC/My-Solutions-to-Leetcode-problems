# Write your MySQL query statement below
SELECT 
machine_id,
ROUND(AVG(duration_time),3)  AS processing_time
FROM (SELECT
machine_id,
MAX(timestamp) OVER(PARTITION BY machine_id,process_id)-MIN(timestamp) OVER(PARTITION BY machine_id,process_id) AS  duration_time
FROM Activity) AS t
GROUP BY machine_id;

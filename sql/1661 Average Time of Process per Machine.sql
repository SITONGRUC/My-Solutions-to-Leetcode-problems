# Write your MySQL query statement below
SELECT 
machine_id,
ROUND(AVG(duration_time),3)  AS processing_time
FROM (SELECT
machine_id,
MAX(timestamp) OVER(PARTITION BY machine_id,process_id)-MIN(timestamp) OVER(PARTITION BY machine_id,process_id) AS  duration_time
FROM Activity) AS t
GROUP BY machine_id;



SELECT 
a.machine_id,
ROUND(AVG((SELECT timestamp FROM Activity AS end WHERE end.activity_type = 'end' AND a.machine_id = end.machine_id AND a.process_id = end.process_id )-
(SELECT timestamp FROM Activity AS start WHERE start.activity_type = 'start' AND a.machine_id = start.machine_id AND a.process_id = start.process_id )),3) AS processing_time
FROM Activity AS a
GROUP BY a.machine_id;

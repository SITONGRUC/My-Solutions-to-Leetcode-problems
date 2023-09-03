# Write your MySQL query statement below
WITH RECURSIVE seq AS (
    SELECT (SELECT MAX(subtasks_count) FROM Tasks) AS value UNION ALL SELECT value -1 FROM seq WHERE value > 1
    )


SELECT
t.task_id AS task_id,
s.value AS subtask_id
FROM Tasks AS t
CROSS JOIN 
seq AS s
LEFT JOIN Executed AS e
ON e.task_id = t.task_id AND e.subtask_id = s.value
WHERE s.value <= subtasks_count AND e.task_id IS NULL 




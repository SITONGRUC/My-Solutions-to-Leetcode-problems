# Write your MySQL query statement below
SELECT
DISTINCT
user_id
FROM (
SELECT
user_id,
DATEDIFF(created_at ,LAG(created_at ,1) OVER(PARTITION BY user_id ORDER BY created_at ASC ) ) AS diff
FROM Users ) AS res
WHERE diff <= 7

# Write your MySQL query statement below
WITH cet AS (
    SELECT user1  ,user2 FROM Friends 
    UNION ALL 
    SELECT user2  ,user1 FROM Friends 
)

SELECT
user1,
ROUND(100*COUNT(DISTINCT user2)/(SELECT COUNT(DISTINCT user1) FROM cet),2) AS percentage_popularity 
FROM cet
GROUP BY user1
ORDER BY user1 ASC

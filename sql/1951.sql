WITH result1 AS (SELECT
r1.user_id AS user1_id,
r2.user_id AS user2_id,
COUNT(r1.follower_id ) AS cnt
FROM Relations AS r1
LEFT JOIN Relations AS r2
ON r1.follower_id = r2.follower_id 
WHERE r1.user_id < r2.user_id 
GROUP BY r1.user_id , r2.user_id ) 

SELECT 
user1_id,
user2_id
FROM  result1
WHERE cnt = (SELECT MAX(cnt) FROM result1)

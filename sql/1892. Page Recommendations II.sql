# Write your MySQL query statement below
WITH 
cte1 AS
( SELECT
user1_id AS id,
user2_id  AS f_id
FROM (
  SELECT * FROM Friendship 
  UNION ALL 
  SELECT user2_id AS user1_id, user1_id AS user2_id   FROM Friendship ) AS res
)


SELECT
res.id AS user_id ,
res.page_id AS page_id ,
res.friends_likes 
FROM 
(SELECT 
id,
page_id,
COUNT(page_id) AS friends_likes 
FROM cte1
LEFT JOIN Likes AS l
ON cte1.f_id = l.user_id
GROUP BY id,page_id) AS res
LEFT JOIN Likes AS l
ON l.user_id = res.id AND l.page_id = res.page_id
WHERE l.user_id IS NULL 

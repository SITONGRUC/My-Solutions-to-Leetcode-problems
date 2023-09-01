SELECT 
DISTINCT page_id AS recommended_page
FROM Likes
WHERE (user_id IN (SELECT user1_id FROM 
Friendship WHERE user2_id = 1) OR user_id IN (SELECT user2_id FROM 
Friendship WHERE user1_id = 1)  ) AND
page_id NOT IN (SELECT page_id FROM Likes WHERE user_id = 1 )

SELECT
DISTINCT page_id AS recommended_page
FROM 
(SELECT user1_id AS first, user2_id AS second FROM Friendship
UNION ALL 
SELECT user2_id AS first, user1_id AS second FROM Friendship) AS res
LEFT JOIN Likes AS l
ON l.user_id = res.second
WHERE first IN (1)
AND 
page_id NOT IN (
    SELECT page_id FROM Likes WHERE user_id = 1
)
AND page_id IS NOT NULL 

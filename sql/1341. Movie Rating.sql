# Write your MySQL query statement below
SELECT
name AS results
FROM
(SELECT
mr.user_id,
u.name,
COUNT(mr.movie_id)
FROM  MovieRating AS mr
LEFT JOIN  Users AS u
ON u.user_id = mr.user_id
GROUP BY mr.user_id
ORDER BY COUNT(mr.movie_id) DESC,name ASC
LIMIT 1) AS name
UNION ALL
SELECT
title AS results
FROM 
(SELECT
mr.movie_id,
m.title,
AVG(rating)
FROM  MovieRating AS mr
LEFT JOIN  Movies AS m
ON m.movie_id = mr.movie_id
WHERE SUBSTR(created_at,1,7) = '2020-02'
GROUP BY mr.movie_id
ORDER BY AVG(rating) DESC, m.title ASC
LIMIT 1) AS title

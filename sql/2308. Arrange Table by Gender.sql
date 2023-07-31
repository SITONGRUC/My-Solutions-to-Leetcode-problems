# Write your MySQL query statement below
SELECT
res.user_id,
name.gender
FROM
(SELECT
DISTINCT
CEIL(user_id/3) AS no
FROM Genders
ORDER BY CEIL(user_id/3) ) AS number
CROSS JOIN 
(SELECT 'male' AS gender
UNION 
SELECT 'other' AS gender
UNION 
SELECT 'female' AS gender) AS name
LEFT JOIN
(SELECT
*,
RANK() OVER(PARTITION BY gender ORDER BY user_id) AS no
FROM Genders) AS res
ON name.gender = res.gender AND number.no = res.no

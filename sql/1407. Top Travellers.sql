# Write your MySQL query statement below
SELECT 
U2.name  AS name,
CASE WHEN U1.travelled_distance  IS NOT NULL THEN U1.travelled_distance 
ELSE 0 END AS travelled_distance 
FROM 
Users AS U2
LEFT JOIN 
(SELECT 
user_id,
SUM(distance) AS travelled_distance 
FROM Rides
GROUP BY user_id) AS U1
ON U1.user_id = U2.id
ORDER BY travelled_distance DESC,name ASC;

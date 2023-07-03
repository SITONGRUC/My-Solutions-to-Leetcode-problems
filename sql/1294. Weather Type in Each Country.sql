# Write your MySQL query statement below
SELECT 
country_name,
CASE WHEN avg_tem <= 15 THEN 'Cold'
WHEN avg_tem >= 25 THEN 'Hot'
ELSE 'Warm' END AS weather_type
FROM 
(SELECT 
country_name,
AVG(weather_state) AS avg_tem
FROM Weather AS w
LEFT JOIN Countries AS c
ON w.country_id = c.country_id
WHERE day BETWEEN '2019-11-01' AND '2019-11-30'
GROUP BY country_name) AS res

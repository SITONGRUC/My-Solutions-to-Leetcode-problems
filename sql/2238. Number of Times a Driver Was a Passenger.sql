# Write your MySQL query statement below
SELECT
driver_id ,
CASE WHEN cnt  IS NULL THEN 0 ELSE cnt  END AS cnt
FROM
(SELECT
DISTINCT driver_id 
FROM Rides ) AS first
LEFT JOIN 
(SELECT
passenger_id ,
COUNT(ride_id ) AS cnt
FROM Rides 
GROUP BY passenger_id) AS r
ON r.passenger_id  = first.driver_id 

SELECT
DISTINCT 
r.driver_id,
CASE WHEN res.cnt IS NULL THEN 0 ELSE res.cnt END AS cnt
FROM 
Rides AS r
LEFT JOIN 
(SELECT
passenger_id AS driver_id,
COUNT(ride_id) AS cnt
FROM Rides
WHERE passenger_id IN (SELECT driver_id FROM Rides)
GROUP BY passenger_id) AS res
ON r.driver_id = res.driver_id


SELECT
DISTINCT 
r1.driver_id,
COUNT(DISTINCT r2.ride_id) AS cnt
FROM 
Rides AS r1
LEFT JOIN Rides AS r2
ON r1.driver_id = r2.passenger_id
GROUP BY r1.driver_id

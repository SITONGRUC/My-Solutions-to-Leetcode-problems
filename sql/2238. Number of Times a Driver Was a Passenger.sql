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

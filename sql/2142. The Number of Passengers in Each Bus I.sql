SELECT
bus_id,
judge-(CASE WHEN LAG(judge,1) OVER(ORDER BY arrival_time) IS NULL THEN 0 ELSE LAG(judge,1) OVER(ORDER BY arrival_time) END ) AS passengers_cnt
FROM (
SELECT
bus_id,
Buses.arrival_time,
SUM(CASE WHEN Buses.arrival_time >= Passengers.arrival_time THEN 1 ELSE 0 END) AS judge
FROM Buses
CROSS JOIN 
Passengers
GROUP BY bus_id
ORDER BY Buses.arrival_time) AS res
ORDER BY bus_id ASC

# Write your MySQL query statement below
SELECT
passenger_id ,
CASE WHEN sm <= capacity THEN 'Confirmed' ELSE 'Waitlist' END AS Status
FROM (
SELECT
*,
SUM(1) OVER(PARTITION BY flight_id ORDER BY booking_time ASC ) AS sm
FROM Passengers ) AS res
LEFT JOIN Flights AS f
ON f.flight_id = res.flight_id
ORDER BY passenger_id ASC

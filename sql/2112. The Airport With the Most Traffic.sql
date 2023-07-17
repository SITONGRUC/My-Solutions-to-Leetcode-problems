# Write your MySQL query statement below
SELECT
airport_id
FROM
(SELECT
airport_id,
RANK() OVER(ORDER BY sm DESC) AS rank1
FROM
(
SELECT 
airport_id,
SUM(flights_count ) AS sm
FROM (
SELECT departure_airport AS airport_id,flights_count FROM Flights
UNION ALL 
SELECT arrival_airport AS airport_id,flights_count FROM Flights
) AS res
GROUP BY airport_id
ORDER BY SUM(flights_count ) DESC ) AS res1 ) AS res2
WHERE rank1 = 1

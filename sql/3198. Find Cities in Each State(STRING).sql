# Write your MySQL query statement below
SELECT c.state,
GROUP_CONCAT(DISTINCT c.city ORDER BY c.city ASC SEPARATOR ', ') AS cities
FROM cities AS c
GROUP BY c.state
ORDER BY c.state,cities;

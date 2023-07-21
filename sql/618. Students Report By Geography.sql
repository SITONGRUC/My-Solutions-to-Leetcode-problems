# Write your MySQL query statement below
SELECT
America,
Asia,
Europe
FROM 
(SELECT name AS America,
ROW_NUMBER() OVER() AS rnk
FROM Student WHERE continent = 'America'
ORDER BY name ASC) AS America
LEFT JOIN 
(SELECT name AS Asia ,
ROW_NUMBER() OVER() AS rnk
FROM Student WHERE continent = 'Asia'
ORDER BY name ASC) AS Asia
ON Asia.rnk = America.rnk
LEFT JOIN 
(SELECT name AS Europe,
ROW_NUMBER() OVER() AS rnk
FROM Student WHERE continent = 'Europe'
ORDER BY name ASC) AS Europe
ON Europe.rnk = America.rnk

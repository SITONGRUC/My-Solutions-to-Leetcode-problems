# Write your MySQL query statement below
SELECT
city_id ,
day,
degree 
FROM
(SELECT
*,
RANK() OVER(PARTITION BY city_id ORDER BY degree DESC,day ASC) AS rnk
FROM Weather ) AS rnk
WHERE rnk=1
ORDER BY city_id

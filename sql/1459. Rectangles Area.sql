# Write your MySQL query statement below
SELECT
DISTINCT
CASE WHEN p1.id > p2.id THEN p2.id ELSE p1.id END AS p1,
CASE WHEN p1.id > p2.id THEN p1.id ELSE p2.id END AS p2,
ABS(p1.x_value-p2.x_value)*ABS(p1.y_value-p2.y_value) AS area
FROM
Points AS p1
CROSS JOIN Points AS p2
WHERE p1.id != p2.id AND ABS(p1.x_value-p2.x_value)*ABS(p1.y_value-p2.y_value) != 0
ORDER BY area DESC,p1 ASC,p2 ASC

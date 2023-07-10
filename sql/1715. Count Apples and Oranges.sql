# Write your MySQL query statement below
SELECT
SUM(b.apple_count + CASE WHEN c.apple_count IS NULL THEN 0 ELSE c.apple_count END) AS apple_count,
SUM(b.orange_count + CASE WHEN c.orange_count IS NULL THEN 0 ELSE c.orange_count END) AS orange_count
FROM
Boxes AS b
LEFT JOIN Chests AS c
ON b.chest_id = c.chest_id

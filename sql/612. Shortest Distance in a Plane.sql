# Write your MySQL query statement below
SELECT
MIN(ROUND(SQRT((p1.x-p2.x)*(p1.x-p2.x)+ (p1.y-p2.y)*(p1.y-p2.y)),2)) AS shortest
FROM 
Point2D AS p1
CROSS JOIN 
Point2D AS p2
WHERE p1.x != p2.x OR p1.y != p2.y

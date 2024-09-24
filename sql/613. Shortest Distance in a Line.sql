# Write your MySQL query statement below
SELECT
MIN(ABS(p1.x-p2.x)) AS shortest 
FROM Point AS p2
CROSS JOIN 
Point AS p1
WHERE p1.x != p2.x;

# There is no difference

SELECT MIN(ABS(p1.x-p2.x)) AS shortest
FROM Point AS p1,Point AS p2
WHERE p1.x != p2.x;


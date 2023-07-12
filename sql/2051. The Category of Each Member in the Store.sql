# Write your MySQL query statement below
SELECT
m.member_id,
m.name,
CASE WHEN conversion_rate>= 80 THEN 'Diamond'
WHEN conversion_rate< 80 AND conversion_rate>=50 THEN 'Gold'
WHEN conversion_rate<50 THEN 'Silver'
ELSE 'Bronze' END AS category 
FROM 
Members AS m
LEFT JOIN
(SELECT
v.member_id,
100*SUM(CASE WHEN charged_amount IS NOT NULL THEN 1 ELSE 0 END)/COUNT(v.visit_id) AS conversion_rate 
FROM
Visits AS v
LEFT JOIN 
Purchases AS p
ON v.visit_id = p.visit_id
GROUP BY v.member_id) AS res
ON m.member_id=res.member_id

# Write your MySQL query statement below
SELECT 
a.date_id,
a.make_name,
unique_leads,
unique_partners
FROM 
(SELECT 
date_id,
make_name,
COUNT(DISTINCT lead_id)  AS unique_leads
FROM DailySales
GROUP BY date_id,make_name) AS a
INNER JOIN 
(SELECT 
date_id,
make_name,
COUNT(DISTINCT partner_id)  AS unique_partners
FROM DailySales
GROUP BY date_id,make_name) AS b
ON b.date_id = a.date_id AND a.make_name = b.make_name;


SELECT
d.date_id,
d.make_name,
(SELECT COUNT(DISTINCT lead_id) FROM DailySales AS d1 WHERE d1.date_id = d.date_id AND d1.make_name = d.make_name) AS unique_leads,
(SELECT COUNT(DISTINCT partner_id) FROM DailySales AS d2 WHERE d2.date_id = d.date_id AND d2.make_name = d.make_name) AS unique_partners
FROM DailySales AS d
GROUP BY d.date_id,d.make_name;

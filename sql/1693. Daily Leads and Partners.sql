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

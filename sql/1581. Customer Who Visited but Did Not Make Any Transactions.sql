SELECT 
customer_id,
SUM(
  CASE WHEN amount IS NULL THEN 1 
  ELSE 0 END 
  ) AS count_no_trans
FROM Visits AS v
LEFT JOIN 
Transactions AS t
ON t.visit_id = v.visit_id
GROUP BY  customer_id 
HAVING count_no_trans != 0;



SELECT
customer_id,
COUNT(visit_id) AS count_no_trans
FROM Visits
WHERE visit_id NOT IN (SELECT visit_id FROM Transactions )
GROUP BY customer_id;


SELECT 
v.customer_id,
SUM(CASE 
WHEN v.visit_id IN (SELECT DISTINCT t.visit_id FROM transactions AS t) THEN 0 ELSE 1 END ) AS count_no_trans
FROM visits AS v
GROUP BY v.customer_id
HAVING count_no_trans > 0;

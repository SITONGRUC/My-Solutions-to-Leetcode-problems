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

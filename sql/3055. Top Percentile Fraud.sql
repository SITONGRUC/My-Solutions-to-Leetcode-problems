# Write your MySQL query statement below
SELECT policy_id,state,fraud_score FROM 
(
SELECT f1.policy_id,f1.state,RANK() OVER(PARTITION BY f1.state ORDER BY f1.fraud_score DESC )-1 AS rnk,f2.cnt,f1.fraud_score 
FROM Fraud AS f1
LEFT JOIN 
(SELECT state,COUNT(*) AS cnt FROM Fraud GROUP BY state) AS f2
ON f1.state = f2.state) AS output
WHERE rnk/cnt < 0.05
ORDER BY state ASC,fraud_score DESC,policy_id ASC;



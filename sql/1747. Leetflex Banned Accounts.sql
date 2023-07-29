# Write your MySQL query statement below
SELECT 
DISTINCT
l1.account_id  AS account_id
FROM 
LogInfo AS l1
CROSS JOIN 
LogInfo AS l2
WHERE l1.account_id  = l2.account_id AND l1.ip_address  > l2.ip_address AND (CASE WHEN (l1.login BETWEEN l2.login  AND l2.logout) OR (l1.logout BETWEEN l2.login  AND l2.logout) OR
(l2.login BETWEEN l1.login  AND l1.logout) OR (l2.logout BETWEEN l1.login  AND l1.logout) THEN 1 ELSE 0 END) = 1

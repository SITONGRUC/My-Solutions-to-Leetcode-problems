# Write your MySQL query statement below
(SELECT DISTINCT l.user_id
FROM Loans AS l
WHERE l.loan_type = 'Refinance'
GROUP BY l.user_id
HAVING COUNT(loan_id) >=1)
INTERSECT 
(SELECT DISTINCT l.user_id
FROM Loans AS l
WHERE l.loan_type = 'Mortgage'
GROUP BY l.user_id
HAVING COUNT(loan_id) >=1)
ORDER BY user_id;




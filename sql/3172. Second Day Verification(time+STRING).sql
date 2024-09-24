# Write your MySQL query statement below
SELECT e.user_id
FROM emails  AS e
LEFT JOIN texts AS t
ON e.email_id = t.email_id
WHERE 
signup_action = "Verified"
AND 
DATE_ADD(SUBSTR(e.signup_date,1,10) , INTERVAL +1 DAY) = SUBSTR(t.action_date,1,10)
ORDER BY e.user_id

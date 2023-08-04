# Write your MySQL query statement below

SELECT 
COUNT(*) AS accounts_count 
FROM Subscriptions
WHERE 
(start_date BETWEEN '2021-01-01' AND '2021-12-31'
OR 
end_date   BETWEEN '2021-01-01' AND '2021-12-31')
AND 
account_id NOT IN (
SELECT
account_id
FROM Streams
WHERE 
EXTRACT(year FROM stream_date) = 2021)

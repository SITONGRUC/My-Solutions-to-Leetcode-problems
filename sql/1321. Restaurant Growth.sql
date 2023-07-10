SELECT
*,
ROUND(amount/7,2) AS average_amount
FROM 
(SELECT
DISTINCT 
visited_on,
SUM(amount) OVER(ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW ) AS amount
FROM
(SELECT
visited_on,
SUM(amount) AS amount 
FROM Customer
GROUP BY visited_on) AS res) AS step2
WHERE visited_on >= DATE_ADD(
  (SELECT MIN(visited_on) FROM Customer) , INTERVAL 6 DAY
)
ORDER BY visited_on ASC;

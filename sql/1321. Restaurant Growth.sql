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


# Write your MySQL query statement below
SELECT
    visited_on,
    (
        SELECT SUM(amount)
        FROM customer
        WHERE visited_on BETWEEN DATE_SUB(c.visited_on, INTERVAL 6 DAY) AND c.visited_on
    ) AS amount,
    ROUND(
        (
            SELECT SUM(amount) / 7
            FROM customer
            WHERE visited_on BETWEEN DATE_SUB(c.visited_on, INTERVAL 6 DAY) AND c.visited_on
        ),
        2
    ) AS average_amount
FROM customer c
WHERE visited_on >= (
        SELECT DATE_ADD(MIN(visited_on), INTERVAL 6 DAY)
        FROM customer
    )
GROUP BY visited_on;

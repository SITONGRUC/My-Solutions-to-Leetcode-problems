WITH cet AS(
SELECT
*,
LAG(contest_id,1) OVER(PARTITION BY user_id ORDER BY contest_id)+1 AS lg,
LEAD(contest_id,1) OVER(PARTITION BY user_id ORDER BY contest_id)-1 AS ld
FROM  (
    SELECT gold_medal AS user_id,contest_id FROM Contests
    UNION ALL 
    SELECT silver_medal AS user_id,contest_id FROM Contests
    UNION ALL 
    SELECT bronze_medal AS user_id,contest_id FROM Contests) AS cet)

SELECT
name,
mail
FROM Users
WHERE 
user_id IN (
SELECT 
DISTINCT user_id
FROM cet 
WHERE lg = contest_id AND ld = contest_id
UNION 
SELECT
DISTINCT
gold_medal AS user_id
FROM Contests
GROUP BY gold_medal
HAVING COUNT(contest_id) >=3)

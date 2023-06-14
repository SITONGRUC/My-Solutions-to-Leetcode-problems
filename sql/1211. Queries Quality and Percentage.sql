# Write your MySQL query statement below
SELECT 
DISTINCT query_name,
ROUND((SUM(rating/position) OVER(PARTITION BY query_name))/(COUNT(position) OVER(PARTITION BY query_name)),2) AS quality ,
ROUND((SUM(CASE WHEN rating < 3 THEN 1
ELSE 0 END) OVER(PARTITION BY Query_name ) )/(COUNT(rating) OVER(PARTITION BY Query_name ) )*100,2) AS poor_query_percentage
FROM Queries

# Write your MySQL query statement below
SELECT
first_col ,
second_col 
FROM
(SELECT 
ROW_NUMBER() OVER() AS number,
first_col
 FROM data 
ORDER BY first_col ASC ) AS a
LEFT JOIN 
(SELECT 
ROW_NUMBER() OVER() AS number,
second_col 
 FROM data 
ORDER BY second_col  DESC) AS b
ON a.number = b.number

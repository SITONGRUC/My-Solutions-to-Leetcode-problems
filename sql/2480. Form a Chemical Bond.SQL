# Write your MySQL query statement below
SELECT
*
FROM
(SELECT symbol AS metal FROM Elements WHERE type  = 'metal') AS metal
CROSS JOIN 
(SELECT symbol AS nonmetal FROM Elements WHERE type  = 'nonmetal') AS nonmetal

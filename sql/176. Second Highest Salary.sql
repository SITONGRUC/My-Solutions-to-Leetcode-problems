# Write your MySQL query statement below
SELECT
AVG(CASE WHEN rank1 = 2 THEN salary ELSE NULL END) AS SecondHighestSalary
FROM
(SELECT
salary,
DENSE_RANK() OVER(ORDER BY salary DESC )  AS rank1
FROM Employee) AS res

#Dense_rank() NO gap

select
(select distinct Salary 
from Employee order by salary desc 
limit 1 offset 1) 


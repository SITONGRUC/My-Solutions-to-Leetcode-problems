CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
     SELECT
SUM(DISTINCT CASE WHEN rank1 = N THEN salary ELSE NULL END) AS SecondHighestSalary
FROM
(SELECT
salary,
DENSE_RANK() OVER(ORDER BY salary DESC )  AS rank1
FROM Employee) AS res


  );
END

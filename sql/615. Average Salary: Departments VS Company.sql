# Write your MySQL query statement below
# company AVG
SELECT
com.pay_month ,
department_id ,
CASE WHEN amount_by_company <  amount_by_dep THEN 'higher'
WHEN amount_by_company >  amount_by_dep THEN 'lower'
ELSE 'same' END AS comparison 
FROM (
SELECT 
CONCAT(SUBSTR(pay_date,1,4),'-',SUBSTR(pay_date,6,2)) AS pay_month,
AVG(amount) AS amount_by_company
FROM Salary
GROUP BY CONCAT(SUBSTR(pay_date,1,4),'-',SUBSTR(pay_date,6,2))) AS com
LEFT JOIN(
SELECT
CONCAT(SUBSTR(pay_date,1,4),'-',SUBSTR(pay_date,6,2)) AS pay_month,
e.department_id ,
AVG(amount) AS amount_by_dep
FROM Salary  AS s
LEFT JOIN Employee AS e
ON e.employee_id =s.employee_id 
GROUP BY CONCAT(SUBSTR(pay_date,1,4),'-',SUBSTR(pay_date,6,2)),e.department_id ) AS dep
ON com.pay_month=dep.pay_month;

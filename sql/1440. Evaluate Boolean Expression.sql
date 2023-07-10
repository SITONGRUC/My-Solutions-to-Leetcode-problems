# Write your MySQL query statement below
SELECT
e.left_operand AS left_operand,
e.operator AS operator,
e.right_operand AS right_operand,
CASE WHEN operator = '>' AND left1.value > right1.value THEN 'true'
WHEN operator = '<' AND left1.value < right1.value THEN 'true'
WHEN operator = '=' AND left1.value = right1.value THEN 'true'
ELSE 'false' END AS value
FROM
Expressions AS e
LEFT JOIN Variables AS left1
ON e.left_operand = left1.name
LEFT JOIN Variables AS right1
ON e.right_operand = right1.name

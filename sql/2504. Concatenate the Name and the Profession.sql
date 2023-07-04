# Write your MySQL query statement below
SELECT
person_id,
CONCAT(name,CONCAT(CONCAT('(',SUBSTR(profession,1,1)),')')) AS name
FROM Person
ORDER BY person_id DESC;

SELECT
i.invoice_id AS invoice_id,
c.customer_name  AS customer_name ,
i.price AS price,
CASE WHEN contacts_cnt IS NULL THEN 0 ELSE contacts_cnt END AS contacts_cnt,
CASE WHEN trusted_contacts_cnt IS NULL THEN 0 ELSE trusted_contacts_cnt END AS trusted_contacts_cnt
FROM
Invoices AS i
LEFT JOIN Customers AS c
ON i.user_id = c.customer_id 
LEFT JOIN 
(SELECT
user_id,
COUNT(contact_name) AS contacts_cnt
FROM Contacts
GROUP BY user_id) AS contacts_cnt
ON contacts_cnt.user_id = i.user_id
LEFT JOIN
(SELECT
user_id,
COUNT(contact_name) AS trusted_contacts_cnt
FROM Contacts
WHERE contact_name IN (SELECT customer_name FROM Customers)
GROUP BY user_id) AS trusted_contacts_cnt
ON trusted_contacts_cnt.user_id = i.user_id
ORDER BY invoice_id;

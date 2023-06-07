SELECT name
FROM Customer
WHERE referee_id != 2 or referee_id IS NULL;
#notice = or 1= would filter null values

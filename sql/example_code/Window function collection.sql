# Window function collection
LEAD()
LAG()
FIRST_VALUE()
LAST_VALUES()
RANK()
DENSE_RANK()
ROW_NUMBER()
NTILE(111)
ORDER BY & PARTITION BY could be used sperately. 


WITH Events AS (
  SELECT DISTINCT Event
  FROM Summer_Medals)
  
SELECT
  --- Split up the distinct events into 111 unique groups
  Event,
  NTILE(111) OVER (ORDER BY Event ASC) AS Page
FROM Events
ORDER BY Event ASC;

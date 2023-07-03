This is for SQL\
Between is inclusive in both sides\
when calul, use case to avoid null \
Pay attention to the window function. lag() OVER(ORDER BY) partition is not needed\
this function is useful DATE_ADD('2019-07-27', INTERVAL -29 DAY)\
pay attention to date, it's str and should be attached with ''\
EXTRACT(MONTH FROM "2017-06-15")\

rank give the same number to which has the same values while row_number didn't\
and there is dense_rank()\
The differenct between dense_rank() and rank() is that  RANK numbers are skipped so there may be a gap in rankings, and may not be unique. DENSE_RANK numbers are not skipped so there will not be a gap in rankings, and may not be unique



# This is a note for SQL

## What we need to do SQL question 

1. JOIN Fuction : LEFT JOIN/RIGHT JOIN/CROSS JOIN
2. 
3. 

## Selection area

1. SELECT '10-15>' AS bin FROM ifio : you could just input the string to the selection result.
  
2. ALWAYS transform null to 0.when you have some selection result to output. please check on whether there are nulls in the result or not. 

3. how to use povit in   sql is a issue
## WHERE AREA and HAVING AREA

1. Between is inclusive on both sides

2. HAVING AND ORDER should use the origin expression instead of allies. For example:

SELECT book_id
FROM Orders
WHERE dispatch_date BETWEEN '2018-06-23' AND '2019-06-23'
GROUP BY book_id
Having sum(quantity) >= 10\
             EXTRACT(dow FROM rental_date) AS dayofweek,\
   

## TIME PROCESS OF MYSQL

1. DATE_ADD(): For adding some time interval to a date. example: DATE_ADD('2019-07-27', INTERVAL -29 DAY)

2. SUBSTR(): since the time is a string, you could use SUBSTR() to extract time from the timestamp. Example: SUBSTR(date,1,7)

3. EXTRACT() You could also use the EXTRACT() function to extract time from a timestamp. Example: 

Pay attention to the window function. lag() OVER(ORDER BY) partition is not needed.EXTRACT(MONTH FROM "2017-06-15")

4. datediff()&TIMESTAMPDIFF()  To compute TIMESTAMPDIFF() you could use TIMESTAMPDIFF() Example TIMESTAMPDIFF(HOUR, out_time, in_time)

5. DATE_FORMAT(day, "%W, %M %e, %Y") : just link the one in python, you could extract different format of time in the output.


|  Effect   | SQL  | Python | Note |
|  ----  | ----  | ---- | ---- |
|  timedelta  | DATE_ADD('2019-07-27', INTERVAL -29 DAY) | x+datetime.timedelta(days=1, hours=6) ||
| Extract  | SUBSTR(date,1,7) | data.apply(lambda x:x[:7]) ||
| Extract | EXTRACT(YEAR FROM "2017-06-15") | data[0].apply(lambda x:x.strftime('%Y')) ||
| re-format | DATE_FORMAT(day, "%W, %M %e, %Y") | data[0].apply(lambda x:x.strftime('%Y,%w')) ||
| diff |  TIMESTAMPDIFF(HOUR, out_time, in_time) | date1-date2 ||

Try to use DATE_FORMAT()


## Windows function: 

1. RANK() VS DENSE_RAN():  rank gives the same number, which has the same values, while row_number doesn't and there is dense_rank()

The difference between dense_rank() and rank() is that  RANK numbers are skipped so there may be a gap in rankings, and may not be unique.

DENSE_RANK numbers are not skipped so there will not be a gap in rankings, and may not be unique

## Some Pandas

scores['rank'] = scores['score'].rank(method='dense', ascending=False)

result_df = scores.drop('id',axis=1).sort_values(by='score', ascending=False)



## String function 

1. GROUP_CONCAT() & CONCAT(): you could use GROUP_CONCAT function to concatenate strings. Example: GROUP_CONCAT(DISTINCT product ORDER BY product ASC SEPARATOR ',')

2. UPPER() LOWER() INITCAP() REVERSE() TRIM() RPAD() LPAD()

|  Excel   | SQL  | Python | Note |
|  ----  | ----  | ---- | ---- |
|  IF()  | CASE WHEN | apply/transform ||
|  CONCAT() | CONCAT() | + ||
| MID() | SUBSTR() | [:23] ||
| REPLACE(A3,3,2,"10") | REPLACE() | re.sub()/re.replace() ||
| need to program in macro |  REG/LIKE | re.findall()/pd.contains() ||
   

## Regular Experssion
useful
For example.
'^[a-zA-Z]+[a-zA-Z-._0-9].*?@leetcode[.]com$'

[] stand for only one char

For example [0-9],[a-z],[A-Z] [A-Za-z0-9_] 

[^n-z] means except, ^ is stand for except. 

This quantifier can be used with any character, or special metacharacters, for example w{3} (three w's), [wxy]{5} (five characters, each of which can be a w, x, or y) and .{2,6} (between two and six of any character).

These quantifiers can be used with any character or special metacharacters, for example a+ (one or more a's), [abc]+ (one or more of any a, b, or c character) and .* (zero or more of any character).

## Python VS SQL ALL 

|  Function   | SQL  | Python | Note |
|  ----  | ----  | ---- | ---- |
|  timedelta  | DATE_ADD('2019-07-27', INTERVAL -29 DAY) | x+datetime.timedelta(days=1, hours=6) ||
| Extract  | SUBSTR(date,1,7) | data.apply(lambda x:x[:7]) ||
| Extract | EXTRACT(YEAR FROM "2017-06-15") | data[0].apply(lambda x:x.strftime('%Y')) ||
| re-format | DATE_FORMAT(day, "%W, %M %e, %Y") | data[0].apply(lambda x:x.strftime('%Y,%w')) ||
| diff |  TIMESTAMPDIFF(HOUR, out_time, in_time) | date1-date2 ||
|  IF()  | CASE WHEN | apply/transform ||
|  CONCAT() | CONCAT() | + ||
| MID() | SUBSTR() | [:23] ||
| REPLACE(A3,3,2,"10") | REPLACE() | re.sub()/re.replace() ||
| need to program in macro |  REG/LIKE | re.findall()/pd.contains() ||
| NOT IN / IN  |  NOT IN / IN  | isin()/~isin() ||
| AGG analysis  | Window function/GROUP BY  | groupby  ||











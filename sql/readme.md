# This is a note for SQL

# data definition language (ddl)

include Create,Drop,Alter,Rename

[example](https://github.com/SITONGRUC/My-Solutions-to-Leetcode-problems/blob/main/sql/example_code/DDL.sql)


## CREATE:
Include a CREATE TABLE or CREATE SCHEMA command

Use DROP TABLE IF EXISTS before each CREATE TABLE statement

Every table should have a primary key.

Foreign Key constraints should be defined/enforced

##### **After you create a database don't forget to use it**


### note 1 from lab1
The main challenge here is choosing a primary key, as the source data doesn't have an obvious primary key. 

One approach is to use an AUTO_INCREMENT column:

**主键，自动生成，除了 datatype需要紧跟 column name 剩下的位置可以随意调换**
 eg:
 
CREATE TABLE employees3 (
emp_no INTEGER NOT NULL auto_increment PRIMARY KEY
);

CREATE TABLE employees3 (
emp_no INTEGER auto_increment PRIMARY KEY NOT NULL
);

CREATE TABLE employees3 (
emp_no INTEGER  PRIMARY KEY  auto_increment NOT NULL
);

以上三个玩意都可以


**If there is no obvious primary key,one approach is to use an AUTO_INCREMENT column:**
    
**parent table just use origianl primary key( if any ) or just creaate one (auto_increment)**

**if can't add FOREIGN KEY.  you could just over it**


### restrict rules

**delete restrict example**
you could not deltete parent data on restrict mode  when the data linked to child data 

**update restract exmaple**
you could not update parent data  on restrict mode  
when the data linked to child data ( foreign key data, if you are trying to update other data it is fine) 

**update cascade example**
if update the parent table, the child table would be update. 

**DELETE cascade exmaple**
it would delete the data in child table where raltedto to the delete datq in parent table 


## DROP:

##### **Drop database**
DROP DATABASE exam1;
would earese all database in a sec, so use it carefully 

##### **Drop TABLE IF EXISTS table_name**
always use before a create table statement. 

## ALTER:

**add data table**
ALTER TABLE  employees ADD COLUMN salary INTEGER NULL;

ALTER TABLE Student	ADD COLUMN birth_year INT;

ALTER TABLE Student DROP COLUMN birth_year;

ALTER TABLE Student 	MODIFY COLUMN birth_year CHAR(4);

## VIEW 
CREATE VIEW [name] AS 
(任何select 语句，你甚至能够嫁cte)

CREATE VIEW view_name [(column_list)] AS select_statement


# Data Manipulation Language (DML):

include SELECT  UPDATE INSERT	 DELETE

## DELETE example

DELETE FROM table_name WHERE ....

## INSERT example

INSERT INTO offers (emp_no,com_no) VALUES(3,3);

you dont need to insert auto_increment value 

## UPDATE example 

UPDATE companies SET com_no = 4 WHERE com_no = 2;

UPDATE employees1 SET position  = 'hooker' WHERE emp_no = 1;

## SQL note ( SELECT) 

### Function List 

1. **IFNULL()**

Return the specified value IF the expression is NULL, otherwise return the expression:

SELECT IFNULL(NULL, "W3Schools.com");


### What we need to do SQL question 

#### 1. JOIN Fuction : LEFT JOIN/RIGHT JOIN/CROSS JOIN/INNER JOIN 

natural join without the reference column: it would not return any result if the two table don;t have columns with the sasme name. 

USE sakila;

SELECT * FROM film NATURAL JOIN inventory;

####  2. GROUP BY and HAVING: 

could add with rollup after group by. with mutilever group by it would just return different level sum. 

Say we have two level of group by, with rollup we could expect one null. null row for total count, one A,null row for first level count, and all of the A,B count. 

####  3. CASE function: CASE WHEN ... ELSE ... END

there is two kind of case 

1 Simple case statetment : CASE [variable] WHEN [value] THEN [return value] ELSE [return] END 

2 Searched case statement, use when there is a null value need to process 



####  4. WINDOW FUNCTION: 

Window functions are permitted only in the select list and ORDER BY clause. Query result rows are determined from the FROM clause, after WHERE, GROUP BY, and HAVING processing, and windowing execution occurs before ORDER BY, LIMIT, and SELECT DISTINCT.

If you want to filter based on the results of a window function, you generally need to use a common table expression (CTE) approach.


##### function list
ROW_NUMBER(): most basic function 

RANK() and DENSE_RANK() :

rank gives the same number, which has the same values, while row_number doesn't and there is dense_rank()
The difference between dense_rank() and rank() is that  RANK numbers are skipped so there may be a gap in rankings, and may not be unique.
DENSE_RANK numbers are not skipped so there will not be a gap in rankings, and may not be unique

SUM(),MAX(),MIN(),AVG() 

SUM(): how to make a cumsum()
if you would want to make a simple cumsum and would not like to have a window, you could just SUM(name) OVER(ORDER BY name DESC) 

if you would like to hold a window: 

SUM(num) OVER(ORDER BY num ROWS BETWEEN UNBOUNDED PRECEDING AND unbounded following) # 前后所有的value都加起来

AVG(num) OVER(ORDER BY num ROWS BETWEEN 1 PRECEDING AND 1 following) # 一个长度为3的窗口

AVG(num) OVER(ORDER BY num ROWS BETWEEN CURRENT ROW AND unbounded following) #如何写出当前的

and you need to pay attention to the null value in the function 

there is five kinds of key word in this experession: 

CURRENT ROW | UNBOUNDED PRECEDING (前面的) | UNBOUNDED FOLLOWING （ 后面的） | expr PRECEDING | expr FOLLOWIN
    
LAG(),LEAD()

#### 5. IN: ,ALL,and ANY 

some columns is in a list. There is two list function. First is (1,2,3) OR you could use (SELECT A FROM B)
it is a kind of division operation. 


#### 6. Basic funtion: MAX(),MIN(), SUM() ROUND()

#### 7. Basic computation: %,
 even number : id%2 = 1
 
#### 8. Table computation:
UNION,UNIONALL, EXCEPT( you may use join to solve as well) INTERSECT 


#### 9. CTE ( mainly recursive) 

Recursive cte in 4 step. 
1.	-- choose a **anchor member**
2.	-- put the anchor part into a cte and write a secord **recursive member**
3.	-- set an **termination condition**
4.	-- put the step in  in and add recursive cte

ANd there is two facts about CTE 

first, comma

WITH cte_c AS (SELECT 1 AS a), CTE_a AS (SELECT 2 AS a) 
SELECT * FROM cet_c,cte_a;

there is a comma between two cte and there is no comma between cte and the query that use cte

second, cte could be in a cte .

recursive would not be in aggreage function 



### Selection area

1. SELECT '10-15>' AS bin FROM ifio : you could just input the string to the selection result.
  
2. ALWAYS transform null to 0.when you have some selection result to output. please check on whether there are nulls in the result or not. 

3. how to use povit in   sql is a issue
### WHERE AREA and HAVING AREA

1. Between is inclusive on both sides

2. HAVING AND ORDER should use the origin expression instead of allies. For example:

SELECT book_id
FROM Orders
WHERE dispatch_date BETWEEN '2018-06-23' AND '2019-06-23'
GROUP BY book_id
Having sum(quantity) >= 10\
             EXTRACT(dow FROM rental_date) AS dayofweek,\
   

### TIME PROCESS OF MYSQL

1. **DATE_ADD()**: For adding some time interval to a date. example: DATE_ADD('2019-07-27', INTERVAL -29 DAY)

2. SUBSTR(): since the time is a string, you could use SUBSTR() to extract time from the timestamp. Example: SUBSTR(date,1,7)

3. EXTRACT() You could also use the EXTRACT() function to extract time from a timestamp. Example: 

Pay attention to the window function. lag() OVER(ORDER BY) partition is not needed.EXTRACT(MONTH FROM "2017-06-15")

4. **datediff()&TIMESTAMPDIFF()**  To compute TIMESTAMPDIFF() you could use TIMESTAMPDIFF() Example TIMESTAMPDIFF(HOUR, out_time, in_time)

  Or you could use CURRENT_DATE key words 
  
  SELECT datediff(CURRENT_DATE,'2012-1-01')
  SELECT TIMESTAMPDIFF(HOUR, '2024-09-30',CURRENT_DATE)

 5. **workday()**
SELECT dayofweek('2024-10-11'); return to the number of weekday in a week. And rthe beginning of week is sunday.
weekday works the same. So all we need is to remember one.
    

8. DATE_FORMAT(day, "%W, %M %e, %Y") : just link the one in python, you could extract different format of time in the output.


|  Effect   | SQL  | Python | Note |
|  ----  | ----  | ---- | ---- |
|  timedelta  | DATE_ADD('2019-07-27', INTERVAL -29 DAY) | x+datetime.timedelta(days=1, hours=6) ||
| Extract  | SUBSTR(date,1,7) | data.apply(lambda x:x[:7]) ||
| Extract | EXTRACT(YEAR FROM "2017-06-15") | data[0].apply(lambda x:x.strftime('%Y')) ||
| re-format | DATE_FORMAT(day, "%W, %M %e, %Y") | data[0].apply(lambda x:x.strftime('%Y,%w')) ||
| diff |  TIMESTAMPDIFF(HOUR, out_time, in_time) | date1-date2 ||

Try to use DATE_FORMAT()




### Some Pandas

scores['rank'] = scores['score'].rank(method='dense', ascending=False)

result_df = scores.drop('id',axis=1).sort_values(by='score', ascending=False)



### String function 

1. GROUP_CONCAT() & CONCAT(): you could use GROUP_CONCAT function to concatenate strings. Example: GROUP_CONCAT(DISTINCT product ORDER BY product ASC SEPARATOR ',')

2. **substring_index** Return a substring of a string before a specified number of delimiter occurs:
 SELECT substring_index("ruc.sitongli@gmail.co.m ",'.',2);

3. **SUBSTR(Acolumn,1,4)** Acolumn stand for the column name, 1 means the position you would like this substring to start. and 4 stands for the length you expect for this substring.

4. **REGEXP_SUBSTR(moviename, ' [0-9]\{3\}$')** re.findall 

5. **INSTR(Acolumn,'.')** Acolumn stands  a column name, '.' means the text you would like to find and the function would return to the first position of this text.

You could paly with this exmaple. SELECT INSTR('@@.@@.','.');

And INSTR kind of use with SUBSTR, below is some exmaple 

SELECT SUBSTR(email,INSTR(email,'@')+1,INSTR(email,'.')-INSTR(email,'@')-1) FROM people;

SELECT SUBSTR(email,INSTR(email,'@')+1,LENGTH(email)-INSTR(email,'@')) FROM people;

5.**TRIM()** Removing the blank from both sides of a string. 

SELECT CONCAT('d',TRIM('  4   '),'d');

6. UPPER() LOWER() INITCAP() REVERSE() TRIM() RPAD() LPAD()



|  Excel   | SQL  | Python | Note |
|  ----  | ----  | ---- | ---- |
|  IF()  | CASE WHEN | apply/transform ||
|  CONCAT() | CONCAT() | + ||
| MID() | SUBSTR() | [:23] |for SUBSTR, both sides of interval is included|
| REPLACE(A3,3,2,"10") | REPLACE() | re.sub()/re.replace() ||
| need to program in macro |  REG/LIKE | re.findall()/pd.contains() ||
   

Some example
SELECT SUBSTR(email,INSTR(email,'@')+1) as email_domain,COUNT(*) as count FROM Emails
WHERE email LIKE '%.com'
GROUP BY 1
ORDER BY 1 ASC, 2 DESC;

### Regular Experssion
useful
For example.
SELECT * FROM USers WHERE REGEXP_LIKE(email,'^[a-zA-Z]+[a-zA-Z0-9[.][-][_]]*@leetcode[.]com$');

或者是

SELECT * FROM USers WHERE REGEXP_LIKE(mail,'^[a-zA-Z]+[a-zA-Z0-9\\.\\-\\_]*@leetcode[.]com$');


[] stand for only one char

For example [0-9],[a-z],[A-Z] [A-Za-z0-9] 

[^n-z] means except, ^ is stand for except. 

**1.** SELECT regexp_like('yyy','[w]{3}');

SELECT regexp_like('www','[w]{3}');

means that if w repeat three times, it mataches 

**2.** SELECT regexp_like('yyy','[wxy]{3}');

any of x,y,w repeat three times would fit 
 
**3.**
+: 	匹配前面的子表达式一次或多次。例如，'zo+' 能匹配 "zo" 以及 "zoo"，但不能匹配 "z"。+ 等价于 {1,}

 *:匹配前面的子表达式零次或多次。例如，zo* 能匹配 "z" 以及 "zoo"。* 等价于{0,}。

 {n,m}	m 和 n 均为非负整数，其中n <= m。最少匹配 n 次且最多匹配 m 次

 how to select . in the reg? use [.] 

 e.g [a-zA-Z0-9[.]] 里面的意思全部是or


### Python VS SQL ALL 

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











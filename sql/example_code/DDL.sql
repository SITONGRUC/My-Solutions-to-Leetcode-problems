DROP DATABASE exam1;

-- Data Definition Language (DDL):
-- Create		 Drop
--  Alter		  Rename


-- For all exercises:
--   Include a CREATE TABLE or CREATE SCHEMA command
--   Every table should have an appropriate name, 
--  usually a singular noun, though it's OK to use the source data table name
--   Use DROP TABLE IF EXISTS before each CREATE TABLE statement (best practice discussed in class)
--   Every table should have a primary key.
--   Foreign Key constraints should be defined/enforced (exercises 2 and 3 only)
--   Choose appropriate data type and (if necessary) size.
--   Your table design should not rely on a modifying the source data! We test with the original source data.

-- Exercise 1
-- The main challenge here is choosing a primary key, as the source data doesn't have an obvious primary key. 
-- One approach is to use an AUTO_INCREMENT column:
    -- 主键，自动生成，除了 datatype需要紧跟 column name 剩下的位置可以随意调换
    -- 观察数据结构并没有明显的主键；不如生成一个
    
    
-- Exercise 2

-- NOTE MATCH is a MySQL keyword and needs backticks
-- There are several _tid columns in here, all of which reference the team table
-- parent table just use origianl primary key( if any ) or just creaate one (auto_increment) 


-- exercise 3
-- if can't add FOREIGN KEY.  you could just over it 

CREATE DATABASE exam1;

USE exam1;



CREATE TABLE employees (
emp_no INTEGER NOT NULL auto_increment,
emp_name VARCHAR(50) NOT NULL UNIQUE,
position VARCHAR(50) NOT NULL UNIQUE,
CONSTRAINT PRIMARY KEY employees(emp_no)
);

INSERT INTO employees (emp_name,position) VALUES('Tan','Banker');
INSERT INTO employees (emp_name,position) VALUES('Yu','Quant');
INSERT INTO employees (emp_name,position) VALUES('Li','Prof');

CREATE TABLE companies (
com_no INTEGER NOT NULL auto_increment,
com_name VARCHAR(50) NOT NULL unique,
CONSTRAINT PRIMARY KEY companies (com_no)
);

INSERT INTO companies (com_name) VALUES('Goldman Sachs');
INSERT INTO companies (com_name) VALUES('Citadel');
INSERT INTO companies (com_name) VALUES('Uchicago');

DROP TABLE offers;
CREATE TABLE offers (
emp_no INTEGER NOT NULL,
com_no INTEGER NOT NULL,
CONSTRAINT PRIMARY KEY (com_no,emp_no),
CONSTRAINT FOREIGN KEY  (emp_no) REFERENCES employees(emp_no) ON DELETE RESTRICT ON UPDATE cascade,
CONSTRAINT FOREIGN KEY  (com_no) REFERENCES companies(com_no) ON UPDATE restrict ON DELETE cascade
);
-- don't use auto_increment in this , it could make some duplicate.
INSERT INTO offers (emp_no,com_no) VALUES(1,1);
INSERT INTO offers (emp_no,com_no) VALUES(2,2);
INSERT INTO offers (emp_no,com_no) VALUES(3,3);


-- delete restrict example 
DELETE FROM employees WHERE emp_no = 1;
-- you could not deltete parent data on restrict mode  when the data linked to child data 

-- update restract exmaple
UPDATE companies SET com_no = 4 WHERE com_no = 2;
-- you could not update parent data  on restrict mode  
-- when the data linked to child data ( foreign key data, if you are trying to update other data it is fine) 

-- update cascade example 
UPDATE employees SET emp_no = 4 WHERE emp_no = 2;
SELECT * FROM employees;
SELECT * FROM offers;
-- if update the parent table, the child table would be update. 

-- DELETE cascade exmaple 
DELETE FROM companies WHERE com_no = 1;
SELECT * FROM companies;
SELECT * FROM offers;
-- it would delete the data in child table where raltedto to the delete datq in parent table 


ALTER TABLE employees ADD COLUMN birth_date VARCHAR(50);
ALTER TABLE 	employees MODIFY COLUMN birth_date CHAR(4);
ALTER TABLE employees DROP COLUMN birth_date;

INSERT INTO companies (com_name) VALUES ('JPMC');

SELECT * FROM companies;
SELECT * FROM offers
JOIN companies USING (com_no);

SELECT * FROM Offers AS o,Companies AS c WHERE c.com_no = o.com_no;

SELECT * FROM offers
RIGHT JOIN companies USING (com_no);



CREATE TABLE employees1 (
emp_no INTEGER NOT NULL auto_increment,
emp_name VARCHAR(50) NOT NULL UNIQUE,
position VARCHAR(50) NOT NULL UNIQUE,
CONSTRAINT PRIMARY KEY employees(emp_no)
);


INSERT INTO employees1 SELECT * FROM employees WHERE emp_name = 'Tan' ;

SELECT * FROM employees1;

UPDATE employees1 SET position  = 'hooker' WHERE emp_no = 1;

SELECT * FROM employees1;

INSERT INTO employees1 SELECT * FROM employees WHERE emp_name = 'Li' ;
SELECT * FROM employees1;

DELETE FROM employees1 WHERE emp_name = 'Li';

SELECT * FROM employees;

ALTER TABLE  employees ADD COLUMN salary INTEGER NULL;

SELECT * FROM employees;

UPDATE employees SET salary = 30000 WHERE emp_name = 'Li';
UPDATE employees SET salary = 40000 WHERE emp_name = 'Tan';
UPDATE employees SET salary = NULL WHERE emp_name = 'Yu';

INSERT INTO employees (emp_name,position,salary) VALUES('Lv','Quant',NULL);

SELECT * FROM employees;

WITH a AS (SELECT * FROM employees)
SELECT * FROM a;

CREATE VIEW [name] AS SELECT `` from ee. 
DROP VIEW IF EXISTS v_account_avgs;

ALTER TABLE vendors ADD INDEX vendor_state_ix (vendor_state);
ALTER TABLE vendors ADD INDEX vendor_state_ix (vendor_state,vendor_state);
ALTER TABLE vendors DROP INDEX vendor_state_ix;
ALTER TABLE vendors ADD PRIMARY KEY (column name);


SHOW INDEX FROM imdb;






















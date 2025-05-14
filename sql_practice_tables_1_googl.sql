-- script for https://artoftesting.com/sql-queries-for-interview
DROP DATABASE IF EXISTS sql_practice;

CREATE DATABASE sql_practice;

USE sql_practice;

DROP TABLE IF EXISTS employee_details;

CREATE TABLE employee_details (emp_Id INT ,full_name varchar(50),manager_id INT, date_of_joining DATE, city varchar(50));
INSERT employee_details
VALUES  (121,"John Snow",321,"2019-01-31","Toronto"),
		(321,"Walter White",986,"2020-01-30","California"),
        (421,"Kuldeep Rana",876,"2021-11-21","New Delhi"),
        (521,"kushwanth sriram",321,"2025-01-01","Jaggampeta"),
		(522,"Naveen Kumar",321,"2025-01-01","Jaggampeta"),
        (523, "kishore T",321,current_date(),"jaggampeta");

DROP TABLE IF EXISTS employee_salary;
CREATE TABLE employee_salary (emp_id INT, project VARCHAR(50),salary INT, variable INT);
INSERT employee_salary 
VALUES  (121,"P1",8000,500),
		(321,"P2",10000,1000),
        (421,"P1",12000,0),
        (521,NULL,9000,200), 
        (522,NULL,9000,200);
        
DROP TABLE IF EXISTS sales_data;
CREATE TABLE sales_data(sale_id INT, product_id INT, region_id INT,sale_amount DECIMAL);

INSERT INTO sales_data
	VALUES  (121,10,9,12500.10),
			(122,11,10,13500.10),
            (123,1,1,18500.00);
            
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (emp_id INT, name VARCHAR(50),manager_id INT, salary DECIMAL);

INSERT INTO employees
	VALUES  (1,"Naveen",6,50000),
			(2,"Harish",6,60000),
            (3,"Harish",6,60000),
            (6,"Kushi",NULL,40000);
        
-- ALTER TABLE employee_details CHANGE managerid manager_id INT;
-- CREATE TABLE employee_salary_arch AS SELECT * FROM employee_details;
-- GEEEKS FOR GEEKS ALL 50 QUESTIONS BELOW.
CREATE TABLE Worker (
    WORKER_ID INT NOT NULL PRIMARY KEY,
    FIRST_NAME CHAR(25),
    LAST_NAME CHAR(25),
    SALARY INT,
    JOINING_DATE DATETIME,
    DEPARTMENT CHAR(25)
);

INSERT INTO Worker (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
    (1, 'Monika', 'Arora', 100000, '2021-02-20 09:00:00', 'HR'),
    (2, 'Niharika', 'Verma', 80000, '2021-06-11 09:00:00', 'Admin'),
    (3, 'Vishal', 'Singhal', 300000, '2021-02-20 09:00:00', 'HR'),
    (4, 'Amitabh', 'Singh', 500000, '2021-02-20 09:00:00', 'Admin'),
    (5, 'Vivek', 'Bhati', 500000, '2021-06-11 09:00:00', 'Admin'),
    (6, 'Vipul', 'Diwan', 200000, '2021-06-11 09:00:00', 'Account'),
    (7, 'Satish', 'Kumar', 75000, '2021-01-20 09:00:00', 'Account'),
    (8, 'Geetika', 'Chauhan', 90000, '2021-04-11 09:00:00', 'Admin');

CREATE TABLE Bonus (
    WORKER_REF_ID INT,
    BONUS_AMOUNT INT,
    BONUS_DATE DATETIME,
    FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID) ON DELETE CASCADE
);

INSERT INTO Bonus (WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
    (1, 5000, '2023-02-20'),
    (2, 3000, '2023-06-11'),
    (3, 4000, '2023-02-20'),
    (1, 4500, '2023-02-20'),
    (2, 3500, '2023-06-11');

CREATE TABLE Title (
    WORKER_REF_ID INT,
    WORKER_TITLE CHAR(25),
    AFFECTED_FROM DATETIME,
    FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID) ON DELETE CASCADE
);

INSERT INTO Title (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
    (1, 'Manager', '2023-02-20 00:00:00'),
    (2, 'Executive', '2023-06-11 00:00:00'),
    (8, 'Executive', '2023-06-11 00:00:00'),
    (5, 'Manager', '2023-06-11 00:00:00'),
    (4, 'Asst. Manager', '2023-06-11 00:00:00'),
    (7, 'Executive', '2023-06-11 00:00:00'),
    (6, 'Lead', '2023-06-11 00:00:00'),
    (3, 'Lead', '2023-06-11 00:00:00');
    
    /* 
    ------------------------------ o ---------------------
    QUESTIONS AND SOLUTIONS
    
    -- 1. Write SQL Query to Display FIRST_NAME with Alias WORKER_NAME.
-- 2. Write SQL Query to Display FIRST_NAME in Upper Case from the Worker Table.
-- 3. Write SQL Query to Display Unique DEPARTMENT Values from the Worker Table.
-- 4. Write SQL Query to Display the First 3 Chars of FIRST_NAME from the Worker Table.
-- 5. Write SQL Query to Find the Position of Alphabet ‘a’ in the FIRST_NAME Column.
-- 6. Write SQL Query to Fetch FIRST_NAME from the Worker Table With No White Spaces on the Right.
-- 7. Write SQL Query to List DEPARTMENT from the Worker Table With No White Spaces on the Left.
-- 8. Write SQL Query to Display Unique DEPARTMENT Values and Their Lengths from the Worker Table.
-- 9. Write SQL Query to Replace ‘a’ with ‘A’ in FIRST_NAME from the Worker Table.
-- 10. Write SQL Query to Combine FIRST_NAME and LAST_NAME into COMPLETE_NAME.
-- 11. Write SQL Query to Print Worker Details Ordered by FIRST_NAME Ascending.
-- 12. Write SQL Query to Print Worker Details Ordered by FIRST_NAME DEPARTMENT Descending.
-- 13. Write SQL Query to Print Worker Details with First Names “Vipul” and “Satish”.
-- 14. Write SQL Query to Print Worker Details Excluding First Names (“Vipul” and “Satish”).
-- 15. Write SQL Query to Print Worker Details with DEPARTMENT Name as “Admin”.
-- 16. Write SQL Query to Print Worker Details Whose FIRST_NAME Contains ‘a’.
-- 17. Write SQL Query to List Worker Info Whose FIRST_NAME Ends with ‘a’.
-- 18. Write SQL Query to Fetch Workers Whose FIRST_NAME Ends with ‘h’ and Has 6 Letters.
-- 19. Write SQL Query to Show Worker Info Whose SALARY is Between 100000 & 500000.
-- 20. Write SQL Query to Display Workers Who Joined in Feb 2021.
-- 21. Write SQL Query to Print Employee Count in ‘Admin’ Department.
-- 22. Write SQL Query to Fetch Worker Names with Salaries >= 50000 and <= 100000.
-- 23. Write SQL Query to List Worker Count Per Department in Descending Order.
-- 24. Write SQL Query to Print Worker Details Who Are Also Managers.
-- 25. Write SQL Query to Fetch Duplicate Records with Matching Data in Specific Fields of a Table.
-- 26. Write SQL Query to Show Only Odd Rows from a Table.
-- 27. Write SQL Query to Show Only Even Rows from a Table.
-- 28. Write SQL Query to Clone a New Table from Another Table.
-- 29. Write SQL Query to Display Intersecting Records of Two Tables. --> wrong question.
-- 30. Write SQL Query to Show Records from One Table That Are Not Present in Another Table.
-- 31. Write SQL Query to Show the Current Date and Time.
-- 32. Write SQL Query to Show the Top n (say 10) Records of a Table.
-- 33. Write SQL Query to Determine the Nth (say n=5) Highest Salary. ****
-- Skipped 34 since same as 33.
-- 35. Write SQL Query to Fetch the List of Employees with the Same Salary.
-- 36. Write SQL Query to List the Employee with the Second-Highest Salary.

-- -------------------- o ---------------------

-- 1. Write SQL Query to Display FIRST_NAME with Alias WORKER_NAME.
SELECT first_name AS WORKER_NAME FROM worker;

-- 2. Write SQL Query to Display FIRST_NAME in Upper Case from the Worker Table.
SELECT upper(FIRST_NAME) FROM worker;
SELECT lower(FIRST_NAME) FROM worker;

-- 3. Write SQL Query to Display Unique DEPARTMENT Values from the Worker Table.
SELECT department, SUM(SALARY) AS total_salary, AVG(SALARY) AS average_salary FROM worker GROUP BY department;
SELECT DISTINCT department from worker;

-- 4. Write SQL Query to Display the First 3 Chars of FIRST_NAME from the Worker Table.
SELECT 
substring(FIRST_NAME,1,3) AS first_chars 
FROM worker;

-- 5. Write SQL Query to Find the Position of Alphabet ‘a’ in the FIRST_NAME Column.
SELECT 
INSTR(first_name,"a")
FROM worker WHERE FIRST_NAME = "amitabh";

-- 6. Write SQL Query to Fetch FIRST_NAME from the Worker Table With No White Spaces on the Right.
SELECT RTRIM(first_name) FROM worker;

-- 7. Write SQL Query to List DEPARTMENT from the Worker Table With No White Spaces on the Left.
SELECT DISTINCT ltrim(department) FROM worker;

-- 8. Write SQL Query to Display Unique DEPARTMENT Values and Their Lengths from the Worker Table.
SELECT DISTINCT department, length(department) FROM worker;

-- 9. Write SQL Query to Replace ‘a’ with ‘A’ in FIRST_NAME from the Worker Table.
SELECT replace(FIRST_NAME, "a","A") FROM worker;

-- 10. Write SQL Query to Combine FIRST_NAME and LAST_NAME into COMPLETE_NAME.
SELECT CONCAT(first_name," ",last_name) AS COMPLETE_NAME FROM worker;

-- 11. Write SQL Query to Print Worker Details Ordered by FIRST_NAME Ascending.
SELECT * FROM worker ORDER BY first_name;

-- 12. Write SQL Query to Print Worker Details Ordered by FIRST_NAME DEPARTMENT Descending.
SELECT * FROM worker ORDER BY department DESC;

-- combo
SELECT * FROM worker ORDER BY first_name, DEPARTMENT DESC;

-- 13. Write SQL Query to Print Worker Details with First Names “Vipul” and “Satish”.
SELECT * FROM worker WHERE first_name IN ("VIPUL","SATISH");

-- 14. Write SQL Query to Print Worker Details Excluding First Names (“Vipul” and “Satish”).
SELECT * FROM worker WHERE first_name NOT IN ("VIPUL","SATISH");

-- 15. Write SQL Query to Print Worker Details with DEPARTMENT Name as “Admin”.
SELECT * FROM worker WHERE department="admin";

-- 16. Write SQL Query to Print Worker Details Whose FIRST_NAME Contains ‘a’.
SELECT * FROM worker WHERE first_name LIKE "%a%";
-- using regular exp
SELECT * FROM worker WHERE first_name REGEXP "a";

-- 17. Write SQL Query to List Worker Info Whose FIRST_NAME Ends with ‘a’.
SELECT * FROM worker WHERE first_name REGEXP "a$";
SELECT * FROM worker WHERE first_name LIKE "%a";

-- 18. Write SQL Query to Fetch Workers Whose FIRST_NAME Ends with ‘h’ and Has 6 Letters.
SELECT * FROM worker WHERE first_name REGEXP "h$" AND length(first_name) = 6;

-- 19. Write SQL Query to Show Worker Info Whose SALARY is Between 100000 & 500000.
SELECT * FROM worker WHERE SALARY BETWEEN 100000 AND 500000;

-- 20. Write SQL Query to Display Workers Who Joined in Feb 2021.
SELECT * FROM worker WHERE JOINING_DATE BETWEEN "2021-01-1" AND "2021-12-31";

-- 21. Write SQL Query to Print Employee Count in ‘Admin’ Department.
SELECT department, COUNT(department) FROM worker GROUP BY department HAVING department="ADMIN";

-- 22. Write SQL Query to Fetch Worker Names with Salaries >= 50000 and <= 100000.
SELECT CONCAT(first_name," ",last_name) AS worker_names FROM worker WHERE SALARY BETWEEN 50000 AND 100000;

-- 23. Write SQL Query to List Worker Count Per Department in Descending Order.
SELECT COUNT(department),department FROM worker GROUP BY department ORDER BY department DESC;

-- 24. Write SQL Query to Print Worker Details Who Are Also Managers.
SELECT * 
FROM worker w 
LEFT JOIN title t 
ON w.worker_id = t.WORKER_REF_ID 
WHERE t.WORKER_TITLE IN ("MANAGER");

-- 25. Write SQL Query to Fetch Duplicate Records with Matching Data in Specific Fields of a Table. NOT understand question.
SELECT WORKER_TITLE, AFFECTED_FROM, COUNT(*) FROM Title GROUP BY WORKER_TITLE, AFFECTED_FROM HAVING COUNT(*) > 1;

-- 26. Write SQL Query to Show Only Odd Rows from a Table.
SELECT * FROM worker WHERE ((worker_id%2)!=0);

-- 27. Write SQL Query to Show Only Even Rows from a Table.
SELECT * FROM worker WHERE (worker_id%2=0);

-- 28. Write SQL Query to Clone a New Table from Another Table.
CREATE TABLE title_archived AS SELECT * FROM title;

-- 29. Write SQL Query to Display Intersecting Records of Two Tables. --> wrong question.

-- 30. Write SQL Query to Show Records from One Table That Are Not Present in Another Table.
SELECT * FROM worker w LEFT JOIN title t ON w.worker_id = t.WORKER_REF_ID;

-- 31. Write SQL Query to Show the Current Date and Time.
SELECT CURRENT_TIMESTAMP;

-- 32. Write SQL Query to Show the Top n (say 10) Records of a Table.
SELECT * FROM worker ORDER BY SALARY LIMIT 10;

-- 33. Write SQL Query to Determine the Nth (say n=5) Highest Salary. ****

-- SELECT HIGHEST SALARY
SELECT * FROM worker ORDER BY salary DESC LIMIT 2;

-- to fetch 2nd hgihest salary
SELECT * FROM worker ORDER BY salary DESC LIMIT 1 OFFSET 1;  -- OFFSET skips the row count. if offset 2 given, first 2 records will be skipped.

-- to fetch nth (lets say 4th) HGIHEST sal
SELECT * FROM worker ORDER BY salary DESC LIMIT 1 OFFSET 3;

-- creating stored procedure for getting nth Highest sal
DELIMITER $$
CREATE PROCEDURE getNthHighestSal(IN n INT)
BEGIN
	DECLARE offset_val INT;
  SET offset_val = n - 1;

  SELECT *
  FROM worker
  ORDER BY salary DESC
  LIMIT 1 OFFSET offset_val;
END $$
DELIMITER ;

CALL getNthHighestSAl(3);

DROP PROCEDURE getNthHighestSAL;

-- 35. Write SQL Query to Fetch the List of Employees with the Same Salary.
SELECT * FROM worker WHERE SALARY IN (
SELECT salary FROM worker GROUP BY salary HAVING count(*) >1);

-- 36. Write SQL Query to List the Employee with the Second-Highest Salary.
SELECT * FROM worker ORDER BY salary DESC LIMIT 1 OFFSET 1;








    
    */
    
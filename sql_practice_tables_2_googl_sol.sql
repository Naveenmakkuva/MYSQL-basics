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
-- 11. Write SQL Query to Print Worker Details Ordered by FIRST_NAME Ascending and DEPARTMENT Descending.
-- 12. Write SQL Query to Print Worker Details Ordered by FIRST_NAME Ascending and DEPARTMENT Descending.
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
-- 29. Write SQL Query to Display Intersecting Records of Two Tables.
-- 30. Write SQL Query to Show Records from One Table That Are Not Present in Another Table.
-- 31. Write SQL Query to Show the Current Date and Time.
-- 32. Write SQL Query to Show the Top n (say 10) Records of a Table.
-- 33. Write SQL Query to Determine the Nth (say n=5) Highest Salary.
-- 34. Write SQL Query to Determine 5th Highest Salary Without Using TOP or Limit.
-- 35. Write SQL Query to Fetch the List of Employees with the Same Salary.
-- 36. Write SQL Query to List the Employee with the Second-Highest Salary.
-- 37. Write SQL Query to Display One Row Twice in the Results from a Table.
-- 38. Write SQL Query to Fetch Intersecting Records of Two Tables.
-- 39. Write SQL Query to Fetch the First 50% of Records from a Table.
-- 40. Write SQL Query to Fetch Departments with Less than Five People in Them.
-- 41. Write SQL Query to Show All Departments with the Number of People in There.
-- 42. Write SQL Query to Show the Last Record from a Table.
-- 43. Write SQL Query to Fetch the First Row of a Table.
-- 44. Write SQL Query to Fetch the Last Five Records from a Table.
-- 45. Write SQL Query to Show Employees with the Highest Salary in Each Department.
-- 46. Write SQL Query to Fetch the Top Three Max Salaries from a Table.
-- 47. Write SQL Query to Fetch the Three Min Salaries from a Table.
-- 48. Write SQL Query to Fetch the Nth Max Salaries from a Table.
-- 49. Write SQL Query to Fetch Departments and Their Total Salaries.
-- 50. Write SQL Query to Fetch Workers with the Highest Salary.

-- ------------------------ o -------------------------------

-- 1. Write SQL Query to Display FIRST_NAME with Alias WORKER_NAME.
SELECT first_name AS worker_name FROM worker;

-- 2. Write SQL Query to Display FIRST_NAME in Upper Case from the Worker Table.
SELECT upper(first_name) FROM worker;

-- 3. Write SQL Query to Display Unique DEPARTMENT Values from the Worker Table.
SELECT DEPARTMENT FROM worker GROUP BY DEPARTMENT;

-- 4. Write SQL Query to Display the First 3 Chars of FIRST_NAME from the Worker Table.
SELECT SUBSTRING(first_name,1,3) FROM worker;

-- 5. Write SQL Query to Find the Position of Alphabet ‘a’ in the FIRST_NAME Column.
SELECT POSITION("a" IN first_name) FROM worker;
SELECT INSTR(first_name,"a") FROM WORKER;

-- 6. Write SQL Query to Fetch FIRST_NAME from the Worker Table With No White Spaces on the Right.
SELECT rtrim(first_name) FROM worker;

-- 7. Write SQL Query to List DEPARTMENT from the Worker Table With No White Spaces on the Left.
SELECT ltrim(first_name) FROM worker;

-- 8. Write SQL Query to Display Unique DEPARTMENT Values and Their Lengths from the Worker Table.
SELECT department,length(department) FROM worker GROUP BY department;

-- 9. Write SQL Query to Replace ‘a’ with ‘A’ in FIRST_NAME from the Worker Table.
SELECT replace(first_name,"a","A") FROM worker;

-- 10. Write SQL Query to Combine FIRST_NAME and LAST_NAME into COMPLETE_NAME.
SELECT CONCAT(first_name," ",last_name) FROM worker;

-- 11. Write SQL Query to Print Worker Details Ordered by FIRST_NAME Ascending and DEPARTMENT Descending.
-- 12. Write SQL Query to Print Worker Details Ordered by FIRST_NAME Ascending and DEPARTMENT Descending.
SELECT * FROM worker ORDER BY first_name, DEPARTMENT DESC;

-- 13. Write SQL Query to Print Worker Details with First Names “Vipul” and “Satish”.
SELECT * FROM worker WHERE first_name IN ("VIPUL","satish");

-- 14. Write SQL Query to Print Worker Details Excluding First Names (“Vipul” and “Satish”).
SELECT * FROM worker WHERE first_name NOT IN ("VIPUL","satish");

-- 15. Write SQL Query to Print Worker Details with DEPARTMENT Name as “Admin”.
SELECT * FROM worker WHERE department= "admin";

-- 16. Write SQL Query to Print Worker Details Whose FIRST_NAME Contains ‘a’.
SELECT * FROM worker WHERE first_name REGEXP "a";
SELECT * FROM worker WHERE first_name LIKE "%a%";

-- 17. Write SQL Query to List Worker Info Whose FIRST_NAME Ends with ‘a’.
SELECT * FROM worker WHERE first_name REGEXP "a$";
SELECT * FROM worker WHERE first_name LIKE "%a";

-- 18. Write SQL Query to Fetch Workers Whose FIRST_NAME Ends with ‘h’ and Has 6 Letters.
SELECT * FROM worker WHERE first_name LIKE "_____h";

-- 19. Write SQL Query to Show Worker Info Whose SALARY is Between 100000 & 500000.
SELECT * FROM worker WHERE salary BETWEEN 100000 AND 500000;

-- 20. Write SQL Query to Display Workers Who Joined in Feb 2021.
SELECT * FROM worker WHERE YEAR(joining_date) = 2021 AND month(joining_date) = 2;

-- 21. Write SQL Query to Print Employee Count in ‘Admin’ Department.
SELECT count(*) FROM worker WHERE DEPARTMENT="ADMIN";

-- 22. Write SQL Query to Fetch Worker Names with Salaries >= 50000 and <= 100000.
SELECT * FROM worker WHERE salary >= 50000 AND salary <= 100000;

-- 23. Write SQL Query to List Worker Count Per Department in Descending Order.
SELECT department, count(worker_id) FROM worker GROUP BY department ORDER BY department DESC;

-- 24. Write SQL Query to Print Worker Details Who Are Also Managers.
SELECT worker_id,w.FIRST_NAME, t.WORKER_TITLE 
FROM worker w 
JOIN title t 
ON w.WORKER_ID = t.WORKER_REF_ID 
WHERE worker_title = "manager" 
GROUP BY WORKER_ID,WORKER_TITLE;

-- 25. Write SQL Query to Fetch Duplicate Records with Matching Data in Specific Fields of a Table.
SELECT worker_id FROM worker GROUP BY worker_id HAVING count(worker_id)>1;

-- 26. Write SQL Query to Show Only Odd Rows from a Table.
SELECT * FROM worker WHERE WORKER_ID%2 <>0;

-- 27. Write SQL Query to Show Only Even Rows from a Table.
SELECT * FROM worker WHERE WORKER_ID%2 =0;

-- 28. Write SQL Query to Clone a New Table from Another Table.
CREATE TABLE worker_temp AS SELECT * FROM worker;

-- 29. Write SQL Query to Display Intersecting Records of Two Tables.
SELECT * FROM worker w JOIN title t ON t.WORKER_REF_ID=w.worker_id;

-- 30. Write SQL Query to Show Records from One Table That Are Not Present in Another Table.
SELECT * FROM worker LEFT JOIN title ON worker.WORKER_ID = title.WORKER_REF_ID;

-- 31. Write SQL Query to Show the Current Date and Time.
SELECT current_timestamp();

-- 32. Write SQL Query to Show the Top n (say 10) Records of a Table.
SELECT * FROM worker ORDER BY salary DESC LIMIT 1;

-- 33. Write SQL Query to Determine the Nth (say n=5) Highest Salary.
SELECT * FROM worker ORDER BY salary DESC LIMIT 1 OFFSET 5;

-- creating stored procedure

DELIMITER $$
CREATE PROCEDURE getNthHighSal(sal INT)
BEGIN
	DECLARE offset_val INT;
    SET offset_val = sal-1;
	SELECT * FROM worker ORDER BY salary DESC LIMIT 1 OFFSET offset_val;
END  $$
DELIMITER ;

CALL getNthHighSal(1);

--  to deop procedure, DROP PROCEDURE getNthHighSal;

-- 34. Write SQL Query to Determine 5th Highest Salary Without Using TOP or Limit.
CALL getNthHighSal(5);

-- 35. Write SQL Query to Fetch the List of Employees with the Same Salary.
SELECT WORKER_ID FROM worker WHERE salary = (
SELECT salary FROM (
SELECT salary FROM worker GROUP BY salary HAVING count(salary)>1
) AS derived
);

-- 36. Write SQL Query to List the Employee with the Second-Highest Salary.
SELECT SALARY FROM worker GROUP BY salary ORDER BY salary DESC LIMIT 1 OFFSET 1;

-- 37. Write SQL Query to Display One Row Twice in the Results from a Table.
SELECT first_name FROM worker WHERE first_name="vipul"
UNION ALL
SELECT first_name FROM worker WHERE first_name="vipul"
;

-- 38. Write SQL Query to Fetch Intersecting Records of Two Tables.
SELECT * FROM worker w JOIN title t WHERE w.WORKER_ID = t.WORKER_REF_ID;

-- 39. Write SQL Query to Fetch the First 50% of Records from a Table.
DELIMITER $$
CREATE PROCEDURE nthCentRec(per INT, count INT)
BEGIN
DECLARE cent_val INT;
DECLARE final_limit_val INT;
SET cent_val = ROUND((per/100)*count);
SET final_limit_val = cent_val -1;
	SELECT * FROM worker LIMIT cent_val;
END $$
DELIMITER ;

CALL nthCentRec(50,8);

DROP PROCEDURE nthCentRec;

-- 40. Write SQL Query to Fetch Departments with Less than Five People in Them.
SELECT department,count(*) as counte FROM worker GROUP BY department HAVING counte < 5;

-- 41. Write SQL Query to Show All Departments with the Number of People in There.
SELECT DEPARTMENT,count(*) FROM worker GROUP BY DEPARTMENT;

-- 42. Write SQL Query to Show the Last Record from a Table.
SELECT * FROM worker ORDER BY worker_id DESC LIMIT 1;

-- 43. Write SQL Query to Fetch the First Row of a Table.
SELECT * FROM worker ORDER BY worker_id LIMIT 1;

-- 44. Write SQL Query to Fetch the Last Five Records from a Table.
SELECT * FROM worker ORDER BY worker_id DESC LIMIT 5;

-- 45. Write SQL Query to Show Employees with the Highest Salary in Each Department.
SELECT DEPARTMENT,MAX(SALARY) AS highest_sal FROM worker GROUP BY DEPARTMENT;

-- 46. Write SQL Query to Fetch the Top Three Max Salaries from a Table.
SELECT salary FROM worker ORDER BY salary DESC LIMIT 3;

-- 47. Write SQL Query to Fetch the Three Min Salaries from a Table.
SELECT salary FROM worker ORDER BY salary LIMIT 3;

-- 48. Write SQL Query to Fetch the Nth Max Salaries from a Table.
CALL getNthHighSal(5);

-- 49. Write SQL Query to Fetch Departments and Their Total Salaries.
SELECT department,sum(salary) AS total_sal FROM worker GROUP BY department;

-- 50. Write SQL Query to Fetch Workers with the Highest Salary.
SELECT * FROM worker WHERE salary = (SELECT max(salary) FROM worker);
SELECT * FROM worker ORDER BY salary DESC LIMIT 1;
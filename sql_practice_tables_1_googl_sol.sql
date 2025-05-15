-- SQL practice questions :

-- 1. Write an SQL query to fetch the EmpId and FullName of all the employees working under the Manager with id – ‘986’.
-- 2. Write an SQL query to fetch the different projects available from the EmployeeSalary table.
-- 3. Write an SQL query to fetch the count of employees working in project ‘P1’.
-- 4. Write an SQL query to find the maximum, minimum, and average salary of the employees.
-- 5. Write an SQL query to find the employee id whose salary lies in the range of 9000 and 15000.
-- 6. Write an SQL query to fetch those employees who live in Toronto and work under the manager with ManagerId – 321.
-- 7. Write an SQL query to fetch all the employees who either live in California or work under a manager with ManagerId – 321.
-- 8. Write an SQL query to fetch all those employees who work on Projects other than P1.
-- 9. Write an SQL query to display the total salary of each employee adding the Salary with Variable value.
-- 10. Write an SQL query to fetch the employees whose name begins with any two characters, followed by a text “hn” and ends with any sequence of characters.
-- 11. Write an SQL query to fetch all the EmpIds which are present in either of the tables – ‘EmployeeDetails’ and ‘EmployeeSalary’.
-- 12. Write an SQL query to fetch common records between two tables.
-- 13. Write an SQL query to fetch records that are present in one table but not in another table.
-- 14. Write an SQL query to fetch the EmpIds that are present in both the tables –  ‘EmployeeDetails’ and ‘EmployeeSalary.
-- 15. Write an SQL query to fetch the EmpIds that are present in EmployeeDetails but not in EmployeeSalary.
-- 16. Write an SQL query to fetch the employee’s full names and replace the space with ‘-’.
-- 17. Write an SQL query to fetch the position of a given character(s) in a field.
-- 18. Write an SQL query to display both the EmpId and ManagerId together.
-- 19. Write a query to fetch only the first name(string before space) from the FullName column of the EmployeeDetails table.
-- 20. Write an SQL query to uppercase the name of the employee and lowercase the city values.
-- 21. Write an SQL query to find the count of the total occurrences of a particular character – ‘n’ in the FullName field.
-- 22. Write an SQL query to update the employee names by removing leading and trailing spaces.
-- 23. Write an SQL query to update the Salary field by value 10% in case of ‘Employee’ and 5% in case of ‘Manager’.
-- 24. Fetch all the employees who are not working on any project.
-- 25. Write an SQL query to fetch employee names having a salary greater than or equal to 5000 and less than or equal to 10000.
-- 26. Write an SQL query to find the current date-time.
-- 27. Write an SQL query to fetch all the Employee details from the EmployeeDetails table who joined in the Year 2020.
-- 28. Write an SQL query to fetch all employee records from the EmployeeDetails table who have a salary record in the EmployeeSalary table.
-- 29. Write an SQL query to fetch the project-wise count of employees sorted by project’s count in descending order.
-- 30. Write a query to fetch employee names and salary records. Display the employee details even if the salary record is not present for the employee.
-- 31. Write an SQL query to join 3 tables.
-- 32. Write an SQL query to fetch all the Employees who are also managers from the EmployeeDetails table.
-- 33. Write an SQL query to fetch duplicate records from EmployeeDetails (without considering the primary key – EmpId).
-- 34. Write an SQL query to remove duplicates from a table without using a temporary table.
-- 35. Write an SQL query to fetch only odd rows from the table.
-- 36. Write an SQL query to fetch only even rows from the table.
-- 37. Write an SQL query to create a new table with data and structure copied from another table.
-- 38. Write an SQL query to create an empty table with the same structure as some other table.
-- 39. Write an SQL query to fetch top n records.
-- 40. Write an SQL query to find the nth highest salary from a table.
-- 41. Write SQL query to find the 3rd highest salary from a table without using the TOP/limit keyword.
-- 42. Consider a SalesData with columns SaleID, ProductID, RegionID, SaleAmount. Write a query to find the total sales amount for each product in each region.
-- 43. Write a query to find employees who earn more than their managers.
-- 44. Consider a BookCheckout table with columns – CheckoutID, MemberID, BookID, CheckoutDate, ReturnDate. Write an SQL query to find the number of books checked out by each member.
-- 45. Consider a StudentGrades table with columns – StudentID, CourseID, Grade. Write a query to find students who have scored an ‘A’ in more than three courses.
-- 46. Consider a table OrderDetails with columns – OrderID, CustomerID, ProductID, OrderDate, Quantity, Price. Write a query to find the average order value for each customer.
-- 47. Consider a table PatientVisits with Columns VisitID, PatientID, DoctorID, VisitDate, Diagnosis. Write a query to find the latest visit date for each patient.
-- 48. For a table FlightBookings with columns – BookingID, FlightID, PassengerID, BookingDate, TravelDate, Class, write a query to count the number of bookings for each flight class.
-- 49. Consider a table FoodOrders with columns – OrderID, TableID, MenuItemID, OrderTime, Quantity. Write a query to find the most ordered menu item.
-- 50. Consider a table Transactions with columns – TransactionID, CustomerID, ProductID, TransactionDate, Amount. Write a query to find the total transaction amount for each month.
-- 51. Consider a table EmployeeAttendance with columns – AttendanceID, EmployeeID, Date, Status. Write a query to find employees with more than 5 absences in a month.
-- --------------------------- 0 ---------------------

-- 1. Write an SQL query to fetch the EmpId and FullName of all the employees working under the manager with id – ‘986’.
SELECT * FROM employee_details WHERE manager_id = 986;

-- 2. Write an SQL query to fetch the different projects available from the EmployeeSalary table.
SELECT project FROM employee_salary WHERE project IS NOT NULL;

-- 3. Write an SQL query to fetch the count of employees working in project ‘P1’.
SELECT project , COUNT(*) AS employee_count FROM employee_salary WHERE project IS NOT NULL GROUP BY project;

-- 4. Write an SQL query to find the maximum, minimum, and average salary of the employees.
SELECT MAX(salary) AS max_sal, MIN(salary) AS min_sal, avg(salary) AS average_sal FROM employee_salary GROUP BY salary;

-- 5. Write an SQL query to find the employee id whose salary lies in the range of 9000 and 15000.
SELECT * FROM employee_salary WHERE salary BETWEEN 9000 AND 15000;

-- 6. Write an SQL query to fetch those employees who live in Toronto and work under the manager with ManagerId – 321.
SELECT * FROM employee_details WHERE city = "TORONTO" AND manager_id = 321;

-- 7. Write an SQL query to fetch all the employees who either live in California or work under a manager with ManagerId – 321.
SELECT * FROM employee_details WHERE city = "California" OR manager_id = 321;

-- 8. Write an SQL query to fetch all those employees who work on Projects other than P1.
SELECT * FROM employee_details ed JOIN employee_salary es USING (emp_id) WHERE es.project != "p1";

-- 9. Write an SQL query to display the total salary of each employee adding the Salary with Variable value.
SELECT emp_id,salary, variable, salary+variable AS total_salary FROM employee_salary;

-- 10. Write an SQL query to fetch the employees whose name begins with any two characters, followed by a text “hn” and ends with any sequence of characters.
SELECT * FROM employee_details WHERE full_name LIKE "__hn%";
SELECT * FROM employee_details WHERE full_name REGEXP "hn";

-- 11. Write an SQL query to fetch all the EmpIds which are present in either of the tables – ‘EmployeeDetails’ and ‘EmployeeSalary’.
SELECT emp_id FROM employee_details
UNION
SELECT emp_id FROM employee_salary;

-- 12. Write an SQL query to fetch common records between two tables.
SELECT * FROM employee_details JOIN employee_salary USING (emp_id);

-- 13. Write an SQL query to fetch records that are present in one table but not in another table.
SELECT * FROm employee_details LEFT JOIN employee_salary USING (emp_id);

-- 14. Write an SQL query to fetch the EmpIds that are present in both the tables –  ‘EmployeeDetails’ and ‘EmployeeSalary.
-- we can use full join but not preferrable since we must use filter for emp_id not null.
SELECT * FROM employee_details JOIN employee_salary USING (emp_id);

-- 15. Write an SQL query to fetch the EmpIds that are present in EmployeeDetails but not in EmployeeSalary.
SELECT * FROm employee_details LEFT JOIN employee_salary USING (emp_id);

-- 16. Write an SQL query to fetch the employee’s full names and replace the space with ‘-’.
SELECT full_name, replace(full_name," ","-") AS formatted_names FROM employee_details;

-- 17. Write an SQL query to fetch the position of a given character(s) in a field.
SELECT full_name , instr(full_name,"a") FROM employee_details;

-- 18. Write an SQL query to display both the EmpId and ManagerId together.
SELECT CONCAT(emp_id,"_",manager_id) AS merged_id FROM employee_details;

-- 19. Write a query to fetch only the first name(string before space) from the FullName column of the EmployeeDetails table.
SELECT SUBSTRING(full_name,1,INSTR(full_name," ")) FROM employee_details;

-- to get last name
SELECT SUBSTRING(full_name,INSTR(full_name," ")) AS last_name FROM employee_details;

-- 20. Write an SQL query to uppercase the name of the employee and lowercase the city values.
SELECT upper(full_name), lower(city) FROM employee_details;

-- 21. Write an SQL query to find the count of the total occurrences of a particular character – ‘n’ in the FullName field.
SELECT emp_id, SUM(length(full_name) - length(replace(full_name,"n",""))) FROM employee_details GROUP BY emp_Id;

-- 22. Write an SQL query to update the employee names by removing leading and trailing spaces.
SELECT ltrim(full_name), rtrim(full_name) FROM employee_details;
-- update query
UPDATE employee_details SET full_name = LTRIM(RTRIM(full_name));

-- 23. Write an SQL query to update the Salary field by value 10% in case of ‘Employee’ and 5% in case of ‘Manager’.

UPDATE employee_salary SET salary = round(salary+((salary*5)/100))
WHERE emp_id IN (
	SELECT DISTINCT emp_id FROM (
		SELECT m.emp_id FROM employee_details e JOIN employee_details m ON e.manager_id = m.emp_Id
    ) AS derived
);

UPDATE employee_salary SET salary = round(salary + ((salary*10)/100))
WHERE emp_id NOT IN (
	SELECT emp_id FROM (
		SELECT DISTINCT m.emp_Id FROM employee_details e JOIN employee_details m ON e.manager_id = m.emp_Id
	) AS derived
);

-- 24. Fetch all the employees who are not working on any project.
SELECT * FROM employee_salary WHERE project IS NULL;

-- 25. Write an SQL query to fetch employee names having a salary greater than or equal to 5000 and less than or equal to 10000.
SELECT * FROM employee_salary WHERE salary BETWEEN 5000 AND 10000;

-- 26. Write an SQL query to find the current date-time.
SELECT current_timestamp();

-- 27. Write an SQL query to fetch all the Employee details from the EmployeeDetails table who joined in the Year 2020.
SELECT * FROM employee_details WHERE YEAR(date_of_joining)= 2020;

-- 28. Write an SQL query to fetch all employee records from the EmployeeDetails table who have a salary record in the EmployeeSalary table.
SELECT * FROM employee_salary JOIN employee_details USING (emp_id);

-- 29. Write an SQL query to fetch the project-wise count of employees sorted by project’s count in descending order.
SELECT project, count(emp_id) AS employees FROM employee_salary GROUP BY project;

-- 30. Write a query to fetch employee names and salary records. Display the employee details even if the salary record is not present for the employee.
SELECT ed.full_name, es.salary FROM employee_details ed LEFT JOIN employee_salary es USING (emp_id);

-- 31. Write an SQL query to join 3 tables.
SELECT * FROM employee_salary JOIN employee_details USING (emp_id) JOIN employee_salary_arch USING (emp_id);

-- 32. Write an SQL query to fetch all the Employees who are also managers from the EmployeeDetails table.
SELECT DISTINCT m.emp_Id FROM employee_details e JOIN employee_salary m ON e.manager_id = m.emp_id;

-- 33. Write an SQL query to fetch duplicate records from EmployeeDetails (without considering the primary key – EmpId).
SELECT emp_id FROM employee_details GROUP BY emp_id HAVING count(emp_Id) > 1;

-- 34. Write an SQL query to remove duplicates from a table without using a temporary table.
DELETE FROM employee_details WHERE emp_id IN (
SELECT emp_id FROM(
SELECT emp_id FROM employee_details GROUP BY emp_id HAVING count(emp_id) > 1
) AS derived
);

-- 35. Write an SQL query to fetch only odd rows from the table.
SELECT * FROM employee_details WHERE emp_id%2!=0;

-- 36. Write an SQL query to fetch only even rows from the table
SELECT * FROM employee_details WHERE emp_id%2=0;

-- with even/odd lable.

SELECT 
emp_id, full_name, 
CASE 
	WHEN emp_id%2=0 THEN "EVEN"
    WHEN emp_id%2!=0 THEN "ODD"
END AS emp_id_no_type
FROM employee_details;

-- 37. Write an SQL query to create a new table with data and structure copied from another table.
CREATE TABLE employee_details_temp AS SELECT * FROM employee_details;

-- 38. Write an SQL query to create an empty table with the same structure as some other table.
TRUNCATE TABLE employee_details_temp;

-- 39. Write an SQL query to fetch top n records.
SELECT MAX(salary) FROM employee_salary GROUP BY salary ORDER BY salary LIMIT 1 OFFSET 0; -- here offset can be replaced with n

-- writing stored procedure for getting only nth val 39 quesiton

DELIMITER $$
CREATE PROCEDURE getNthTopRecord(rec INT)
BEGIN
	DECLARE offset_val INT;
    SET offset_val = rec-1;
	SELECT max(salary) FROM employee_salary GROUP BY salary ORDER BY salary LIMIT 1 OFFSET offset_val;
END $$
DELIMITER ;

CALL getNthTopRecord(1);

-- writing stored procedure for n number of records.

DELIMITER $$
CREATE PROCEDURE getNRecords(n INT)
BEGIN 
	SELECT * FROM employee_salary ORDER BY salary LIMIT n;
END $$
DELIMITER ;

CALL getNRecords(2);

-- 40. Write an SQL query to find the nth highest salary from a table.
SELECT MAX(salary) FROM employee_salary;

-- WRITING stored procedure for the same.

DELIMITER $$
CREATE PROCEDURE getHighestSal()
BEGIN 
	SELECT MAX(salary) FROM employee_salary;
END $$
DELIMITER ;

CALL getHighestSal;

-- DROP PROCEDURE getNthHighestSal;

-- 41. Write SQL query to find the 3rd highest salary from a table without using the TOP/limit keyword.
SELECT * FROM employee_salary ORDER BY salary DESC LIMIT 1 OFFSET 2;

-- without using limit/offset/rownumber/
SELECT DISTINCT Salary FROM EmployeeDetails E1
WHERE (
    SELECT COUNT(DISTINCT Salary)
    FROM EmployeeDetails E2
    WHERE E2.Salary > E1.Salary
) = 2;

-- stored procedure
DELIMITER $$
	CREATE PROCEDURE getNthHighSal(sal INT)
		BEGIN
			DECLARE value_offset INT;
			SET value_offset = sal-1;
			SELECT * FROM employee_salary ORDER BY salary LIMIT 1 OFFSET value_offset;
		END $$
DELIMITER ;

CALL getNthHighSal(3);

-- 42. Consider a SalesData with columns SaleID, ProductID, RegionID, SaleAmount. Write a query to find the total sales amount for each product in each region.
SELECT product_id, SUM(sale_amount) AS total_amount FROM sales_data GROUP BY product_id;

-- 43. Write a query to find employees who earn more than their managers.
SELECT DISTINCT e.salary,e.name
FROM employees e JOIN employees m ON 
e.manager_id = m.emp_id 
WHERE e.salary > m.salary;
/*
-- 44. Consider a BookCheckout table with columns – CheckoutID, MemberID, BookID, CheckoutDate, ReturnDate. 
-- Write an SQL query to find the number of books checked out by each member.

SELECT MemberID, count(BookId) AS total_books FROM book_checkout GROUP BY MemberID;

-- 45. Consider a StudentGrades table with columns – StudentID, CourseID, Grade. 
-- Write a query to find students who have scored an ‘A’ in more than three courses.

SELECT StudentID,count(CourseID) AS total_courses FROM StudentGrades WHERE GRADE = "A" GROUP BY StudentID HAVING count(CourseID)>3;


-- 46. Consider a table OrderDetails with columns – OrderID, CustomerID, ProductID, OrderDate, Quantity, Price. Write a query to find the average order value for each customer.

SELECT CustomerID, AVG(Quantity*Price) AS avg_price FROM OrderDetails GROUP BY CustomerID;

-- 47. Consider a table PatientVisits with Columns VisitID, PatientID, DoctorID, VisitDate, Diagnosis. Write a query to find the latest visit date for each patient.

SELECT PatientID, Max(VisitDate) AS latest_date FROM PatientVisits GROUP BY PatientID;

-- 48. For a table FlightBookings with columns – BookingID, FlightID, PassengerID, BookingDate, TravelDate, Class, 
-- write a query to count the number of bookings for each flight class.

SELECT FlightID,Class, COUNT(BookingID) AS bookings FROM FlightBookings GROUP BY FlightID,Class;

-- 49. Consider a table FoodOrders with columns – OrderID, TableID, MenuItemID, OrderTime, Quantity. 
--Write a query to find the most ordered menu item.

SELECT MenuItemID, SUM(Quantity) AS quantity FROM FoodOrders GROUP BY MenuItemID ORDER BY quantity DESC LIMIT 1;

-- 50. Consider a table Transactions with columns – TransactionID, CustomerID, ProductID, TransactionDate, Amount. 
-- Write a query to find the total transaction amount for each month.

SELECT MONTH(TransactionDate) AS month, SUM(amount) AS total_sum FROM Transactions GROUP BY MONTH(TransactionDate) , Year(TransactionDate);


-- 51. Consider a table EmployeeAttendance with columns – AttendanceID, EmployeeID, Date, Status. 
-- Write a query to find employees with more than 5 absences in a month.

SELECT MONTH(Date) AS month, COUNT(*) AS absent_count FROM EmployeeAttendance
WHERE Status = 'absent' GROUP BY MONTH(Date) HAVING COUNT(*) > 5;
*/

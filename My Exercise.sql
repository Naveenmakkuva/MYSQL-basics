-- EXERCISES GIVEN

-- NOTES: 
/* 
06-05-2025 starts
SELECT 
	first_name, 
    last_name,
	points,
    -- new column created with addition of 10 to points.
    points + 10 AS "whole points"
	FROM customers;
    
SELECT * FROM customers WHERE city="chicago";
SELECT * FROM customers WHERE phone="312-480-8498";
SELECT * FROM customers WHERE birth_date > "1991-01-01";

SELECT * FROM customers WHERE birth_date > "1991-01-01" AND points > 1000;

SELECT * FROM customers WHERE birth_date > "1991-01-01" OR points > 1000;

SELECT * FROM customers WHERE NOT (state="FL");

SELECT DISTINCT state FROM customers;

-- TN, FL, VA
SELECT * FROM customers WHERE state IN ("TN","FL","VA") ORDER BY state;

sorting using descending order
SELECT * FROM products WHERE quantity_in_stock IN (49,38,98) ORDER BY name DESC;

-------------------o--------------------
07-05-2025 Starts.

Notes
    -- we can use below generally but

SELECT * FROM customers 
	WHERE points >=1000 AND points <=3000;

-- Using between operator as below.

SELECT * FROM customers
	WHERE points BETWEEN 1000 AND 3000;
    
-- LIKE operator similar to our startswith/endswith
-- % acts as any number of chars in string. if we keep before will give endsWith and if we keep after cahr, it will acts as startswith.

SELECT *
	FROM customers 
    -- b% will act as starts with funciton.
    WHERE last_name LIKE "b%";

SELECT *
	FROM customers 
    -- %b acts as ends with function.
    WHERE last_name LIKE "%y";
    
SELECT * 
	FROM customers
    -- %b% acts as b presence in string in any position like abu, b in center. this will show up.
    WHERE last_name LIKE "%b%";
    
-- we can use _ for single cahr like bablu has 5 cahrs. we can use like
-- b___u to get customers starts with b and ends with u having 5 cahrs.
-- ----u this will help us to find string having 5 chars and ends with u.and

SELECT * FROM customers
	WHERE last_name LIKE "b____y";
    
-- REGEXP stands for REGULAR EXPRESSIONS similar to LIKE but more powerful
-- patterns that REGEXP allows : 
-- ^b -> indicates starts with b
-- b$ --> indicated ends with b
-- b|c|d --> indicates checking of b OR c OR d in string
-- we can use combo like :: b$|c|d --> either ends with b or have c or have d in string.
-- [ahm]b --> indicates to check in string for ab, hb, mb.
-- b[ahm] --> indicates to check in string for ba, bh, bm.
-- [a-h]b --> indicates to check in string for ab,bb,cb....hb.

SELECT * FROM customers
-- starts with b
	WHERE last_name REGEXP "^b";

SELECT * FROM customers
-- Ends with b
	WHERE last_name REGEXP "y$";
    
SELECT * FROM customers 
-- starts with b OR endswith Y or startswith d
	WHERE last_name REGEXP "^b|y$|^d";

SELECT * FROM customers 
-- runs combo check as ff,hf
	WHERE last_name REGEXP "[fh]f";
    
SELECT * FROM customers
-- runs combo check as cc,ch
	WHERE last_name REGEXP "c[ch]";

SELECT * FROM customers 
-- checks for combos starting from ca to ch in string.
	WHERE last_name REGEXP "c[a-h]";
    
-- IS NULL to check weather any one having null value in db.
SELECT * FROM customers
	WHERE phone IS NULL;
    
SELECT * FROM customers
	WHERE phone IS NOT NULL;

SELECT * FROM customers ORDER By last_name DESC;
-- below query sorts table with first name in desc first and if in last name any duplicates
SELECT * FROM customers ORDER BY first_name DESC, last_name;

-- LIMIT operator can be used to limit no of records we want to see.
SELECT * FROM customers LIMIT 3;  -- this will show only 3 records since limit set to 3.for
SELECT * FROM customers LIMIT 300; -- This will show all recors up to 300. ie we have 20 rec, it will show all 20.
SELECT * FROM customers LIMIT 7,3; -- This will give an offset till 7 records ie ignores 7 records and fetch next 3 rec.

-- Inner joins (INNER JOIN) (when we want to select data from multiple tables, we can use inner joins)
-- INNER JOIN table name ON Condition on how to join.
-- INNER JOIN works like it will check the foreign key availablity in other table and joins there based on condition.
-- ie; both columns in both tables should match.

SELECT 
	c.customer_id, 
    CONCAT(c.first_name ," ", c.last_name) AS customer_name , 
    o.order_id, c.address , 
    c.phone 
FROM orders o
INNER JOIN customers c
ON o.customer_id = c.customer_id  -- Condition on how to join. here we said order.customerid should be equal to customers.customerId
---------------- o --------------------
08-05-2025

USE sql_inventory;

-- Whenever we want to join tables from diff. DB, we need to prefix DB name before table.
-- check point : in sql_inventory DB, we dont have order_items table. so we prefic sql_store DB to table name to access it.

SELECT * 
FROM sql_store.order_items o 
JOIN products p
ON o.product_id = p.product_id;

USE sql_store;

SELECT *
FROM order_items o
JOIN sql_inventory.products p
ON o.product_id = p.product_id;

-- SELF JOIN is used to join table to itself.
-- example, we have employee table that contains reports to id.
-- we want to see each employee reporting manager.
-- in this case, we can use SELF JOINS.

USE sql_hr;

SELECT 
	e.employee_id AS employee_id,
    CONCAT(e.first_name," ",e.last_name) AS employee_name,
    CONCAT(em.first_name," ",em.last_name) AS manager
FROM employees e
JOIN employees em
	ON e.reports_to = em.employee_id;
    
-- JOINING MULTIPLE TABLES

SELECT 
    o.order_id,
    o.order_date,
    c.first_name,
    c.last_name,
    os.name AS status
FROM
    orders o
        JOIN
    order_statuses os ON o.status = os.order_status_id
        JOIN
    customers c ON c.customer_id = o.customer_id

 -- COMPOUND JOIN CONDITIONS nothing but joining 2 tables on two or more conditions.

SELECT
	*
FROM order_items oi
JOIN order_item_notes oin
	ON oi.order_id = oin.order_id
    AND oi.product_id = oin.product_id
    
    IMPLICIT JOIN
	In general we write same EXPLICITly using JOINS like below.
    
    SELECT * 
    FROM customers c 
    JOIN orders o 
    ON c.customer_id = o.customer_id;
    
    IMPLICIT JOINS similar to JOINS, but syntax differs using WHERE like below.
    
    SELECT *
FROM customers c , orders o
WHERE c.customer_id = o.customer_id;

-- OUTER JOIN is either LEFT OUTER JOIN (or LEFT JOIN) OR RIGHT OUTER JOIN (or RIGHT JOIN).
-- ex: we have customers that ordered before and custoemrs doesn't have any orders before and
-- we want to see all customers weather they have orders or not. there we can use outer joins.
-- simply saying if we use JOIN, it means we are using inner join, if LEFT JOIN / RIGHT JOIN used, its outer joins.

SELECT 
	first_name,
    c.customer_id,
    o.order_id
FROM customers c LEFT JOIN orders o  -- here left join indicated left table data. even if condition is not satisfied below, we get all customers.
	ON c.customer_id = o.customer_id;

SELECT 
	first_name,
    c.customer_id,
    o.order_id
FROM orders o RIGHT JOIN customers c -- here right join indicates right table data. even if condition is not satisfied below, we get all customers.
	ON c.customer_id = o.customer_id;

-- OUTER JOIN between multiple tables.
-- best practice is to avoid using RIGHT joins since its confusing.
-- below query will give all customers weather or not having orders weather or not having any shipper id.

SELECT 
	c.customer_id,
    CONCAT(c.first_name, " ",c.last_name) AS customer_name,
    o.order_id,
    sh.name AS shipper
FROM customers c
LEFT JOIN orders o
   ON c.customer_id = o.customer_id
LEFT JOIN shippers sh
	ON o.shipper_id = sh.shipper_id
ORDER BY c.customer_id;

-- SELF OUTER JOIN all employees with managers has come but for manager nothing came.
-- to see manager reports to we can use SELF OUTER JOIN.
SELECT 
	e.employee_id,
    e.first_name,
    m.first_name
FROM employees e
LEFT JOIN employees m
	ON e.reports_to = m.employee_id
    
--------------- o -------------------

-- USING clause generally used to replace ON condition on JOIN (INNER/OUTER).
-- However column names in both tables MUST BE SAME.
-- we can also perform compound joining using USING clause.

SELECT 
	c.first_name,
    o.order_id,
    s.name AS shipper_id
FROM customers c
JOIN orders o
	USING (customer_id)  -- customer_id is same column name across 2 tables.
LEFT JOIN shippers s
	USING (shipper_id);

SELECT *
FROM order_items oi
LEFT JOIN order_item_notes oin
	USING (product_id,order_id);  -- table oin have composite PK. so we can join using both product_id and order_id.
    
-- NATURAL JOIN NOT RECOMEMDED since it may provide unexpected o/p because SQL engine may have freedom to guess join but better to know.

SELECT *
FROM customers c
NATURAL JOIN orders o;

-- CROSS JOIN all records in one table will be joined with all records in other table.
-- we dont have any condition since all records are joined here.
-- 2 types we can call explicit CROSS JOIN and directly in FROM caluse.
-- real time ex: one table has sizes (small, large, medium) another table has colours (rgb). when we want to combine all colours with sizes.

SELECT 
	c.first_name AS customer,
    p.name AS products
FROM customers c
CROSS JOIN products p -- explicit syntax RECOMENDED.
ORDER BY customer;

SELECT 
	c.first_name AS customer,
    p.name AS products
FROM customers c, products p  -- implicit syntax for cross joins.
ORDER BY customer;

-- UNION used to combine 2 or more queries to give a specific result.
-- number of col specified in 1st query count should be same for the rest.
-- we can perform UNION between multiple tables as well.

SELECT 
	o.order_id,
    o.order_date,
    "ACTIVE" AS status
FROM orders o
	WHERE o.order_date >= "2019-01-01"
UNION  -- joined results of 2 queries using UNION
SELECT
	order_id,
    order_date,
    "ARCHIVED" AS status
FROM orders
	WHERE order_date <"2019-01-01";

-- COLUMN ATTRIBUTES gives a brief of column attributes like data-type (int, bigint, varchar, char), not-null, primary key, auto increment, default value etc :

-- INSERTING SINGLE ROW

INSERT INTO customers
	VALUES (DEFAULT, "NAVEEN","KUMAR","2025-01-01",NULL,"Door No 9-1, geddapeta,jagagmpeta, EGDT, INDIA","JAGGAMPETA","AP",DEFAULT);

-- we can also insert data like below.

INSERT INTO customers (first_name, last_name, address, city, state)
	VALUES ("HARISH","KUMAR","JIO MANAGER OFFICE","JAGGAMPETA","AP");
    
-- INSERTING multiple rows.

INSERT INTO shippers (name)
	VALUES ("delhivery"), ("flipkart"),("amazon"),("dtdc")

-- INSERTING HIERARCHICAL ROWS (inserting data to multiple tables)
-- a new order id is generated for above query to get that id, we can use inbuilt function : LAST_INSERT_ID()
SELECT LAST_INSERT_ID();  -- fetching last_insert_id.
-- inserting orders with that insert id into child order-items table.

INSERT INTO orders (customer_id,order_date,status)
	VALUES (11,"2025-05-09",3);
INSERT INTO order_items
	VALUES (last_insert_id(), 11 , 4 , 2.86),
			(last_insert_id(), 12 , 5 , 2.16),
            (last_insert_id(), 13 , 6 , 3.89);
            
-- CREATING COPY OF TABLES
CREATE TABLE orders_archived AS
	SELECT * FROM orders;  -- this is a subquery inside create statement that copy all data from orders to orders_archived.
    
-- post truncating data in orders_archived table,
INSERT INTO orders_archived
	SELECT * FROM orders WHERE order_date < "2019-01-01";  -- sub query inside insert statement. copies some data only.
    
-- UPDATING SINGLE ROW


UPDATE invoices
SET payment_total = 10, payment_date = "2019-03-01"  -- updating col with data for id 1
WHERE invoice_id = 1;

UPDATE invoices
SET 
	payment_total = DEFAULT, 
    payment_date = NULL  -- DEFAULT meaning sql set default value, null can be passed if col accept it.
WHERE invoice_id = 1;

-- lets say customer 3 paid 50% of invoice total on due date. to update, we can write as follows

UPDATE invoices
SET 
	payment_total = invoice_total/2 , 
	payment_date = due_date
WHERE invoice_id = 3

-- UPDATING MULTIPLE ROWS we need to turn off our safe mode from edit --> pref --> sql-editor --> last un check safe mode.
UPDATE invoices
SET payment_total = 10 , payment_date = "2019-02-02"
WHERE client_id=3  -- *** if where condition is not provided, all records will be updated with same amount and date.


-- USING SUBQUERY WITH UPDATE
-- ALWAYS first execute and check select statement before updating.

UPDATE invoices
SET 
	payment_total = 10, 
	payment_date = "2021-02-01"
WHERE client_id = (SELECT client_id FROM clients WHERE name = "vinte");  -- added subquery inside update where condition.

UPDATE invoices
SET
	payment_total = 10, 
	payment_date = "2021-02-01"
WHERE client_id IN ( SELECT client_id FROM clients WHERE state IN ("CA","TX") );

-- DELETING ROWS
DELETE FROM invoices
	WHERE client_id = (SELECT client_id FROM clients WHERE name = "MyWORKS");
    
-- RESTORING DATABASES just run script before we downloaded and run script. in that we have drop and create fresh data base.

*/
-- 06-05-2025
-- 1 "SELECT" CALUSE STARTS HERE
	-- RETURN ALL THE PRODUCTS
	-- NAME
	-- UNIT PRICE
	-- NEW PRICE (UNITPRICE * 1.1)
-- ENDS HERE

SELECT 
	name,
    unit_price,
    unit_price * 1.1 AS "new price"
    FROM PRODUCTS;
    
-- 2 "WHERE" CLAUSE STARTS HERE
	-- GET ALL ORDERS PLACED ON 2018
-- ENDS HERE
SELECT * FROM 
	orders 
    WHERE 
    order_date <= "2018-12-31" AND order_date > "2018-01-01";


-- 3 "AND", "OR", "NOT" CLAUSEs STARTS HERE
	/*
		from order_items table, get items for order no 6
        where total price is greater than 30.
        total price is multiple of quantity * unit price
    */
-- ENDS HERE

SELECT 
    order_id,
    product_id,
    quantity,
    unit_price,
    quantity * unit_price AS total_price
FROM
    order_items
 WHERE
    order_id = 6
         AND quantity * unit_price > 30;

/*
4 IN clause starts here.
we use IN operator to compare an attribute against a list of objects.
Return products with qty in stock equal to 49, 38,98
Ends here
*/

SELECT * FROM products WHERE quantity_in_stock IN (49,38,98) ORDER BY name DESC;

/* 
Sample practice that includes whole yesterday's session.
SELECT DISTINCT
	first_name, 
    last_name, 
    birth_date, 
    phone, address, 
    city, 
    state, 
    points, 
    state IN ("VA","FL","CO","tx") AS "separate_states" 
    FROM sql_store.customers 
    WHERE (points > 1000 AND birth_date > "1973-01-01") OR NOT (city="Chichago")
	ORDER BY state DESC;
*/

-- 07-05-2025 Starts.

/* 
5. BETWEEN operator starts here.
Return customers born between 1/1/1990 and 1/1/2000
ENDS here
*/

SELECT * FROM customers
	WHERE birth_date BETWEEN "1990-01-01" AND "2000-01-01";
    
    /* 
6. LIKE operator starts here.
A. Get the customers whose addresses containg TRAIl or AVENUE
B. phone numbers ends with 9.
ENDS here
*/

SELECT * FROM customers
	WHERE address LIKE "%TRAIL%" OR address LIKE "%AVENUE%";
    
SELECT * FROM customers
	WHERE phone LIKE "%9";

    /* 
7. REGEXP operator (more powerful than LIKE) starts here.
	GET THE CUSOTMERS WHOSE 
A.	firstname are ELKA or AMBUR
B.	last name ends with EY or ON
C.	last name start with MY or contains SE
D.	last name contains B followed by R or U
ENDS here
*/

SELECT * FROM customers
	WHERE first_name REGEXP "ELKA|AMBUR";

SELECT * FROM customers
	WHERE last_name REGEXP "EY$|ON$";
    
SELECT * FROM customers 
	WHERE last_name REGEXP "^MY|SE";

SELECT * FROM customers
	WHERE last_name REGEXP "B[RU]";

SELECT * FROM customers
	WHERE last_name REGEXP "BR|BU";
    
    /* 
8. IS NULL / IS NOT NULL operator starts here.
	GET the orders that are not shipped yet.
    GET orders where comments not null.
ENDS here
*/
SELECT * FROM orders
	WHERE shipped_date IS NULL AND shipper_id IS NULL;

SELECT * FROM orders WHERE comments IS NOT NULL;

/* 
8. ORDER BY caluse starts here.
	write a query to select order items with order id 2 and get toal price sorted in desc order.
ENDS here
*/

SELECT 
    * , quantity * unit_price AS total_price
FROM
    order_items
WHERE
    order_id = 2
ORDER BY total_price DESC;
   
/* 
9. LIMIT operator starts here.
	GET top 3 loayal customers
    loyal meaning more points.
ENDS here
*/

SELECT 
    *
FROM
    customers
ORDER BY points DESC
LIMIT 3;

/* 
10. INNER JOIN clause starts here.
	join order_items with products table and
		for each order_id, we want product_id, product_name, quantity and unit price and total price
ENDS here
*/

SELECT 
	order_id,
    pt.product_id,
    pt.name AS product_name,
    ot.unit_price,
    quantity,
    quantity * ot.unit_price AS "Total Price"
FROM order_items ot
INNER JOIN products pt
ON ot.product_id = pt.product_id;

-- Another example
-- i have customer id. i want all his orders with phone number, customer_id, order_id, order_date,
--  and shipment details and customer full name in single col.

SELECT 
	CONCAT(first_name, " ",last_name) AS "Customer Name",
    phone,
	c.customer_id,
    order_id, 
    order_date,
    shipped_date
FROM orders o
INNER JOIN customers c
ON o.customer_id=c.customer_id
WHERE c.customer_id=2;

-- 08-05-2025 starts
/* 
11. JOINING MULTIPLE TABLES starts here.
	from sql_invoicing DB, join all tables and give proper report.
    get clients id and name and all payments done with invoice id, payment type.
ENDS here
*/

SELECT 
	c.client_id,
	c.name AS client_name,
    p.date AS payment_date,
    pm.name AS mode_of_payment,
    p.invoice_id,
    i.invoice_total
FROM clients c
JOIN payments p
	ON c.client_id = p.client_id
JOIN payment_methods pm
	ON p.payment_id = pm.payment_method_id
JOIN invoices i
	ON p.invoice_id = i.invoice_id
ORDER BY client_id;
    
/* 
12. OUTER JOIN starts here.
join products table to order items table and get result as product_id, product name, quantity weather product is ordered or not based on qty.
ie: if qty null, order hasn't been done on that product.
ENDS here
*/

SELECT 
	p.product_id,
	p.name AS producct_name,
    oi.quantity AS ordered_quantity
FROM products p
LEFT JOIN order_items oi
		ON p.product_id = oi.product_id;
    
    
/* 
13. OUTER JOIN FOR MULTIPLE TABLES starts here.
columns req : order_date, order_id, first_name, shipper, status
tables needed : orders, customers, shippers, order_statuses
ENDS here
*/    

SELECT 
	o.order_date,
    o.order_id,
    c.first_name AS customer,
    s.name AS shipper,
    os.name AS status
FROM customers c
JOIN orders o
	ON c.customer_id = o.customer_id
LEFT JOIN shippers s
	ON o.shipper_id = s.shipper_id
JOIN order_statuses os
	ON o.status = os.order_status_id
ORDER BY status;

-- 09-05-2025 starts here
    
/* 
14. USING CALUSE starts here.
columns req : date, client, amount, name (mode_of_payment) from sql_invoicing.
ENDS here
*/   

SELECT 
	p.date,
    c.name AS client,
    p.amount,
    pm.name AS mode_of_payment
FROM clients c
LEFT JOIN payments p
	USING (client_id)
JOIN payment_methods pm
	-- below column name in both tables are not same so used ON clause.
	ON p.payment_method = pm.payment_method_id;
 
 /* 
15. CROSS JOIN starts here.
do a cross join b/w shippers and products
	A. using implicit syntax
    B. using explicit syntax
ENDS here
*/ 

SELECT 
	c.name AS products,
	sh.name AS shipper
FROM shippers sh  
CROSS JOIN products c -- Explicit syntax
ORDER BY products;

SELECT 
	p.name AS products,
	sh.name AS shipper
FROM shippers sh, products p  -- Implicit syntax
ORDER BY products;

/* 
16. UNION starts here.
columns : customer_id,first_name,points,type
TYPE is a label here and is calculated based on points. < 2000 points bronze, 2000 to 3000 silver and above 3000 gold customers.
ENDS here
*/ 

SELECT 
	customer_id,
    first_name,
    points,
    "BRONZE" AS type
FROM customers
	WHERE points <=2000
UNION
SELECT 
	customer_id,
    first_name,
    points,
    "SILVER" AS type
FROM customers
	WHERE points BETWEEN "2000" AND "3000"
UNION
SELECT 
	customer_id,
    first_name,
    points,
    "GOLD" AS type
FROM customers
	WHERE points > 3000
ORDER BY first_name;

/* 
16. INSERT into rows starts here.
insert 3 rows in products table.
ENDS here
*/ 

INSERT INTO products (name,quantity_in_stock,unit_price)
	VALUES ("mobiles",50,10.5),("earphones",100,5.5),("charger",20,3.5);
    
/* 
17. CREATE TABLE -- as and subquery starts here.
create copy of sql_invoices.invoices table as invoices_archived following conditions as below
A. instead of client_id, we want client_name col
B. invoices that only have payment is required. ie:payment date available records only.
ENDS here
*/

CREATE TABLE invoices_archievd AS 
SELECT i.invoice_id,
    i.number,
    c.name AS client_name,
    i.invoice_total,
    i.payment_total,
    i.invoice_date,
    i.due_date,
    i.payment_date 
    FROM invoices i
	JOIN clients c 
    USING (client_id)
WHERE
    i.payment_date IS NOT NULL;
    
/* 
18. UPDATE SINGLE/MULTIPLE ROWS starts here.
get all customers who are born before 1990 and add 50 points.
ENDS here
*/

UPDATE customers
SET points = points + 50
WHERE birth_date <= "1990-01-01";
    
/* 
19. UPDATE WITH SUBQUERY starts here.
all customers ordered and having more than 3000 points should be updated with comments GOLD custoemr.
ENDS here
*/
UPDATE orders
SET comments = "GOLD CUSTOMER"
WHERE customer_id IN (
SELECT customer_id 
FROM customers
WHERE points > 3000);

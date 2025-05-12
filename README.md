BASICS of sql and all study material can be found in exercise file.

DBMS
	1. Relational DB
	2. non-relational DB
	
Relational DB : its a common DB that follows tablular structure maintaing relations between tables.
	-> using SQL this will work.
	-> examples DBMS: MySQL/MYSEQUEL, Oracle, SQL server.....
	
Non-relational DB : it works with a separate query language.

TOPICS covered here.

keywords we use today:
A. USE
1. SELECT
2. FROM
3. WHERE
4. AND
5. NOT
6. OR
7. IN

-- DAY 2 --

8. BETWEEN
9. LIKE  --> % represenst chars (b% starts with , %b ends with, %b% anywhere in string., ____y 4 chars ends with y)
10. REGEXP --> (^ starts with, adad$ ends with , b|n|m anywhere in str for chars b,n,m, b[a,b] gives ba, bb)
11. IS NULL / IS NOT NULL
12. ORDER BY
13. LIMIT
14. INNER JOIN

-- DAY 3 --

15. JOINING ACROSS DATABASES
16. SELF JOINS
17. JOINING MULTIPLE TABLES
18. COMPOUND JOIN CONDITIONS
19. IMPLICIT JOIN SYNTAX  --> same as JOINS but diff syntax using WHERE .. NOT PREFERERD.
20. OUTER JOINS (LEFT JOIN, RIGHT JOIN)
21. OUTER JOINS BETWEEN MULTIPLE TABLES
22. SELF OUTER JOIN

-- DAY 4 --

23. USING CLAUSE
24. NATURAL JOIN (not recomnded)
25. CROSS JOIN
26. UNION
27. COLUMN ATTRIBUTES
28. INSERTING SINGLE ROW
29. INSERTING MULTIPLE ROWS (INSERT INTO table_name VALUES ("",""))
30. INSERTING HIERARCHICAL ROWS (inserting data to multiple tables)
31. CREATING COPY OF TABLES  (CREATE TABLE table_name AS select query)
32. UPDATING SINGLE ROW (UPDATE TABLE table_name SET (cloumns to be updated condition) WHERE condition)
33. UPDATING MULTIPLE ROWS
34. USING SUBQUERIES IN UPDATE
35. DELETING ROWS
36. RESTORING DATABASES

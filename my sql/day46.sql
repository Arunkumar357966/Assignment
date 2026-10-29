create database company;
USE company;

SELECT * FROM Employee;
SELECT * FROM Customer;
SELECT * FROM Student;
SELECT * FROM Staff;
SELECT * FROM Product;

SELECT * FROM Employee WHERE salary > 30000 AND age < 25;
SELECT * FROM Employee WHERE department IN ('IT','HR');
SELECT * FROM Employee WHERE salary BETWEEN 25000 AND 40000;
SELECT * FROM Employee WHERE emp_name LIKE 'V%';
SELECT * FROM Employee WHERE email IS NOT NULL;
SELECT emp_name, salary + 5000 AS new_salary FROM Employee;

SELECT * FROM Customer WHERE city = 'Chennai' OR age >= 25;
SELECT * FROM Customer WHERE city NOT IN ('Chennai','Salem');
SELECT * FROM Customer WHERE age BETWEEN 23 AND 26;
SELECT * FROM Customer WHERE cust_name LIKE 'R%';

SELECT * FROM Student WHERE marks >= 80 AND age < 23;
SELECT * FROM Student WHERE course IN ('B.Tech','BCA');
SELECT * FROM Student WHERE marks BETWEEN 70 AND 90;
SELECT stu_name, marks + 5 AS bonus_marks FROM Student;

SELECT * FROM Staff WHERE salary > 30000 OR experience >= 5;
SELECT * FROM Staff WHERE department NOT IN ('HR','Sales');
SELECT * FROM Staff WHERE salary BETWEEN 28000 AND 45000;
SELECT staff_name, salary * 12 AS annual_salary FROM Staff;

SELECT * FROM Product WHERE price >= 1000 AND quantity > 10;
SELECT * FROM Product WHERE category IN ('Electronics','Accessories');
SELECT * FROM Product WHERE price BETWEEN 500 AND 12000;
SELECT * FROM Product WHERE product_name LIKE 'L%';
SELECT product_name, price * quantity AS stock_value FROM Product;

SELECT UPPER(emp_name), LOWER(department), LENGTH(emp_name) FROM Employee;

SELECT CONCAT(cust_name, ' - ', city) FROM Customer;

SELECT AVG(marks), MAX(marks), MIN(marks), SUM(marks) FROM Student;

SELECT COUNT(*), AVG(salary), MAX(salary), MIN(salary) FROM Staff;

SELECT ROUND(AVG(price), 2), MAX(price), MIN(price), SUM(quantity) FROM Product;

SELECT CURDATE(), NOW(), YEAR(CURDATE()), MONTH(CURDATE());
SELECT ABS(-10), CEIL(12.3), FLOOR(12.9), MOD(10,3);

SELECT IF(100 > 50, 'Yes', 'No');
SELECT COALESCE(NULL, 'MySQL');
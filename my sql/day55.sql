use company;

CREATE TABLE employees (emp_id INT PRIMARY KEY,emp_name VARCHAR(50),
department VARCHAR(50),salary DECIMAL(10,2));

INSERT INTO employees VALUES(1, 'Arun', 'IT', 30000),
(2, 'Kumar', 'HR', 25000),(3, 'Ravi', 'IT', 40000),
(4, 'Priya', 'HR', 35000),(5, 'Siva', 'Sales', 20000);

CREATE TABLE students (student_id INT PRIMARY KEY,student_name VARCHAR(50),
course VARCHAR(50),mark INT);

INSERT INTO students VALUES(1, 'Arun', 'BCA', 85),
(2, 'Ravi', 'BSc', 70),(3, 'Priya', 'BCA', 95),
(4, 'Kumar', 'BSc', 60),(5, 'Siva', 'BCom', 80);

CREATE TABLE products (product_id INT PRIMARY KEY,product_name VARCHAR(100),
category VARCHAR(50),price DECIMAL(10,2));

INSERT INTO products VALUES(1, 'Laptop', 'Electronics', 55000),
(2, 'Mobile', 'Electronics', 15000),(3, 'TV', 'Electronics', 30000),
(4, 'Chair', 'Furniture', 5000),(5, 'AC', 'Electronics', 40000);

WITH avg_salary AS (SELECT AVG(salary) AS average_salary FROM employees)
SELECT *FROM employees
WHERE salary > (SELECT average_salary FROM avg_salary);

WITH dept_salary AS (SELECT department, AVG(salary) AS average_salary FROM employees
GROUP BY department)
SELECT department, average_salary
FROM dept_salary;

WITH average_mark AS (SELECT AVG(mark) AS avg_mark FROM students)
SELECT student_name, course, mark
FROM students
WHERE mark > (SELECT avg_mark FROM average_mark); 

WITH product_data AS (SELECT product_name, category, priceFROM products)
SELECT *FROM product_data
WHERE price > 20000;

WITH employee_bonus AS (SELECT emp_id,emp_name,salary,salary * 0.10 AS bonus FROM employees)
SELECT emp_name,salary,bonus,salary + bonus AS total_salary
FROM employee_bonus;

WITH cte_name AS (SELECT column_name FROM table_name)
SELECT *FROM cte_name;
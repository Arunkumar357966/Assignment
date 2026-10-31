CREATE DATABASE sample;
USE sample;

CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    dept_id INT
);

CREATE TABLE departments (
    dept_id INT,
    dept_name VARCHAR(50)
);

INSERT INTO employees VALUES
(1, 'Alice', 101),
(2, 'Bob', 102),
(3, 'Charlie', 103),
(4, 'David', NULL);

INSERT INTO departments VALUES
(101, 'HR'),
(102, 'IT'),
(104, 'Finance');

SELECT e.emp_name, d.dept_name FROM employees e
INNER JOIN departments d ON e.dept_id = d.dept_id;

SELECT e.emp_name, d.dept_name FROM employees e
LEFT JOIN departments d ON e.dept_id = d.dept_id;

SELECT e.emp_name, d.dept_name FROM employees e
RIGHT JOIN departments d ON e.dept_id = d.dept_id;

SELECT e.emp_name, d.dept_name FROM employees e
LEFT JOIN departments d ON e.dept_id = d.dept_id
UNION
SELECT e.emp_name, d.dept_name FROM employees e
RIGHT JOIN departments d ON e.dept_id = d.dept_id;

SELECT e.emp_name, d.dept_name FROM employees e
CROSS JOIN departments d;

CREATE TABLE Employee (
    empid INT,
    name VARCHAR(50),
    mgrid INT
);

INSERT INTO Employee VALUES
(1, 'Alice', 1),
(2, 'Bob', 1),
(3, 'Charlie', 2);

SELECT e.name AS Employee, m.name AS Manager
FROM Employee e
JOIN Employee m ON e.mgrid = m.empid
WHERE e.empid <> e.mgrid;

CREATE TABLE customers (
    customer_id INT,
    customer_name VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT,
    customer_id INT,
    amount DECIMAL(10,2)
);

INSERT INTO customers VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie');

INSERT INTO orders VALUES
(101, 1, 500.00),
(102, 2, 300.00),
(103, 4, 200.00);

SELECT c.customer_name, o.order_id, o.amount FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id;

SELECT c.customer_name, o.order_id, o.amount
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

SELECT c.customer_name, o.order_id, o.amount  FROM customers c
RIGHT JOIN orders o ON c.customer_id = o.customer_id;

SELECT c.customer_name, o.order_id, o.amount FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id UNION
SELECT c.customer_name, o.order_id, o.amount  FROM customers c
RIGHT JOIN orders o ON c.customer_id = o.customer_id;

SELECT c.customer_name, o.order_id FROM customers c
CROSS JOIN orders o;

SELECT a.customer_name AS Customer1, b.customer_name AS Customer2 FROM customers a
JOIN customers b ON a.customer_id < b.customer_id;
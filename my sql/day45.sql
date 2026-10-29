CREATE DATABASE company;
USE company;


CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    age INT,
    department VARCHAR(50),
    salary INT
);

CREATE TABLE Customer (
    cust_id INT PRIMARY KEY,
    cust_name VARCHAR(50),
    city VARCHAR(50),
    phone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE Student (
    stu_id INT PRIMARY KEY,
    stu_name VARCHAR(50),
    age INT,
    course VARCHAR(50),
    marks INT
);

CREATE TABLE Staff (
    staff_id INT PRIMARY KEY,
    staff_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    experience INT
);

CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price INT,
    quantity INT
);



ALTER TABLE Employee ADD email VARCHAR(100);
ALTER TABLE Customer ADD age INT;
ALTER TABLE Student ADD city VARCHAR(50);
ALTER TABLE Staff ADD phone VARCHAR(15);
ALTER TABLE Product ADD brand VARCHAR(50);


ALTER TABLE Employee MODIFY salary DECIMAL(10,2);
ALTER TABLE Customer MODIFY city VARCHAR(100);
ALTER TABLE Student MODIFY marks DECIMAL(5,2);


RENAME TABLE Employee TO Employees;


INSERT INTO Employees (emp_id, emp_name, age, department, salary, email)
VALUES
(1, 'Vijay', 22, 'IT', 25000, 'vijay@gmail.com'),
(2, 'Arun', 23, 'HR', 30000, 'arun@gmail.com'),
(3, 'Ragul', 24, 'Finance', 35000, 'ragul@gmail.com'),
(4, 'Karthik', 25, 'IT', 40000, 'karthik@gmail.com'),
(5, 'Kumar', 22, 'Sales', 28000, 'Kumar@gmail.com');


INSERT INTO Customer (cust_id, cust_name, city, phone, email, age)
VALUES
(1, 'Rahul', 'Chennai', '9876543210', 'rahul@gmail.com', 25),
(2, 'santhosh', 'Madurai', '9876543211', 'santhosh@gmail.com', 23),
(3, 'Ajay', 'Salem', '9876543212', 'ajay@gmail.com', 26),
(4, 'sanjay', 'Trichy', '9876543213', 'sanjay@gmail.com', 24),
(5, 'Ravi', 'Erode', '9876543214', 'ravi@gmail.com', 27);


INSERT INTO Student (stu_id, stu_name, age, course, marks, city)
VALUES
(1, 'Vijay', 22, 'B.Tech', 85, 'Chennai'),
(2, 'Arun', 21, 'BCA', 78, 'Madurai'),
(3, 'Ragul', 22, 'B.Sc', 92, 'Salem'),
(4, 'Karthik', 23, 'B.Tech', 67, 'Trichy'),
(5, 'Kumar', 21, 'BCA', 88, 'Erode');


INSERT INTO Staff (staff_id, staff_name, department, salary, experience, phone)
VALUES
(1, 'Manoj', 'Admin', 40000, 5, '9000000001'),
(2, 'Selva', 'Finance', 35000, 4, '9000000002'),
(3, 'Suresh', 'IT', 45000, 6, '9000000003'),
(4, 'Shakti', 'HR', 30000, 3, '9000000004'),
(5, 'Prakash', 'Sales', 28000, 2, '9000000005');


INSERT INTO Product (product_id, product_name, category, price, quantity, brand)
VALUES
(1, 'Laptop', 'Electronics', 55000, 10, 'HP'),
(2, 'Mouse', 'Accessories', 500, 50, 'Logitech'),
(3, 'Keyboard', 'Accessories', 1200, 30, 'Dell'),
(4, 'Monitor', 'Electronics', 12000, 15, 'Samsung'),
(5, 'Headphone', 'Accessories', 2000, 20, 'Sony');


SELECT * FROM Employees;
SELECT * FROM Customer;
SELECT * FROM Student;
SELECT * FROM Staff;
SELECT * FROM Product;


UPDATE Employees SET salary = 30000 WHERE emp_id = 1;
UPDATE Customer SET city = 'Coimbatore' WHERE cust_id = 1;
UPDATE Student SET marks = 90 WHERE stu_id = 1;
UPDATE Staff SET salary = 42000 WHERE staff_id = 1;
UPDATE Product SET price = 60000 WHERE product_id = 1;


DELETE FROM Employees WHERE emp_id = 5;
DELETE FROM Customer WHERE cust_id = 5;
DELETE FROM Student WHERE stu_id = 5;
DELETE FROM Staff WHERE staff_id = 5;
DELETE FROM Product WHERE product_id = 5;


SELECT * FROM Employees;
SELECT * FROM Customer;
SELECT * FROM Student;
SELECT * FROM Staff;
SELECT * FROM Product;


TRUNCATE TABLE Employees;
TRUNCATE TABLE Customer;
TRUNCATE TABLE Student;
TRUNCATE TABLE Staff;
TRUNCATE TABLE Product;


DROP TABLE Employees;
DROP TABLE Customer;
DROP TABLE Student;
DROP TABLE Staff;
DROP TABLE Product;
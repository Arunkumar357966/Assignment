CREATE DATABASE ConstraintDB;
USE ConstraintDB;

show tables;

CREATE TABLE Departments (dept_id INT PRIMARY KEY,dept_name VARCHAR(50) NOT NULL UNIQUE);

CREATE TABLE Students (student_id INT PRIMARY KEY,student_name VARCHAR(50) NOT NULL,email VARCHAR(100) UNIQUE,
age INT CHECK (age >= 18),city VARCHAR(50) DEFAULT 'Thanjavur',dept_id INT,FOREIGN KEY (dept_id)
REFERENCES Departments(dept_id));

CREATE TABLE Employees (emp_id INT PRIMARY KEY,emp_name VARCHAR(50) NOT NULL,email VARCHAR(100) UNIQUE,
salary INT CHECK (salary > 0),city VARCHAR(50) DEFAULT 'Chennai',dept_id INT,FOREIGN KEY (dept_id)
REFERENCES Departments(dept_id));


INSERT INTO Departments VALUES(1, 'IT'),(2, 'HR'),(3, 'Finance');

INSERT INTO Students(student_id, student_name, email, age, dept_id)
VALUES(101, 'Arun', 'arun@gmail.com', 21, 1),(102, 'Vijay', 'vijay@gmail.com', 22, 2),
(103, 'Kumar', 'kumar@gmail.com', 20, 3);

INSERT INTO Employees(emp_id, emp_name, email, salary, dept_id)
VALUES(1, 'Ravi', 'ravi@gmail.com', 25000, 1),(2, 'Suresh', 'suresh@gmail.com', 30000, 2),
(3, 'Raj', 'raj@gmail.com', 35000, 3);


SELECT * FROM Departments;
SELECT * FROM Students;
SELECT * FROM Employees;


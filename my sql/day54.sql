use sample;

CREATE TABLE students (id INT,class VARCHAR(10),name VARCHAR(50),marks INT);
INSERT INTO students VALUES(1, 'A', 'John', 85),(2, 'A', 'Sara', 92),(3, 'A', 'Mike', 78),(4, 'B', 'Anna', 88),(5, 'B', 'Tom', 90);

CREATE TABLE exam (student VARCHAR(50),subject VARCHAR(20),score INT);
INSERT INTO exam VALUES('Alice', 'Math', 90),('Bob', 'Math', 90),('Charlie', 'Math', 85),('David', 'Science', 88),('Eva', 'Science', 88);

CREATE TABLE employees1 (emp_name VARCHAR(50),department VARCHAR(20),salary INT);
INSERT INTO employees1 VALUES('Alex', 'IT', 7000),('Brian', 'IT', 7000),('Chris', 'IT', 6500),('Diana', 'HR', 6000),('Eva', 'HR', 5800);

CREATE TABLE orders1 (order_id INT,order_date DATE, amount INT);
INSERT INTO orders1 VALUES(1, '2024-01-01', 100),(2, '2024-01-02', 200),(3, '2024-01-03', 150),(4, '2024-01-04', 300);

CREATE TABLE monthly_sales1 (month VARCHAR(10), sales INT);
INSERT INTO monthly_sales1 VALUES('Jan', 5000),('Feb', 6000),('Mar', 5500),('Apr', 7000);

SELECT id,class,name,marks,
ROW_NUMBER() OVER (PARTITION BY class ORDER BY marks DESC) AS row_num
FROM students;

SELECT id,class,name,marks, 
RANK() OVER (PARTITION BY class ORDER BY marks DESC) AS student_rank
FROM students;

SELECT id,class,name,marks,
DENSE_RANK() OVER (PARTITION BY class ORDER BY marks DESC) AS student_rank
FROM students;

SELECT id,class,name,marks,
AVG(marks) OVER (PARTITION BY class) AS average_marks
FROM students;

SELECT id,class,name,marks,
MAX(marks) OVER (PARTITION BY class) AS highest_marks
FROM students;

SELECT student,subject,score,
ROW_NUMBER() OVER (PARTITION BY subject ORDER BY score DESC)row_num
FROM exam;

SELECT student,subject,score,
RANK() OVER (PARTITION BY subject ORDER BY score DESC) AS student_rank
FROM exam;

SELECT student,subject,score,
DENSE_RANK() OVER (PARTITION BY subject ORDER BY score DESC) AS student_rank
FROM exam;

SELECT student,subject,score,
COUNT(*) OVER (PARTITION BY subject) AS total_students
FROM exam;

SELECT student,subject,score,
MIN(score) OVER (PARTITION BY subject) AS minimum_score
FROM exam;

SELECT emp_name,department,salary,
ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC) AS row_num
FROM employees1;

SELECT emp_name,department,salary,
RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS employee_rank
FROM employees1;

SELECT emp_name,department,salary,
DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS employee_rank
FROM employees1;

SELECT emp_name,department,salary,
SUM(salary) OVER (PARTITION BY department) AS total_salary
FROM employees1;

SELECT emp_name,department,salary,
AVG(salary) OVER (PARTITION BY department) AS average_salary
FROM employees1;

SELECT order_id,order_date,amount,
ROW_NUMBER() OVER (ORDER BY order_date) AS row_num
FROM orders1;

SELECT order_id,order_date,amount,
SUM(amount) OVER (ORDER BY order_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total
FROM orders1;

SELECT order_id,order_date,amount,
AVG(amount) OVER (ORDER BY order_date ROWS BETWEEN 1 PRECEDING AND CURRENT ROW) AS moving_average
FROM orders1;

SELECT order_id,order_date,amount,
MAX(amount) OVER (ORDER BY order_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS maximum_amount
FROM orders1;

SELECT order_id,order_date,amount,
COUNT(*) OVER () AS total_orders
FROM orders1;

SELECT month,sales,
ROW_NUMBER() OVER (ORDER BY FIELD(month, 'Jan', 'Feb', 'Mar', 'Apr')) AS row_num
FROM monthly_sales1;

SELECT month,sales,
LAG(sales) OVER (ORDER BY FIELD(month, 'Jan', 'Feb', 'Mar', 'Apr')) AS previous_sales
FROM monthly_sales1;

SELECT month,sales,
LEAD(sales) OVER (ORDER BY FIELD(month, 'Jan', 'Feb', 'Mar', 'Apr')) AS next_sales
FROM monthly_sales1;

SELECT month,sales,
sales - LAG(sales) OVER (ORDER BY FIELD(month, 'Jan', 'Feb', 'Mar', 'Apr')) AS sales_difference
FROM monthly_sales1;

SELECT month,sales,
SUM(sales) OVER (ORDER BY FIELD(month, 'Jan', 'Feb', 'Mar', 'Apr')ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
) AS cumulative_sales
FROM monthly_sales1;
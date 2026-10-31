SELECT emp_name, salary FROM Employees
WHERE salary > (SELECT AVG(salary) FROM Employees);

SELECT emp_name FROM Employees
WHERE dept_id = (SELECT dept_id FROM Departments
WHERE dept_name = 'Engineering');

SELECT emp_name FROM Employees WHERE emp_id IN (
SELECT emp_id FROM Employee_Projects);

SELECT emp_name FROM Employees
WHERE emp_id NOT IN (SELECT emp_id FROM Employee_Projects);

SELECT project_name, budgetFROM Projects
WHERE budget = (SELECT MAX(budget) FROM Projects);

SELECT d.dept_name, SUM(p.budget) AS total_budget
FROM Departments d
JOIN Projects p ON d.dept_id = p.dept_id
GROUP BY d.dept_id, d.dept_name
HAVING SUM(p.budget) > (
    SELECT AVG(total_budget)
    FROM (
        SELECT SUM(budget) AS total_budget
        FROM Projects
        GROUP BY dept_id
    ) AS temp
);

SELECT emp_name, salary
FROM Employees
WHERE salary > (
    SELECT MAX(salary)
    FROM Employees
    WHERE dept_id = (
        SELECT dept_id
        FROM Departments
        WHERE dept_name = 'Marketing'
    )
);

SELECT emp_name, salary
FROM Employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM Employees
    WHERE dept_id = e.dept_id
);

SELECT dept_name
FROM Departments d
WHERE EXISTS (
    SELECT 1
    FROM Employees e
    WHERE e.dept_id = d.dept_id
);

SELECT dept_name
FROM Departments d
WHERE NOT EXISTS (
    SELECT 1
    FROM Projects p
    WHERE p.dept_id = d.dept_id
);

SELECT emp_name, salary,
    (SELECT SUM(salary) FROM Employees) AS total_payroll
FROM Employees;

SELECT emp_name, hire_date
FROM Employees
WHERE hire_date = (
    SELECT MIN(hire_date) FROM Employees
);

SELECT MAX(salary) AS second_highest_salary
FROM Employees
WHERE salary < (
    SELECT MAX(salary) FROM Employees
);

SELECT project_name, budget
FROM Projects
WHERE budget > (
    SELECT SUM(budget)
    FROM Projects
    WHERE dept_id = (
        SELECT dept_id
        FROM Departments
        WHERE dept_name = 'Sales'
    )
);

SELECT emp_name
FROM Employees e
WHERE EXISTS (
    SELECT 1
    FROM Employees m
    WHERE m.emp_id = e.manager_id
    AND m.dept_id <> e.dept_id
);

SELECT d.dept_name, COUNT(e.emp_id) AS total_employees
FROM Departments d
JOIN Employees e ON d.dept_id = e.dept_id
GROUP BY d.dept_id, d.dept_name
HAVING COUNT(e.emp_id) = (
    SELECT MAX(emp_count)
    FROM (
        SELECT COUNT(*) AS emp_count
        FROM Employees
        GROUP BY dept_id
    ) AS temp
);

SELECT e.emp_name, p.project_name, ep.hours_worked
FROM Employees e
JOIN Employee_Projects ep ON e.emp_id = ep.emp_id
JOIN Projects p ON ep.project_id = p.project_id
WHERE ep.hours_worked = (
    SELECT MAX(hours_worked)
    FROM Employee_Projects
);

SELECT dept_name, location
FROM Departments
WHERE dept_id IN (
    SELECT dept_id
    FROM Departments
    WHERE location LIKE 'New%'
       OR location LIKE 'San%'
);

SELECT emp_name, salary
FROM Employees
WHERE salary > ANY (
    SELECT salary
    FROM Employees
    WHERE YEAR(hire_date) = 2024
);

SELECT emp_name
FROM Employees
WHERE emp_id IN (
    SELECT manager_id
    FROM Employees
    WHERE manager_id IS NOT NULL
    GROUP BY manager_id
    HAVING COUNT(*) >= 2
);

SELECT project_name, budget
FROM Projects
WHERE budget < (
    SELECT AVG(budget) FROM Projects
);

SELECT emp_name
FROM Employees
WHERE emp_id IN (
    SELECT emp_id
    FROM Employee_Projects
    WHERE project_id IN (
        SELECT project_id
        FROM Employee_Projects
        GROUP BY project_id
        HAVING COUNT(*) = 1
    )
);

SELECT emp_name, salary,
    salary - (
        SELECT AVG(salary)
        FROM Employees e2
        WHERE e2.dept_id = e1.dept_id
    ) AS salary_difference
FROM Employees e1;

SELECT d.dept_name, SUM(e.salary) AS total_payroll
FROM Departments d
JOIN Employees e ON d.dept_id = e.dept_id
GROUP BY d.dept_id, d.dept_name
HAVING SUM(e.salary) = (
    SELECT MIN(total_payroll)
    FROM (
        SELECT SUM(salary) AS total_payroll
        FROM Employees
        GROUP BY dept_id
    ) AS temp
);

SELECT project_name
FROM Projects p
WHERE EXISTS (
    SELECT 1
    FROM Employee_Projects ep
    WHERE ep.project_id = p.project_id
    AND ep.emp_id IN (
        SELECT emp_id
        FROM Employees
        WHERE dept_id = (
            SELECT dept_id
            FROM Departments
            WHERE dept_name = 'Engineering'
        )
    )
);



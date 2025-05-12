-- Drop tables if they exist
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

-- Create tables
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    salary DECIMAL(10, 2),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

-- Insert data
INSERT INTO departments VALUES
(1, 'Engineering'),
(2, 'Sales'),
(3, 'HR');

INSERT INTO employees VALUES
(101, 'Alice', 75000, 1),
(102, 'Bob', 50000, 2),
(103, 'Charlie', 60000, 1),
(104, 'Diana', 55000, 3),
(105, 'Eve', 65000, 2);

-- Example query: Join + Filter
SELECT 
    e.emp_name, 
    e.salary, 
    d.dept_name
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
WHERE e.salary > 55000;

-- Aggregation: Average salary per department
SELECT 
    d.dept_name,
    AVG(e.salary) AS avg_salary
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

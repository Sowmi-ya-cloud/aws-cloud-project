-- ================================
-- Create Tables
-- ================================

CREATE TABLE Departments (
    dept_id INTEGER PRIMARY KEY,
    dept_name TEXT NOT NULL,
    location TEXT
);

CREATE TABLE Employees (
    emp_id INTEGER PRIMARY KEY,
    emp_name TEXT NOT NULL,
    age INTEGER,
    salary REAL,
    dept_id INTEGER,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

CREATE TABLE Projects (
    project_id INTEGER PRIMARY KEY,
    project_name TEXT NOT NULL,
    budget REAL,
    dept_id INTEGER,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

-- ================================
-- Insert Sample Data (Departments)
-- ================================

INSERT INTO Departments (dept_id, dept_name, location) VALUES
(1, 'HR', 'New York'),
(2, 'Finance', 'London'),
(3, 'IT', 'San Francisco'),
(4, 'Marketing', 'Paris'),
(5, 'Operations', 'Tokyo'),
(6, 'Sales', 'Dubai'),
(7, 'R&D', 'Berlin'),
(8, 'Support', 'Sydney');

-- ================================
-- Insert Sample Data (Employees)
-- ================================

INSERT INTO Employees (emp_id, emp_name, age, salary, dept_id) VALUES
(101, 'Alice', 30, 60000, 1),
(102, 'Bob', 28, 55000, 2),
(103, 'Charlie', 35, 75000, 3),
(104, 'Diana', 32, 72000, 3),
(105, 'Ethan', 29, 50000, 4),
(106, 'Fiona', 40, 85000, 2),
(107, 'George', 38, 90000, 5),
(108, 'Hannah', 26, 48000, 6),
(109, 'Ian', 31, 62000, 7),
(110, 'Jasmine', 27, 51000, 8);

-- ================================
-- Insert Sample Data (Projects)
-- ================================

INSERT INTO Projects (project_id, project_name, budget, dept_id) VALUES
(201, 'Recruitment Drive', 15000, 1),
(202, 'Annual Audit', 30000, 2),
(203, 'Cloud Migration', 120000, 3),
(204, 'Website Redesign', 50000, 4),
(205, 'Logistics Optimization', 70000, 5),
(206, 'Sales Campaign', 45000, 6),
(207, 'AI Research', 200000, 7),
(208, 'Customer Helpdesk Upgrade', 35000, 8),
(209, 'Cybersecurity Upgrade', 95000, 3),
(210, 'Mobile App Development', 110000, 4);

-- ================================
-- SQL Queries
-- ================================

-- 1. Selecting specific columns
SELECT emp_name, salary FROM Employees;

-- 2. Filtering records with WHERE
SELECT * FROM Employees WHERE salary > 60000;

-- 3. Using ORDER BY for sorting
SELECT emp_name, age, salary FROM Employees ORDER BY salary DESC;

-- 4. Applying aggregate functions
SELECT COUNT(*) AS total_employees FROM Employees;
SELECT AVG(salary) AS average_salary FROM Employees;
SELECT MAX(salary) AS highest_salary FROM Employees;
SELECT MIN(salary) AS lowest_salary FROM Employees;

-- 5. JOIN between Employees and Departments
SELECT e.emp_name, d.dept_name, e.salary
FROM Employees e
JOIN Departments d ON e.dept_id = d.dept_id;

-- 6. JOIN between Projects and Departments
SELECT p.project_name, p.budget, d.dept_name
FROM Projects p
JOIN Departments d ON p.dept_id = d.dept_id;

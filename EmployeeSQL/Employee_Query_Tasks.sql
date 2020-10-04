-- QUERIES 
-- Task 1
SELECT e.emp_no, e.first_name, e.last_name,
	   e.sex, s.salary
FROM "Employee" AS e
INNER JOIN "Salaries" AS s 
ON e.emp_no = s.emp_no;

-- Task 2
SELECT first_name, last_name, hire_date
FROM "Employee"
WHERE hire_date >= '1986-01-01' 
AND hire_date <= '1986-12-31';

-- Task 3
SELECT
  "Department".dept_name, "Dept_manager".dept_no, "Employee".emp_no, 
  "Employee".first_name, "Employee".last_name
FROM "Employee"
JOIN "Dept_manager"
  ON "Employee".emp_no = "Dept_manager".emp_no
JOIN "Department"
  ON "Department".dept_no = "Dept_manager".dept_no;


-- Task 4
SELECT
  "Employee".emp_no, "Employee".first_name, 
  "Employee".last_name, "Department".dept_name
FROM "Employee"
JOIN "Dept_emp"
  ON "Employee".emp_no = "Dept_emp".emp_no
JOIN "Department"
  ON "Department".dept_no = "Dept_emp".dept_no;

-- Task 5
SELECT first_name, last_name, sex
From "Employee"
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- Task 6
SELECT
  "Employee".emp_no, "Employee".last_name, 
  "Employee".first_name, "Department".dept_name
FROM "Employee"
JOIN "Dept_emp"
  ON "Employee".emp_no = "Dept_emp".emp_no
JOIN "Department"
  ON "Department".dept_no = "Dept_emp".dept_no
WHERE "Department".dept_name = 'Sales';

-- Task 7
SELECT
  "Employee".emp_no, "Employee".last_name, 
  "Employee".first_name, "Department".dept_name
FROM "Employee"
JOIN "Dept_emp"
  ON "Employee".emp_no = "Dept_emp".emp_no
JOIN "Department"
  ON "Department".dept_no = "Dept_emp".dept_no
WHERE "Department".dept_name = 'Sales' OR "Department".dept_name = 'Development';

-- Task 8
SELECT last_name, COUNT(last_name) AS last_name_count
FROM "Employee"
Group by last_name
Order by last_name_count DESC;
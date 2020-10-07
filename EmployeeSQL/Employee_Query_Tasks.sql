-- QUERIES 
-- Task 1
-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name,
	   e.sex, s.salary
FROM "Employee" AS e
INNER JOIN "Salaries" AS s 
ON e.emp_no = s.emp_no;

-- Task 2
-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM "Employee"
WHERE hire_date >= '1986-01-01' 
AND hire_date <= '1986-12-31';

-- Task 3
-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT
  "Department".dept_name, "Dept_manager".dept_no, "Employee".emp_no, 
  "Employee".last_name, "Employee".first_name
FROM "Employee"
JOIN "Dept_manager"
  ON "Employee".emp_no = "Dept_manager".emp_no
JOIN "Department"
  ON "Department".dept_no = "Dept_manager".dept_no;


-- Task 4
-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT
  "Employee".emp_no, "Employee".last_name, 
  "Employee".first_name, "Department".dept_name
FROM "Employee"
JOIN "Dept_emp"
  ON "Employee".emp_no = "Dept_emp".emp_no
JOIN "Department"
  ON "Department".dept_no = "Dept_emp".dept_no;

-- Task 5
-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
From "Employee"
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- Task 6
-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
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
-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
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
-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS last_name_count
FROM "Employee"
Group by last_name
Order by last_name_count DESC;
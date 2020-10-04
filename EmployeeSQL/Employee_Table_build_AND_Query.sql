-- DROP TABLE "Title"
-- DROP TABLE "Employee"
-- DROP TABLE "Salaries"
-- DROP TABLE "Department"
-- DROP TABLE "Dept_manager"
-- DROP TABLE "Dept_emp"

-- Build Tables
CREATE TABLE "Title" (
    "title_id" Varchar(40)   NOT NULL,
    "title" Varchar(40)   NOT NULL,
    CONSTRAINT "pk_Title" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "Employee" (
    "emp_no" Integer   NOT NULL,
    "emp_title" Varchar(40)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" Varchar(40)   NOT NULL,
    "last_name" Varchar(40)   NOT NULL,
    "sex" Varchar(40)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_Employee" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Salaries" (
    "emp_no" Integer   NOT NULL,
    "salary" Integer   NOT NULL
);

CREATE TABLE "Department" (
    "dept_no" Varchar(40)   NOT NULL,
    "dept_name" Varchar(40)   NOT NULL,
    CONSTRAINT "pk_Department" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Dept_manager" (
    "dept_no" Varchar(40)   NOT NULL,
    "emp_no" Integer   NOT NULL
);

CREATE TABLE "Dept_emp" (
    "emp_no" Integer   NOT NULL,
    "dept_no" Varchar(40)   NOT NULL
);

ALTER TABLE "Employee" ADD CONSTRAINT "fk_Employee_emp_title" FOREIGN KEY("emp_title")
REFERENCES "Title" ("title_id");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employee" ("emp_no");

ALTER TABLE "Dept_manager" ADD CONSTRAINT "fk_Dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Department" ("dept_no");

ALTER TABLE "Dept_manager" ADD CONSTRAINT "fk_Dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employee" ("emp_no");

ALTER TABLE "Dept_emp" ADD CONSTRAINT "fk_Dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employee" ("emp_no");

ALTER TABLE "Dept_emp" ADD CONSTRAINT "fk_Dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Department" ("dept_no");

 
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
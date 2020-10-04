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

-- IMPORT CSVs HERE

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

-- QC Query
SELECT * FROM "Employee"

-- END

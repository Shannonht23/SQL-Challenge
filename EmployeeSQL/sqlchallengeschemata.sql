CREATE TABLE titles
(
	title_id VARCHAR PRIMARY KEY,
	title VARCHAR
);
	
	
--SELECT * FROM titles;

--create table for employees

CREATE TABLE employees
( 
	emp_no INT PRIMARY KEY,
 	emp_title_id VARCHAR,	
 	birth_date 	DATE,
 	first_name	VARCHAR,
 	last_name	VARCHAR,
	sex	VARCHAR,
	hire_date DATE,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);
	
--SELECT * FROM employees;	

--- create table for departments 

CREATE TABLE departments 
(
	dept_no VARCHAR PRIMARY KEY,
	dept_name VARCHAR);
	

--SELECT * FROM departments;


--create table for department managers ( join )
CREATE TABLE dept_manager
(
	dept_no VARCHAR, 
	emp_no INT,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (dept_no, emp_no)
	);
	
--SELECT * FROM dept_manager;

-----create table for dept employee

CREATE TABLE dept_emp
(
	emp_no INT, 
	dept_no VARCHAR,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (emp_no, dept_no)
	);
	
	--SELECT * FROM dept_emp;
	

-- create table for salaries
CREATE TABLE salaries 
(
	emp_no INT PRIMARY KEY,
	salary INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
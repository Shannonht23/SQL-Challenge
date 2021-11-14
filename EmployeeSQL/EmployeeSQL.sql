--CREATE THE TABLES IN THE FOLLOWING ORDER;
--Titles
--Employees
--Departments
--Dept_Manager
--Dept_Emp
--Salaries
----create table for titles csv
CREATE TABLE titles
(
	title_id VARCHAR PRIMARY KEY,
	title VARCHAR);
	
	
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
	
--SELECT * FROM salaries;


-- 1.List the following details of each employee: employee number, last name, first name, sex, and salary.
--SELECT *FROM employees;
--SELECT *FROM salaries ;

SELECT employees.emp_no, last_name, first_name, sex, salary 
FROM employees
INNER JOIN salaries
ON employees.emp_no = salaries.emp_no;


--2.List first name, last name, and hire date for employees who were hired in 1986.
-- BETWEEN COMMAND since the hiredate is date datatype

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';



--3.List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
--SELECT *FROM departments;
--SELECT * FROM dept_manager;
--SELECT *FROM employees;

SELECT departments.dept_no, dept_name, dept_manager.emp_no,last_name, first_name
FROM departments
INNER JOIN dept_manager
ON departments.dept_no =dept_manager.dept_no
INNER JOIN employees
ON dept_manager.emp_no=employees.emp_no;

--4.List the department of each employee with the following information: employee number, last name, first name, and department name.
--SELECT *FROM employees;
--SELECT* FROM departments;
--SELECT *FROM dept_emp;


SELECT employees.emp_no,last_name,first_name,dept_name
FROM employees
INNER JOIN dept_emp
ON employees.emp_no =dept_emp.emp_no
INNER JOIN departments
ON departments.dept_no = dept_emp.dept_no; 


--5.List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
	--SELECT *FROM employees;

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';


--6.List all employees in the Sales department, including their employee number, last name, first name, and department name.
--SELECT *FROM employees;
--SELECT * FROM dept_emp;

SELECT employees.emp_no,last_name,first_name, dept_name
FROM employees
INNER JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments
ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales' ;


--7.List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
	--SELECT * FROM EMPLOYEES;
	--SELECT * FROM departments;
	--SELECT * FROM dept_emp;


SELECT employees.emp_no,first_name,last_name, dept_name
FROM employees
INNER JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments
ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name IN ('Sales', 'Development');


--8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT (last_name) AS "Last Name Count"
FROM employees
GROUP BY last_name 
ORDER BY "Last Name Count" DESC;


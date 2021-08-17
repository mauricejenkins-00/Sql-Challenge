-- Dropping tables if they are already created in the data base

DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

--Creation of tables corresponding to csv file columns
--Creates base department table 
CREATE TABLE dept_table(
	dept_no varchar(30),
	dept_name varchar(30)
)

select *
from dept_table

--Creates department emp table 
CREATE TABLE dept_emp(
	emp_no int,
	dept_no varchar(30)
)

select * 
from dept_emp

--Creates department manager table 
CREATE TABLE dept_manager(
	dept_no varchar(30),
	emp_no int
)

select *
from dept_manager

--Creates employee table
CREATE TABLE employee_table(
	emp_no int,
	emp_title_id varchar(45),
	birth_date date,
	first_name varchar(30),
	last_name varchar(30),
	sex varchar(1),
	hire_date date
)


Select employee_table.emp_no, employee_table.last_name, employee_table.first_name, employee_table.sex, salaries.salary
From salaries
Left Join on employee_table.emp_no=salaries.emp_no


--The Inner Join used to list employee information and salary information from the salaries table
SELECT employee_table.emp_no, employee_table.last_name, employee_table.first_name, employee_table.sex, salaries.salary
FROM salaries
INNER JOIN employee_table ON
employee_table.emp_no=salaries.emp_no;

select *
from employee_table


--List first name, last name, and hire date for employees who were hired in 1986.
SELECT employee_table.first_name, employee_table.last_name, employee_table.hire_date 
FROM employee_table
WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01';

--List the manager of each department with the following information: department number, department name, 
--the manager's employee number, last name, first name.
SELECT dept_table.dept_no, dept_table.dept_name, employee_table.emp_no, employee_table.last_name, employee_table.first_name
FROM dept_table
JOIN employee_table
ON employee_table.emp_no = employee_table.emp_no;

--List the department of each employee with the following information: employee number, 
--last name, first name, and department name.
SELECT dept_table.dept_no, employee_table.emp_no, employee_table.last_name, employee_table.first_name, dept_table.dept_name
From dept_table
Join employee_table
ON employee_table.emp_no = employee_table.emp_no

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT employee_table.first_name, employee_table.last_name, employee_table.sex
FROM employee_table
WHERE employee_table.first_name = 'Hercules' AND last_name LIKE 'B%'

--List all employees in the Sales department, including their 
--employee number, last name, first name, and department name.
SELECT employee_table.first_name, employee_table.last_name, employee_table.emp_no, dept_table.dept_name
FROM employee_table 
JOIN dept_table
ON dept_table.dept_no=dept_table.dept_no
WHERE dept_table.dept_no='d007'

--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
SELECT employee_table.first_name, employee_table.last_name, employee_table.emp_no, dept_table.dept_name
FROM employee_table 
JOIN dept_table
ON dept_table.dept_no=dept_table.dept_no
WHERE dept_table.dept_no='d007' or dept_table.dept_no='d005'

--In descending order, list the frequency count of employee 
--last names, i.e., how many employees share each last name.
SELECT employee_table.last_name, COUNT(employee_table.last_name) AS "frequency"
FROM employee_table
GROUP BY employee_table.last_name
ORDER BY
COUNT(employee_table.last_name) DESC;

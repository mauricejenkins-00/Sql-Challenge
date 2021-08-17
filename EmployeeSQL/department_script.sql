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

select birth_date, last_name
from employee_table


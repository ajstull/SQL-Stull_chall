-- https://app.quickdatabasediagrams.com/#/

--Create the tables in the following order
--Titles
--Employees
--Departments
--Dept_Manager
--Dept_Emp
--Salaries



CREATE TABLE titles
(
	title_id VARCHAR PRIMARY KEY,
	title VARCHAR

);

SELECT * FROM titles;

Create table employees(
	emp_no INT Primary Key,
	emp_title_id VARCHAR,
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date DATE,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

Select * from employees;

Create table departments(
	dept_no VARCHAR primary key,
	dept_name VARCHAR
);
Select * from departments;

create table dept_manager(
	dept_no VARCHAR,
	emp_no INT,
	foreign key (dept_no) references departments(dept_no),
	foreign key (emp_no) references employees(emp_no),
	primary key (dept_no, emp_no)
);
Select * from dept_manager;

create table dept_emp(
	emp_no INT,
	dept_no VARCHAR,
	FOREIGN KEY (dept_no) references departments(dept_no),
	foreign key (emp_no) references employees(emp_no),
	primary key (emp_no, dept_no)
);
select * from dept_emp;

create table salaries(
	emp_no INT PRIMARY KEY,
	salary INT,
	foreign key (emp_no) references employees(emp_no)
);
select * from salaries;

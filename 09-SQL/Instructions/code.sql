
--List the following details of each employee: employee number, last name, first name, sex, and salary.
select * from employees;
select * from salaries;

select employees.emp_no, last_name, first_name, sex, salaries.salary
from employees
inner join salaries
on employees.emp_no = salaries.emp_no


--List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date
from employees
where hire_date between '1986-01-01' and '1986-12-31';

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select * from employees;
select * from departments;
select * from dept_manager;

select departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
from departments
inner join dept_manager
on departments.dept_no = dept_manager.dept_no
inner join employees
on dept_manager.emp_no = employees.emp_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
select * from employees;
select * from departments;
select * from dept_emp;

select dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
from dept_emp
inner join employees
on dept_emp.emp_no = employees.emp_no
inner join departments
on dept_emp.dept_no = departments.dept_no;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
--select * from employees
select first_name, last_name, sex
from employees
where first_name = 'Hercules'
AND last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
select * from employees;
select * from departments;
select * from dept_emp;

select employees.emp_no, first_name, last_name, dept_name
from employees
inner join dept_emp
ON employees.emp_no = dept_emp.emp_no
inner join departments
on departments.dept_no = dept_emp.dept_no
where departments.dept_name in ('Sales');


--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select * from employees;
select * from departments;
select * from dept_emp;

--1st way
select employees.emp_no, first_name, last_name, dept_name
from employees
inner join dept_emp
ON employees.emp_no = dept_emp.emp_no
inner join departments
on departments.dept_no = dept_emp.dept_no
where departments.dept_no in ('d007','d005');

--2nd way
select employees.emp_no, first_name, last_name, dept_name
from employees
inner join dept_emp
on employees.emp_no = dept_emp.emp_no
inner join departments
on departments.dept_no = dept_emp.dept_no
where departments.dept_name in ('Sales','Development');

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select * from employees;
select last_name, count(last_name) as "Last Name Count"
from employees
group by last_name
order by "Last Name Count" DESC;



#### Insert this into Quick DBD to sketch physical ERD

departments
--
dept_no varchar(4)
dept_name varchar(30)

titles
--
title_id varchar(5)
title varchar(30)

employees
--
emp_no int
emp_title_id varchar(5) FK >- titles.title_id
birth_date date
first_name varchar(30)
last_name varchar(30)
sex varchar(1)
hire_date date

dept_emp
--
emp_no int PK FK >- employees.emp_no
dept_no varchar(5) PK FK >- departments.dept_no

dept_manager
--
dept_no varchar(5) PK FK >- departments.dept_no
emp_no int PK FK >- employees.emp_no

salaries
--
emp_no int PK FK >- employees.emp_no
salary int PK


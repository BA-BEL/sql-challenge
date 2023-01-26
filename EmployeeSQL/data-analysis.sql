
---- 1) List the employee number, last name, first name, sex, and salary of each employee.

select e.emp_no, last_name, first_name, sex, s.salary
from employees e
left join salaries s on e.emp_no = s.emp_no;


---- 2) List the first name, last name, and hire date for the employees who were hired in 1986.

select first_name, last_name, hire_date
from employees
where date_part('year', hire_date) = 1986;

---- 3) List the manager of each department along with their department number, department name, employee number, last name, and first name.

select dm.dept_no, dept_name, dm.emp_no, last_name, first_name
from dept_manager dm
left join departments d on dm.dept_no = d.dept_no
left join employees e on dm.emp_no = e.emp_no;

---- 4) List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

select de.dept_no, de.emp_no, last_name, first_name, dept_name
from dept_emp de
left join departments d on de.dept_no = d.dept_no
left join employees e on de.emp_no = e.emp_no;

---- 5) List the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

select first_name, last_name, sex
from employees
where first_name = 'Hercules'
and last_name like 'B%';

---- 6) List each employee in the Sales department, including their employee number, last name, and first name.

select emp_no, first_name, last_name 
from employees
where emp_no
in(
    select emp_no
    from dept_emp
    where dept_no
    in (
        select dept_no
        from departments
        where dept_name = 'Sales'
    )
);

---- 7) List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

select e.emp_no, first_name, last_name, d.dept_name
from employees e
left join dept_emp de on de.emp_no = e.emp_no
left join departments d on de.dept_no = d.dept_no
where d.dept_name in ('Sales','Development');

---- 8) List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

select last_name, count(last_name) as "Frequency"
from employees
group by last_name
order by last_name desc;
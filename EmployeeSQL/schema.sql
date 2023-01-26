
---- Drop tables if existing

drop table if exists salaries;

drop table if exists dept_manager;

drop table if exists dept_emp;

drop table if exists employees;

drop table if exists titles;

drop table if exists departments;


---- Create tables


create table departments (
    dept_no varchar(4) primary key not null,
    dept_name varchar(30) not null
);

create table titles (
    title_id varchar(5) primary key not null,
    title varchar(30) not null
);

create table employees (
    emp_no int primary key not null,
    emp_title_id varchar(5) not null,
    birth_date date not null,
    first_name varchar(30) not null,
    last_name varchar(30) not null,
    sex varchar(1),
    hire_date date not null,
    foreign key (emp_title_id) references titles (title_id)
);

create table dept_emp (
    emp_no int not null,
    dept_no varchar(4) not null,
    primary key (emp_no,dept_no),
    foreign key (emp_no) references employees (emp_no),
    foreign key (dept_no) references departments (dept_no)
);

create table dept_manager (
    dept_no varchar(5) not null,
    emp_no int not null,
    primary key (dept_no,emp_no),
    foreign key (emp_no) references employees (emp_no),
    foreign key (dept_no) references departments (dept_no)
);



create table salaries (
    emp_no int not null,
    salary int not null,
    primary key (emp_no, salary),
    foreign key (emp_no) references employees (emp_no)
);



---- Import data via pgAdmin
---- using the COPY statement yielded an error with denied permission.




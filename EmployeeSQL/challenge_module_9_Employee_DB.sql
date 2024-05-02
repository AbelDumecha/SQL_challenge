---- 1. Data Modeling and Engineering
----- Create tables of Employees, Departments, dept_managers, dept_emp, salaries, & Titles
CREATE TABLE Employees (
    emp_no INT   NOT NULL,
    emp_title_id VARCHAR(255)   NOT NULL,
    birth_date Date   NOT NULL,
    first_name VARCHAR(255)   NOT NULL,
    last_name VARCHAR(255)   NOT NULL,
    sex VARCHAR(255)   NOT NULL,
    hire_date Date   NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE Departments (
    dept_no VARCHAR(255)   NOT NULL,
    dept_name VARCHAR(255)   NOT NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (
        dept_no
     )
);

CREATE TABLE Dept_managers (
    dept_no VARCHAR(255)   NOT NULL,
    emp_no INT   NOT NULL
);

CREATE TABLE Dept_employees (
    emp_no INT   NOT NULL,
    dept_no VARCHAR(255)   NOT NULL
);

CREATE TABLE Salaries (
    emp_no INT   NOT NULL,
    salary INT   NOT NULL
);

CREATE TABLE Titles (
    title_id VARCHAR(255)   NOT NULL,
    title VARCHAR(255)   NOT NULL,
    CONSTRAINT pk_Titles PRIMARY KEY (
        title_id
     )
);

ALTER TABLE Employees ADD CONSTRAINT fk_Employees_emp_title_id FOREIGN KEY(emp_title_id)
REFERENCES Titles (title_id);

ALTER TABLE Dept_managers ADD CONSTRAINT fk_Dept_managers_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE Dept_managers ADD CONSTRAINT fk_Dept_managers_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Dept_employees ADD CONSTRAINT fk_Dept_employees_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

ALTER TABLE Dept_employees ADD CONSTRAINT fk_Dept_employees_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES Employees (emp_no);

------ 2. Data Analysis 
--- List the employee number, last name, first name, sex, and salary of each employee.
Select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees
join salaries on employees.emp_no = salaries.emp_no;

--- List the first name, last name, and hire date for the employees who were hired in 1986.
Select first_name, last_name, hire_date
from employees
where extract(year from hire_date) = 1986;

--- List the manager of each department along with their department number, department name, employee number, last name, and first name.
select dept_managers.dept_no, departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
from departments
join dept_managers on departments.dept_no = dept_managers.dept_no
join employees on dept_managers.emp_no = employees.emp_no;

--- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
select dept_employees.dept_no, dept_employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from dept_employees
join employees on dept_employees.emp_no = employees.emp_no
join departments on dept_employees.dept_no = departments.dept_no;

--- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select employees.first_name, employees.last_name, employees.sex
from employees
where first_name = 'Hercules' 
and last_name like 'B%';

--- List each employee in the Sales department, including their employee number, last name, and first name.
select employees.emp_no, employees.last_name, employees.first_name
from employees
join dept_employees on employees.emp_no = dept_employees.emp_no
join departments on dept_employees.dept_no = departments.dept_no
where departments.dept_name = 'Sales';

--- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
join dept_employees on employees.emp_no = dept_employees.emp_no
join departments on dept_employees.dept_no = departments.dept_no
where departments.dept_name in ('Sales', 'Development');

--- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
select last_name, count(*) as frequency 
from employees
group by last_name
order by frequency DESC;
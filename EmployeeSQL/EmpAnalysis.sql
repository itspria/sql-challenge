--1. Listing employee number, last name, first name, sex, and salary for each employee 
SELECT e.emp_no, last_name, first_name, sex, salary FROM employee as e, salaries as s WHERE e.emp_no = s.emp_no;

--2. Listing first name, last name, and hire date for employees who were hired in 1986
SELECT first_name, last_name, hire_date FROM employee WHERE hire_date LIKE '%1986%';

/*3. Listing manager of each department with the following information: department number, department name, 
the manager's employee number, last name, first name*/
----It can be achieved in 2 ways.----
--Query 1
SELECT d.dept_no, dep.dept_name, d.emp_no, e.last_name, e.first_name 
FROM department as dep, dept_manager as d, employee as e WHERE dep.dept_no = d.dept_no AND d.emp_no = e.emp_no;

--Query 2
SELECT d.dept_no, dep.dept_name, d.emp_no, e.last_name, e.first_name
FROM department as dep
INNER JOIN dept_manager as d
ON dep.dept_no = d.dept_no
INNER JOIN employee as e
ON d.emp_no = e.emp_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name 
from employee as e, department as d, dept_emp as de 
WHERE e.emp_no = de.emp_no AND de.dept_no = d.dept_no;

--5. Listing first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex FROM employee WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6. Listing all employees in the Sales department, including their employee number, last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp as de
INNER JOIN employee as e
ON de.emp_no = e.emp_no
INNER JOIN department as d
ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp as de
INNER JOIN employee as e
ON de.emp_no = e.emp_no
INNER JOIN department as d
ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) FROM employee GROUP BY last_name ORDER BY COUNT(last_name) DESC;
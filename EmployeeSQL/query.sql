-- 1. List Details for All Employees: employee number, last name, first name, sex, and salary
SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	e.sex,
	s.salary
FROM "Employees" AS e
	INNER JOIN "Salaries" AS s
	On e.emp_no = s.emp_no

-- 2. List first name, last name, and hire date for employees hired in 1986
SELECT
	emp_no,
	first_name,
	last_name,
	hire_date
FROM "Employees"
WHERE hire_date between '1986-01-01' AND '1986-12-31'
ORDER BY 4 ASC

-- 3. List the manager of each department with the following informaiton:
-- department number, department name, the manager's employee number, last name, first name
SELECT 
	d.dept_no,
	d.dept_name,
	dm.emp_no,
	e.last_name,
	e.first_name
FROM "Departments" AS d
	INNER JOIN
	"Department_Managers" AS dm
	ON d.dept_no = dm.dept_no
	INNER JOIN
	"Employees" AS e
	ON e.emp_no = dm.emp_no
	
-- 4. List department of each employee with the follwoing informaiton:
-- empoloyee number, last name, first name, and department name
SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM "Employees" AS e
	INNER JOIN
	"Employee_Departments" As ed
	ON e.emp_no = ed.emp_no
	INNER JOIN
	"Departments" AS d
	ON ed.dept_no = d.dept_no
	
-- 5. List first name, last name, and sex for employees whose 
-- first name is "Hercules" and last names begin with "B"
SELECT
	first_name,
	last_name,
	sex
FROM "Employees"
WHERE
	first_name = 'Hercules'
	AND last_name LIKE 'B%'
	
-- 6. List all employees in the Sales and Development departments, 
-- including theri employee number, last name, first name, and department name
SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM "Employees" AS e
	INNER JOIN
	"Employee_Departments" AS dm
	ON e.emp_no = dm.emp_no
	INNER JOIN
	"Departments" AS d
	ON dm.dept_no = d.dept_no
WHERE
	d.dept_name = 'Sales'

-- 7. List all employees in the Sales and Development departments,
-- including their employee number, last name, first name, and department name
SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM "Employees" AS e
	INNER JOIN
	"Employee_Departments" AS dm
	ON e.emp_no = dm.emp_no
	INNER JOIN
	"Departments" AS d
	ON dm.dept_no = d.dept_no
WHERE
	d.dept_name IN ('Sales', 'Development')
ORDER BY 4,1

-- 8. In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name
SELECT
	last_name,
	count('last_name')
FROM "Employees"
GROUP BY 1
ORDER BY 2 DESC
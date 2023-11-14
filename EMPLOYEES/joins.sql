SELECT 
    dept_emp.emp_no, dept_emp.from_date
FROM
    departments
        INNER JOIN
    dept_emp ON departments.dept_no = dept_emp.dept_no;
    
SELECT 
    d.emp_no, d.from_date, d.to_date, n.dept_name, d.dept_no
FROM
    dept_manager d
        INNER JOIN
    departments n ON d.dept_no = n.dept_no
ORDER BY d.dept_no;

/*
If you currently have the ‘departments_dup’ table set up, use DROP COLUMN to remove the ‘dept_manager’ column from the ‘departments_dup’ table.
Then, use CHANGE COLUMN to change the ‘dept_no’ and ‘dept_name’ columns to NULL.
(If you don’t currently have the ‘departments_dup’ table set up, create it. Let it contain two columns: dept_no and dept_name.
 Let the data type of dept_no be CHAR of 4, and the data type of dept_name be VARCHAR of 40. Both columns are allowed to have null values. Finally,
 insert the information contained in ‘departments’ into ‘departments_dup’.)
Then, insert a record whose department name is “Public Relations”.
Delete the record(s) related to department number two.
Insert two new records in the “departments_dup” table. Let their values in the “dept_no” column be “d010” and “d011”.
*/

SELECT *
FROM departments;


CREATE TABLE departments_dup LIKE departments;
INSERT INTO departments_dup SELECT * FROM departments;

SELECT *
FROM departments_dup;
INSERT INTO departments_dup(dept_no,dept_name) VALUES ('d010','Public Relations');

SELECT *
FROM departments_dup
ORDER BY dept_no;

UPDATE departments_dup SET dept_name='' WHERE dept_no='d002';

SELECT *
FROM departments_dup
ORDER BY dept_no;


#Extract a list containing information about all managers’ employee number, first and last name, department number, and hire date. 

SELECT *
FROM dept_emp;

SELECT t.emp_no,t.title,t.from_date,e.first_name,e.last_name,d.dept_no
FROM titles t
JOIN employees e ON t.emp_no=e.emp_no
JOIN dept_emp d ON t.emp_no=d.emp_no
WHERE t.title='Manager';

#Join the 'employees' and the 'dept_manager' tables to return a subset of all the employees whose 
#last name is Markovitch. See if the output contains a manager with that name.  
#Hint: Create an output containing information corresponding to the following fields: ‘emp_no’,
# ‘first_name’, ‘last_name’, ‘dept_no’, ‘from_date’. Order by 'dept_no' descending, and then by 'emp_no'.

SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT e.emp_no,e.first_name,e.last_name,m.dept_no,m.from_date,e.gender
FROM employees e
JOIN dept_manager m 
ON e.emp_no=m.emp_no
WHERE e.last_name='Markovitch'
ORDER BY dept_no DESC,emp_no;

#Extract a list containing information about all managers’ employee number, first and last name, department number,
#and hire date. Use the old type of join syntax to obtain the result.

SELECT e.emp_no,e.first_name,e.last_name,m.dept_no,m.from_date
FROM employees e,dept_manager m
WHERE e.emp_no=m.emp_no;

#Select the first and last name, the hire date, and the job title of all
#employees whose first name is “Margareta” and have the last name “Markovitch”.

SELECT e.emp_no,e.first_name,e.last_name,e.hire_date,t.title
FROM employees e
JOIN titles t
ON e.emp_no=t.emp_no
WHERE first_name='Margareta' AND last_name='Markovitch';

#Use a CROSS JOIN to return a list with all possible combinations between managers from the dept_manager table and department number 9.
SELECT *
FROM dept_manager;

SELECT de.*,m.*
FROM dept_emp de
CROSS JOIN dept_manager m
WHERE de.dept_no='d009';


#Return a list with the first 10 employees with all the departments they can be assigned to.
#Hint: Don’t use LIMIT; use a WHERE clause.

SELECT e.*,m.*
FROM employees e
CROSS JOIN dept_emp m
WHERE e.emp_no < 10011;

#Select all managers’ first and last name, hire date, job title, start date, and department name.

SELECT * FROM titles;
SELECT * FROM dept_manager;
SELECT * FROM departments;

SELECT e.first_name,e.last_name,e.hire_date,t.title,m.from_date,d.dept_name
FROM employees  e
JOIN titles t ON e.emp_no=t.emp_no
JOIN dept_manager m ON e.emp_no=m.emp_no
JOIN departments d ON m.dept_no=d.dept_no
WHERE title='Manager'
ORDER BY e.emp_no;

#How many male and how many female managers do we have in the ‘employees’ database?
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT COUNT(*)
FROM employees e
JOIN dept_manager m ON e.emp_no=m.emp_no
WHERE e.gender='M';

SELECT e.gender,COUNT(m.emp_no)
FROM employees e
JOIN dept_manager m ON e.emp_no=m.emp_no
GROUP BY e.gender;

#Go forward to the solution and execute the query. What do you think is
#the meaning of the minus sign before subset A in the last row (ORDER BY -a.emp_no DESC)? 
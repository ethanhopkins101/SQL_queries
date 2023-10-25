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


SELECT *
FROM dept_manager;

SELECT e.first_name,e.last_name,m.dept_no
FROM employees e
JOIN dept_manager m ON e.emp_no=m.emp_no
WHERE e.last_name='Markovitch';

SELECT e.first_name,e.last_name,m.dept_no
FROM employees e
LEFT JOIN dept_manager m ON e.emp_no=m.emp_no
WHERE e.last_name='Markovitch'
ORDER BY dept_no DESC;
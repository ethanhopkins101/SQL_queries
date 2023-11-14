#How many departments are there in the “employees” database? Use the ‘dept_emp’ table to answer the question.
SELECT 
    COUNT(DISTINCT dept_no)
FROM
    dept_emp;
#-----------------------------------------------------
#What is the total amount of money spent on salaries for all contracts starting after the 1st of January 1997?
SELECT 
    SUM(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01';
#-----------------------------------------------------
#1. Which is the lowest employee number in the database?
#2. Which is the highest employee number in the database?
    
SELECT 
    MAX(emp_no)
FROM
    employees;

SELECT 
    MIN(emp_no)
FROM
    employees;
#-----------------------------------------------------
#What is the average annual salary paid to employees who started after the 1st of January 1997?
SELECT 
    AVG(salary)
FROM
    salaries
WHERE from_date>'1997-01-01';
#-----------------------------------------------------
#Round the average amount of money spent on salaries for all contracts that
# started after the 1st of January 1997 to a precision of cents.

SELECT 
    ROUND(AVG(salary), 2)
FROM
    salaries
WHERE
    from_date > '1997-01-01';
#-----------------------------------------------------
#Select the department number and name from the ‘departments_dup’ table
#and add a third column where you name the department number (‘dept_no’) as ‘dept_info’.
# If ‘dept_no’ does not have a value, use ‘dept_name’.

SELECT 
    dept_no,
    dept_name,
    COALESCE(dept_no, dept_name) AS dept_info
FROM
    departments;

SELECT 
    *, dept_no AS dept_info
FROM
    departments;


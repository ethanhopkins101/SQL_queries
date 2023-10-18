#Select ten records from the “titles” table to get a better idea about its content.
#Then, in the same table, insert information about employee number 999903. State that he/she is a “Senior Engineer”,
# who has started working in this position on October 1st, 1997.
#At the end, sort the records from the “titles” table in descending order to check if
# you have successfully inserted the new record.
SELECT 
    *
FROM
    titles
LIMIT 10;

INSERT INTO employees 
VALUES (999903,'1977-09-14','Johnathan','Creek', 'M','1999-01-01');

SELECT * 
FROM employees
ORDER BY emp_no DESC;

INSERT INTO titles(emp_no,title,from_date)
VALUES (999903,'Senior Engineer','1997-10-01');

SELECT 
    *
FROM
    titles 
ORDER BY emp_no DESC;
#---------------------------------------------------------------
#Insert information about the individual with employee number 999903 into the “dept_emp” table.
#He/She is working for department number 5, and has started work on  October 1st,
#1997; her/his contract is for an indefinite period of time.
SELECT 
    *
FROM
    dept_emp;
    
#Inserting:
INSERT INTO dept_emp
VALUES(999903,'d005','1997-10-1','9999-01-01');

SELECT 
    *
FROM
    dept_emp
ORDER BY emp_no DESC;

#----------------------------------------------------
#Create a new department called “Business Analysis”. Register it under number ‘d010’.
SELECT 
    *
FROM
    departments;
    
INSERT INTO departments
VALUES ('d010','Business Analysis');

#----------------------------------------------------

-- LINK : https://en.wikibooks.org/wiki/SQL_Exercises/Employee_management
-- 2.1 Select the last name of all employees.
SELECT * FROM departments;
SELECT * FROM employees;
SELECT LastName FROM employees;
-- 2.2 Select the last name of all employees, without duplicates.
SELECT DISTINCT(LastName) FROM employees;
-- 2.3 Select all the data of employees whose last name is "Smith".
SELECT * FROM employees WHERE LastName='Smith';
-- 2.4 Select all the data of employees whose last name is "Smith" or "Doe".
SELECT * FROM employees WHERE LastName IN ('Smith','Doe');
-- 2.5 Select all the data of employees that work in department 14.
SELECT * FROM employees WHERE Department=14;
-- 2.6 Select all the data of employees that work in department 37 or department 77.
SELECT * FROM employees WHERE Department in (37,77);
-- 2.7 Select all the data of employees whose last name begins with an "S".
SELECT * FROM employees WHERE LastName LIKE 'S%';
-- 2.8 Select the sum of all the departments' budgets.
SELECT * FROM employees;
SELECT SUM(Budget)AS 'Budget Total' FROM departments;
-- 2.9 Select the number of employees in each department (you only need to show the department code and the number of employees).
SELECT Department,COUNT(*) from employees GROUP BY Department;
-- 2.10 Select all the data of employees, including each employee's department's data.
SELECT * FROM employees e JOIN departments d ON e.Department=d.Code;
-- 2.11 Select the name and last name of each employee, along with the name and budget of the employee's department.
SELECT e.Name,e.LastName,d.Name,d.Budget FROM employees e JOIN departments d ON e.Department=d.Code;
-- 2.12 Select the name and last name of employees working for departments with a budget greater than $60,000.
SELECT e.Name,e.LastName,d.Name,d.Budget FROM employees e JOIN departments d ON e.Department=d.Code WHERE d.Budget>60000;
-- 2.13 Select the departments with a budget larger than the average budget of all the departments.
SELECT * FROM departments;
SELECT Name,Budget FROM departments WHERE Budget>(SELECT AVG(Budget) FROM departments);
-- 2.14 Select the names of departments with more than two employees.
SELECT * FROM employees;
SELECT d.Name,q.count FROM departments d JOIN (
SELECT Department,COUNT(*) AS count FROM employees GROUP BY Department HAVING COUNT(*)>2) q
ON d.Code=q.Department;
-- 2.15 Very Important - Select the name and last name of employees working for departments with second lowest budget
SELECT e.Name,e.LastName FROM employees e JOIN (
SELECT Code,Name,Budget FROM departments WHERE Budget=(SELECT MIN(Budget) FROM departments WHERE Budget>(SELECT Budget FROM departments ORDER BY Budget ASC Limit 1))) q ON e.Department=q.Code; 
-- 2.16  Add a new department called "Quality Assurance", with a budget of $40,000 and departmental code 11.
SELECT * FROM departments; 
INSERT INTO departments VALUES(11,'Quality Assurance',40000);
-- And Add an employee called "Mary Moore" in that department, with SSN 847-21-9811.
SELECT * FROM employees;
INSERT INTO employees VALUES (847219811,'Mary','Moore',11);
-- 2.17 Reduce the budget of all departments by 10%.
UPDATE departments SET Budget=Budget-Budget/10;
-- 2.18 Reassign all employees from the Research department (code 77) to the IT department (code 14).
UPDATE employees SET Department=14 WHERE Department=77;
-- 2.19 Delete from the table all employees in the IT department (code 14).
#DELETE FROM employees WHERE Department=14;
-- 2.20 Delete from the table all employees who work in departments with a budget greater than or equal to $60,000.
#DELETE FROM employees WHERE Department=(SELECT Code FROM deparments WHERE Budget>=60000);
-- 2.21 Delete from the table all employees.
#DELETE FROM employees;
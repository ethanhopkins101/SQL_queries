#Change the “Business Analysis” department name to “Data Analysis”.
SELECT *
FROM departments;

UPDATE departments 
SET 
    dept_name = 'Data Analysis'
WHERE
    dept_no = 'd010';

#-----------------------------------------------------
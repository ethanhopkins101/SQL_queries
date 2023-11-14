SELECT * FROM assignedto;
SELECT * FROM projects;
SELECT * FROM scientists;

-- https://en.wikibooks.org/wiki/SQL_Exercises/Scientists
-- 6.1 List all the scientists' names, their projects' names,
 SELECT s.Name,p.Name,p.Hours from scientists s JOIN assignedto a ON s.SSN=a.Scientist JOIN projects p ON a.Project=p.Code ORDER BY p.Name,s.Name;
    -- and the hours worked by that scientist on each project,
    -- in alphabetical order of project name, then scientist name.
-- 6.2 Select the project names which are not assigned yet
SELECT Name FROM projects WHERE Code NOT IN (SELECT Project FROM assignedto);

-- https://en.wikibooks.org/wiki/SQL_Exercises/Planet_Express 
SELECT * FROM client;
SELECT * FROM employee;
SELECT * FROM has_clearance;
SELECT * FROM package;
SELECT * FROM planet;
SELECT * FROM shipment;
-- 7.1 Who receieved a 1.5kg package?
SELECT c.Name FROM client c JOIN package p ON c.AccountNumber=p.Recipient WHERE p.Weight=1.5;
-- 7.2 What is the total weight of all the packages that he sent?
SELECT SUM(Weight) FROM package WHERE Sender=(SELECT Recipient FROM package WHERE Weight=1.5);
-- The Warehouse
-- lINK: https://en.wikibooks.org/wiki/SQL_Exercises/The_warehouse
-- 3.1 Select all warehouses.
SELECT * FROM warehouses;
SELECT * FROM boxes;
-- 3.2 Select all boxes with a value larger than $150.
SELECT * FROM boxes WHERE value>150;
-- 3.3 Select all distinct contents in all the boxes.
SELECT DISTINCT(Contents) FROM boxes;
-- 3.4 Select the average value of all the boxes.
SELECT * FROM boxes;
SELECT ROUND(AVG(Value),2) FROM boxes;
-- 3.5 Select the warehouse code and the average value of the boxes in each warehouse.
SELECT * FROM warehouses;
SELECT * FROM boxes;
SELECT w.Location,q.Warehouse,q.Average AVG FROM warehouses w JOIN(
SELECT Warehouse,AVG(Value) AS Average FROM boxes GROUP BY Warehouse)q ON w.Code=q.Warehouse;
-- 3.6 Same as previous exercise, but select only those warehouses where the average value of the boxes is greater than 150.
SELECT Warehouse,AVG(Value)AS Average FROM boxes GROUP BY Warehouse HAVING Average>150;
-- 3.7 Select the code of each box, along with the name of the city the box is located in.
SELECT b.Code,w.Location FROM boxes b JOIN warehouses w ON b.Warehouse=w.Code;
-- 3.8 Select the warehouse codes, along with the number of boxes in each warehouse.
SELECT * FROM warehouses;
SELECT * FROM boxes;
SELECT Warehouse,COUNT(*) FROM boxes GROUP BY Warehouse;

-- Optionally, take into account that some warehouses are empty (i.e., the box count should show up as zero, instead of omitting the warehouse from the result).
SELECT b.Warehouse,COUNT(*) FROM boxes b LEFT JOIN warehouses w ON b.Warehouse=w.Code GROUP BY b.Warehouse;
-- 3.9 Select the codes of all warehouses that are saturated (a warehouse is saturated if the number of boxes in it is larger than the warehouse's capacity).
SELECT b.Warehouse,w.Location,COUNT(*)AS Count,w.Capacity FROM boxes b JOIN warehouses w ON (b.Warehouse=w.Code ) GROUP BY b.Warehouse HAVING Count>=w.Capacity;
-- 3.10 Select the codes of all the boxes located in Chicago.
SELECT * FROM warehouses;
SELECT * FROM boxes b JOIN (
SELECT * FROM warehouses WHERE Location='Chicago') q ON b.Warehouse=q.Code;
-- 3.11 Create a new warehouse in New York with a capacity for 3 boxes.
SELECT * FROM warehouses;
INSERT INTO warehouses VALUES (6,'New York',3);
-- 3.12 Create a new box, with code "H5RT", containing "Papers" with a value of $200, and located in warehouse 2.
INSERT INTO boxes VALUES ('H5RT','Papers',200,2);
-- 3.13 Reduce the value of all boxes by 15%.
SELECT * FROM boxes;
UPDATE boxes SET Value=Value-Value*0.15;
-- 3.14 Remove all boxes with a value lower than $100.
DELETE FROM boxes WHERE Value<100;
-- 3.15 Remove all boxes from saturated warehouses.
DELETE FROM boxes WHERE Warehouse IN (
SELECT DISTINCT(boxes.Warehouse)FROM boxes JOIN (
SELECT b.Warehouse,COUNT(*) AS Count,q.Capacity FROM boxes b JOIN (SELECT Code,Capacity FROM warehouses) q ON b.Warehouse=q.Code GROUP BY b.Warehouse HAVING Count>=Capacity)q ON boxes.Warehouse=q.Warehouse);
-- 3.16 Add Index for column "Warehouse" in table "boxes"
SELECT * FROM boxes;
CREATE INDEX Warehouse_ind ON boxes(Warehouse);
    -- !!!NOTE!!!: index should NOT be used on small tables in practice
-- 3.17 Print all the existing indexes
SHOW INDEX FROM boxes;
    -- !!!NOTE!!!: index should NOT be used on small tables in practice
-- 3.18 Remove (drop) the index you added just
ALTER TABLE boxes DROP INDEX Warehouse_ind;
    -- !!!NOTE!!!: index should NOT be used on small tables in practice

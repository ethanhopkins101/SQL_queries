SELECT * FROM manufacturers;
SELECT * FROM products;

-- 1.1 Select the names of all the products in the store.
SELECT DISTINCT(Name) FROM products;
-- 1.2 Select the names and the prices of all the products in the store.
SELECT Name,Price FROM products;
-- 1.3 Select the name of the products with a price less than or equal to $200.
SELECT Name,Price FROM products WHERE Price<= 200;
-- 1.4 Select all the products with a price between $60 and $120.
SELECT Name,Price FROM products WHERE Price BETWEEN 60 AND 120;
-- 1.5 Select the name and price in cents (i.e., the price must be multiplied by 100).
SELECT Name,Price*100 AS 'Price(cents)' FROM products ;
-- 1.6 Compute the average price of all the products.
SELECT COUNT(*) AS 'nb of products',AVG(Price) AS 'Average price' FROM products;
-- 1.7 Compute the average price of all products with manufacturer code equal to 2.
SELECT COUNT(*) AS 'nb of products',AVG(Price) AS 'Average price' FROM products WHERE Manufacturer=2;
-- 1.8 Compute the number of products with a price larger than or equal to $180.
SELECT COUNT(*) AS 'Nb of products' FROM products WHERE price>=180;
-- 1.9 Select the name and price of all products with a price larger than or equal to $180, and sort first by price (in descending order), and then by name (in ascending order).
SELECT Name,Price FROM products WHERE Price>=180 ORDER BY Price DESC,Name;
-- 1.10 Select all the data from the products, including all the data for each product's manufacturer.
SELECT * FROM products p LEFT JOIN manufacturers m on p.Manufacturer=m.Code;
-- 1.11 Select the product name, price, and manufacturer name of all the products.
SELECT p.Name,p.Price,m.Name FROM products p JOIN manufacturers m on p.Manufacturer=m.Code;
-- 1.12 Select the average price of each manufacturer's products, showing only the manufacturer's code.
SELECT m.Code,AVG(p.Price) FROM products p JOIN manufacturers m on p.Manufacturer=m.Code GROUP BY m.Code;
-- 1.13 Select the average price of each manufacturer's products, showing the manufacturer's name.
SELECT m.Name,AVG(p.Price) FROM products p JOIN manufacturers m ON p.Manufacturer=m.Code GROUP BY m.Name;
-- 1.14 Select the names of manufacturer whose products have an average price larger than or equal to $150.
SELECT m.Name,AVG(p.Price) FROM products p JOIN manufacturers m ON p.Manufacturer=m.Code GROUP BY m.Name HAVING AVG(p.Price)>=150;
-- 1.15 Select the name and price of the cheapest product.
SELECT Name,Price FROM (SELECT MIN(Price) FROM products);
-- 1.16 Select the name of each manufacturer along with the name and price of its most expensive product.

-- 1.17 Add a new product: Loudspeakers, $70, manufacturer 2.
-- 1.18 Update the name of product 8 to "Laser Printer".
-- 1.19 Apply a 10% discount to all products.
-- 1.20 Apply a 10% discount to all products with a price larger than or equal to $120.
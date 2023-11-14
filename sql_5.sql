SELECT * FROM pieces;
SELECT * FROM providers;
SELECT * FROM provides;
-- https://en.wikibooks.org/wiki/SQL_Exercises/Pieces_and_providers
-- 5.1 Select the name of all the pieces. 
SELECT Name FROM pieces;
-- 5.2  Select all the providers' data. 
SELECT * FROM providers;
-- 5.3 Obtain the average price of each piece (show only the piece code and the average price).
SELECT Piece,AVG(Price) FROM provides GROUP BY Piece;
-- 5.4  Obtain the names of all providers who supply piece 1.
SELECT Name FROM providers WHERE Code IN(
SELECT Provider FROM provides WHERE Piece=1);
-- 5.5 Select the name of pieces provided by provider with code "HAL".
SELECT Name FROM pieces WHERE Code IN(
SELECT DISTINCT(Piece) FROM provides WHERE Provider='HAL');
-- 5.6
-- ---------------------------------------------
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
SELECT * FROM pieces;
-- Interesting and important one.
-- For each piece, find the most expensive offering of that piece and include the piece name, provider name, and price 
-- (note that there could be two providers who supply the same piece at the most expensive price).
SELECT q_3.Name,p.Name,q_3.Price FROM providers p JOIN (
SELECT p.Name,q_2.Provider,q_2.Price FROM pieces p JOIN(
SELECT p.Piece,p.Provider,p.Price FROM provides p JOIN (
SELECT Piece,MAX(Price) AS Price FROM provides GROUP BY Piece) q ON (p.Piece=q.Piece AND p.Price=q.Price)) q_2 ON p.Code=q_2.Piece) q_3 ON p.Code=q_3.Provider;
-- ---------------------------------------------
-- 5.7 Add an entry to the database to indicate that "Skellington Supplies" (code "TNBC") will provide sprockets (code "1") for 7 cents each.
INSERT INTO provides VALUES(1,'TNBC','7');
SELECT * FROM provides;
-- 5.8 Increase all prices by one cent.
UPDATE provides SET Price=Price+1;
-- 5.9 Update the database to reflect that "Susan Calvin Corp." (code "RBT") will not supply bolts (code 4).
DELETE FROM provides WHERE Provider='RBT' AND Piece=4;
-- 5.10 Update the database to reflect that "Susan Calvin Corp." (code "RBT") will not supply any pieces 
    -- (the provider should still remain in the database).
DELETE FROM provides WHERE Provider='RBT';
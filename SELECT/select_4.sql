SELECT * FROM movies;
SELECT * FROM movietheaters;
-- https://en.wikibooks.org/wiki/SQL_Exercises/Movie_theatres
-- 4.1 Select the title of all movies.
SELECT Title FROM movies;
-- 4.2 Show all the distinct ratings in the database.
SELECT * FROM(
SELECT DISTINCT(Rating)AS Ratings FROM movies) q WHERE q.Ratings IS NOT NULL;
-- 4.3  Show all unrated movies.
SELECT * FROM movies WHERE Rating IS NULL;
-- 4.4 Select all movie theaters that are not currently showing a movie.
SELECT * FROM movietheaters;
SELECT Code,Name FROM movietheaters WHERE Movie IS NULL ;
-- 4.5 Select all data from all movie theaters 
SELECT * FROM movietheaters;
    -- and, additionally, the data from the movie that is being shown in the theater (if one is being shown).
SELECT t.Code,t.Name,m.Title,m.Rating FROM movietheaters t JOIN movies m ON t.Movie=m.Code;
-- 4.6 Select all data from all movies and, if that movie is being shown in a theater, show the data from the theater.
SELECT * FROM movies m LEFT JOIN movietheaters t ON m.Code=t.Movie;
-- 4.7 Show the titles of movies not currently being shown in any theaters.
SELECT * FROM movies;
SELECT * FROM movietheaters;
SELECT Movie FROM movietheaters WHERE Movie IS NOT NULL;
SELECT * FROM movies WHERE Code NOT IN (
SELECT Movie FROM movietheaters WHERE Movie IS NOT NULL);
-- 4.8 Add the unrated movie "One, Two, Three".
ALTER TABLE movies AUTO_INCREMENT=1;
INSERT INTO movies VALUES(9,'One, Two, Three',NULL);
-- 4.9 Set the rating of all unrated movies to "G".
UPDATE movies SET Rating='G' WHERE Rating IS NULL;
-- 4.10 Remove movie theaters projecting movies rated "NC-17".
DELETE FROM movietheaters WHERE Movie IN
(SELECT Code FROM movies WHERE Rating='NC-17');

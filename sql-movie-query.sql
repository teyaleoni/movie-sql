-- Select all columns and rows from the movies table
SELECT *
FROM movies;

-- Select only the title and id of the first 10 rows
SELECT `title`, `id`
FROM movies
LIMIT 10;

-- Find the movie with the id of 485
SELECT title 
FROM movies 
WHERE id=485;

-- Find the id (only that column) of the movie Made in America (1993)
SELECT `id` 
FROM `movies`
WHERE `title` = "Made in America (1993)";

-- Find the first 10 sorted alphabetically
SELECT *
FROM `movies`
ORDER BY title
LIMIT 10;

-- Find all movies from 2002
SELECT *
FROM `movies`
WHERE `title` LIKE "%(2002)%";


-- Find out what year the Godfather came out
SELECT `title`
FROM `movies`
WHERE `title` LIKE "%GodFather%";

-- Without using joins find all the comedies
SELECT `title`
FROM `movies`
WHERE `genres` LIKE "%Comedy%";


-- Find all comedies in the year 2000
SELECT `title`
FROM `movies`
WHERE `genres` LIKE "%Comedy%" AND `title` LIKE "%(2002)%";

-- Find any movies that are about death and are a comedy---
SELECT `title`
FROM `movies`
WHERE `genres` LIKE "%Comedy%" AND `title` LIKE "%Dead%";

-- Find any movies from either 2001 or 2002 with a title containing super
SELECT `title`
FROM `movies`
WHERE `title` LIKE "%super%(2001)" 
OR `title` LIKE "%super%(2002)";

-- Create a new table called actors (We are going to pretend the actor can only play in one movie). The table should include name, character name, foreign key to movies and date of birth at least plus an id field.



-- Pick 3 movies and create insert statements for 10 actors each. You should use the multi value insert statements
INSERT INTO actors(`name`,`character`,`movie_id`,`dob`)
VALUES  
  ('Ben Affleck','Hunter Royce', 1,'1972-01-01'),
  ('Anne Hathaway','Rose White', 2, '1974-01-11'),
  ('Will Smith', 'Craig Shoulders', 3, '1975-08-01'),
  ('Jennifer Lopez', 'Maria Mendez', 4, '1976-01-01'),
  ('Lady Gaga', 'Summer Hanes', 5, '1978-01-01'),
  ('Halle Barry', 'Jessica Rabbit', 6, '1976-07-01'),
  ('Will Ferrell', 'Buddy', 7, '1973-01-01'),
  ('Adam Sandler', 'Henry Holiday', 8, '1972-01-03'),
  ('Kristen Bell', 'Anna Hendrix', 9, '1979-01-01'),
  ('Sam Hunt', 'Heather Burn', 10, '1978-01-06');
  
-- Create a new column in the movie table to hold the MPAA rating. UPDATE 5 different movies to their correct rating
UPDATE `movies`
SET `MPAA` = 'G'
WHERE id = 1;

UPDATE `movies`
SET `MPAA` = 'PG'
WHERE id = 2;

UPDATE `movies`
SET `MPAA` = 'G'
WHERE id = 3;

UPDATE `movies`
SET `MPAA` = 'MA'
WHERE id = 4;

UPDATE `movies`
SET `MPAA` = 'R'
WHERE id = 5;


-- Find all the ratings for the movie Godfather, show just the title and the rating
SELECT `title`, `rating`
FROM `movies` m
LEFT JOIN `ratings` r ON r.movie_id = m.`id`
WHERE `title` LIKE "%Godfather%";

-- Order the previous objective by newest to oldest
SELECT `title`, `rating`, `timestamp`
FROM `movies` m
LEFT JOIN `ratings` r ON r.movie_id = m.`id`
WHERE `title` LIKE "%Godfather%"
ORDER BY timestamp DESC;

-- Find the comedies from 2005 and get the title and imdbid from the links table
SELECT `title`, `imdb_Id`
FROM `movies` m
LEFT JOIN `links` ON links.movie_Id = m.id
WHERE `title` LIKE "%(2005)%" AND `genres` LIKE "%Comedy%";


-- Find all movies that have no ratings
SELECT `title`, `rating`
FROM `movies` m
LEFT JOIN `ratings` r ON r.movie_id = m.`id`
WHERE `rating` = null;

-- Get the average rating for a movie
SELECT avg(rating)
FROM `movies` m
LEFT JOIN `ratings` r ON r.movie_id = m.id
WHERE m.id = '3';

-- Get the total ratings for a movie
SELECT COUNT(rating)
FROM `movies` m
LEFT JOIN `ratings` r ON r.movie_id = m.id
WHERE m.id = '4';

-- Get the total movies for a genre
SELECT COUNT(genres)
FROM `movies` m
LEFT JOIN `ratings` r ON r.movie_id = m.id
WHERE `genres` LIKE '%comedy%';

-- Get the average rating for a user
SELECT avg(rating)
FROM `movies` m
LEFT JOIN `ratings` r ON r.movie_id = m.id
WHERE r.user_id = '6';

-- Find the user with the most ratings

-- Find the user with the highest average rating

-- Find the user with the highest average rating with more than 50 reviews

-- Find the movies with an average rating over 4


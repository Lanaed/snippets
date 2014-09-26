#Ethan Spiro
#CS 275
#Assignment 2
#File: Assignment2-selection.sql

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#KEY
#film : f
#film category : fc
#language : l
#category : c
#actor : a
#film actor : fa

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#1 Find the film title and language of all films in which ADAM GRANT acted
#Order the results by title, descending (use ORDER BY title DESC at the end of the query)

SELECT f.title, l.name FROM language l 
INNER JOIN film f ON f.language_id = l.language_id 
INNER JOIN film_actor fa ON fa.film_id = f.film_id 
INNER JOIN actor a ON a.actor_id = fa.actor_id
WHERE a.first_name = 'ADAM' AND a.last_name = 'GRANT'
ORDER BY f.title DESC;


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#2 We want to find out how many of each category of film ED CHASE has started in so return a table with category.name and the count
#of the number of films that ED was in which were in that category order by the category name ascending

#select category name and count of num per category films
SELECT cfull.name, COUNT(subset.film_id) AS Number_Of_Films FROM
#from a selection of categories and films ED CHASE has starred in
(SELECT c.category_id, fa.film_id FROM category c
INNER JOIN film_category fc ON fc.category_id = c.category_id
INNER JOIN film f ON f.film_id = fc.film_id
INNER JOIN film_actor fa ON fa.film_id = f.film_id
INNER JOIN actor a ON a.actor_id = fa.actor_id
WHERE a.first_name = 'ED' AND a.last_name = 'CHASE') AS subset
#then right join it on category id to keep categories even where ED NULL didnt star
#this preserves the 0 or NULL in those categories since we have to show all categories
RIGHT JOIN category cfull ON cfull.category_id = subset.category_id
GROUP BY cfull.name ASC;


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#3 Find the first name, last name and total combined film length of Sci-Fi films for every actor
#That is the result shoudl list the names of actors and the total lenght of Sci-Fi films they have been in

SELECT a.first_name, a.last_name, SUM(length) AS total_length_of_scifi from actor a
#(left) join entire actor table with a table of actors from sci fi films (from piazza post)
LEFT JOIN (SELECT f.length, a.actor_id FROM actor a
INNER JOIN film_actor fa ON fa.actor_id = a.actor_id
INNER JOIN film f ON f.film_id = fa.film_id
INNER JOIN film_category fc ON fc.film_id = f.film_id
INNER JOIN category c ON c.category_id = fc.category_id
WHERE c.name = 'Sci-Fi') subset ON subset.actor_id = a.actor_id
#this keeps all actors first names, last names and lengths
#but shows null for actors who havent had an instance of category sci-fi
GROUP BY a.actor_id
#my own add in just for readability to list them alphabetically by last name
ORDER BY a.last_name ASC;


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#4 Find the first name and last name of all actors who have never been in a Sci-Fi film

#select the first and last name of all actors
SELECT a.first_name, a.last_name FROM actor a WHERE a.actor_id NOT IN
#who are not in the group of actors who ARE in Sci-Fi films
(SELECT a.actor_id FROM actor a 
INNER JOIN film_actor fa ON fa.actor_id = a.actor_id 
INNER JOIN film f ON f.film_id = fa.film_id 
INNER JOIN film_category fc ON fc.film_id = f.film_id 
INNER JOIN category c ON c.category_id = fc.category_id
WHERE c.name = "Sci-Fi");


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#5 Find the film title of all films which feature both KIRSTEN PALTROW and WARREN NOLTE
#Order the results by title, descending (use ORDER BY title DESC at the end of the query)
#Warning, this is a tricky one and while the syntax is all things you know, you have to think oustide
#the box a bit to figure out how to get a table that shows pairs of actors in movies

#join the film table with a Kirsten Paltrow Table with a Warren Nolte table ON the titles
SELECT f.title FROM film f 
#join to kirsten paltrow subset
INNER JOIN (SELECT f.title FROM film f 
INNER JOIN film_actor fa ON fa.film_id = f.film_id 
INNER JOIN actor a ON a.actor_id = fa.actor_id
WHERE a.first_name = 'KIRSTEN' AND a.last_name = 'PALTROW') kptable ON f.title = kptable.title
#join to warren nolte subset
INNER JOIN (SELECT f.title FROM film f 
INNER JOIN film_actor fa ON fa.film_id = f.film_id 
INNER JOIN actor a ON a.actor_id = fa.actor_id
WHERE a.first_name = 'WARREN' AND a.last_name = 'NOLTE') wntable ON f.title = wntable.title
ORDER BY f.title DESC;


-- SQL - Lab 3.01
USE sakila;

-- Activity 1
-- 1. Drop column picture from staff.
ALTER TABLE sakila.staff
	DROP COLUMN picture;

-- 2. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.

-- SELECT * FROM sakila.staff;
-- SELECT * FROM address;
-- SELECT * FROM customer
-- WHERE first_name = 'TAMMY' AND last_name = 'SANDERS';
-- so her address_id is 79

INSERT INTO sakila.staff VALUES
(3, 'Tammy', 'Sanders', 6, 'Tammy.Sanders@sakilastaff.com', 2, 1, 'Tammy','50rxjWcBpg67kidbn904ml4eks9026nu', NOW());
-- now I need to change her address_id to 79
UPDATE sakila.staff SET address_id = 79 WHERE staff_id = 3;  

-- 3. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1.
-- You can use current date for the rental_date column in the rental table.
-- Hint: Check the columns in the table rental and see what information you would need to add there.
-- You can query those pieces of information. For eg., you would notice that you need customer_id information as well.
-- To get that you can use the following query:

-- SELECT customer_id FROM sakila.customer
-- WHERE first_name = 'CHARLOTTE' AND last_name = 'HUNTER';
-- so the customer_id is 130

-- Use similar method to get inventory_id, film_id, and staff_id.

-- SELECT * FROM sakila.rental;
-- so I need: rental_id, rental_date, inventory_id, customer_id, staff_id, last_update

-- SELECT max(rental_id) FROM sakila.rental;
-- 16049

-- SELECT film_id FROM sakila.film
-- WHERE film.title = 'Academy Dinosaur';
-- so the film_id is 1

-- SELECT staff_id FROM sakila.staff
-- WHERE first_name = 'Mike' AND last_name = 'Hillyer';
-- so the staff_id is 1

-- SELECT MAX(i.inventory_id) FROM sakila.inventory AS i
-- JOIN sakila.film AS f
-- ON i.film_id = f.film_id
-- WHERE f.film_id = 1 AND i.store_id = 1;
-- so the inventory_id is 4

INSERT INTO sakila.rental VALUES(16050, NOW(),4,130, NULL,1,NOW());

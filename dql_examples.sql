-- Hello World SQL Query, SELECTS ALL COLUMNS from actor table
SELECT * FROM actor;

-- Query for specific columns in the actor table
SELECT first_name, last_name
FROM actor;


-- Use the WHERE clause to filter rows Syntax: WHERE <condition>
SELECT *
FROM actor
WHERE first_name = 'Nick';

-- LIKE keyword 
SELECT *
FROM actor
WHERE first_name LIKE 'Nick';

-- LIKE keyword with the wildcard (aka %) for 0-infinity spaces
SELECT *
FROM actor 
WHERE first_name LIKE 'N%';

-- LIKE keyword with the wildcard (aka _) for 1 space
SELECT *
FROM actor 
WHERE first_name LIKE '_a_';



-- Comparing operators are: 
-- Greater Than (>) -- Less Than (<)
-- Greater or Equal (>=) -- Less or Equal (<=)
-- Not Equal (<>)


-- Explore data with SELECT * query (sqpecifically when looking at new table)
SELECT * FROM payment;

-- Get all payments of more than $2.00
SELECT * 
FROM payment 
WHERE amount > 2.99;


-- Get all payments between $3 and $8
SELECT *
FROM payment
WHERE amount >= 3 AND amount <= 8;


-- Using the BETWEEN/AND clause with WHERE
SELECT *
FROM payment
WHERE amount BETWEEN 3 AND 8;


-- Order our rows of data by using the ORDER BY clause (default to ascending)
SELECT *
FROM payment 
WHERE amount BETWEEN 3 AND 8
ORDER BY amount;

-- Order our rows of data in descending by using the ORDER BY clause and DESC
SELECT *
FROM payment 
WHERE amount BETWEEN 3 AND 8
ORDER BY amount DESC;



SELECT customer_id,amount
FROM payment 
WHERE amount > 5 AND customer_id < 200
ORDER BY customer_id;



-- SQL Aggregations => SUM(), AVG(), COUNT(), MIN(), MAX()

SELECT SUM(amount)
FROM payment;


-- Get the total amount paid if the amount greater than $5
SELECT SUM(amount)
FROM payment
WHERE amount > 5;

-- Get the average amount paid if the amount is greater than $5
SELECT AVG(amount)
FROM payment
WHERE amount > 5;


-- Get the number of payments that are greater than $5
SELECT COUNT(*)
FROM payment
WHERE amount > 5;

-- Alias our column names - AS keyword
SELECT MIN(amount) AS lowest_amount_above_five
FROM payment
WHERE amount > 5;


-- Alias our column names - AS keyword
SELECT MAX(amount) AS max_amount_paid
FROM payment
WHERE amount > 5;



-- Query different amounts (quick demo -> group by)
SELECT COUNT(amount)
FROM payment 
WHERE amount = 3.99;


-- GROUP BY clause
SELECT amount, SUM(amount), COUNT(*)
FROM payment 
GROUP BY amount;

-- Query the payment table to display the customers who have spent the most (aka order by sum amount)
SELECT customer_id, SUM(amount), COUNT(*)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC;


-- HAVING clause -> HAVING is to GROUP BY/Aggregations as WHERE is to SELECT 

-- Query the payment table to display the customers who have spent the most (aka order by sum amount) having made no more than 40 payments
SELECT customer_id, SUM(amount), COUNT(*)
FROM payment
GROUP BY customer_id 
HAVING COUNT(*) <= 40
ORDER BY SUM(amount) DESC;


-- Limit the number of rows returned using the LIMIT clause
SELECT customer_id, SUM(amount), COUNT(*)
FROM payment
GROUP BY customer_id 
HAVING COUNT(*) <= 40
ORDER BY SUM(amount) DESC
LIMIT 5;


-- Start your rows after a certain amount of rows using the OFFSET clause
-- e.g. Display customers 10-15 in terms of most spent under 40 purchases
SELECT customer_id, SUM(amount), COUNT(*)
FROM payment
GROUP BY customer_id 
HAVING COUNT(*) <= 40
ORDER BY SUM(amount) DESC
OFFSET 9 -- SKIP OVER FIRST 9 rows
LIMIT 5; -- LIMIT TO showing ONLY 5 rows






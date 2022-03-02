CREATE database dvdrental;

-- CREATE TABLE customer (
--     id SERIAL PRIMARY KEY,
--     name VARCHAR(255) NOT NULL,
--     email VARCHAR(255) NOT NULL,
--     password VARCHAR(255) NOT NULL
-- );

-- INSERT INTO users (name, email, password) VALUES ('Luiggy', 'luiggy@gmail.com', '123456');

-- select a specific column from a table
SELECT first_name FROM customer;

-- select more than one column from a table
SELECT first_name, last_name, email FROM customer;

-- select all columns from a table
SELECT * FROM customer;
-- it is not recommended to use * in a query because it is a wildcard and it can return a lot of data and it is not optimized for performance, this can affect the performance of your application and it is not recommended to use it in production environments because it can be slow.
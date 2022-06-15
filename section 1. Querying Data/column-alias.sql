-- use an alias to name a column
SELECT column_name AS alias_name FROM table_name;

-- this way you can make more meaningful names for your columns
SELECT first_name, last_name AS surname FROM customer;
SELECT first_name, last_name surname FROM customer; -- this is the same as the previous one but whitout the AS keyword
-- this command would result in the following output:
/* 
    first    |   surname        <--------- this is where the alias is used
-------------+--------------
 Jared       | Ely
 Mary        | Smith
 Patricia    | Johnson
 Linda       | Williams
 Barbara     | Jones
 Elizabeth   | Brown
 Jennifer    | Davis
 Maria       | Miller
 Susan       | Wilson
 Margaret    | Moore
*/

-- you can use expression to name a column
SELECT first_name || ' ' || last_name FROM customer;
-- thi command is fine, but the name of the column is not very meaningful
-- result:
/*
       ?column?        <--------- as you can see the name of the column is not very meaningful
-----------------------
 Jared Ely
 Mary Smith
 Patricia Johnson
 Linda Williams
 Barbara Jones
 Elizabeth Brown
 Jennifer Davis
 Maria Miller
 Susan Wilson
 Margaret Moore

*/
-- using a expression to concatenate the name of the columns result in one name for the column, the default one ins 'column', but with an alias you can make it more meaningful:
SELECT first_name || ' ' || last_name AS full_name FROM customer;
-- result:
/*
       full_name       <--------- now the name of the column is more meaningful
-----------------------
 Jared Ely
 Mary Smith
 Patricia Johnson
 Linda Williams
 Barbara Jones
 Elizabeth Brown
 Jennifer Davis
 Maria Miller
 Susan Wilson
 Margaret Moore
*/

-- if you're going to use spaces in your column name, you can use the following syntax:
SELECT first_name || ' ' || last_name AS "full name" FROM customer;
-- result:
/*
       ?column?        <--------- as you can see the name of the column is not very meaningful
-----------------------
 Jared Ely
 Mary Smith
 Patricia Johnson
 Linda Williams
 Barbara Jones
 Elizabeth Brown
 Jennifer Davis
 Maria Miller
 Susan Wilson
 Margaret Moore

*/
-- using a expression to concatenate the name of the columns result in one name for the column, the default one ins 'column', but with an alias you can make it more meaningful:
SELECT first_name || ' ' || last_name AS full_name FROM customer;
-- result:
/*
       full name       <--------- now the name of the column is more meaningful
-----------------------
 Jared Ely
 Mary Smith
 Patricia Johnson
 Linda Williams
 Barbara Jones
 Elizabeth Brown
 Jennifer Davis
 Maria Miller
 Susan Wilson
 Margaret Moore
*/
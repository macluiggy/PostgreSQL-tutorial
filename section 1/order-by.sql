-- you can order a column or columns in ascending or descending order using this syntax:
SELECT first_name, last_name FROM customer ORDER BY first_name ASC;

-- order the rows by the order opcion in one column
SELECT first_name, last_name FROM customer ORDER BY first_name ASC;
/*
the rows now are ordered by the first column in ascending order

 first_name  |  last_name   
-------------+--------------
 Aaron       | Selby
 Adam        | Gooch
 Adrian      | Clary
 Agnes       | Bishop
 Alan        | Kahn
 Albert      | Crouse
 Alberto     | Henning
 Alex        | Gresham
 Alexander   | Fennell
 Alfred      | Casillas
:
*/

-- you can also order the rows by multiple columns, in this case the order is based on the first column, if two or more values are equal in the first column, the order is based on the second column order role for the second column, and so on:
SELECT first_name, last_name FROM customer ORDER BY first_name ASC, last_name DESC;

/*
 first_name  |  last_name   
-------------+--------------
 Aaron       | Selby
 Adam        | Gooch
 ...
 Kathryn     | Coleman
 Kathy       | James
 Katie       | Elliott
 Kay         | Caldwell
 Keith       | Rico
 Kelly       | Torres   <--- ORDER DESC FOR VALUES OF THE SECOND COLUMN IF TWO VALUES OF THE FIRST COLUMN ARE EQUAL
 Kelly       | Knott    <--- ORDER DESC FOR VALUES OF THE SECOND COLUMN IF TWO VALUES OF THE FIRST COLUMN ARE EQUAL
 Ken         | Prewitt
 Kenneth     | Gooden
 Kent        | Arsenault
 Kevin       | Schuler
 Kim         | Cruz
:

As you can see, the order is based on the second column when two values are the same in the first column
*/

-- if you want to order by its value length, you can use the following syntax:
SELECT first_name, length(first_name) len FROM customer ORDER BY len desc;
-- length(first_name) is a function that returns the length of the first_name column
-- lenght(first_name) is the length of the first_name column's value, and it needs a column name which is why it uses "len", but you can use any other name you want

-- if you have Null values in your table, you can order them using NULLS LAST or NULLS FIRST
-- this commands are self explanatory

-- create a new table
CREATE TABLE sort_demo(
	num INT
);

-- insert some data
INSERT INTO sort_demo(num)
VALUES(1),(2),(3),(null);

-- return data from the sort_demo table
SELECT num
FROM sort_demo
ORDER BY num;
/*
 num 
-----
   1
   2
   3  
   null <--- notice that the null value is at the end of the list, this is becase the ORDER BY command uses the NULLS LAST option by default
*/

-- so if you want to place the null value at the beginning of the list, you can use the following syntax:
SELECT num FROM sort_demo ORDER BY num NULLS FIRST;
/*
 num 
-----  
   null <--- now the null value is at the beginning of the list because the NULLS FIRST option was used
   1
   2
   3
*/

-- if you use this:
SELECT num
FROM sort_demo
ORDER BY num DESC;
/*
 num 
-----
   null <--- the null values now is at the beginning of the list because the DESC option uses NULLS LAST by default
   3
   2
   1
(4 rows)
*/

-- so if you use this:
SELECT num
FROM sort_demo
ORDER BY num DESC NULLS LAST;

/*
 num 
-----
   3
   2
   1
   null <--- the null value now is at the end again because the DESC NULLS LAST option was used
(4 rows)
*/
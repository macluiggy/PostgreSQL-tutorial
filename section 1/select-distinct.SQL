INSERT INTO distinct_demo (bcolor, fcolor) VALUES
('red', 'red'),
('red', 'red'),
('red', NULL),
(NULL, 'red'),
('red', 'green'),
('red', 'blue'),
('green', 'red'),
('green', 'blue'),
('green', 'green'),
('blue', 'red'),
('blue', 'green'),
('blue', 'blue');

-- para seleccionar una o mas filas de una columna de una tabla podemos utilizar el comando SELECT DISTINCT
SELECT DISTINCT fcolor FROM distinct_demo;
-- el comando de arriba devuelve los valores de la columna fcolor de la tabla distinct_demo, sin repetir ninguno de ellos
/*
 fcolor 
--------
 
 green
 blue
 red
(4 rows)
*/


-- si usamos el comando seleccionando dos columnas, el resultado sera distinto
SELECT DISTINCT bcolor, fcolor FROM distinct_demo;

/*
 bcolor | fcolor 
--------+--------
 blue   | green
 red    | 
 blue   | red
 red    | green
 red    | red
 red    | blue
 green  | red
        | red
 green  | green
 blue   | blue
 green  | blue
(11 rows)

este resultado es debido a que ahora se distinge con los valores de las filas de ambas columnas
blue green no es lo mismo que blue red, por eso aunque blue aparece dos veces, red y green aparecen una sola vez, es como decir que pepe gonzalez y pepe perez no son la misma persona
*/

-- para que solo distinga los valores de una columna, podemos utilizar el comando SELECT DISTINCT ON
-- este comando es similar al anterior, pero en este caso solo se distingue los valores de una columna
-- de esta forma se tendra dos columnas pero solo una de ellas tendra valores distintos y la otra
-- tendra la posibilidad de tener valores repetidos
SELECT DISTINCT ON (bcolor) bcolor, fcolor FROM distinct_demo ORDER BY bcolor, fcolor;
/*
 bcolor | fcolor 
--------+--------
 blue   | blue
 green  | blue
 red    | blue
        | red
(4 rows)

una analogia para entender esto seria como si solo una persona de una pareja tenga la decision de algo
y la segunda pareja no tenga la posibilidad de tomar esa decision
mientras que sin la opcion ON, ambas parejas tendran que tomar la decision de algo
*/
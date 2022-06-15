-- esta te permite crear una tabla desde el resultado de una query
-- la sintaxis es:
create table table_name as query;

-- para que sea temporal, se puede usar la sintaxis:
create temp table table_name as query;

-- si quieres que los nombres de las columnas del query sean differentes a las columnas de la tabla, se puede usar la sintaxis:
create table table_name(column1, column2) as query;

-- en caso de que quieras evitar un error porque ya se creo la tabla, se puede usar la sintaxis:
create table if not exists table_name as query;

-- ejemplo
-- la siguiente declaracion crea una tabla que contiene las pelicuals de accion que pertenecen a la categoria uno
create table action_film as 
select 
film_id,
title,
release_year,
length,
rating
from film
inner join film_category using (film_id)
where category_id = 1;

-- si la clausula select tiene expresiones, es buena practica sobreescribir el nombre de las columnas, por ejemplo:
CREATE TABLE IF NOT EXISTS film_rating (rating, film_count) 
AS 
SELECT
    rating,
    COUNT (film_id)
FROM
    film
GROUP BY
    rating;

-- create table as query, es similar a select into, pero es preferible usar el primero
-- ya que create table as query, no se confunde con otros usos que se pueden hacer con select into
-- en PL/pgSQL, Además, la instrucción CREATE TABLE AS proporciona un superconjunto de funciones que ofrece la instrucción SELECT INTO.
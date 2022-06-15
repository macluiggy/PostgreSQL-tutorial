-- la clausula union permite unir dos tablas, pero estas tienen que tener la misma estructura, es decir, tener la misma cantidad de columnas, con el mismo nombre, orden y tipo de datos. el resultado elimina los duplicados, para evitarlo se puede user union all (que no elimina duplicados).

select first_name, last_name from customer union select payment_id from payment; -- ERROR:  each UNION query must have the same number of columns
-- el anterior error es porque las dos tablas tienen diferente cantidad de columnas, por lo tanto no pueden unirse.

select * from top_rated_films union select * from most_popular_films;
select * from top_rated_films union all select * from most_popular_films;

-- para ordenar los resultados de una union, se puede usar la clausula order by
select * from top_rated_films union select * from most_popular_films order by title;
select * from top_rated_films union select * from most_popular_films order by year;
select * from top_rated_films order by title union select * from most_popular_films order by title; -- X

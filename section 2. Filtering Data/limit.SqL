-- puede limitar el numero de filas que se devuelven con la clausula limit
select film_id, title, release_year from film order by film_id limit 5;
select film_id, title, rental_rate from film order by rental_rate desc limit 10;
select film_id, title, rental_rate from film order by rental_rate desc offset 5 limit 10; -- offset es primero por el standard de SQL, pero em postgres lo puedes ponder en cualquiera de los dos ordenes
select film_id, title, rental_rate from film order by rental_rate desc limit 10 offset 5;
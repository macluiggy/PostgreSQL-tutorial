-- limit no es estandar de SQL, por lo cual si se quiere hacer compatible con otro motor de base de datos se debe utilizar fetch en lugar de limit como en estos ejemplos
select film_id, title from film order by title fetch first 5 rows only;
select film_id, title from film order by title offset 5 row fetch first 5 row only;

select first_name from customer order by first_name offset 10 fetch next 5 rows only;
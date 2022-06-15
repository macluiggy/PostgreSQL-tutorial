-- puedes seleccionar un o varias filas donde su valor sea igual a uno de los valores de una lista
select * from film where title in ('The Godfather', 'The Shawshank Redemption');
select customer_id, rental_id, return_date from rental where customer_id in ( 1, 2 ) order by return_date desc;
-- esto se puede hacer equivalente si usamos los operadores = y or
select customer_id, rental_id, return_date from rental where customer_id = 1 or customer_id = 2 order by return_date desc;
-- es recomendable utilizar el operador in en vez de =, porque postgresql lo ejecuta mucho mas rapido
-- el mismo query que usando el operador =

-- para devolver lo contrario al ejemplo anterior que uso el operador in
select customer_id, rental_id, return_date from rental where customer_id not in ( 1, 2 ) order by return_date asc;
select customer_id, rental_id, return_date from rental where customer_id not in ( 1, 2 );
-- para devolver lo contrario al ejemplo anterior que uso el operador = y or
select customer_id, rental_id, return_date from rental where customer_id != 1 and customer_id != 2;
select customer_id, rental_id, return_date from rental where customer_id != 1 and customer_id <> 2;
select customer_id, rental_id, return_date from rental where customer_id <> 1 and customer_id <> 2;
select customer_id, rental_id, return_date from rental where customer_id <> 1 and customer_id != 2;

-- tambien puedes usar el operador in con subquery o en español subconsulta
select * from rental where customer_id in (select customer_id from customer where name like '%pe%');
SELECT customer_id
FROM rental
WHERE CAST (return_date AS DATE) = '2005-05-27'
ORDER BY customer_id;

select customer_id, first_name, last_name from customer where customer_id in(select customer_id from rental where cast (return_date as date) = '2005-05-27') order by customer_id;
-- select first_name from customer where first_name in (select first_name from customer where length(first_name) between 4 and 6);




select first_name, last_name from customer where first_name in (select first_name from customer where length(first_name) > 5);
select first_name, last_name from customer where length(first_name) > 5;
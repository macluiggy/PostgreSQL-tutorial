-- una subquey (subconsulta) es una query (consulta) que se ejecuta dentro de otra query (consulta) como SELECT, INSERT, UPDATE, DELETE, etc.

select film_id, title, rental_rate from film where rental_rate > (select avg(rental_rate) from film);

-- como se puede ver, la subquery se ejecuta dentro de parentesis, luego de la consulta principal.
-- los pasos que sigue postgres son:
/*
1. ejecuta la subconsulta
2. devuelve el resultado de la subconsulta y pásale el resultado a la consulta principal
3. ejecuta la consulta principal
*/

-- se puede usar el operador IN ya que la subquery devuelve una lista de valores
SELECT
	inventory.film_id
FROM
	rental
INNER JOIN inventory ON inventory.inventory_id = rental.inventory_id
WHERE
	return_date BETWEEN '2005-05-29'
AND '2005-05-30';
-- esto devulve una lista, entonces se puede usar como una subquery (subconsulta) mas el operador IN para filtrar los resultados
select film_id, title from film where film_id in (select inventory.film_id from rental inner join inventory ON inventory.inventory_id = rental.inventory_id where return_date BETWEEN '2005-05-29' AND '2005-05-30');

select film_id, title from film where film_id in (SELECT
	inventory.film_id
FROM
	rental
INNER JOIN inventory ON inventory.inventory_id = rental.inventory_id
WHERE
	return_date BETWEEN '2005-05-29'
AND '2005-05-30');

SELECT
	film_id,
	title
FROM
	film
WHERE
film_id IN (
  SELECT
    inventory.film_id
  FROM
    rental
  INNER JOIN inventory ON inventory.inventory_id = rental.inventory_id
  WHERE
    return_date BETWEEN '2005-05-29'
  AND '2005-05-30'
);

-- una subquery puede ser un input de del operador EXISTS, si la subquery devulve cualquier fila, el operador exists devuelve 1, si no devuelve nada, el operador exists devuelve 0
-- este operador solo le importa el numero de filas que devuelve la subquery, no el contenido de las filas, es por eso que la convencion comun de EXISTS es:
select 1 from tbl where condition;

SELECT
	first_name,
	last_name
FROM
	customer
WHERE
EXISTS (
  SELECT
    1
  FROM
    payment
  WHERE
    payment.customer_id = customer.customer_id
);
-- esto funciona como un inner join entre las tablas customer y payment, pero solo se devulve como 1 fila por cada fila de customer, aunque hay filas correspondientes en payment
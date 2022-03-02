-- inner join sirve para devolver el resultado de dos tablas intersecadas
select pka, c1, pkb, c2 from A inner join B on pka = pkb;
-- este comando consta de 3 pasos
-- especifica las columnas que quieres devolver de ambas tablas
-- especifica la tabla de la izquierda o la tabla principal
-- especifica la tabla de la derecha o la tabla secundaria en la clausula inner join

-- la forma en que inner join funciona es que selecciona todas las filas de la tabla principal y luego selecciona todas las filas de la tabla secundaria que tengan el mismo valor de la columna pka de la tabla principal


select customer.customer_id, firsT_name, last_name, amount, payment_date from customer inner join payment on payment.customer_id = customer.customer_id order by payment_date;
select customer_id, firsT_name, last_name from customer where customer_id in (select customer_id from payment);


SELECT customer.customer_id, firsT_name, last_name, amount, payment_date FROM customer INNER JOIN payment ON payment.customer_id = customer.customer_id ORDER BY payment_date;
SELECT customer.customer_id, firsT_name, last_name, amount, payment_date FROM customer INNER JOIN payment ON payment.customer_id = customer.customer_id ORDER BY payment_date limit 5;
-- lo mismo que el anterior pero con table aliases
SELECT c.customer_id, firsT_name, last_name, amount, payment_date FROM customer AS c INNER JOIN payment AS p ON p.customer_id = c.customer_id ORDER BY payment_date limit 5;
-- para hace lo mismo que el anterior pero con where
select c.customer_id, firsT_name, last_name, amount, payment_date from customer c, payment p where c.customer_id = p.customer_id order by payment_date limit 5;
select c.customer_id, firsT_name, last_name, amount, payment_date from customer c, payment p where c.customer_id = p.customer_id order by payment_date limit 5;
select c.customer_id, firsT_name, last_name, amount, payment_date from customer c inner join payment p on c.customer_id = p.customer_id where c.customer_id = 2; -- para entender eso mas claramente, imaginemos que todo antes del where seria algo como select * from table_name, ya que antes de where el commando retorna una nueva tabla de insercion y esta se le puede aplicar los mismos filtros que una tabla original

-- SELECT customer.customer_id, first_name, last_name, amount, payment_date FROM customer INNER JOIN payment ON payment.customer_id = customer.customer_id ORDER BY payment_date;


-- select customer.customer_id, firsT_name, last_name, amount, payment_date from customer inner join payment on payment.customer_id = customer.customer_id limit 5;
-- select customer_id, firsT_name, last_name from customer where customer_id in (select customer_id from payment) limit 5;
-- select 

-- si ambas tablas tienen una columna con el mismo nombre, se puede usar using para especificar el nombre de la columna, esto es equivalente a usar t1.col1 = t2.col1
select customer_id, firsT_name, last_name, amount, payment_date from customer inner join payment using (customer_id) order by payment_date limit 5;

-- para usar inner join con mas de dos tablas se establece otro join despues del primer join
select c.customer_id, c.firsT_name customer_first_name, c.last_name customer_last_name, s.firsT_name  staff_first_name, s.last_name staff_last_name, amount, payment_date from customer c inner join payment p on c.customer_id = p.customer_id inner join staff s on p.staff_id = s.staff_id;
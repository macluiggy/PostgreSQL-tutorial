-- la clausula having es una condición que se aplica a una consulta para filtrar los resultados obtenidos, esta condición se aplica después de haber ejecutado la clausula group by generalmente. es similar a la clausula where pero aqui se aplica el filtro a un grupo de filas de acuerdo a una condición especifica.
-- en otras palabras, la clausula where se usa para filas individuales, mientras que la clausula having se usa para filas agrupadas.

select customer_id, sum(amount) from paymenT group by customer_id ; 
select customer_id, sum(amount) from paymenT group by customer_id having sum(amount) > 200;

select store_id, count(customer_id) from customer group by store_id ;
select store_id, count(customer_id) from customer group by store_id having count(customer_id) > 300;


select store_id, count(customer_id) from customer where count(customer_id) > 300 group by store_id; 
select store_id, count(customer_id) from customer group by store_id where count(customer_id) > 300;
-- ninguno de los dos anteriores es correcto ya que la clausula where se aplica a una fila individual y la clausula having se aplica a un grupo de filas.

select STORE_ID FROM customer GROUP BY STORE_ID;
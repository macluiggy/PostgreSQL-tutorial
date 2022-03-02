SELECT 
   column_1, 
   column_2,
   ...,
   aggregate_function(column_3)
FROM 
   table_name
GROUP BY 
   column_1,
   column_2,
   ...;


select customer_id from payment GROUP by customer_id;
select firsT_name from customer GROUP by firsT_name limit 5; -- este
select firsT_name from customer limit 5;
select distinct firsT_name from customer limit 5; -- es quivalente a este

-- la columna debe ser usada ya sea en el grpuo by o en un aggregate para que funcione
select customer_id, amount from payment limit 5;
select distinct customer_id, amount from payment limit 5;
select distinct on(customer_id) customer_id, amount from payment limit 5;
select customer_id, amount from payment group by customer_id, amount;
select customer_id, sum(amount) from payment group by customer_id, amount limit 5;
select customer_id, sum(amount) from payment GROUP by customer_id limit 5;
-- lo anterior es equivalente dice:
-- de la tabla payment selecciona la columna customer_id y agrupalo con la suma de cada amount que le corresponda a cada customer_id
-- entonces basicamente group by col_name hace que no se repita col_name y se puede agrupar los valores de las filas que contengan el mismo valor de col_name

select customer_id, sum(amount) from payment group by customer_id order by sum(amount) desc;
select customer_id, sum(amount) from payment group by customer_id order by sum(amount) desc limit 5;

select firsT_name || ' ' || last_name full_name, sum(amount) from payment inner join customer using(customer_id) group by full_name order by sum(amount) ;
select firsT_name || ' ' || last_name full_name, sum(amount) from payment inner join customer using(customer_id) group by full_name order by sum(amount) desc ;
select firsT_name || ' ' || last_name full_name, sum(amount) amount from payment inner join customer using(customer_id) group by full_name order by amount desc ;

select firsT_name || ' ' || last_name full_name, sum(amount) amount from payment inner join customer using(customer_id) group by full_name order by amount desc limit 3 ;
-- ya que el anterior usa using, tambien se puede usar el natural join en el siguiente ejemplo
select firsT_name || ' ' || last_name full_name, sum(amount) amount from payment natural join customer group by full_name order by amount desc limit 3;


select firsT_name || ' ' || last_name full_name, sum(amount) from payment inner join customer using(customer_id) group by full_name order by sum(amount) desc limit 5;
select p.customer_id, firsT_name, last_name, sum(amount) from payment p inner join customer c using(customer_id) group by customer_id;
select p.customer_id, firsT_name, last_name, sum(amount) from payment p inner join customer c using (customer_id) group by p.customer_id, firsT_name, last_name order by sum(amount) desc limit 5;

select staff_id , count(payment_id) from payment group by staff_id; -- este comando dice: de la tabla payment agrupa las veces que se repite el payment_id como valor de staff_id que representa la agrupacion del mismo
select staff_id , count(payment_id) from payment; -- ya que se estaq usando un aggregate, este comando dara error si no se usa el group by con la(s) columna(s) que se quieren agrupar
select staff_id  from payment order by staff_id;
select * from payment order by staff_id;
select * from payment where customer_id = 341 order by staff_id;
select 
select * from payment where staff_id = 1 or staff_id = 2 order by staff_id;

select customer_id, staff_id, sum(amount) from payment group by customer_id, staff_id order by customer_id desc; -- la cantidad de filas que devulve este comando es igual a la multiplicacion de customer_id agrupado por la cantidad de staff_id agrupado
-- lo que hace el comando anterior es que devulve las filas donde haya uno o mas filas donde customer_id sea igual a "x" y donde staff_id sea igual a "y", o dicho de otra manera, agrupa las columnas donde se repitan el valor de customer_id y el valor de staff_id pero juntos, osea que customer_id y staff_id se toman como un solo valor y de ahi se agrupan para sumar los valores de amount donde salga ese valor de customer_id y staff_id
select customer_id,  sum(amount) from payment group by customer_id;

select  staff_id, sum(amount) from payment group by  staff_id;
select customer_id,  sum(amount) from payment group by customer_id limit 5;
select  staff_id, sum(amount) from payment group by  staff_id limit 5;

select payment_id, date(payment_date) from payment group by date(payment_date);
select date(payment_date) paid_date, sum(amount) sum from payment group by paid_date order by sum desc; -- este comando agrupa la suma de pagos que se hicieron en una fecha determinada
select payment_date , sum(amount) sum from payment group by payment_date order by payment_date; -- este no funcionara como se espera, yq que payment_date toma el tiempo y fecha, es decir que no van a ser iguales porque el tiempo transcurre y el valor de payment_dare varia aunque sea el mismo dia, el comando anterior funciona ya que ese solo toma la fecha, mas no el tiempo

select * from payment order by payment_id;

select date(payment_date) paid_date, staff_id, sum(amount) sum from payment group by paid_date, staff_id order by sum desc; -- este comando agrupa la suma de pagos que se hicieron en una fecha determinada y por cada fecha agrupa por cada staff_id, es decir que devulve la suma de pagos que cada staff_id (que son 1 y 2) hizo en una fecha determinada, este divide el amount para el staff_id 1 y 2 a difeencia del que no tiene la columna staff_id que solo devulve la suma de pagos que se hicieron en una fecha determinada sin importar que staff_id hizo ese pago
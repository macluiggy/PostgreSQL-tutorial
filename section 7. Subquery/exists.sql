-- el operador EXISTS se utiliza para saber si existe uno o mas filas en una consulta
-- el contenido de select de la subconsulta no es importante
-- por esta razon la convencion comun al usar este operador es:
SELECT 
    column1
FROM 
    table_1
WHERE 
    EXISTS( SELECT 
                1 
            FROM 
                table_2 
            WHERE 
                column_2 = table_1.column_1);

select first_name, last_name
from customer c
where exists (
  select 1
  from payment p
  where p.customer_id = c.customer_id
  and amount > 11
) 
order by first_name, last_name;
-- en este ejemplo, para cada cliente in la tabla customer, la subconsulta verifica la tabla paymente para encontrar se ese cliente hizo al menos un pago (p.customer_id = c.customer_id) y que el monto del pago sea mayor a 11 (amount > 11)

-- not exists es igual que exists solo que este devulve false si existe una o mas filas en la subconsulta y true si no existe ninguna fila

select first_name, last_name
from customer c
where not exists (
  select 1
  from payment p
  where p.customer_id = c.customer_id
  and amount > 11

)
order by first_name, last_name;
-- esta cosulta devulve los resultados que no sean iguales a la constulta anterior
-- esta consulta tambien se podria escribir como:
select first_name, last_name
from customer c
inner join payment p on p.customer_id = c.customer_id
where amount > 11
order by first_name, last_name;

-- si la subquery retorna null, exists devuelve true
SELECT
	first_name,
	last_name
FROM
	customer
WHERE
	EXISTS( SELECT NULL )
ORDER BY
	first_name,
	last_name;
-- esta consulta devolvera todas las filas de la tabla customer ya que exists devuelve true para cada fila


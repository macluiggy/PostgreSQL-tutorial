-- para selectionar filas que su valor encaje con un patron de busqueda se utiliza el operador like
-- supongamos que quieres seleccionar los datos de un usuario en espacifico, pero no lo recuerdas bien
-- solo recuerdas que su nombre empieza con 'Ann', es aqui donde entra el operador like:
select customer_id, first_name, last_name from customer where first_name like 'Ann%';

select first_name, last_name from customer where first_name like 'Jen%' order by first_name;

-- usando el wildcard _ es para selectionar los valores que tengan una letra en cualquier posicion
-- es como decir 'julia' like '_u_ia', seria como el ahorcado
select first_name, last_name from customer where first_name like '_u_ia';

-- es decir 'julia' like '%u%i%a'
-- '%u%i%a' es como una expresion regular equivalente a /.*u.*i.*a.*/

SELECT
	'foo' LIKE 'foo', -- true
	'foo' LIKE 'f%', -- true
	'foo' LIKE '_o_', -- true
	'bar' LIKE 'b_'; -- false


select first_name, last_name from customer where first_name like '%er%' order by first_name;
SELECT
	first_name,
	last_name
FROM
	customer
WHERE
	first_name LIKE '_her%'
ORDER BY 
        first_name;

-- para seleccionar filas que no tengan un patron de busqueda se utiliza el operador not like
select first_name, last_name from customer where first_name not like 'Jen%' order by first_name;

-- para seleccionar filas que encajen con un patron sin importar mayusculas o minusculas se utiliza el operador ilike
select first_name  , last_name from customer where first_name ilike 'BaR%' order by first_name;
select first_name  , last_name from customer where first_name like 'BaR%' order by first_name; -- este no devulvera ninunga fila
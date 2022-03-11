-- para seleccionar filas de una o mas columnas de una tabla donde satisfaga una condicion
-- podemos usar las cláusula where
select select_list from table_name where condition;

-- el siguiente no va a funcionar ya que los alias no funcionan con where, se tendria que poner 
-- ... where first_name = 'Juan'; para que funcione
select first_name as first_n from customer where first_n = 'Jared'; -- incorrecto
select first_name as first_n from customer where first_name = 'Jared'; -- correcto
-- entonces el alias es innecesario
select first_name from customer where first_name = 'Jared';

-- vamos a hacer unos ejemplos
-- en este ejemplo se busca el nombre y apellido de un cliente que su nombre sea Jamie
select last_name, first_name from customer where first_name = 'Jamie';

-- en el siguiente es igual al anterior solo que ahora se filtra por su nombre y apellido
select last_name, first_name from customer where first_name = 'Jamie' and last_name = 'Rice';

-- tambien se puede utilizar el operador OR el cual permite filtrar por mas de una condicion
select last_name, first_name from customer where last_name = 'Rodriguez' or first_name = 'Adam';

-- para filtrar filas que su valor se encuentre un una lista de valores se utiliza el operador IN
-- en el siguiente ejemplo se filtra los clientes que tengan los nombres en la lista de nombres
select first_name, last_name from customer where first_name in ('Ann', 'Anne', 'Annie');

-- para devolver todas las filas que cumplan con un patron de busqueda se utiliza el operador LIKE
-- para el siguiente ejemplo se filtra todos los nombres que comiencen con  Ann
select first_name, last_name from customer where first_name like 'Ann%';
-- % es como . en las expresiones regulares

-- para filtrar filas que cumplan con un range de valores se utiliza el operador BETWEEN
-- en este ejemplo se filtran los nombres que empiecen con A y que se encuentren entre los valores 3 y 5
select first_name, length(first_name) name_length from customer where first_name like 'A%' and length(first_name) between 3 and 5 order by name_length;
-- el siguiente es el mismo pero sin la columna que muestra el length
select first_name from customer where first_name like 'A%' and length(first_name) between 3 and 5 order by length(first_name);

-- si queremos filtrar filas donde sus valores no sean iguales a la condicion se utiliza el operador != o <>
-- en este ejemplo filtraremos el nombre de los clientes que empliecen con Bra y no se appelliden Motley
select first_name, last_name from customer where first_name like 'Bra%' and last_name <> 'Motley';
select first_name, last_name from customer where first_name like 'Bra%' and last_name != 'Motley';
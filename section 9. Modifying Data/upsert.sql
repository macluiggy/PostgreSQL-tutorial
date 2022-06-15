-- la feature upsert sirve para insertar o actualizar registros en una tabla
-- por eso el nombre de la clausula es UPSERT, la combinacion de update y insert es UPSERT
-- la sintaxis es:
INSERT INTO table_name(column_list) 
VALUES(value_list)
ON CONFLICT target action;

-- el target puede ser uno de los siguientes:
/*
* column_name - una columna de la tabla
* ON CONSTRAINT constraint_name - una constraint único de la tabla
* WHERE predicate - una condicion, un where con su predicado
la accion
* DO NOTHING - no hace nada si la fila existe
* DO UPDATE SET column_1 = value_1, ... WHERE condition - actualiza los valores de las columnas indicadas en la clausula SET
*/

DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
	customer_id serial PRIMARY KEY,
	name VARCHAR UNIQUE,
	email VARCHAR NOT NULL,
	active bool NOT NULL DEFAULT TRUE
);

INSERT INTO 
    customers (name, email)
VALUES 
    ('IBM', 'contact@ibm.com'),
    ('Microsoft', 'contact@microsoft.com'),
    ('Intel', 'contact@intel.com') RETURNING *;

-- suponemos que microsoft cambia el email contact@microsoft.com, si usamos el update
-- a secas, este devuelve un error quejandose de que existe una key duplicada name
-- por eso usamos el ON CONFLICT
INSERT INTO customers (NAME, email)
VALUES('Microsoft','hotline@microsoft.com') 
ON CONFLICT ON CONSTRAINT customers_name_key 
DO NOTHING;
-- esto significa, que si la tabla customer, la columna name, ya existe, no hace nada
-- por eso la sintaxis de on constraint es: table_column_key

-- tambien se podria hacer lo mismo que lo anterior, usando simplemente
-- el nombre de la columna
INSERT INTO customers (name, email)
VALUES('Microsoft','hotline@microsoft.com') 
ON CONFLICT (name) 
DO NOTHING;

-- si se quiere añadir el correo anterior concatenado con el nuevo, se puede usar
INSERT INTO customers (name, email)
VALUES('Microsoft','hotline@microsoft.com') 
ON CONFLICT (name) 
DO 
   UPDATE SET email = EXCLUDED.email || ';' || customers.email
RETURNING *;
-- EXCLUDED.email quiere decir que el email proviene del valor de la fila que se iba a insertar
-- y customers.email quiere decir que el email proviene de la fila que ya existia en la tabla
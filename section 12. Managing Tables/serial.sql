-- serial sirve para crear una secuencia de numeros que se incrementa
-- la secuencia se puede crear con el pseudo tipo SERIAL de la siguiente forma:
CREATE TABLE table_name(
    id SERIAL
);

-- asignando serial se hace lo siguiente de forma automatica:
/*
- primero, se crea un objeto secuencia y se establece el siguiente valor generado por la secuencia
como el valor por defecto de la columna id
- segundo, se añade el constraint NOT NULL a la columna id ya que la secuencia no puede tener valor nulo
- tercero, se añade el dueño de la secuencia a la columna id, como resultado, el objecto de
la secuencia se elimina cuando el id o la tabla se elimina
*/

CREATE TABLE table_name(
    id SERIAL
);

-- detras de escenas esto, es igual a lo siguiente:
CREATE SEQUENCE table_name_id_seq;

CREATE TABLE table_name (
    id integer NOT NULL DEFAULT nextval('table_name_id_seq')
);

ALTER SEQUENCE table_name_id_seq
OWNED BY table_name.id;

-- serial no hace por defecto un index o un primary key
CREATE TABLE fruits(
   id SERIAL PRIMARY KEY,
   name VARCHAR NOT NULL
);

-- para insertar los valores a la tabla fruits, en el id no es necesario ponerlo, ya que es autoincremental
INSERT INTO fruits(name) 
VALUES('Orange');
-- o puedes poner el parametro id, y name, pero id le pones default
INSERT INTO fruits(id,name) 
VALUES(DEFAULT,'Apple');

-- para obtener el nombre de la secuencia de una columna serial
-- puedes usar la funcion pg_get_serial_sequence()
pg_get_serial_sequence('table_name','column_name')
-- puedes pasar el nombre de una secuencia para obtener el valor reciente generada
-- por la misma, usando la funcion currval()
SELECT currval(pg_get_serial_sequence('fruits', 'id'));

-- si quieres obtener una o mas columnas cuando se inseta una fila
-- y por consiguiente una secuencia, puedes usar RETURNING
INSERT INTO fruits(name) 
VALUES('Banana')
RETURNING id;

-- el generador de secuencia no es segura para transacciones
-- ya que si dos conecciones a la base de datos, insertan una fila
-- cada sesion creara una secuencia, y si uno o ambas de las sesiones 
-- hace rollback, la secuencia no se guarda
-- osea que el numero para una secuencia solo se puede crear una vez
-- asi esté en una sesion
-- creando un hueco/brecha en la secuencia.
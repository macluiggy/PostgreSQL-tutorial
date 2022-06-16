-- la sintaxis de las secuencias es la siguiente
CREATE SEQUENCE [ IF NOT EXISTS ] sequence_name
    [ AS { SMALLINT | INT | BIGINT } ] -- el tipo de dato de la secuencia, BIGINT por defecto
    [ INCREMENT [ BY ] increment ]
    [ MINVALUE minvalue | NO MINVALUE ] 
    [ MAXVALUE maxvalue | NO MAXVALUE ]
    [ START [ WITH ] start ] 
    [ CACHE cache ] 
    [ [ NO ] CYCLE ]
    [ OWNED BY { table_name.column_name | NONE } ]

    -- el nombre de la secuencia deber ser diferente que cualquiera de las
    -- otras secuencias, tablas, indices, views o llaves foraneas
    -- que se hayan creado en el mismo schema

[ INCREMENT [ BY ] increment ] 
-- especifica el valor a añadir para la siguiente secuencia
-- un numero negativo formara una secuancia decreciente
-- un numero positivo formara una secuencia creciente
-- el valor por defecto es 1

[ MINVALUE minvalue | NO MINVALUE ]
[ MAXVALUE maxvalue | NO MAXVALUE ]
-- especifica el valor minimo y maximo de la secuencia
-- si no se espescifica, se usara el valor por defecto
-- para una secuenca ascendente, el valor minimo es 1
-- y el maximo es el maximo de el tipo de dato de la secuencia
-- para una secuencia descendente, el valor maximo es -1
-- y el minimo es el minimo de el tipo de dato de la secuencia

[ START [ WITH ] start ]
-- especifica el valor inicial de la secuencia
-- el valor por defecto es minvalue para una secuencia ascendente
-- y maxvalue para una secuencia descendente

[ CACHE cache ]
-- especifica el numero de valores preasignados y almacenados
-- en la memoria para un acceso mas rapido
-- por defecto la secuencia genera un valor a la vez, es decir
-- que no hay cache

[ [ NO ] CYCLE ]
-- este te permite reiniciar la secuencia a su valor minimo o maximo
-- dependiendo si es ascendente o descendente
-- para secuencias ascendentes, cuando se llege al limite, el siguiente
-- valor de la secuencia volvera a ser el minimo
-- para secuencias descendentes, cuando se llege al limite, el siguiente
-- valor de la secuencia volvera a ser el maximo
-- si no se usa NO CYCLE, y la secuencia llega a su limite
-- intentar obtener el siguiente valor resultara en error
-- NO CYCLE es el valor por defecto si no se usa CYCLE o NO CYCLE

[ OWNED BY { table_name.column_name | NONE } ]
-- especifica la tabla y la columna que sera la propietaria de la secuencia
-- esto sirve para que la secuencia asociada sea eliminada cuando la columna
-- o tabla sean eliminadas
-- Nota que cuandu se usa SERIAL Postgres automaticamente crea una 
-- secuencia asociada con la columna

-- esta declaracion usa la declaracion CRATE SECUENCE para crear una nueva
-- secuencia ascendente, empezando por 100 e incrementando de 5 en 5
CREATE SEQUENCE mysequence
start 100
increment 5;

-- para obtener el siguiente valor de la secuencia
-- se usa la funcion nextval()
SELECT nextval('mysequence');

-- si lo ejecutas otra ver, se obtendra el siguiente valor de la secuencia
select nextval('mysequence');

-- la siguiente declaracion crea una secuencia descendente
-- desde 3 a 1 con la opcion cycle
create sequence three
start 3
minvalue 1
maxvalue 3
increment -1
cycle;

select nextval('three');


-- CREANDO UNA SECUENCIA ASOCIADA CON UNA COLUMNA DE UNA TABLA
-- primero creamos la tabla
CREATE TABLE order_details(
    order_id SERIAL,
    item_id INT NOT NULL,
    item_text VARCHAR NOT NULL,
    price DEC(10,2) NOT NULL,
    PRIMARY KEY(order_id, item_id)
);

-- para listar todas las secuencias usamos la siguiente query (consulta)
SELECT
    relname sequence_name
FROM 
    pg_class 
WHERE 
    relkind = 'S';

-- luego creamos la secuencia
create sequence order_item_id
start 10
increment 10
minvalue 10
OWNED by order_details.item_id;

-- y por ultimo, insertmos valores en la tabla
INSERT INTO 
    order_details(order_id, item_id, item_text, price)
VALUES
    (100, nextval('order_item_id'),'DVD Player',100),
    (100, nextval('order_item_id'),'Android TV',550),
    (100, nextval('order_item_id'),'Speaker',250);
-- en esta se uso nextval() para obtener el siguiente valor de la secuencia order_item_id
-- hacemos la consulta de la tabla
SELECT
    order_id,
    item_id,
    item_text,
    price
FROM
    order_details;        

INSERT INTO 
    order_details(order_id, item_id, item_text, price)
VALUES
    (default, nextval('order_item_id'),'DVD Player',100);

-- si la secuencia esta asociada con la columna de una tabla
-- esta sera eliminada automaticamente, si la columna o tabla
-- es eliminada
-- tambien se puede eliminar manualmente usando
-- la declaracion DROP SEQUENCE
DROP SEQUENCE [ IF EXISTS ] sequence_name [, ...] 
[ CASCADE | RESTRICT ];
-- primero se especifica la secuencia que quieres eliminar.
-- luego if exists condicionalmente elimina la secuencia si existe
-- luego se especifica la opcion CASCADE o RESTRICT si quieres eliminar
-- recursivamente los objetos que dependen de la secuencia y los objetos
-- que dependen del objeto que depende de la secuencia o el objeto dependiente
-- y asi sucesivamente

drop table order_details;
-- ya que esta tabla tiene la columna item_id que esta asociada a la secuancia
-- order_item_id, esta secuencia tambien sera eliminada automaticamente
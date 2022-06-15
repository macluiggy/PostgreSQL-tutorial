-- la declaracion INSERT tiene la siguiente estructura:
INSERT INTO
  table_name (column1, column2, column3)
VALUES
  (value1, value2, value3);

-- esta retorna de la siguiente manera:
INSERT
  oid count;

-- count es el numero de filas insertadas
-- si se quiere que se devuelva la tabla insertada, se debe usar RETURNING;
-- ejemplo:
INSERT INTO
  table_name (column1, column2, column3)
VALUES
  (value1, value2, value3) RETURNING *;

-- se usa * para retornar todas las columnas de la tabla insertada
-- pero si se quiere retornar una sola columna, se debe usar el nombre de la columna
-- ejemplo:
INSERT INTO
  table_name (column1, column2, column3)
VALUES
  (value1, value2, value3) RETURNING column1;

-- tambien se puede retornar la(s) columna(s) insertada(s) con un alias
-- ejemplo:
INSERT INTO
  table_name (column1, column2, column3)
VALUES
  (value1, value2, value3) RETURNING column1 AS col1;

DROP TABLE IF EXISTS links;

CREATE TABLE links (
  id SERIAL PRIMARY KEY,
  url VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL,
  description VARCHAR (255),
  last_update DATE
);

INSERT INTO
  links (url, name   )
VALUES
  (
    'https://www.postgresqltutorial.com',
    'PostgreSQL Tutorial'
  );

-- para poder insertar strings que contengan una comilla simple, se debe usar doble comilla simple para escapar el caracter
INSERT INTO links (url, name)
VALUES('http://www.oreilly.com','O''Reilly Media');

-- para insertar un dato con el tipo fecha, se debe ingresar con el formato yyyy-mm-dd
INSERT INTO links (url, name, last_update)
VALUES('https://www.google.com','Google')

-- para insertar y que devuelva el ultimo id insertado, se debe usar RETURNING con el nombre de la columna del id

INSERT INTO links (url, name)
VALUES('http://www.postgresql.org','PostgreSQL')
RETURNING id;
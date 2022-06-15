-- esta tiene una sintaxis similar a como se importa un archivo csv en postgresql
-- la sintaxis es:
COPY table_name TO '/path/to/file.csv' DELIMITER ',' CSV HEADER;

-- si solo se quiere exportar ciertas columnas de la tabla, se puede usar la sintaxis:
COPY table_name(column1, column2, column3) TO '/path/to/file.csv' DELIMITER ',' CSV HEADER;
-- recuerda que CSV HEADER es para indicar que la primera linea o fila es la cabecera

-- exportamos la tabla persons a un archivo csv
\ COPY persons TO 
'/home/luiggy/PROGRAMMING/POSTGRESQL/PostgreSQL tutorial/section 11/persons_db.csv' 
DELIMITER ',' CSV HEADER;

\ copy (
  SELECT
    *
  FROM
    persons
) to 
'/home/luiggy/PROGRAMMING/POSTGRESQL/PostgreSQL tutorial/section 11/persons_db.csv' 
with csv HEADER;
-- SINTAXIS ALTERNATIVA


-- tambien se puede exportar sin incluir la cabecera, pero si se quiere importar
-- ese archivo en una tabla, no se debe incluir la cabecera ya que tomaria 
--valores de columnas de la primera fila como cabecera
\ COPY persons TO 
'/home/luiggy/PROGRAMMING/POSTGRESQL/PostgreSQL tutorial/section 11/persons_db.csv'
DELIMITER ',';

-- si no se quiere exportar y solo se quiere algunas columnas de la tabla, se puede usar la sintaxis:
\ COPY persons(first_name, last_name) TO 
'/home/luiggy/PROGRAMMING/POSTGRESQL/PostgreSQL tutorial/section 11/persons_db.csv' 
DELIMITER ',' CSV HEADER;

-- supongamos que queremos exportar el email de la tabla persons sin incluir la cabecera
\ COPY persons(email) TO 
'/home/luiggy/PROGRAMMING/POSTGRESQL/PostgreSQL tutorial/section 11/persons_email_db.csv' 
DELIMITER ',';


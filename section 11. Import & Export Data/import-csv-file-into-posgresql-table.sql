-- importar archivos csv permite insertar datos en una tabla de postgresql
-- su sintaxis es:
COPY sample_table_name
FROM 'C:\sampledb\sample_data.csv' 
DELIMITER ',' 
CSV HEADER;

CREATE TABLE persons (
  id SERIAL,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  dob DATE,
  email VARCHAR(255),
  PRIMARY KEY (id)
)

COPY persons(first_name, last_name, dob, email)
FROM 'C:\sampledb\persons.csv'
DELIMITER ',' -- ya que se esta usando el formato csv se nesera el delimitador ','
CSV HEADER; -- y tambien las clausulas CSV, HEADER es para indicar que la primera linea es la cabecera
-- Si el archivo csv tiene todas las columnas de la tabla, no es necesario especificar las columnas explicitamente

COPY persons(first_name, last_name, dob, email) from '/home/luiggy/PROGRAMMING/POSTGRESQL/PostgreSQL tutorial/section 11/persons.csv' DELIMITER ',' CSV HEADER;
-- esto es como poner
INSERT INTO persons (first_name, last_name, dob, email)
VALUES
 ('John', 'Doe', '1995-01-05', 'john.doe@postgresqltutorial.com'),
 ('Jane', 'Doe', '1990-02-05', 'jane.doe@postgresqltutorial.com');
  
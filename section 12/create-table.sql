-- la sintaxis basica es:
CREATE TABLE [IF NOT EXISTS] table_name (
   column1 datatype(length) column_contraint,
   column2 datatype(length) column_contraint,
   column3 datatype(length) column_contraint,
   table_constraints
);

/**
  * primero se especifica el nombre de la tabla luego de create table
  * luego se dice si la tabla ya existe o no
  esta es para evitar que postgres mande error, ya que si la tabla ya existe
  postgres no crea la tabla y manda error
  pero si se pone IF NOT EXISTS, postgres no crea la tabla y no manda error
  en su lugar solo manda un warning
  * luego se especifica el tipo de dato de cada columna
  este consta del nombre de la columna, del tipo de dato, de su longitud y de las restricciones
  las restricciones son las reglas que se aplican a los datos de la columna
  por ejemplo, el constraint not null indica que la columna no puede ser nula
  * por ultimo se especifican las restricciones de la tabla
*/

CREATE TABLE  if not exists accounts2(
	user_id serial PRIMARY KEY,
	username VARCHAR ( 50 ) UNIQUE NOT NULL,
	password VARCHAR ( 50 ) NOT NULL,
	email VARCHAR ( 255 ) UNIQUE NOT NULL,
	created_on TIMESTAMP NOT NULL,
        last_login TIMESTAMP 
);

CREATE TABLE roles(
   role_id serial PRIMARY KEY,
   role_name VARCHAR (255) UNIQUE NOT NULL
);

CREATE TABLE account_roles (
  user_id INT NOT NULL,
  role_id INT NOT NULL,
  grant_date TIMESTAMP,
  PRIMARY KEY (user_id, role_id), -- ya que tiene dos primary keys, se pone como si fueran dos columnas de una tabla
  FOREIGN KEY (role_id)
      REFERENCES roles (role_id),
  FOREIGN KEY (user_id)
      REFERENCES accounts2 (user_id)
);
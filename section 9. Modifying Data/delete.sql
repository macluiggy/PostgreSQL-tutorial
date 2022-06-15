-- la clausula DELETE sirve para eliminar filas de una tabla
-- para eliminar una o varias filas que cumplan una condicion, se usa la clausula WHERE
-- si no se especifica ninguna condicion, se eliminan todas las filas de la tabla
-- la sintaxis es:
DELETE FROM table_name
WHERE condition
RETURNING (select_list | *)

DROP TABLE IF EXISTS links;

CREATE TABLE links (
    id serial PRIMARY KEY,
    url varchar(255) NOT NULL,
    name varchar(255) NOT NULL,
    description varchar(255),
    rel varchar(10),
    last_update date DEFAULT now()
);

INSERT INTO  
   links 
VALUES 
   ('1', 'https://www.postgresqltutorial.com', 'PostgreSQL Tutorial', 'Learn PostgreSQL fast and easy', 'follow', '2013-06-02'),
   ('2', 'http://www.oreilly.com', 'O''Reilly Media', 'O''Reilly Media', 'nofollow', '2013-06-02'),
   ('3', 'http://www.google.com', 'Google', 'Google', 'nofollow', '2013-06-02'),
   ('4', 'http://www.yahoo.com', 'Yahoo', 'Yahoo', 'nofollow', '2013-06-02'),
   ('5', 'http://www.bing.com', 'Bing', 'Bing', 'nofollow', '2013-06-02'),
   ('6', 'http://www.facebook.com', 'Facebook', 'Facebook', 'nofollow', '2013-06-01'),
   ('7', 'https://www.tumblr.com/', 'Tumblr', 'Tumblr', 'nofollow', '2013-06-02'),
   ('8', 'http://www.postgresql.org', 'PostgreSQL', 'PostgreSQL', 'nofollow', '2013-06-02');

SELECT * FROM links;

DELETE FROM links
WHERE id = 8;

DELETE 1

DELETE FROM links
WHERE id = 10;

DELETE 0

-- se pueden retornar los registros eliminados usando la clausula RETURNING (* | column_name)
DELETE FROM links
WHERE id = 7
RETURNING *;

-- borra las filas que sean igual a los de la lista:
DELETE FROM links
WHERE id IN (6,5)
RETURNING *;

-- borra todas las filas de la tabla:
DELETE FROM links;
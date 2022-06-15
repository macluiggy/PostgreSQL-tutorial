-- sintaxis:
UPDATE
  table_name
SET
  column1 = value1,
  column2 = value2,
...
WHERE
  condition;

-- where es opcional, si se omite, todas las filas se actualizan
-- al actualizar de manera exitosa, se devuelve:
UPDATE count

-- para actualizar y devolver las filas actualizadas 
UPDATE
  table_name
SET
  column1 = value1,
  column2 = value2,
...
WHERE
  condition RETURNING * | output_expression AS output_name;

DROP TABLE IF EXISTS courses;

CREATE TABLE courses(
  course_id serial primary key,
  course_name VARCHAR(255) NOT NULL,
  description VARCHAR(500),
  published_date date
);

INSERT INTO
  courses(course_name, description, published_date)
VALUES
  (
    'PostgreSQL for Developers',
    'A complete PostgreSQL for Developers',
    '2020-07-13'
  ),
  (
    'PostgreSQL Admininstration',
    'A PostgreSQL Guide for DBA',
    NULL
  ),
  ('PostgreSQL High Performance', NULL, NULL),
  (
    'PostgreSQL Bootcamp',
    'Learn PostgreSQL via Bootcamp',
    '2013-07-11'
  ),
  (
    'Mastering PostgreSQL',
    'Mastering PostgreSQL in 21 Days',
    '2012-06-30'
  );

UPDATE courses set published_date = '2020-08-01' where course_id = 3;
update courses set published_date = '2020-07-01' where course_id = 2 RETURNINg *;
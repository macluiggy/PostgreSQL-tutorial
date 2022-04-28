-- las consultas recursivas (recursive queries) son una forma de hacer una consulta que se repite una cantidad indefinida de veces, hasta que la tabla recursiva no devuelva ninguna fila.
-- esta tiene 3 elementos
/*
1. el termino no recursivo, esta es la tabla del primer select del cte
2. el termino recursivo, esta es la tabla del segundo select del cte donde se hace la consulta. esta se une con el termino no recursivo usando la clausula union o union all
3. verificacion de terminacion, esta es la tabla que no devuelve ninguna fila, esta sirve para indicar que la consulta termino.

esto se ejecuta en la siguiente secuencia:
1. ejecuta el termino no recursivo para crear el resultado base (R0)
2. ejecuta el termino recursivo con Ri como input y Ri+1 como output
3. repite el paso 2 hasta que el termino recursivo no devuelva ninguna fila
4. retorna el resultado final que es una UNION o UNION ALL de los resultados de los pasos 2 R0, R1, ..., Rn
*/

CREATE TABLE employees2 (
	employee_id serial PRIMARY KEY,
	full_name VARCHAR NOT NULL,
	manager_id INT
);

INSERT INTO employees2 (
	employee_id,
	full_name,
	manager_id
)
VALUES
	(1, 'Michael North', NULL),
	(2, 'Megan Berry', 1),
	(3, 'Sarah Berry', 1),
	(4, 'Zoe Black', 1),
	(5, 'Tim James', 1),
	(6, 'Bella Tucker', 2),
	(7, 'Ryan Metcalfe', 2),
	(8, 'Max Mills', 2),
	(9, 'Benjamin Glover', 2),
	(10, 'Carolyn Henderson', 3),
	(11, 'Nicola Kelly', 3),
	(12, 'Alexandra Climo', 3),
	(13, 'Dominic King', 3),
	(14, 'Leonard Gray', 4),
	(15, 'Eric Rampling', 4),
	(16, 'Piers Paige', 7),
	(17, 'Ryan Henderson', 7),
	(18, 'Frank Tucker', 8),
	(19, 'Nathan Ferguson', 8),
	(20, 'Kevin Rampling', 8);

SELECT employee_id, manager_id, full_name FROM employees2 WHERE employee_id = 2;

-- WITH RECURSIVE subordinates AS ( SELECT employee_id, manager_id, full_name FROM employees2 WHERE employee_id = 2 UNION SELECT e.employee_id, e.manager_id, e.full_name FROM employees2 e INNER JOIN subordinates s ON s.employee_id = e.manager_id
-- ) SELECT
-- 	*
-- FROM
-- 	subordinates;

WITH RECURSIVE subordinates AS (
  -- inicio termino no recursivo
	SELECT
		employee_id,
		manager_id,
		full_name
	FROM
		employees
	WHERE
		employee_id = 2
  -- fin termino no recursivo
	UNION
  -- inicio termino recursivo
		SELECT
			e.employee_id,
			e.manager_id,
			e.full_name
		FROM
			employees e
		INNER JOIN subordinates s ON s.employee_id = e.manager_id
    -- fin termino recursivo
) SELECT
	*
FROM
	subordinates;
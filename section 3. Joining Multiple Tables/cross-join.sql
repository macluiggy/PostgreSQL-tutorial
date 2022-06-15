DROP TABLE IF EXISTS T1;
CREATE TABLE T1 (label CHAR(1) PRIMARY KEY);

DROP TABLE IF EXISTS T2;
CREATE TABLE T2 (score INT PRIMARY KEY);

INSERT INTO T1 (label)
VALUES ('A'), ('B');

INSERT INTO T2 (score)
VALUES (1), (2), (3);

select * from T1 cross join T2;

-- basicamente lo que hace cross join es una union de las tablas
-- si una tabla tiene n filas y otra tiene m filas
-- entonces el resultado de cross join es una tabla con n*m filas
/*
esto quiere decir que para cada fila de la tabla T1 se crea una fila con todas las filas de la tabla T2, dicho de otra forma cada valor de la filas de la tabla T1 se repite tantas veces como filas de la tabla T2 tenga
ejemplo:
T1 tiene los valores de la columna X: x1, x2, x3
T2 tiene los valores de la columna Y: y1, y2, y3
entonces el valor de para x1 va a taner x1, y1, x1, y2, x1, y3
el valor de para x2 va a taner x2, y1, x2, y2, x2, y3
y asi sucesivamente
*/
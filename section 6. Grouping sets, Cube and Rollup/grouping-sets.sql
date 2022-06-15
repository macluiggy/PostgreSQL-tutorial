DROP TABLE IF EXISTS sales;
CREATE TABLE sales (
    brand VARCHAR NOT NULL,
    segment VARCHAR NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (brand, segment)
);

INSERT INTO sales (brand, segment, quantity)
VALUES
    ('ABC', 'Premium', 100),
    ('ABC', 'Basic', 200),
    ('XYZ', 'Premium', 100),
    ('XYZ', 'Basic', 300);

-- grouping sets son la como group by solo que este agrupa por mas de una columna, osea que por ejemplo, tenemos la columna: col1 y col2, para los valores de col1 = x y col2 = y, solo se agruparan filas que contengan ambas columnas con los valores x y, por ejemplo, para nombre y apellido, solo para personas con nombre y apellido alberto gomez por ejemplo se agruparan y se hara un aggregate con valores de las filas que tengan ambas columnas con los valores alberto y gomez

select brand, segment, sum(quantity) as total_quantity from sales group by brand, segment;
select brand, segment, sum(quantity) as total_quantity from sales group by grouping sets (brand, segment);

select brand, sum(quantity) from sales group by brand;
select segment, sum(quantity) from sales group by segment;
select brand, null, sum(quantity) from sales group by brand; -- null es solo para que segment no se toma en cuanta, la tabla es la misma sin el null solo que no se muestra esa columna ?column?
select null, segment, sum(quantity) from sales group by segment;
select sum(quantity) from sales group by sales;
select null, null, sum(quantity) from sales group by sales;
select null, null, sum(quantity) from sales; -- aqui null juega el mismo papel que los null anteriores, pero en este caso son tanto para segment como para brand, solo es para representar las columnas de la tabla, asi que la tabla es la misma sin ninguna columna null, solo que no estarian esas columnas obviamente


select brand, sum(quantity) as total_quantity from sales group by brand;
select segment, sum(quantity) as total_quantity from sales group by segment;
select sum(quantity) as total_quantity from sales group by sales;

SELECT
    brand,
    segment,
    SUM (quantity)
FROM
    sales
GROUP BY
    brand,
    segment

UNION ALL

SELECT
    brand,
    NULL,
    SUM (quantity)
FROM
    sales
GROUP BY
    brand

UNION ALL

SELECT
    NULL,
    segment,
    SUM (quantity)
FROM
    sales
GROUP BY
    segment

UNION ALL

SELECT
    NULL,
    NULL,
    SUM (quantity)
FROM
    sales;

-- lo anterios se puede simplificar con la clausula grouping sets

SELECT
    c1,
    c2,
    aggregate_function(c3)
FROM
    table_name
GROUP BY
    GROUPING SETS (
        (c1, c2),
        (c1),
        (c2),
        ()
);

-- esto simplifica el ejemplo anterior, en la parte de grouping set ( (ci, c2) ) es como decir
-- select c1, c2, sum(c3) from table_name group by c1, c2;
-- la parte de (c1) es como decir
-- select c1, null, sum(c3) from table_name group by c1;
-- la parte de (c2) es como decir
-- select null, c2, sum(c3) from table_name group by c2;
-- la parte de () es como decir
-- select null, null, sum(c3) from table_name;

-- entonces el grouping set es la union de groups by, pero de manera simplificada sin usar unions all

select brand, segment, sum(quantity) as total_quantity from sales group by grouping sets (
    (brand, segment),
    (brand),
    (segment),
    ()
);

-- usango la funcion grouping se puede saber si el argumeto es un miembro del grouping set actual y 1 si no lo es

SELECT
	GROUPING(brand) grouping_brand,
	GROUPING(segment) grouping_segment,
	brand,
	segment,
	SUM (quantity)
FROM
	sales
GROUP BY
	GROUPING SETS (
		(brand),
		(segment),
		()
	)
ORDER BY
	brand,
	segment;

-- loas dos primeras filas del ejemplo anterior tendran 0 en grouping_brand y 1 en grouping_segment ya que en grouping sets se empieza por brand eso quiere decir que grouping brand es 0 de primero
-- esto es para decir que el primer select es este
-- select brand, null, sum(quantity) from sales group by brand;
-- el segundo select es este
-- select null, segment, sum(quantity) from sales group by segment;
-- y el tercero es este
-- select null, null, sum(quantity) from sales;

-- se puede usar la funcion grouping con having para encontrar el subtotal de cada brand, de esta forma

SELECT
	GROUPING(brand) grouping_brand,
	GROUPING(segment) grouping_segment,
	brand,
	segment,
	SUM (quantity)
FROM
	sales
GROUP BY
	GROUPING SETS (
		(brand),
		(segment),
		()
	)
HAVING GROUPING(brand) = 0	
ORDER BY
	brand,
	segment;

-- esto solo devuelve las filas donde brand sea el argumento actual de grouping sets

SELECT
    brand,
    segment,
    SUM (quantity)
FROM
    sales
GROUP BY
    GROUPING SETS (
        (brand, segment),
        brand,
        segment,
        ()
    );
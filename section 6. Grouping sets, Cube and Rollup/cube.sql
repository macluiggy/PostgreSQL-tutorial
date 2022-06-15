-- la clusula cube es equivalente a usar grouping sets, pero con una union de todos los grupos by, o sea este usa todos los posibles grouping sets para n columnas
-- entonces
select c1, c2, aggregate_function(c3) from table_name group by grouping sets ((c1, c2), (c1), (c2), ());
-- es equivalente a
select c1, c2, aggregate_function(c3) from table_name group by cube(c1, c2);
-- en general, si el numero de columnas es n entinces tendras 2^n combinaciones de grouping sets

SELECT
    brand,
    segment,
    SUM (quantity)
FROM
    sales
GROUP BY
    CUBE (brand, segment)
ORDER BY
    brand,
    segment;

-- tambien se puede usar cube de forma parcial, osea no usando todas las columnas de select, y las que no se usan se ponen antes de la clausula cube

SELECT
    brand,
    segment,
    SUM (quantity)
FROM
    sales
GROUP BY
    brand,
    CUBE (segment)
ORDER BY
    brand,
    segment;

-- seria lo mismo a 
SELECT
    brand,
    segment,
    SUM (quantity)
FROM
    sales
GROUP BY
    grouping sets (
      (brand, segment),
      (brand)
    )
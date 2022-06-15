-- este es otro grouping sets, pero este a diferencia de cube, no genera todas las posibles combinaciones, esta solo devuelve las conbinaciones en base a su gerarquia
-- por ejemplo si tenemos c1, c2 en ese order, rollup devulve:
/*
(
  (c1), (c2)
  (c1),
  ()
)
*/

SELECT
    c1,
    c2,
    c3,
    aggregate(c4)
FROM
    table_name
GROUP BY
    ROLLUP (c1, c2, c3);

-- esto es equivalente a:

SELECT
    c1,
    c2,
    c3,
    aggregate(c4)
FROM
    table_name
GROUP BY
    grouping sets (
      (c1, c2, c3),
      (c1, c2),
      (c1),
      ()
    );

-- o de manera parcial 

SELECT
    c1,
    c2,
    c3,
    aggregate(c4)
FROM
    table_name
GROUP BY
    c1, 
    ROLLUP (c2, c3);


-- esquivalente a:
SELECT
    c1,
    c2,
    c3,
    aggregate(c4)
FROM
    table_name
GROUP BY
    grouping sets(
      (c1, c2, c3),
      (c1, c2),
      (c1)
    )


SELECT
    brand,
    segment,
    SUM (quantity)
FROM
    sales
GROUP BY
    ROLLUP (brand, segment)
ORDER BY
    brand,
    segment;

SELECT
    segment,
    brand,
    SUM (quantity)
FROM
    sales
GROUP BY
    ROLLUP (segment, brand)
ORDER BY
    segment,
    brand;

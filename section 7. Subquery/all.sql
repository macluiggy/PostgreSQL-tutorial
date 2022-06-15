-- el operador ALL es similar a ANY solo que en este caso todos los elementos de la subquery deben cumplir la condicion
-- este operador al igual que ANY debe estar precedido por los operadores de comparacion como =, <, >, <=, >=, <>
-- supongamos que tenemos la columna x, si queremos saber si x es diferente que todos los valoes de la subconsulta seria asi
select x from t where x <> all(select y from t2);
-- entonces si tenemos que los valores de la columna x son: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 y la subconsulta es: 1, 2, 3, 4, 5, 6, 7
-- entonces la tabla resultante seria para x = 8, 9 y 10

SELECT
    ROUND(AVG(length), 2) avg_length
FROM
    film
GROUP BY
    rating
ORDER BY
    avg_length DESC;


select
film_id,
title,
LENGTH
from film
where length > all(
    select
    round(avg(length), 2) avg_length
    from film
    group by rating
    order by avg_length desc
)
order by length ;
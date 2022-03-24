-- el operador ANY sirve para comparar un valor escalar con una lista de valores devueltos por una subconsulta
/*
  * la subconsulta debe retornar exactamente una columna
  * el operador ANY debe estar precedido por los operadores de comparacion como =, <, >, <=, >=, <>
  * el operador ANY retorna true si alguno de los valores de la subconsulta cumple la condicion

  SOME es sinonimo de ANY
*/

SELECT
    MAX( length )
FROM
    film
INNER JOIN film_category
        USING(film_id)
GROUP BY
    category_id;
-- puedes usar esta consulta como una subconsulta para encontrar las peliculas cuyos lengths sin mayores o iguales a el maximo length de cualquier pelicula

select title
from film
where length >= any(
    select MAX( length )
    from film
    inner join film_category
        using(film_id)
    group by category_id
);

-- el operador = ANY es equivalente a IN

SELECT
    title,
    category_id
FROM
    film
INNER JOIN film_category
        USING(film_id)
WHERE
    category_id = ANY(
        SELECT
            category_id
        FROM
            category
        WHERE
            NAME = 'Action'
            OR NAME = 'Drama'
    );
-- esto se puede expresar con in
SELECT
    title,
    category_id
FROM
    film
INNER JOIN film_category
        USING(film_id)
WHERE
    category_id IN(
        SELECT
            category_id
        FROM
            category
        WHERE
            NAME = 'Action'
            OR NAME = 'Drama'
    );

-- Note that the <> ANY operator is different from NOT IN. The following expression:

x <> ANY (a,b,c) 
-- is equivalent to

x <> a OR <> b OR x <> c
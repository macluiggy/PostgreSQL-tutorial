-- esta crea una nueva tabla proveniente del select into
-- la sintaxis es:
SELECT
    select_list
INTO [ TEMPORARY | TEMP | UNLOGGED ] [ TABLE ] new_table_name
FROM
    table_name
WHERE
    search_condition;
-- esta tabla no es devuelta al cliente
-- TEMP or TEMPORARY es opcional e indica que la tabla es temporal
-- si UNLOGGED esta disponible, va a hacer la tabla como una tabla no registrada
-- WHERE es para indicar que filas se van a insertar en la nueva tabla
-- tambien puedes utilizar otras clausulas de select como INNER JOIN, LEFT JOIN, GROUP BY, HAVING, ORDER BY, etc

-- Lo siguiente crea la tabla rental_r que tiene peliculas con clasificacion R
-- y la duracion de renta es de 5 dias
SELECT
    film_id,
    title,
    rental_rate
INTO TABLE film_r
FROM
    film
WHERE
    rating = 'R'
AND rental_duration = 5
ORDER BY
    title;

-- crea una tabla llamada short_film que su length sea menor que 60 minutos
SELECT
    film_id,
    title,
    length 
INTO TEMP TABLE short_film
FROM
    film
WHERE
    length < 60
ORDER BY
    title;
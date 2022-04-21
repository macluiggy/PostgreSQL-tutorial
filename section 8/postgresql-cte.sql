-- postgresql cte (common table expressions) sirve para tener una tabla temporal que luego se puede usar en una consulta
-- su sintaxis es la siguiente:
WITH cte_name (column_list) AS (
    CTE_query_definition 
)
statement;
-- se especifica el nombre de la cte y la lista de columnas que tendra
-- si no se da el valor de column_list, esta sera igual a CTE_query_definition
-- esto devuelve una tabla que se puede usar con los statements SELECT, INSERT, UPDATE, DELETE

-- ejemplo
WITH cte_film AS (
    SELECT 
        film_id, 
        title,
        (CASE 
            WHEN length < 30 THEN 'Short'
            WHEN length < 90 THEN 'Medium'
            ELSE 'Long'
        END) length    
    FROM
        film
)
SELECT
    film_id,
    title,
    length
FROM 
    cte_film
WHERE
    length = 'Long'
ORDER BY 
    title; 


WITH cte_rental AS (
    SELECT staff_id,
        COUNT(rental_id) rental_count
    FROM   rental
    GROUP  BY staff_id
)
SELECT s.staff_id,
    first_name,
    last_name,
    rental_count
FROM staff s
    INNER JOIN cte_rental USING (staff_id); 
-- la clausula except al igual que la clusula union e intersect, tienen que tener la misma estructura, es decir, tener la misma cantidad de columnas, con el mismo nombre, orden y tipo de datos.
-- la diferencia es que esta clausula retorna las filas de la primera consulta que no aparece en los resultados de la segunda consulta. es decir que solo devulve las filas que estan en la primera consulta y si una fila se repite con las filas de la segunda consulta, ese resultado no se incluye, en otras palabras, solo devulve filas exclusivas de la primera consulta.
select * from top_rated_films except select * from most_popular_films;
select * from top_rated_films except select * from most_popular_films order by title;
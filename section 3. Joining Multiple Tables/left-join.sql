-- para devolver filas donde las filas de la tabla izquierda corresponden cero o mas de las filas de la tabla derecha y donde las filas de la tabla derecha corresponde solo y solo una fila de la tabla izquierda se usa la clausula left join
select c.customer_id, firsT_name, payment_date from payment p left join customer c using (customer_id) order by customer_id nulls first;
select c.customer_id, firsT_name, payment_date from payment p left outer join customer c using (customer_id) order by customer_id nulls first;

-- el siguiente ilustra la sintaxis para unir la tabla A con la tabla B usando la clausula left join
select pka, c1, pkb, c2 from A left join B on pka = fka;

select film.film_id, title, inventory_id from film left join inventory on film.film_id = inventory.film_id;
select film.film_id, title, inventory_id from film left join inventory on film.film_id = inventory.film_id order by title;
select film.film_id, title, inventory_id from film left join inventory on film.film_id = inventory.film_id order by title offset 70;
select film.film_id, title, inventory_id from film left join inventory on film.film_id = inventory.film_id where inventory.film_id is null order by title;
select  f.film_id, title, inventory_id from film f left join inventory i on  f.film_id =  i.film_id where  i.film_id is null order by title;
select  f.film_id, title, inventory_id, i.film_id from film f left join inventory i on  f.film_id =  i.film_id where  i.film_id is null order by title;
select  f.film_id, title, inventory_id, i.film_id from film f left join inventory i using(film_id) where  i.film_id is null order by title;

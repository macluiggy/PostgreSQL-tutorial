-- sudo -u postgres pg_restore -U postgres -d database_name /path/to/database_data.tar
select col1 || ' ' || col2 from table;
-- \dt table_name;
select col1 || ' ' || col2 AS col1_col2 from table;
select col1 as "col 1" from table;
select col1, col2 from table order by col1;
select col1, col2 from table order by col1 desc, col2 asc;
select col1, length(col1) len from table order by len desc;
select col1, length(col1) len from table order by len desc null last;

select col1, length(col1) len from table order by len desc null last;
select col1, col2 from table order by  col1 asc/desc, col2 asc/desc;
-- select first_name, last_name from customer order by      first_name asc, last_name asc;
select col1 from table_name order by col1 asc/desc nulls last/first;
select col1 as 'col 1' from table_name;
select col1, col2 from table_name order by col1 asc/desc, col2 asc/desc;
select distinct col1 from table_name;
select distinct col1, col2 from table_name;
select distinct on (col1) col1, col2 from table_name;

select distinct col1, col2 from table_name;
select distinct on (col1) col1, col2 from table_name;
create user user_name with password 'password';
select distinct on (col1) col1 from table_name;
select first_name from customer where first_name like '%a%' or first_name like '%e%';
select first_name from customer where first_name like '%a%' and first_name like '%e%';
select first_name from customer where first_name in ('Ann', 'Smith', 'c');
select first_name from customer where first_name = 'Ann' or first_name = 'Smith';
select first_name from customer where first_name like 'Ann%';
select first_name from customer where first_name between 'cynthiA' and 'dAve' order by first_name;
select first_name, length(first_name) namex from customer where length(first_name) between 2.0001+0.9999 and 3 order by namex desc;
select first_name from customer where first_name <> 'Ann';
select first_name from customer where first_name != 'Annie';
-- select first_name from customer where length(first_name) between 2 and 5;

select col1 as "col 1" from table_name;
select first_name "first name" from customer; -- as is optional
select first_name, last_name from customer where first_name like 'Ann%' or last_name like 'El%';
select first_name from customer where first_name = 'Annie' and last_name = 'Russell';
select 1000*22222 as "million";
\d customer
select first_name, length(last_name) ln_len from customer where length(last_name) between 2 and 5 order       by ln_len desc;
select first_name from customer where first_name in ('Ann', 'Annie', 'c');
select first_name from customer where last_name like 'An%'; 
select first_name from customer where last_name != 'An%';
select first_name from customer where last_name <> 'An%';
select first_name || ' ' || last_name as full_name from customer where first_name like 'Ann%';
select first_name, last_name from customer;
insert into customer (first_name, last_name) values ('Ann', 'Smith');
sudo -u postgres pg_restore -U postgres -d database_name /path/to/database_data.tar;
select first_name, last_name from customer order by first_name asc, last_name asc;
select first_name || ' ' || last_name as full_name from customer order by first_name asc, last_name asc;
select first_name, last_name from customer order by first_name asc, last_name asc;
select first_name from customer order by first_name desc nulls last ;
select distinct on (last_name) last_name from customer;
select first_name, length(first_name) len from customer order by len desc nulls last;

create database database_name;
\dt
select col1 from table_name order by col1 limit 5;
select first_name from customer order by first_name offset 5 limit 5;
select first_name from customer order by first_name limit 5 offset 5;
select first_name from customer order by first_name fetch next 5 rows only    ;
select first_name from customer order by first_name fetch first 5 row only    ;
select first_name from customer order by first_name offset 5 fetch first 5 row only;
select first_name from customer order by first_name fetch first 5 row only offset 5;

select first_name from customer order by first_name limit 5;
select first_name from customer limit 5 order by first_name; -- el orden importa, limit tiene que ir despues de order by
select first_name from customer fetch first 5 row only;
select first_name from customer fetch next 5 rows only;
select first_name from customer fetch first 5 rows only;
select first_name from customer fetch next 5 rows only;
select first_name from customer fetch next 5 rows only offset 5;
select first_name from customer offset 5 fetch next 5 rows only; -- offset puede ir antes o despues de fetch
create extension if not exists "extension_name";
create database database_name with owner user_name;
drop table table_name;
select first_name from customer where first_name in ('Ann', 'Annie', 'c');;
select first_name from customer limit 5 offset 5;
select first_name from customer offset 5 limit 5; -- offset puede ir antes o despues de limit

select first_name from customer where length(first_name) between 2 and 5;
select distinct first_name, last_name from customer;

select first_name from customer where first_name like 'Ann%';
select first_name from customer where length(first_name) between 2 and 5;
select first_name from customer order by first_name limit 5 offset 5;
select distinct on (last_name) last_name, first_name from customer;
select first_name from customer fetch first 5 rows only;
select first_name from customer order by length(first_name) desc nulls last;

select first_name from customer where first_name in ('Ann' , 'Annie');
select first_name || ' ' || last_name as full_name from customer where first_name like 'Ann%';
sudo -u Postgres pg_restore -U postgres -d database_name /path/to/database_data.tar;

select c.customer_id, firsT_name, payment_date from payment p inner join customer c on p.customer_id = c.customer_id;
select c.customer_id, firsT_name, payment_date from payment p left join customer c on p.customer_id = c.customer_id;
select * from customer where firsT_name is null;
select c.customer_id, firsT_name, payment_date from payment p full join customer c on p.customer_id = c.customer_id;
select a, fruit_a, b, fruit_b from basket_b full join basket_a on fruit_a = fruit_b;
select firsT_name, last_name from customer fetch first 5 rows only;
select firsT_name, last_name from customer fetch first 5 rows only offset 5;
select firsT_name, last_name from customer offset 5 fetch first 5 rows only; -- "fetch first 5 rows only" representa un solo comando, por lo que tiene que ir unido, offset puede ir antes o despues de ese comando
select firsT_name, last_name from customer where length(first_name) between 2 and 5;
select firsT_name, last_name from customer where length(first_name) not between 2 and 5;
select firsT_name, last_name from customer where length(first_name) not between 2 and 5;
select e.firsT_name from customer e;
select c.customer_id, firsT_name, payment_date from payment p inner join customer c using (customer_id);
select c.firsT_name customer_first_name, s.firsT_name staff_first_name, payment_date from customer c inner join payment p on c.customer_id = p.customer_id inner join staff s on s.staff_id = p.staff_id;
select c.firsT_name customer_first_name, s.firsT_name staff_first_name, payment_date from customer c inner join payment p using(customer_id) inner join staff s on s.staff_id = p.staff_id;
select c.firsT_name customer_first_name, s.firsT_name staff_first_name, payment_date from customer c inner join payment p using(customer_id) inner join staff s  using(staff_id);

select c.firsT_name, p.firsT_name p_firname from customer c inner join payment p on c.customer_id = p.customer_id;
select firsT_name from customer c;
select firsT_name from customer c inner join payment p using(customer_id);
select firsT_name from customer c ;
\dt
select c.firsT_name, c.last_name from customer c inner join payment p using(customer_id) inner join staff s using(staff_id);
insert into sosote (name, last) values ('Ann', 'Smith');
select firsT_name from customer offset 5 limit 5;

select f1.title, f2.title from film f1 inner join film f2 on f1.film_id <> f2.film_id and f1.length = f2.length;
select c1.firsT_name, c1.last_name from customer c1 inner join customer c2 on c1.last_name = c2.last_name limit 5;
select c1.firsT_name, c2.last_name from customer c1 inner join customer c2 on c1.last_name = c2.last_name limit 5;

select f1.title, f2.title, f2.length from film f1 inner join film f2 on f1.title <>f2.title and f1.length = f2.length;

-- select firsT_name, last_name from customer  c cross join payment p on c.customer_id = p.customer_id;
select firsT_name, last_name from customer cross join payment
select * from customer cross join paymenT;

select t1.firsT_name, t2.firsT_name from customer t1 inner join customer t2 on t1.last_name = t2.last_name and t1.customer_id <> t2.customer_id;
select firsT_name, payment_id from customer c natural join payment p;
select * from customer natural join payment;

select * from inventory;
select * from rental; 
select 



select * from customer full join payment using(customer_id);
select firsT_name from customer where last_name is null;
select firsT_name from customer where last_name is not null;
select firsT_name, last_name, payment_id from customer left join payment using(customer_id) order by last_name nulls first;
select t1.title, t2.title, t1.length from film t1 inner join film t2 on t1.title != t2.title and t1.length = t2.length;

select t1.title, t2.title, t1.length from film t1 inner join film t2 on t1.title != t2.title and t1.length = t1.length limit 5;
select t1.title, t2.title, t1.length from film t1 inner join film t2 on t1.title != t2.title and t1.length = t2.length limit 5;

select a.firsT_name, b.firsT_name from customer a inner join customer b on a.customer_id <> b.customer_id and a.last_name = b.last_name;
select firsT_name from customer order by firsT_name;

select firsT_name, last_name from customer cross join paymenT;
select * from customer natural join  paymenT;
select * from  paymenT natural join customer;

select firsT_name, last_name from customer fetch first 5 rows only;


alter user with superuser;
alter role user with superuser;


select firsT_name || ' ' || last_name from customer where first_name like 'Ann%';


select firsT_name, last_name from customer inner join payment using(customer_id) ;
select * from top_rated_films cross join most_popular_films;-- X


insert into database_name (column_name) values ('value');
sudo -U Postgres pg_restore -d database_name path/to/database_data.tar
select t1.title, t2.title from film t1 inner join film t2 on t1.title != t2.title and t1.length = t2.length;


select t1.title, t2.title from film t1 inner join film t2 on t1.title != t2.title and t1.length = t2.length limit 5;


select film_id, rental_rate from film where rental_rate > (select avg(rental_rate) from film);
select c1, c2 from t where c1 in (select c1 from t where c1 between 4 and 40);
select c1, c2 from t where x2 >= any(select max(x1) from t group by c1)
-- supongamos que queremos los valores maximos de x1 y x2 donde ambos son iguales, este query nos devolveria los valores de x1 y x2 que son iguales y al mismo tiempo maximos.
select c1, x1, x2 from t where x2 = any(select max(x1) from t group by c1);


select firsT_name, last_name from customer inner join payment using(customer_id);
select firsT_name, last_name from customer natural join payment;


select firsT_name, last_name from customer where firsT_name = last_name;


update comerciantes c
set c.altura = 'alto'
from persona p
where c.id = p.id;

update table1 set col1 = val1 from table2 where table1.col1 = table2.col1;
with t as (select * from table1) update t set col1 = val1 from table2 where table1.col1 = table2.col1;
update t1 set c1 = v1 where id = 2 on conflict (id) do nothing;
update t1 set c1 = v1 where id = 2
on conflict (id) do update set c1 = excluded.c1 || ' ' || t1.c1;
insert into table1 (col1, col2) values (v1, v2)
on conflict (id) do nothing;
insert into table1 (col1, col2) values (v1, v2)
on conflict (id) do update set col1 = excluded.col1 || ' ' || table1.col1;
insert into table1 (col1, col2) values (v1, v2)
on conflict table_column_key do nothing;
insert into table1 (col1, col2) values (v1, v2)
on conflict table_column_key do update set col1 = excluded.col1 || ' ' || table1.col1;
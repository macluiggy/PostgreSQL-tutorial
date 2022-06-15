select distinct first_name, last_name from customer cliente;
-- se puede usar un alias para nombrar tablas
select distinct first_name, last_name from customer as cliente;
-- luego se pueden referenciar las filas con la sintaxis: alias.column_name
select cliente.first_name from customer as cliente;

-- el usar alias y referenciar las columnas es muy comun en SQL cuando se usan joins
-- debido a que la columna de una taba x se puede llamar igual que la columna de la tabla y
select c.customer_id, first_name,  amount, payment_date from customer c inner join payment p on c.customer_id = p.customer_id;
select c.customer_id, first_name,  amount, payment_date from customer c inner join payment p on c.customer_id = p.customer_id order by payment_date desc;
-- lo que dice el comando anterior es:
-- renombra la columna customer a c y de ella traeme la columna customer_id y first_name y de la tabla payment renombrada como p, traeme el amount y payment_date donde customer_id de c sea igual a customer_id de p

select * from payment limit 5;
select * from customer limit 5;

-- si quieres devolver una tabla relacionada donde los valores de una columna "x" coincidan con los de otra columna "y" de la misma tabla usando joins, se debe usar un alias, ya que referencias a la misma tabla no son permitidas
select e.first_name employee, m .first_name manager from employee e inner join employee m on e.manager_id = m.employee_id;
-- INSERT into customer (first_name, last_name) VALUES ('Juan', 'Perez');
select first_name, last_name from customer where first_name = last_name;

create table sosote (
  name varchar(100) not null,
  last varchar(100) not null
);
INSERT into sosote (name, last) VALUES ('sosote', 'sosote');
INSERT into sosote (name, last) VALUES ('sosote', 'rocafuerte');
select * from sosote;
select name, last from sosote  inner join sosote  on name = last; -- ERROR:  table name "sosote" specified more than once
-- para evitarlo
select x.name, -- para evitarlo
select y.last, x.first from sosote x inner join sosote y on x.name = y.last;
select x.last from sosote x inner join sosote y on x.name = y.last;
select y.last from sosote x inner join sosote y on x.name = y.last;
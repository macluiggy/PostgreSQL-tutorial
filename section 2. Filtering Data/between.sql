-- para seleccionar valores que se encuentren  en un rango de valores se utiliza el operador between
select col1 from table1 where col1 between 1 and 10;
-- tambien puedes usar los operadores mayor o igual que, menor o igual que para obtener el mismo resultado que el ejemplo anterior
select col1 from table1 where col1 >= 1 and col1 <= 10;
-- para devolver lo contrario al ejemplo anterior que uso el operador between
-- es decir valores fuera de un determinado rango
select col1 from table1 where col1 not between 1 and 10;
-- para devolver lo contrario al ejemplo anterior que uso el operador >= y <=
select col1 from table1 where col1 < 1 and col1 > 10;

-- vamos a seleccionar pagos cuya cantidad esta entre 8 y 9
select customer_id, payment_id, amount from payment where amount between 8 and 9;
-- para devolver lo contrario al ejemplo anterior que uso el operador between
select customer_id, payment_id, amount from payment where amount not between 8 and 9;

-- para seleccionar valores que se encuantren entre dos fechas se debe usar el formato ISO 8601 format i.e., YYYY-MM-DD
select customer_id, payment_id, amount from payment where payment_date between '2007-02-07' and '2007-02-15';;
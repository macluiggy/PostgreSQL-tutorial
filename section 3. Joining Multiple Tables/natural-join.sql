INSERT INTO categories (category_name)
VALUES ('Smart Phone'), ('Laptop'), ('Tablet');

INSERT INTO products (product_name, category_id)
VALUES ('iPhone', 1), ('Samsung Galaxy', 1), ('HP Elite', 2), ('Lenovo Thinkpad', 2), ('iPad', 3), ('Kindle Fire', 3);

select product_name, category_name from products p natural join categories c;
select * from products natural join categories;

-- lo de arriba seria equivalente a 
select * from products inner join categories using (category_id);

-- la forma en que funciona el natural join es que este de manera implicita utiliza una clausula join, por ejemplo en el anterior se usa la clausula using o products.category_id = categories.category_id, ya que natural join usa la clusula implicitamente basandose en columnas que tengan el mismo nombre, es por eso que el comando anterior es equivalente, ya que category_id es el nombre de la columna de la tabla products y category_id es el nombre de la columna de la tabla categories

select * from city natural join country;
select * from country natural join city;

-- lo de arriba seria equivalente a:
select * from city inner join country using (country_id) and using(last_update);

-- por este tipo de ejemplos no se recomienda usar natural join, ya que en este caso ambas tablas tienen la columna conuntry_id y last_update, lo cual hace que no se puedan relacionar ya que nunca van a tener exactamente la misma fecha, es por eso que seria solo recomendable usar natural join cuando ambas tablas tengan exactamente la misma columna, es decir, ambas tablas tienen la misma columna country_id
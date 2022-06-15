CREATE TABLE basket_a (
    a INT PRIMARY KEY,
    fruit_a VARCHAR (100) NOT NULL
);

CREATE TABLE basket_b (
    b INT PRIMARY KEY,
    fruit_b VARCHAR (100) NOT NULL
);

INSERT INTO basket_a (a, fruit_a)
VALUES
    (1, 'Apple'),
    (2, 'Orange'),
    (3, 'Banana'),
    (4, 'Cucumber');

INSERT INTO basket_b (b, fruit_b)
VALUES
    (1, 'Orange'),
    (2, 'Apple'),
    (3, 'Watermelon'),
    (4, 'Pear');


-- para devolver filas de basked_a que sus valores coincidan con los de basket_b
select a, fruit_a, b, fruit_b from basket_a inner join basket_b on fruit_a = fruit_b;
select a, fruit_a,      b, fruit_b from      basket_a inner      join basket_b on a = b;

select a, fruit_a, b, fruit_b from basket_a left join basket_b on fruit_a = fruit_b;
select a, fruit_a, b, fruit_b from basket_a right join basket_b on fruit_a = fruit_b;

-- para seleccionar filas de la tabla izquierda que no esten en la tabla derecha
select a, fruit_a, b, fruit_b from basket_a left join basket_b on fruit_a = fruit_b where b is null;

-- para seleccionar filas de la tabla derecha que no esten en la tabla izquierda
select a, fruit_a, b, fruit_b from basket_a right join basket_b on fruit_a = fruit_b where a is null;
select a, fruit_a, b, fruit_b from basket_a right outer join basket_b on fruit_a = fruit_b where a is null;

-- para seleccionar filas de amabas tablas encajen o no
select a, fruit_a, b, fruit_b from basket_a full join basket_b on fruit_a = fruit_b; -- esto es una union de ambas tablas
select a, fruit_a, b, fruit_b from basket_a full join basket_b on fruit_a = fruit_b where a is null or b is null; -- esto es una union de ambas tablas

select a, fruit_a, b, fruit_b from basket_a left join basket_b on fruit_a = fruit_b; -- esto es una union de ambas tablas
select distinct first_name, last_name from customer;

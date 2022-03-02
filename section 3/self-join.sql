-- aqui se muestra que el empleado le reporta al manager, si el manager es null, el empleado es el manager
INSERT INTO employee ( employee_id, first_name, last_name, manager_id) VALUES (1, 'Windy', 'Hays', NULL), (2, 'Ava', 'Christensen', 1), (3, 'Hassan', 'Conner', 1), (4, 'Anna', 'Reeves', 2), (5, 'Sau', 'Norman', 2), (6, 'Kelsie', 'Hays', 3), (7, 'Tory', 'Goff', 3), (8, 'Salley', 'Lester', 3);

-- con la clausula self join se puede saber quien reporta a quien
select e.first_name || ' '|| e.last_name employee, m.first_name || ' '|| m.last_name manager from employee e inner join employee m on e.manager_id = m.employee_id;
select e.first_name || ' '|| e.last_name employee, m.first_name || ' '|| m.last_name manager from employee e inner join employee m on e.manager_id = m.employee_id order by manager;
-- esta clusula no mostrara valores null
-- para eso se necesita usar la clausula left join
select e.first_name || ' '|| e.last_name employee, m.first_name || ' '|| m.last_name manager from employee e left join employee m on e.manager_id = m.employee_id order by manager;
select e.first_name || ' '|| e.last_name employee, m.first_name || ' '|| m.last_name manager from employee e right join employee m on e.manager_id = m.employee_id order by manager;

-- usando inner join para juntar valores de una misma tabla
select f1.title, f2.title, f1.length from film f1 inner join film f2 on f1.film_id != f2.film_id;
select f1.title, f2.title, f1.length from film f1 inner join film f2 on f1.film_id = f2.film_id;
select f1.title, f2.title, f1.length from film f1 inner join film f2 on f1.film_id != f2.film_id and f1.length = f2.length;
select f1.title, f2.title, f1.length from film f1 join film f2 on f1.film_id != f2.film_id and f1.length = f2.length;
select f1.title, f2.title, f1.length from film f1 left join film f2 on f1.film_id != f2.film_id and f1.length = f2.length order by f1.title nulls first;
select f1.title, f2.title, f1.length from film f1 inner join film f2 on f1.film_id != f2.film_id and length(f1.title) = length(f2.title) order by length(f1.title);
select p.* from products p inner join companies c on p.company_id = c.id;
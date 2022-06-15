-- the full outer join is the combination of the left and right joins
select c.customer_id, firsT_name, payment_date from payment p full outer join customer c on p.customer_id = c.customer_id order by firsT_name nulls first;

INSERT INTO departments (department_name)
VALUES ('Sales'), ('Marketing'), ('HR'), ('IT'), ('Production');

INSERT INTO employees (
	employee_name,
	department_id
)
VALUES ('Bette Nicholson', 1), ('Christian Gable', 1), ('Joe Swank', 2), ('Fred Costner', 3), ('Sandra Kilmer', 4), ('Julia Mcqueen', NULL);

select * from departments;

select employee_name, department_name from employees e full join departments d on e.department_id = d.department_id;
select employee_name, department_name from departments d full join  employees e on e.department_id = d.department_id;
-- como no existe relacion entre el valor 'Julia Mcqueen' de employees entre employees y departments
-- y no existe una relacion entre ningun  el valor 'Production' de departments entre employees y departments
/*
 se devuelve algo como un left join para 'Julia Mcqueen' y un right join para 'Production'
   employee_name  | department_name 
-----------------+-----------------
 Bette Nicholson | Sales
 Christian Gable | Sales
 Joe Swank       | Marketing
 Fred Costner    | HR
 Sandra Kilmer   | IT
 Julia Mcqueen   | 
                 | Production

 esto quiere decir que el resultado incluye para left join:
  cada empleado que pertenece a un departamento
  y para right join:
  cada departamento que tiene un empleado
en adicion a para left join:
  cada empleado que no pertenece a un departamento
  y para right join:
  cada departamento que no tiene un empleado
*/

select employee_name, department_name from employees e full outer join departments d on e.department_id = d.department_id where employee_name is null;
select employee_name, department_name from employees e full outer join departments d on e.department_id = d.department_id where department_name is null;
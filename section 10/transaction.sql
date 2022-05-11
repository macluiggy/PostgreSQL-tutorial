-- una transaccion es como si estuvieras trabajando en un repo local, el cual sus cambios
-- no se guardaran en el repo remoto hasta que se ejecute el commit
-- tambien se podria entender como una sesion, que el progreso no se guardara
-- hasta que se ejecute el commit

-- start a transaction / session
BEGIN;

-- insert a new row into the accounts table
INSERT INTO accounts(name,balance)
VALUES('Alice',10000);

-- commit the change (or roll it back later)
COMMIT;

-- un ejemplo de como transferir 1000USD a la cuenta desde la cuenta de Bob a la de Alice
-- usaremos dos sesiones para ver la diferencia entre ambas sesiones
-- sesion 1
BEGIN;

UPDATE accounts 
SET balance = balance - 1000
WHERE id = 1;

-- en la segunda sesion revisa el saldo de ambas cuentas
select * from accounts;
-- el cambio no deberia verse reflejado en sesiones externas

-- estando en la sesion 1 si hacemos commit
COMMIT;
-- ahora deberia verse reflejado en la sesion 2
select * from accounts; -- esto deberia devulver las filas actualizadas de la sesion 1


-- en resumen
-- start a transaction
BEGIN;

-- deduct 1000 from account 1
UPDATE accounts 
SET balance = balance - 1000
WHERE id = 1;

-- add 1000 to account 2
UPDATE accounts
SET balance = balance + 1000
WHERE id = 2; 

-- select the data from accounts
SELECT id, name, balance
FROM accounts;

-- commit the transaction
COMMIT;

-- supongamos que ahora queremos actualizar el saldo de Alice, pero por
-- accidente le pasamos el valor a Jack, para volver al estado anterior
-- podemos usar ROLLBACK
-- begin the transaction
BEGIN;

-- deduct the amount from the account 1
UPDATE accounts 
SET balance = balance - 1500
WHERE id = 1;

-- add the amount from the account 3 (instead of 2)
UPDATE accounts
SET balance = balance + 1500
WHERE id = 3; 

-- roll back the transaction
ROLLBACK;
-- de esta forma salimos de la sesion actual sin guardar los cambios;


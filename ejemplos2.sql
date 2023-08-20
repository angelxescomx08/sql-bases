CREATE TABLE users(
	name VARCHAR(10) UNIQUE
);

INSERT INTO
    users(name)
VALUES
    ('Yukary'),
    ('Ángel'),
    ('Ana');
    
UPDATE
    users
SET
    name = 'Laura'
WHERE
    name = 'Ana';
    
SELECT * FROM users LIMIT 1 OFFSET 2;

SELECT * FROM users;

DELETE FROM users WHERE name = 'Laura';

--Elimina la tabla de la basee de datos
DROP TABLE users;

--Elimina todos los registros de la tabla
TRUNCATE TABLE users; 
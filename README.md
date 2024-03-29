# SQL

---

## Ejemplos para practicar

[https://sqlbolt.com/](https://sqlbolt.com/)

---

## SELECT

El select permite mostrar las columnas de una o más tablas así como filtrarlas.

### Select ejemplos

Sintaxis básica:

```sql
SELECT columna1, columna2 FROM tabla
```

Obtener todas las columnas de una tabla:

```sql
SELECT * FROM tabla
```

Filtrar por una condición:

```sql
SELECT columna1, columna2
FROM tabla
WHERE columna1 = 'valor'
```

---

## WHERE

Permite filtrar los resultados de una búsqueda basandose en una condición.

### Crear condiciones

Para crear condiciones tenemos diferentes operadores, estos están divididos en operadores lógicos y operadores comparativos.

#### OPERADORES LÓGICOS

**AND**: Requiere que se cumplan las condiciones.

**OR**: Requiere que solo se cumpla una condición.

**NOT**: Devuelve los resultados que **NO** cumplan una condición.

#### OPERADORES COMPARATIVOS

**=**: Compara si dos valores son iguales.

**<>** o **!=**: Compara si dos valores son diferentes.

**<** o **>**: Compara si un valor es menor o mayor que otro respectivamente.

**<=** o **>=**: Compara si un valor es menor o igual, o, mayor o igual respectivamente.

### WHERE Ejemplos

```sql
SELECT columna1, columna2
FROM tabla
WHERE columna1 = 'valor'
```

```sql
SELECT columna1, columna2
FROM tabla
WHERE columna1 = 'valor' AND columna2 > 10
```

---

## GROUP BY

La cláusula GROUP BY en SQL se utiliza para agrupar filas con base en una o varias columnas específicas. Esta cláusula se utiliza comúnmente junto con funciones de agregación, como SUM, AVG, COUNT, MAX o MIN, para calcular valores resumidos para cada grupo.

Sintaxis básica:

```sql
SELECT columna1, columna2, ..., columnaN, función_de_agregación(columna)
FROM tabla
GROUP BY columna1, columna2, ..., columnaN
```

### Funciones de agregación

**SUM**: Calcula la suma de los valores en una columna.

**AVG**: Calcula el promedio de los valores en una columna.

**COUNT**: Cuenta el número de filas en un grupo.

**MAX**: Encuentra el valor máximo en una columna.

**MIN**: Encuentra el valor mínimo en una columna.

### GROUP BY Ejemplos

Calcular la suma de ventas para cada producto:

```sql
SELECT producto, SUM(ventas) AS total_ventas
FROM tabla
GROUP BY producto
```

Calcular el promedio de calificaciones por asignatura:

```sql
SELECT asignatura, AVG(calificacion) AS promedio_calificaciones
FROM tabla
GROUP BY asignatura
```

Encontrar el valor máximo y mínimo de ventas por año:

```sql
SELECT año, MAX(ventas) AS max_ventas, MIN(ventas) AS min_ventas
FROM tabla
GROUP BY año
```

---

## HAVING

la cláusula HAVING se utiliza junto con la cláusula GROUP BY para filtrar los resultados de una consulta basándose en condiciones específicas sobre los grupos creados por el GROUP BY, en pocas palabras es similar a un where.

Sintaxis básica:

```sql
SELECT columna1, columna2, ..., columnaN
FROM tabla
GROUP BY columna1, columna2, ..., columnaN
HAVING condicion;
```

### HAVING Ejemplos

Supongamos que tienes una tabla "Ventas" con las columnas "Producto" y "Cantidad" y deseas obtener los productos cuya cantidad total vendida es mayor que 100. Puedes escribir la consulta de la siguiente manera:

```sql
SELECT Producto, SUM(Cantidad) AS TotalVendido
FROM Ventas
GROUP BY Producto
HAVING SUM(Cantidad) > 100;
```

---

# ORDER BY

En SQL, la cláusula ORDER BY se utiliza para ordenar los resultados de una consulta en un orden específico. Puedes ordenar los resultados según una o más columnas en orden ascendente (ASC) o descendente (DESC).

Sintaxis básica:

```sql
SELECT columna1, columna2, ..., columnaN
FROM tabla
ORDER BY columna [ASC|DESC];
```

## ORDER BY Ejemplos:

Ordenar por una sola columna en orden ascendente:

```sql
SELECT Nombre, Edad
FROM Personas
ORDER BY Edad ASC;
```

Ordenar por múltiples columnas en orden descendente:

```sql
SELECT Nombre, Edad, Salario
FROM Empleados
ORDER BY Edad DESC, Salario DESC;
```

---

# TOP

En SQL, la cláusula TOP se utiliza para limitar el número de filas que se devuelven en el resultado de una consulta. Es una forma conveniente de seleccionar un número específico de registros superiores de una tabla en función de un criterio de clasificación determinado.

Sintaxis básica:

1. SQL Server / Azure SQL Database:

```sql
SELECT TOP n column1, column2, ...
FROM table
ORDER BY column;
```

2. MySQL / PostgreSQL / SQLite:

```sql
SELECT column1, column2, ...
FROM table
ORDER BY column
LIMIT n;
```

3. Oracle:

```sql
SELECT column1, column2, ...
FROM table
WHERE ROWNUM <= n
ORDER BY column;
```

## TOP Ejemplos:

```sql
SELECT TOP 5 Nombre, Edad
FROM Personas
ORDER BY Edad DESC;
```

---

# DISTINCT

En SQL, la palabra clave DISTINCT se utiliza para eliminar duplicados de los resultados de una consulta. Permite obtener valores únicos de una o más columnas seleccionadas en una tabla.

Sintaxis básica:

```sql
SELECT DISTINCT columna1, columna2, ...
FROM tabla;
```

## DISTINCT Ejemplos

```sql
SELECT DISTINCT País
FROM Clientes;
```

---

# INNER JOIN

![Imagen de un gato](https://i.stack.imgur.com/VQ5XP.png)

En SQL, INNER JOIN se utiliza para combinar filas de dos o más tablas en función de una condición de igualdad entre las columnas relacionadas. Se utiliza para obtener un conjunto de resultados que contiene solo las filas que tienen coincidencias en ambas tablas involucradas en la operación.

```sql
SELECT columna1, columna2, ...
FROM tabla1
INNER JOIN tabla2 ON tabla1.columna = tabla2.columna;
```

## INNER JOIN Ejemplo:

```sql
SELECT Clientes.Nombre, Clientes.Apellido, Pedidos.Producto
FROM Clientes
INNER JOIN Pedidos ON Clientes.ID = Pedidos.Cliente;
```

---

# LEFT JOIN y RIGHT JOIN

LEFT JOIN y RIGHT JOIN son tipos de operaciones de unión utilizadas en consultas de bases de datos relacionales. Estas operaciones se utilizan para combinar filas de dos tablas diferentes en función de una condición de unión especificada. Aquí está una explicación de cada uno:

LEFT JOIN (o LEFT OUTER JOIN):

En un LEFT JOIN, se seleccionan todas las filas de la tabla izquierda (tabla a la izquierda de la operación JOIN) y las filas coincidentes de la tabla derecha (tabla a la derecha de la operación JOIN) según la condición de unión especificada.
Si no hay coincidencias en la tabla derecha para una fila en la tabla izquierda, se devolverán valores nulos para las columnas de la tabla derecha en el resultado.
En resumen, el LEFT JOIN devuelve todas las filas de la tabla izquierda y las filas coincidentes de la tabla derecha.
RIGHT JOIN (o RIGHT OUTER JOIN):

En un RIGHT JOIN, se seleccionan todas las filas de la tabla derecha y las filas coincidentes de la tabla izquierda según la condición de unión especificada.
Si no hay coincidencias en la tabla izquierda para una fila en la tabla derecha, se devolverán valores nulos para las columnas de la tabla izquierda en el resultado.
En resumen, el RIGHT JOIN devuelve todas las filas de la tabla derecha y las filas coincidentes de la tabla izquierda.

---

# Crear una tabla

Para crear la tabla se ocupa la siguiente sintaxis:

```sql
create table NombreTabla(
  columna1 tipo_de_dato_restricciones,
  columna2 tipo_de_dato_restricciones,
  columna3 tipo_de_dato_restricciones,
);
```

Un ejemplo más concreto es el siguiente:

```sql
create table Producto(
	id int identity(1,1) primary key,
	nombre varchar(50),
	descripcion varchar (100),
	precio_unitario float,
	stock int,
);
```

---

# Llaves foraneas

Una llave foránea es un campo o conjunto de campos en una tabla que hace referencia a la llave primaria de otra tabla. Esto permite establecer una relación de integridad referencial entre las tablas, lo que significa que se garantiza que los datos almacenados en una tabla estén relacionados correctamente con los datos en otra tabla.

## Sintaxis

```sql
CREATE TABLE tabla_secundaria (
  columna_secundaria TIPO_DE_DATO,
  CONSTRAINT nombre_llave_foranea FOREIGN KEY (columna_secundaria)
  REFERENCES tabla_principal (columna_principal)
);
```

## Ejemplos llave foranea:

```sql
CREATE TABLE Table_Telefono (Id_Tel INT PRIMARY KEY, Numero INT NOT NULL);

CREATE TABLE Table_Personal (
  Id INT PRIMARY KEY,
  Nombre VARCHAR(50),
  Cedula INT NOT NULL,
  Id_Tel INT FOREIGN KEY REFERENCES Table_Telefono(Id_Tel)
);
```

---

# Funciones de conversión

Funciones que sirven para hacer un casteo.

## CAST

Convierte un tipo de dato a otro, es similar a un parse en algún lenguaje de programación.

## Ejemplos cast

```sql
select
CAST(fecha as DATE),
CAST(precio as FLOAT),
CAST(stock as INT),
from productos;
```

---

# UNION y UNION ALL

Permiten fusionar dos tablas con EL MISMO NÚMERO DE COLUMNAS Y TIPOS DE DATOS EN UNA SOLA.
Imagina que tienes dos tablas con la misma información pero en dos tablas separadas, puedes hacer una consulta
combinada con UNION Y UNION ALL para que se muestren en una sola tabla.

La diferencia entre UNION y UNION ALL es que UNION ALL muestra todos los datos aunque estén repetidos mientras que
UNION solo muestra los que no están repetidos. Cuando mezclamos las tablas en la consulta aparecerán los nombres de las columnas de la tabla 1.

## Sintaxis

```sql
select * from productos1 union
select * from productos2 union
select * from productos3
```

```sql
select * from productos1 union all
select * from productos2 union all
select * from productos3
```

---

# ALTER TABLE

ALTER se utiliza para alterar tablas o columnas de tablas, por ejemplo cambiar un tipo de dato de una columna,
agregar un nuevo dato a una tabla.

## SINTAXIS ALTER TABLE CON VARIANTES

Añadir una columna a una tabla:

```sql
ALTER TABLE mytable
ADD column DataType OptionalTableConstraint
    DEFAULT default_value;
```

```sql
ALTER TABLE movies ADD language TEXT DEFAULT "English";
```

```sql
ALTER TABLE movies ADD aspect_ratio FLOAT ;
```

Renombrar una tabla:

```sql
ALTER TABLE mytable
RENAME TO new_table_name;
```

Eliminar una columna de una tabla
```sql
ALTER TABLE mytable
DROP column_to_be_deleted;
```

## Ejemplos ALTER:

```sql
ALTER TABLE Alumno ADD COLUMN edad;
```

```sql
ALTER TABLE Alumno ALTER COLUMN apellido VARCHAR(20);
```

```sql
ALTER TABLE Alumno ALTER COLUMN Apellido SET DEFAULT 'DESCONOCIDO';
```

---

# DROP

DROP se utiliza para muchas cosas referentes a eliminar algo por ejemplo una base de datos, una tabla, una columna de una tabla.

## Ejemplos DROP:

```sql
DROP DATABASE Nombre_Base_Datos;
```

```sql
DROP TABLE Tabla;
```

```sql
ALTER TABLE Tabla DROP COLUMN Columna;
```

```sql
DROP TABLE IF EXISTS mytable;
```

---

# INSERT INTO

Se utiliza para insertar datos dentro de una tabla

## Sintaxis INSERT INTO

```sql
INSERT INTO mytable
(column, another_column, …)
VALUES (value_or_expr, another_value_or_expr, …),
      (value_or_expr_2, another_value_or_expr_2, …),
      …;
```

## EJEMPLOS INSERT INTO

```sql
INSERT INTO boxoffice
(movie_id, rating, sales_in_millions)
VALUES (1, 9.9, 283742034 / 1000000);
```

---

# UPDATE

Se utiliza para actualizar una fila o filas que cumplan una condición.

## SINTAXIS UPDATE SET

```sql
UPDATE mytable
SET column = value_or_expr,
    other_column = another_value_or_expr,
    …
WHERE condition;
```

## EJEMPLOS UPDATE SET

```sql
UPDATE movies SET director = "John Lasseter" WHERE id = 2;
```

---

# DELETE FROM

Usado para eliminar registros de una tabla.

## SINTAXIS DELETE FROM

```sql
DELETE FROM mytable
WHERE condition;
```

## EJEMPLOS DELEFROM

```sql
DELETE FROM movies WHERE year < 2005;
```

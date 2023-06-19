# SQL

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

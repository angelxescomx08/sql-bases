# SQL
-----------------------
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
-------------------------
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

-------------------------

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
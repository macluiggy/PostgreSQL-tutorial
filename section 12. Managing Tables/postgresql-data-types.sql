-- BOOLEAN
/*
 los BOOLEAN son valores booleanos, que pueden ser true o false.
 los valores pueden ser para true: 1, t, y, yes, true, t
 los valores pueden ser para false: 0, f, n, no, false, f
 
 CHARACTER
 * NVARCHAR(n) es una cadena de caracteres de longitud n
 Si insertas un string menor a n, se completa con espacios en blanco
 Si insertas un string mayor a n, PostgreSQL teera un error
 
 * VARCHAR(n) es una cadena de caracteres de longitud n
 es igual a NVARCHAR(n) solo que no se completa con espacios en blanco
 
 * TEXT es una cadena de caracteres de longitud teoricamente infinita
 
 NUMERIC
 PostgreSQL tiene dos tipos de numeros:
 * INTEGER es un numero entero
 * FLOAT es un numero decimal
 
 INTEGER
 Hay tres formas de definir un numero entero:
 * SMALLINT es un numero entero de 2 bytes que tiene un rango de -32,768 a 32,767
 * INTEGER es un numero entero de 4 bytes que tiene un rango de -2,147,483,648 a 2,147,483,647
 * SERIAL es igual a INTEGER, pero es autoincrementable, es decir que se genera un numero
 automaticamente cada vez que se inserta una nueva fila en la tabla
 
 Número de punto flotante
 Hay tres tipos principales de números de coma flotante:
 
 float(n) es un número en coma flotante cuya precisión, al menos, n, hasta un máximo de 8 bytes.
 real or float8 es un número de punto flotante de 4 bytes.
 numeric or numeric(p,s) es un número real con p dígitos con un número s después del punto decimal. El numérico (p, s) es el número exacto.
 
 Temporal data types
 The temporal data types allow you to store date and /or  time data. PostgreSQL has five main temporal data types:
 
 DATEstores the dates only.
 TIMEstores the time of day values.
 TIMESTAMPstores both date and time values.
 TIMESTAMPTZ is a timezone-aware timestamp data type. It is the abbreviation for timestamp with the time zone.
 INTERVAL stores periods of time.
 The TIMESTAMPTZ is the PostgreSQL’s extension to the SQL standard’s temporal data types.
 */
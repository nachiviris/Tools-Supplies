CREATE TABLE empleados (
    id NUMBER(10) PRIMARY KEY,
    nombre VARCHAR2(50),
    apellido VARCHAR2(50),
    email VARCHAR2(100),
    fecha_contratacion DATE,
    salario NUMBER(10, 2)
);
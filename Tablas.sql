CREATE TABLESPACE TBS_TS_DATA DATAFILE
'C:\TBS_TS\TS\DF_TS_DATA.DBF' SIZE 20M DEFAULT STORAGE
(INITIAL 5M NEXT 5M PCTINCREASE 0);

CREATE TABLESPACE TBS_TS_IDX DATAFILE
'C:\TBS_TS\TS\DF_TS_IDX.DBF' SIZE 20M DEFAULT STORAGE
(INITIAL 5M NEXT 5M PCTINCREASE 0);


CREATE TABLE Clientes (
    cliente_id INT NOT NULL CONSTRAINT PK_CLI_ID PRIMARY KEY USING INDEX TABLESPACE TBS_TS_IDX,
    nombre_cliente VARCHAR2(50) NOT NULL,
    direccion_cliente VARCHAR2(100),
    telefono_cliente VARCHAR2(50),
    correo_cliente VARCHAR2(40)
)TABLESPACE TBS_TS_DATA;

CREATE TABLE Empleados (
    empleado_id INT NOT NULL CONSTRAINT PK_EMP_ID PRIMARY KEY USING INDEX TABLESPACE TBS_TS_IDX,
    nombre_empleado VARCHAR2(50) NOT NULL,
    direccion_empleado VARCHAR2(100),
    telefono_cliente VARCHAR2(50),
    correo_cliente VARCHAR2(40),
    puesto_empleado VARCHAR2(20)
)TABLESPACE TBS_TS_DATA;

CREATE TABLE Ordenes (
    orden_id INT NOT NULL CONSTRAINT PK_ORD_ID PRIMARY KEY USING INDEX TABLESPACE TBS_TS_IDX,
    cliente_id INT NOT NULL,
    empleado_id INT NOT NULL,
    nombre_orden VARCHAR2(50) NOT NULL,
    fecha_orden DATE NOT NULL,
    descripcion VARCHAR2(100) NOT NULL,
    CONSTRAINT FK_Ordenes_Clientes FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id),
    CONSTRAINT FK_Ordenes_Empleados FOREIGN KEY (empleado_id) REFERENCES Empleados(empleado_id)
)TABLESPACE TBS_TS_DATA;

select * from Clientes;